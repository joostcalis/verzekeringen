def create_insurers
  Insurer.create!(
  name: 'Yarden',
  description: 'Kut verzekeraar',
  price: 100,
  insured_amount: 6000,
  extra_info: 'geen extra info',
  affiliate_link: 'https://www.google.com'
  )
end
