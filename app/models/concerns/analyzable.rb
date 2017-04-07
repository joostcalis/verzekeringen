module Analyzable
  extend ActiveSupport::Concern

  module InstanceMethods

  end

  included do

  end
end

def get_average_score_hash(answers)
  method_string = answers.first.is_a?(Answer) ? 'question' : 'form_question'
  score_hash = {}
  answers.each do |answer|
    score = answer.score
    question = answer.send(method_string)
    categories = question.subject_categories
    categories.each do |category|
      if score_hash.has_key?(category.name)
        score_hash[category.name] << score
      else
        score_hash[category.name] = [score]
      end
    end
  end
  score_hash
end

def transform_to_averages(score_hash)
  average_hash = {}
  score_hash.each do |subject_name, score_array|
    average_hash[subject_name] = get_average(score_array)
  end
  average_hash
end

def get_average(array)
  (array.inject{ |sum, current_item| sum + current_item }.to_f / array.size).round(4)
end

def get_average_per_insurer
  insurer_scores = {}
  answers = Answer.includes(:insurer).includes(question: :subject_categories)
  Insurer.published.each do |insurer|
    selected_answers = answers.reject{ |a| a.insurer != insurer}
    average_hash = process_test_results_to_averages(selected_answers)
    insurer_scores[insurer.name] = average_hash
  end
  insurer_scores
end

# def create_fake_answers
#   answers = {}
#   SubjectCategory.pluck(:name).each do |name|
#     answers[name] = rand(1.00..5.00).round(4)
#   end
#   answers
# end

def get_final_scores(insurer_scores, test_scores)
  final_scores = {}
  insurer_scores.each do |insurer_name, score_hash|
    acc_score = 0
    score_hash.each do |category_name, score|
      if test_scores.has_key?(category_name)
        score_diff = ([score, test_scores[category_name]].max) - ([score, test_scores[category_name]].min)
        acc_score += score_diff
      end
    end
    final_scores[insurer_name] = acc_score
  end
  final_scores.sort_by{ |_,v| v }
end

def run_analyzer(test_form)
  puts "analyzing your results...one moment please"
  create_fake_answers(test_form)
  insurer_scores = get_average_per_insurer
  puts "this is the insurer_scores: #{insurer_scores}"
  test_result = process_test_results(test_form)
  final_score = get_final_scores(insurer_scores, test_result)
  puts 'We have analyzed your results, this is your testadvice:'
  final_score.first(3).each_with_index do |array, index|
    puts "#{index + 1}. #{array[0]}"
  end
  final_score
end

def create_fake_answers(test_form)
  questions = test_form.form_questions
  questions.each do |q|
    score = rand(1..6)
    answer = FormAnswer.create!(form_question: q, score: score)
  end
end

def process_test_results_to_averages(answers)
  score_hash = get_average_score_hash(answers)
  average_hash = transform_to_averages(score_hash)
end

def process_test_results(test_form)
  answers = FormAnswer.includes(:form_question).reject{ |a| a.form_question.test_forms.blank? }
  average_hash = process_test_results_to_averages(answers)
end
