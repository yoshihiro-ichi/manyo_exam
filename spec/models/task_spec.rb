require 'rails_helper'
describe 'タスクモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(name: '', content: '失敗テスト')
        expect(task).not_to be_valid
      end
    end

    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(name: 'test' ,content: '')
        expect(task).not_to be_valid
      end
    end

    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task = Task.create(name: 'test',content:'test' )
        expect(task).to be_valid
      end
    end
    describe '検索機能' do
       # 必要に応じて、テストデータの内容を変更して構わない
       let!(:task) { FactoryBot.create(:task, name: 'task',status: "完了") }
       let!(:scond_task) { FactoryBot.create(:scond_task, name:'ninjin' ,status: "未着手") }
       context 'scopeメソッドでタイトルのあいまい検索をした場合' do
         it "検索キーワードを含むタスクが絞り込まれる" do
           # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
           expect(Task.name_search('task')).to include(task)
           expect(Task.name_search('task')).not_to include(scond_task)
           expect(Task.name_search('task').count).to eq 1
         end
       end
       context 'scopeメソッドでステータス検索をした場合' do
         it "ステータスに完全一致するタスクが絞り込まれる" do
           expect(Task.status_search('完了')).to include(task)
           expect(Task.status_search('完了')).not_to include(scond_task)
           expect(Task.status_search('完了').count).to eq 1
         end
       end
       context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
         it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
           expect(Task.name_search('task')).to include(task)
           expect(Task.name_search('task')).not_to include(scond_task)
           expect(Task.status_search('完了')).to include(task)
           expect(Task.status_search('完了')).not_to include(scond_task)
           expect(Task.name_search('task').count).to eq 1
           expect(Task.status_search('完了').count).to eq 1
        end
      end
    end
  end
end
