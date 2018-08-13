class Address
  include Mongoid::Document
  include Mongoid::Timestamps

  field :street_address_1, type: String
  field :street_address_2, type: String
  field :city,             type: String
  field :state,            type: String
  field :postal_code,      type: String

  embedded_in :account
end
