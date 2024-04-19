require 'rails_helper'

RSpec.describe Report, type: :model do
  before do
    @user = build(:user)
    @report = build(:report)
  end
end
