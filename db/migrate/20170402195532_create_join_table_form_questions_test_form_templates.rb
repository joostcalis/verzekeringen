class CreateJoinTableFormQuestionsTestFormTemplates < ActiveRecord::Migration
  def change
    create_join_table :form_questions, :test_form_templates do |t|
      t.index [:form_question_id, :test_form_template_id], name: 'index_fq_id_on_tft_id'
      t.index [:test_form_template_id, :form_question_id], name: 'index_tft_id_on_fq_id'
    end
  end
end
