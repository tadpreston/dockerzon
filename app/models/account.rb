class Account
  include Mongoid::Document
  include Mongoid::Timestamps

  DB_PREFIX = "ap-account"

  field :name, type: String
  field :account_id, type: String

  embeds_many :addresses

  accepts_nested_attributes_for :addresses

  def self.find account_id:
    with(database: "#{DB_PREFIX}-#{account_id}") { |klass| klass.find_by account_id: account_id }
  end

  def primary_address
    addresses.first
  end

  def users
    User.where account_id: account_id
  end
end
