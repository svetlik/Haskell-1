#!/usr/bin/env ruby

class HelpHass
  attr_reader :stations

  def initialize(stations)
    @stations = stations
  end

  def arrayize
    @stations.split(",")
  end

  def possible_routes
    all = []
      arrayize.permutation.each { |element| all << element.join(" ") }
    all
  end

  def routes_for_hass
    return "H L" if @stations.include?("H L")
    possible_routes.select {|route| self.valid_routes(route)}
    .min_by {|route| route.length}.squeeze.gsub(" ","").squeeze.gsub(/(.{1})/, '\1 ').rstrip
  end

  def valid_routes(routes_list)
    routes_list.split(" ").slice(1..-2).each_slice(2).all? {|first, last| first == last}
  end
end

$/ = "end"

print "Enter trains "
p stations = gets.chomp.gsub(/\n/, ",").rstrip

puts HelpHass.new(stations).routes_for_hass
