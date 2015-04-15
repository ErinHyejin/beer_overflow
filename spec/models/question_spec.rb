require 'rails_helper'

RSpec.describe Question, type: :model do
  # expect(question).to have_many(:answers)
  it { expect(subject).to have_many :answers }
end
