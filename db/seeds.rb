# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def clear_db
  puts 'clearing database'
  Question.destroy_all
  Insurer.destroy_all
  Admin.destroy_all
  Answer.destroy_all
end

def create_insurers
  puts 'creating insurers'
  (1..5).each do |index|
    name = "Monuta - #{index}"
    second_name = "Yarden - #{index}"
    Insurer.create!(
      name: name,
      description: 'Hele vette verzekeraar',
      price: 100,
      insured_amount: 6000,
      extra_info: 'Bijna de pijp uit? Wij zijn de verzekering voor jou',
      affiliate_link: 'www.mlb.com',
      meta_keywords: 'heel veel vette keywords voor googleeee',
      meta_page_title: 'Uitvaartverzekering Monuta',
      meta_description: 'Super vette beschrijving'
    )
    Insurer.create!(
      name: second_name,
      description: 'Kut verzekeraar, maar wel goedkoop',
      price: 20,
      insured_amount: 4000,
      extra_info: 'Goedkoop tot in de dood? Wij zijn de verzekering voor jou',
      affiliate_link: 'www.hackertyper.com',
      meta_keywords: 'goedkope troep verzekerking hoor',
      meta_page_title: 'Uitvaartverzekering Yarden',
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

def create_question(content)
  Question.create(
    content: content,
    published: true
  )
end

def create_answers
  puts 'creating faqs and answers'
  answers = ['Dat weet je nooit, het zou zo maar kunnen', 'Verzeker je bij ons en we vertellen je het', 'Filosofisch gezien zou het in principe kunnen']
  ['Bestaat er een god?', 'Ben ik verzekerd van een plekje in de hemel?', 'Wanneer is het mijn tijd?'].each do |question|
    (1..30).each do |index|
      q_name = [question, index].join('-')
      question = create_question(q_name)
      Insurer.all.each do |insurer|
        Answer.create(
          content: answers.sample,
          question: question,
          insurer: insurer
        )
      end
    end
  end
end

clear_db
create_insurers
create_admins
create_answers
