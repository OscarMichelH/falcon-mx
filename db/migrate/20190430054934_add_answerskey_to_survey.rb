class AddAnswerskeyToSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :answers_key, :string
  end
end
