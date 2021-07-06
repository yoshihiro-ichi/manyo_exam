require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task[name]', with: '新タスク'
        fill_in 'task[content]', with: 'タスク内容'
        fill_in 'task[deadline]',with: '2021-07-01 00:00:00'
        click_button '登録する'
        visit tasks_path
        expect(page).to have_content '新タスク'
        expect(page).to have_content 'タスク内容'
        expect(page).to have_content '2021-07-01 00:00:00'
      end
    end
  end

  let!(:task) { FactoryBot.create(:task, name: 'task' ,deadline: '2021-07-01 00:00:00') }
  before  do
# 「一覧画面に遷移した場合」や「タスクが作成日時の降順に並んでいる場合」など、contextが実行されるタイミングで、before内のコードが実行される
   visit tasks_path
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
               visit tasks_path
               expect(page).to have_content 'task'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
         visit tasks_path
        task_list = all('.task_row')
        expect(task_list[0]).to have_content 'task'
      end
    end
    context '終了期限でソートするというリンクを押した場' do
      it '終了期限が一番遅いタスクが一番上に表示される' do
         visit tasks_path
         click_on "終了期限"
        task_list = all('.sort_deadline')
        expect(task_list[0]).to have_content '2021-07-01 00:00:00'
      end
    end
 end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
            visit task_path(task.id)
          expect(page).to have_content 'task'
       end
     end
  end
end
