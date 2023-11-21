json.extract! transaction, :id, :author_id, :name, :amount, :category_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
