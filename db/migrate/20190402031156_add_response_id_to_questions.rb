class AddResponseIdToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :response, foreign_key: true
  end
end
