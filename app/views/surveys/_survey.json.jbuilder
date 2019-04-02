json.extract! survey, :id, :name, :response_id, :created_at, :updated_at
json.url survey_url(survey, format: :json)
