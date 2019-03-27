namespace :dev do 
  task fake_restaurant: :environment do 
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name, 
      opening_hours: FFaker::Time.datetime, 
      tel: FFaker::PhoneNumber.short_phone_number, 
      address: FFaker::Address.street_address, 
      description: FFaker::Lorem.paragraph,
      category: Category.all.sample,
      image: File.open(File.join(Rails.root, "public/seed_image/#{rand(0..20)}.jpg"))
      )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end

  task fake_user: :environment do
    User.destroy_all
    20.times do |i|
      User.create!(
        email: FFaker::Internet.safe_email,
        name: FFaker::Name.name,
        intro: FFaker::Lorem.sentence,
        password: "123456"
        )
    end
    puts "have created fake users"
    puts "now you have #{User.count} users data"

    User.create(email: "root@example.com", password: "12345678", role: "admin", name: "root")
    puts "Default admin created!"
  end

  task fake_comment: :environment do
    Restaurant.all.each do |restaurant|
      3.times do |i|
        restaurant.comments.create!(
        content: FFaker::Lorem.sentence,
        user: User.all.sample
        )
      end
    end
    puts "have created fake comments"
    puts "now you have #{Comment.count} comment data"
  end

end
