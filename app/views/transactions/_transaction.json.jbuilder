json.extract! transaction, :id, :name, :amouunt, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
