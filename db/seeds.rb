# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email


category_names = ["Буше","Керамика","Хрусталь","Классика","Детство","Диамант",
				  "Универсал","Еврокаркасы ","Флористика","Геометрия","Image Light",
				  "Ковка","Медь","Модерн","Мозайка","Органза","Панели ","Ротанг",
				  "Водопады","Бра","Настольные Лампы","Торшеры",]

brand_names = %w(БелСвет ЦУМ Valve Sony Samsung Any_long_brand_name_to_test_layout)

category_names.each do |name|
  puts "Category created #{name}" if Category.create!(name: name)
end

brands = brand_names.each do |name|
  brand = Brand.create!(name: name)
  Category.all.each do |category|
  	product_params = {
      name: Forgery(:lorem_ipsum).words(rand(1..3)),
      description: Forgery(:lorem_ipsum).words(rand(50..140)),
      price: rand(10000000), category_id: category.id, brand_id: brand.id
    }
    Product.create!(product_params)
  end
end


Delivery.new(name: "Курьером", description: "Э фасся джигит сгорных гор падгонит пабрацки чиста э нахуй").save!
Delivery.new(name: "Почтой" , description: " ЧёКаво туда сюда привезут увезут").save!
Delivery.new(name: "Крысами", description: "По минску толькаэ").save!

