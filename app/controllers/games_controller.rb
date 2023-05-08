require 'open-uri'

class GamesController < ApplicationController
  VOWELS = %w(A E I O U Y)

  def new
    @letters = VOWELS.sample(5)
    @letters += (('A'..'Z').to_a - VOWELS).sample(5)
    @letters.shuffle!
  end

  def score
    @letters = params[:letters].split
    @word = params[:word].upcase
    @english_word = english_word?(@word)

    @included = included?(@word, @letters)
  end

  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

  def included?(word, letters)
    # split your word into characters and for every each and one of them (letter)
    word.chars.all? do |letter|
      # count how times the letter appears in the word
      # check if the amount it appears is less or equal then the amount of times it appears in the letters array
      word.count(letter) <= letters.count(letter)
    end
  end
end
