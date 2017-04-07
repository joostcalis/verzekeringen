# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def clear_db
  puts 'clearing database'
  SubjectCategory.destroy_all
  Answer.destroy_all
  Insurer.destroy_all
  Question.destroy_all
  Admin.destroy_all
  FormAnswer.destroy_all
  FormQuestion.destroy_all
end

def create_subject_categories
  puts 'creating subject_categories'
  ['kosten', 'dekking', 'service', 'bereikbaarheid', 'hulp bij begrafenis', 'opzegbaarheid'].each do |name|
    SubjectCategory.create!(name: name)
  end
end

def create_insurers
  puts 'creating insurers'
  (1..5).each do |index|
    name = "Monuta - #{index}"
    second_name = "Yarden - #{index}"
    link = "www.mlb.com - #{index}"
    second_link = "www.google.com - #{index}"
    title = "Uitvaartverzekering Monuta #{index}"
    second_title = "Uitvaartverzekering Yarden #{index}"
    Insurer.create!(
      name: name,
      description: 'Hele vette verzekeraar',
      price: 100,
      insured_amount: 6000,
      extra_info: 'Bijna de pijp uit? Wij zijn de verzekering voor jou',
      affiliate_link: link,
      meta_keywords: 'heel veel vette keywords voor googleeee',
      meta_page_title: title,
      meta_description: 'Super vette beschrijving'
    )
    Insurer.create!(
      name: second_name,
      description: 'Kut verzekeraar, maar wel goedkoop',
      price: 20,
      insured_amount: 4000,
      extra_info: 'Goedkoop tot in de dood? Wij zijn de verzekering voor jou',
      affiliate_link: second_link,
      meta_keywords: 'goedkope troep verzekerking hoor',
      meta_page_title: second_title,
      meta_description: 'Super goedkope beschrijving'
    )
  end
end

def create_admins
  puts 'creating admins'
  Admin.create!(
    email: 'elvis@heaven.com',
    password: 'password'
  )
end

def create_question(content, categories)
  Question.create(
    content: content,
    published: true,
    subject_categories: categories
  )
end

def create_answers
  puts 'creating faqs and answers'
  answers = ['Dat weet je nooit, het zou zo maar kunnen', 'Verzeker je bij ons en we vertellen je het', 'Filosofisch gezien zou het in principe kunnen']
  ['Bestaat er een god?', 'Ben ik verzekerd van een plekje in de hemel?', 'Wanneer is het mijn tijd?'].each do |question_content|
    categories = SubjectCategory.order("RANDOM()").limit(2)
    (1..30).each do |index|
      q_name = [question_content, index].join('-')
      question = create_question(q_name, categories)
      Insurer.all.each do |insurer|
        Answer.create(
          content: answers.sample,
          question: question,
          insurer: insurer,
          score: rand(1..6)
        )
      end
    end
  end
end

def create_form_questions
  puts 'creating form_questions'
  SubjectCategory.all.each do |category|

    content = "Hoe belangrijk vindt u #{category.name}"
    FormQuestion.create!(content: content, subject_categories: [category])
  end
end


clear_db
create_subject_categories
create_insurers
create_admins
create_answers
create_form_questions
