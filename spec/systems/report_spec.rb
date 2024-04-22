# frozen_string_literal: true

require 'rails_helper'

RSpec.feature '日報機能', type: :system do
  given(:report) { create(:report) }

  background do
    sign_in report.user
  end

  scenario '新規作成ができる' do
    visit new_report_path
    fill_in 'タイトル', with: '日報1'
    fill_in '内容', with: 'テストを書いた'
    click_button '登録する'
    expect(page).to have_content '日報が作成されました。'
  end

  scenario '編集ができる' do
    visit edit_report_path(report)
    fill_in 'タイトル', with: '日報2'
    fill_in '内容', with: 'テストを編集'
    click_button '更新する'
    expect(page).to have_content '日報が更新されました。'
  end

  scenario '削除ができる' do
    visit report_path(report)
    click_button 'この日報を削除'
    expect(page).to have_content '日報が削除されました。'
  end
end
