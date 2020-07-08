
require 'nokogiri'
require 'open-uri'
require 'rubygems'

wordsArray = []
definitionsArray = []
url = 'https://dotesports.com/general/news/fighting-games-glossary-2106'
data = Nokogiri::HTML(open(url))
words = data.css('h2')
definitions = data.css('p')
words.each do |word|
    wordsArray.push(word.text)

end

definitions.each do |definition|
    definitionsArray.push(definition.text)
    
end

4.times do
  definitionsArray.delete(definitionsArray.first)
end

definitionsArray.each do |definition|
  if definition.include?('See:') === true
    definitionsArray.delete(definition)
  end
end

completeArray = Hash[wordsArray.zip definitionsArray]

completeArray.each do |key,value|
  unless value.nil?
      Vocabulary.create!(
          word: key,
          definition: value
      )
   end
end

admin = User.create!(
  user_name: "fakeadmin",
  email: "fakeadmin@happypath.com",
  password: "password",
  admin: true
)
