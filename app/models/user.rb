class User
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in database: 'ap_users'

  field :username, type: String
  field :email,    type: String
  field :password, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :account_id, type: String
end
