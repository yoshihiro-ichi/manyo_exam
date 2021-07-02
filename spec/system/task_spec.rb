require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task[name]', with: '新タスク'
        fill_in 'task[content]', with: 'タスク内容'
        click_button 'Create Task'
        visit tasks_path
        expect(page).to have_content '新タスク'
        expect(page).to have_content 'タスク内容'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, name: 'task')
               visit tasks_path
               expect(page).to have_content 'task'
      end
    end
  end

  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
          visit task_path(tasks.id)
          expect(page).to have_content 'task'
       end
     end
  end
end
