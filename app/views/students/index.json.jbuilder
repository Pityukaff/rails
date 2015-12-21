json.array!(@students) do |student|
  json.extract! student, :id, :name, :is_girl, :is_special
  json.url student_url(student, format: :json)
end
