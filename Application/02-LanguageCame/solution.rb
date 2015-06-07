#!/usr/bin/env ruby

class LanguageGame

  attr_reader :language, :word

  def initialize(language, word)
    @language = language
    @word = word
  end

  def check
    validate_letters && validate_length ? 'yes' : 'no'
  end

  def validate_letters
    @word == valid_word
  end

  def validate_length
    valid_word.length == valid_word_length
  end

  def valid_word
    valid_word = ""
    unique_letters.each { |letter| valid_word += letter * sequence_length }
    valid_word
  end

  def valid_word_length
    base.length * sequence_length
  end

  def base
    @language.gsub("^n", '')
  end

  def unique_letters
    letters = []
    @word.each_char { |char| letters << char }
    letters.uniq!
  end

  def first_letter
    @word.chr
  end

  def sequence_length
    @word.rindex(first_letter) + 1
  end
end

print "Define a lanugage? "
language = gets.chomp
print "Give a word? "
word = gets.chomp

puts game_result = LanguageGame.new(language, word).check
