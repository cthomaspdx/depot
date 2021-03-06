
class Product < ActiveRecord::Base
 
  attr_accessible :description, :price, :title, :image, :remote_image_url
  has_many :orders, through: :line_items
  has_many :line_items
  has_many :reviews
  before_destroy :ensure_not_referenced_by_any_line_item
  
  mount_uploader :image , ImageUploader
  
  include PgSearch
    pg_search_scope :search, :against => [:title, :description]
  
  validates :title, :description,  :presence => true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}  
  validates :title, :uniqueness => true
  validates :image, :format => { :with => %r{\.(gif|jpeg|jpg|png)$}i,
                message:  'must be a URL for GIF, JPG, JPEG or PNG image.' 
                }
  validates :title, :length => { :minimum => 5 }
   
   def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end
  private
  # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
       return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end 
end
