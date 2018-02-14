json.extract! contact, :id, :FirstName, :LastName, :Phone, :Email, :Address, :created_at, :updated_at
json.url contact_url(contact, format: :json)
