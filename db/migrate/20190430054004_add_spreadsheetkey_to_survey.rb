class AddSpreadsheetkeyToSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :spreadsheet_key, :string
  end
end
