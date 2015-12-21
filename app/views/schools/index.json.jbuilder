json.array!(@schools) do |school|
  json.extract! school, :id, :name, :number_of_dep
  json.url school_url(school, format: :json)
end
