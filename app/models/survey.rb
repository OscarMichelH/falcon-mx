class Survey < ApplicationRecord
  has_many :responses
  before_destroy :destroy_responses

  private

  def destroy_responses
    self.responses.destroy_all
  end
end
