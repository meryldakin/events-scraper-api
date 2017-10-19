class Importer 

    def self.import(url, month) 
        
        page = HTTParty.get(url)
        parse_page = Nokogiri::HTML(page)
        $i = 0
        $num = 10
        while parse_page.css('.feature-item')[$i]  do
          name = parse_page.css('.feature-item__column > h3')[$i].children.text.strip
          url = "https://www.timeout.com" + parse_page.css('.feature-item__column > a[data-tracking]')[$i]['href']
          description = parse_page.css('.feature-item__column > div.feature_item__annotation--truncated')[$i].css('p').text
          date = parse_page.css('.feature-item')[$i].css(' .listing_meta_controls > .listings_flags_bar > .listings_flags > .icon_calendar').text.strip
          Event.create(name: name, url: url, description: description, date: date, month: month, source_id: 1)
          $i += 1
        end
      end

end
