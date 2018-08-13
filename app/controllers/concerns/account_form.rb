require 'securerandom'

class AccountForm
  ATTRIBUTES = [:company_name, :username, :password, :street_address_1, :street_address_2, :city, :state, :postal_code, :acct_id]
  attr_accessor *ATTRIBUTES

  def self.all_accounts
    account_ids.map do |id|
      Account.with(database: "#{Account::DB_PREFIX}-#{id}") do |klass|
        klass.first
      end
    end
  end

  def initialize account_params
    @company_name = account_params["company_name"]
    @username = account_params["username"]
    @password = account_params["password"]
    @street_address_1 = account_params["street_address_1"]
    @street_address_2 = account_params["street_address_2"]
    @city = account_params["city"]
    @state = account_params["state"]
    @postal_code = account_params["postal_code"]
    @acct_id = account_params["account_id"]
  end

  def create
    account_creation
    user_creation
  end

  def update
    update_account
  end

  private

  private_class_method def self.account_ids
    @account_ids ||= User.all.map { |user| user.account_id }.compact
  end

  def account_creation
    account = Account.new name: company_name, account_id: account_id
    account.addresses.build street_address_1: street_address_1, street_address_2: street_address_2, city: city, state: state, postal_code: postal_code
    account.with(database: "#{Account::DB_PREFIX}-#{account_id}") { |account_object| account_object.save! }
  end

  def user_creation
    user = User.new username: username, password: password, account_id: account_id
    user.save
  end

  def account_id
    @account_id ||= SecureRandom.uuid
  end

  def update_account
  end

  def account
    @account ||= Account.with(database: "#{Account::DB_PREFIX}-#{acct_id}") { |klass| klass.find_by account_id: acct_id }
  end
end
