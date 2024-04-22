# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  let(:user) { build(:user) }

  describe '#current_user_name' do
    context 'nameが与えられている場合' do
      it 'nameを返す' do
        expect(current_user_name(user)).to eq user.name
      end
    end
    context 'nameが与えられていない場合' do
      it 'emailを返す' do
        user.name = ''
        expect(current_user_name(user)).to eq user.email
      end
    end
  end
end
