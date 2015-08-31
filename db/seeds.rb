# db/seeds.rb impliments the faker gem to seed the db
  # gem 'faker'

# Working:
require 'faker'
# require 'populator'

111.times do
  article = Article.create( 
    :title => Faker::Name.title, #=> "Legacy Creative Director",
    :text => Faker::Lorem.sentence(11) #=> Corporis iusto vel reiciendis ut tenetur qui eos officiis rerum at consectetur.  
  )
  puts article.inspect
end
# rake db:reset db:migrate db:seed
# rake db:reset db:migrate db:seed --trace
# https://github.com/stympy/faker