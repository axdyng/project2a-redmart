# products
sampleImages = [
  'http://data.whicdn.com/images/58366654/original.jpg',
  'https://data.whicdn.com/images/22863369/large.jpg',
  'http://zestandzing.com.au/wp-content/uploads/2016/03/nutritionist-a2-milk-benefits.jpg',
  'https://cdn0.vox-cdn.com/thumbor/5NOFOS-aTyLYgoh9lpyYlf4hI7g=/0x0:1000x563/1310x737/cdn0.vox-cdn.com/uploads/chorus_image/image/47787999/ramenSS.0.0.jpg',
  'http://static.wixstatic.com/media/18a4e4_da884f16bdb442778410c70c5536dba6.jpg_srz_980_1234_85_22_0.50_1.20_0.00_jpg_srz',
  'https://hungrysquirrels.files.wordpress.com/2016/03/img_8142.jpg?w=640',
  'http://www.victorsfood.com.au/wp-content/uploads/2012/06/hot-chocolate-01.jpg',
  'http://i.imgur.com/kxZsek7.jpg',
  'http://a3145z1.americdn.com/wp-content/uploads/2013/04/banana-amazing-fruit-and-cure.jpg'
]

35.times do
  Product.create!(
    imgurl: sampleImages.sample,
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    description: Faker::Hipster.sentence
  )
end

# users
admin = User.create!(
  email:                 'dylan@gmail.com',
  password:              'test',
  password_confirmation: 'test'
)
admin.toggle!(:admin)

# reviews
8.times do
  content = Faker::Hipster.sentence
  product = Product.pluck(:id)
  User.first.reviews.create!(content: content, product_id: product.sample )
end
