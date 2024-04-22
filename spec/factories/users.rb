# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email { 'test_user@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
