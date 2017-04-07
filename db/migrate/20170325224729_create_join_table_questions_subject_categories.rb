class CreateJoinTableQuestionsSubjectCategories < ActiveRecord::Migration
  def change
    create_join_table :questions, :subject_categories do |t|
      t.index [:question_id, :subject_category_id], name: 'index_q_id_on_sc_id'
      t.index [:subject_category_id, :question_id], name: 'index_sc_id_on_q_id'
    end
  end
end
