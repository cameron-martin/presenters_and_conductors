class CreateAvatars < ActiveRecord::Migration
  def self.up
    create_table :avatars do |t|
      t.column :company_id, :integer
      t.column :size, :integer
      t.column :content_type, :string
      t.column :filename, :string
      t.column :height, :integer
      t.column :width, :integer
      t.column :parent_id, :integer
      t.column :thumbnail, :string
    end
  end

  def self.down
    drop_table :avatars
  end
end
