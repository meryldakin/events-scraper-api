require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'pry'
require 'csv'




class Importer

  def initialize
  end

  def self.import(url) 
    
    page = HTTParty.get(url)
    parse_page = Nokogiri::HTML(page)
    $i = 0
    $num = 10
    while parse_page.css('.feature-item')[$i]  do
      title = parse_page.css('.feature-item__column > h3')[$i].children.text.strip
      url = parse_page.css('.feature-item__column > a[data-tracking]')[$i]['href']
      description = parse_page.css('.feature-item__column > div.feature_item__annotation--truncated')[$i].css('p').text
      date = parse_page.css('.feature-item')[$i].css(' .listing_meta_controls > .listings_flags_bar > .listings_flags > .icon_calendar').text.strip
      Event.new(title, url, description, date)
      $i += 1
    end
    Event.all
  end

end


class Event 
  attr_accessor :title, :url, :description, :date
  @@all = []

  def initialize(title, url, description, date)
    @title = title
    @url = "https://www.timeout.com" + url
    @description = description
    @date = date
    @@all << self
  end

  def self.all
    @@all
  end

end


Pry.start

