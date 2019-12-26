class AccountSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @account = Account.new
  end

  def create
    @account = login(params[:email], params[:password])

    if @account
      redirect_back_or_to(:accounts, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:accounts, notice: 'Logged out!')
  end
end
