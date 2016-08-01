# products
10.times do
  Product.create!(
    imgurl: Faker::Placeholdit.image("50x50"),
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    description: Faker::Hipster.sentence
  )
end

# reviews
8.times do
  content = Faker::Hipster.word
  the_user.reviews.create!(content: content)
end
