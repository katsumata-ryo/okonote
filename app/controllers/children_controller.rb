class ChildrenController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  def index
    @children = Child.all
  end

  def show
  end

  def new
    @child = Child.new
  end

  def edit
  end

  def create
    @child = Child.new(account_params)

    if @child.save
      redirect_to(:children, notice: 'User was successfully created')
    else
      format.html { render :new }
    end
  end

  def update
    if @child.update(account_params)
      format.html { redirect_to @child, notice: 'Child was successfully updated.' }
    else
      format.html { render :edit }
    end
  end

  def destroy
    @child.destroy
    respond_to do |format|
      format.html { redirect_to children_url, notice: 'Child was successfully destroyed.' }
    end
  end

  private

  def set_account
    @child = Child.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:email, :password, :password_confirmation)
  end
end
