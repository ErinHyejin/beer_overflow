
require 'rails_helper'

RSpec.describe Answer, type: :model do
  # expect(question).to have_many(:answers)
  it { should belong_to (:question) }
end
