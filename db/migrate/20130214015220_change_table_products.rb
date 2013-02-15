class ChangeTableProducts < ActiveRecord::Migration
  change_table :products do |t|
  	t.rename :image_url, :image
  end
end
