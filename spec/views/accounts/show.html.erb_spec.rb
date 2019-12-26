require 'rails_helper'

RSpec.describe "accounts/show", type: :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :email => "Email",
      :crypted_password => "Crypted Password",
      :salt => "Salt"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Crypted Password/)
    expect(rendered).to match(/Salt/)
  end
end
