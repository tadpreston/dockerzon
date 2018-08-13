class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = AccountForm.all_accounts
  end

  def show
  end

  def new
    @account = Account.new
    @account.addresses.build
  end

  def edit
  end

  def create
    AccountForm.new(account_params).create
    redirect_to '/accounts', notice: 'Account was successfully created.'
  end

  def update
    AccountForm.new(account_params).update
    redirect_to '/accounts', notice: 'Account was successfully updated.'
  end

  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_account
      @account = Account.find account_id: params[:id]
      @account.addresses.build if @account.addresses.empty?
    end

    def account_params
      params.require(:account).permit(:company_name, :username, :password, :password_confirmation, :street_address_1, :street_address_2, :city, :state, :postal_code)
    end
end
