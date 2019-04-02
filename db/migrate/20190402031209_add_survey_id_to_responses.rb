class AddSurveyIdToResponses < ActiveRecord::Migration[5.2]
  def change
    add_reference :responses, :survey, foreign_key: true
  end
end
