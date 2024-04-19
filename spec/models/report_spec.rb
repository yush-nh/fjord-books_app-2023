require 'rails_helper'

RSpec.describe Report, type: :model do
  let(:report) { build(:report) }

  describe '#editable?(target_user)' do
    context 'userとtarget_userが等しい場合' do
      it 'trueを返す' do
        expect(report.editable?(report.user)).to eq true
      end
    end
  end

  describe '#created_on' do
    it '整形された日時を返す' do
      expect(report.created_on).to eq(Date.new(2024, 4, 18))
    end
  end
end
