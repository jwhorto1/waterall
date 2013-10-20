json.array!(@people) do |person|
  json.extract! person, :role_di, :first_name, :last_name, :email, :active
  json.url person_url(person, format: :json)
end
