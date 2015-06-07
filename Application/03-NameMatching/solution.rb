#!/usr/bin/env ruby

class NameMatching
  attr_reader :name_counts, :names

  def initialize(name_counts, names)
    @name_counts = name_counts
    @names = names
  end

  def female_names_count
    @name_counts[-1].to_i
  end

  def male_names_count
    @name_counts[0].to_i
  end

  def names_list
    @names.split(" ")
  end

  def female_names
    names_list.each.select { |name| name.end_with?('tta') }
  end

  def male_names
    names_list.each.select { |name| name.end_with?('ss') }
  end

  def unknown_male_names_count
    male_names.count - male_names_count
  end

  def unknown_female_names_count
    female_names.count - female_names_count
  end

  def male_guess_probability
    return 1.0 if unknown_male_names_count == 0
    1.0 / (male_names.count - male_names_count)
  end

  def female_guess_probability
    return 1.0 if unknown_female_names_count == 0
    1.0 / (female_names.count - female_names_count)
  end

  def total_probability_of_success
    (female_guess_probability * male_guess_probability * 100).to_i.to_s + "%"
  end
end

print "Enter known name counts: "
name_counts = gets.chomp
print "Enter all names: "
names = gets.chomp

puts NameMatching.new(name_counts, names).total_probability_of_success
