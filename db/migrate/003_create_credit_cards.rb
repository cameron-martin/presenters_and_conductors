class CreateCreditCards < ActiveRecord::Migration
  def self.up
    create_table :credit_cards do |t|
      t.column :company_id, :integer
      t.column :owner_name, :string
      t.column :number, :string
      t.column :expiry_month, :integer
      t.column :expiry_year, :integer
      t.column :provider, :string
    end
  end

  def self.down
    drop_table :credit_cards
  end
end
