require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  let(:user) { FactoryBot.create(:user,email: 'tack@a.com') }
  let!(:task) { FactoryBot.create(:task, user_id: user.id) }
  let!(:task2) { FactoryBot.create(:scond_task, user_id: user.id) }
  # let!(:task3) { FactoryBot.create(:task3, user_id: user.id) }
  # before do
  #   visit new_session_path
  #   fill_in :session_email, with: "tack@a.com"
  #   fill_in :session_password, with: "111111"
  #   click_on 'commit'
  # end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in 'task[name]', with: ''
        fill_in 'task[content]', with: 'タスク内容'
        fill_in 'task[deadline]',with: '2021-07-01 00:00:00'
        select '未着手', from: 'task[status]'
        click_button '登録する'
        visit tasks_path
        expect(page).to have_content '新タスク'
        expect(page).to have_content 'タスク内容'
        expect(page).to have_content '2021-07-01 00:00:00'
        expect(page).to have_content '未着手'
      end
    end
  end
  # let!(:task) { FactoryBot.create(:task, name: 'task' ,deadline: '2021-07-01 00:00:00' ,priority: '高') }
  before  do
# 「一覧画面に遷移した場合」や「タスクが作成日時の降順に並んでいる場合」など、contextが実行されるタイミングで、before内のコードが実行される
   visit tasks_path
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        visit tasks_path
        expect(page).to have_content 'test_name'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
         visit tasks_path
        task_list = all('.task_row')
        expect(task_list[0]).to have_content 'test_name'
      end
    end
    context '終了期限でソートするというリンクを押した場' do
      it '終了期限が一番遅いタスクが一番上に表示される' do
         visit tasks_path
         click_button"終了期限でソートする"
        sleep 0.5
        task_list = all('.sort_deadline')
        expect(task_list[0]).to have_content '2021-07-02 00:00:00 +0900'
      end
    end
    context '優先順位でソートするというリンクを押した場' do
      it '一番遅優先順位が高いタスクが一番上に表示される' do
         visit tasks_path
         click_button "優先順位"
        sleep 0.5
        test_list = all('.sort_pryority')
        expect(test_list[0]).to have_content '高'
      end
    end
 end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
            visit task_path(task.id)
          expect(page).to have_content 'test_name'
       end
     end
  end
  describe '検索機能' do
    before do
      # 必要に応じて、テストデータの内容を変更して構わない
      # FactoryBot.create(:task, name: "test_name")
      # FactoryBot.create(:scond_task, status: "完了")
    end
    context 'タイトルであいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        visit tasks_path
        fill_in :name, with: 'test_name'
        click_on "検索"
        expect(page).to have_content "test_name"
      end
    end
    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
          visit tasks_path
          select '完了', from: 'status'
          visit tasks_path
          expect(page).to have_content "完了"
      end
    end
    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
            visit tasks_path
            fill_in :name, with: 'test_name'
            select '完了', from: 'status'
            visit tasks_path
            expect(page).to have_content "test_name"
            expect(page).to have_content "完了"
      end
    end
  describe 'ラベル登録機能' do
    let!(:label){ FactoryBot.create(:label)}

      context 'タスク登録時にラベルも登録した場合' do
          it  'ラベルも同時に作成される'do
            visit new_task_path
            fill_in "task[name]",	with: "合格希望"
            fill_in "task[content]",	with: "お願いします。"
            fill_in "task[deadline]",	with: "2021-07-01 00:00:00"
            select '完了', from: 'task[status]'
            select '高', from: 'task[priority]'
            check 'task[label_ids][]'
            click_button '登録'
        end
      end
    end
  end
end
