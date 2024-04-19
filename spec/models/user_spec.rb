require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe '#name_or_email' do
    context 'nameが与えられている場合' do
      it 'nameを返すこと' do
        expect(user.name_or_email).to eq user.name
      end
    end
    context 'nameが与えられていない場合' do
      it 'emailを返すこと' do
        user.name = ''
        expect(user.name_or_email).to eq user.email
      end
    end
  end
end
