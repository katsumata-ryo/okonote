require 'rails_helper'

RSpec.describe "accounts/index", type: :view do
  before(:each) do
    assign(:accounts, [
      Account.create!(
        :email => "Email",
        :crypted_password => "Crypted Password",
        :salt => "Salt"
      ),
      Account.create!(
        :email => "Email",
        :crypted_password => "Crypted Password",
        :salt => "Salt"
      )
    ])
  end

  it "renders a list of accounts" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Crypted Password".to_s, :count => 2
    assert_select "tr>td", :text => "Salt".to_s, :count => 2
  end
end
