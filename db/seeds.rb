# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def clear_db
  puts 'clearing database'
  Insurer.destroy_all
  Admin.destroy_all
end

def create_insurers
  puts 'creating insurers'
  Insurer.create!(
    name: 'Monuta',
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
    name: 'Yarden',
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

def create_admins
  puts 'creating admins'
  Admin.create!(
    email: 'elvis@heaven.com',
    password: 'password'
  )
end

clear_db
create_insurers
create_admins
