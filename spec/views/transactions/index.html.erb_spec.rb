require 'rails_helper'

RSpec.describe "transactions/index", type: :view do
  before(:each) do
    assign(:transactions, [
      Transaction.create!(
        author_id: 2,
        name: "Name",
        amount: "9.99",
        category_id: 3
      ),
      Transaction.create!(
        author_id: 2,
        name: "Name",
        amount: "9.99",
        category_id: 3
      )
    ])
  end

  it "renders a list of transactions" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
  end
end
