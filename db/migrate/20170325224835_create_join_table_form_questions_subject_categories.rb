class CreateJoinTableFormQuestionsSubjectCategories < ActiveRecord::Migration
  def change
    create_join_table :form_questions, :subject_categories do |t|
      t.index [:form_question_id, :subject_category_id], name: 'index_fq_id_on_sc_id'
      t.index [:subject_category_id, :form_question_id], name: 'index_sc_id_on_fq_id'
    end
  end
end
