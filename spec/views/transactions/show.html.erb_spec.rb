require 'rails_helper'

RSpec.describe "transactions/show", type: :view do
  before(:each) do
    assign(:transaction, Transaction.create!(
      author_id: 2,
      name: "Name",
      amount: "9.99",
      category_id: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/3/)
  end
end
