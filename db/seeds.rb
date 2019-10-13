require 'nokogiri'
require 'open-uri'
require 'rubygems'

wordsArray = []
definitionsArray = []
url = 'https://en.wiktionary.org/wiki/Appendix:Glossary_of_fighting_games'
data = Nokogiri::HTML(open(url))
words = data.css('.mw-headline')
definitions = data.css('.mw-body-content p')


words.each do |word|
    wordsArray.push(word.text)
end

definitions.each do |definition|
    definitionsArray.push(definition.text)
end

definitionsArray.delete(definitionsArray.first)



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
