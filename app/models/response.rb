class Response < ApplicationRecord
  has_many :questions
  belongs_to :survey
  before_destroy :destroy_questions

  private

  def destroy_questions
    self.questions.destroy_all
  end

end
