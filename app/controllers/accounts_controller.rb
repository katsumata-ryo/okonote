class AccountsController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = Account.all
  end

  def show
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to(:accounts, notice: 'User was successfully created')
    else
      format.html { render :new }
    end
  end

  def update
    if @account.update(account_params)
      format.html { redirect_to @account, notice: 'Account was successfully updated.' }
    else
      format.html { render :edit }
    end
  end

  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
    end
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:email, :password, :password_confirmation)
  end
end
