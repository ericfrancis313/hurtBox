require 'nokogiri'
require 'open-uri'
require 'rubygems'

url = 'https://en.wiktionary.org/wiki/Appendix:Glossary_of_fighting_games'
data = Nokogiri::HTML(open(url))
words = data.css('.mw-headline')
definitions = data.css('.mw-body-content p')

wordsArray = []
definitionsArray = []

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

h = Hash[wordsArray.zip definitionsArray]


h.each do |key,value|
  Vocabulary.create!(
    Word: key,
    Definition: value
  )
end
