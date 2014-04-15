# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 3) do

  create_table "avatars", :force => true do |t|
    t.column "company_id",   :integer
    t.column "size",         :integer
    t.column "content_type", :string
    t.column "filename",     :string
    t.column "height",       :integer
    t.column "width",        :integer
    t.column "parent_id",    :integer
    t.column "thumbnail",    :string
  end

  create_table "companies", :force => true do |t|
    t.column "name",    :string
    t.column "phone",   :string
    t.column "website", :string
  end

  create_table "credit_cards", :force => true do |t|
    t.column "company_id",   :integer
    t.column "owner_name",   :string
    t.column "number",       :string
    t.column "expiry_month", :integer
    t.column "expiry_year",  :integer
    t.column "provider",     :string
  end

end