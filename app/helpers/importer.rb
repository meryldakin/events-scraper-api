class Importer

    def self.import(url, month)
        page = HTTParty.get(url)
        parse_page = Nokogiri::HTML(page)
        $i = 0
        # $num = 10
        # byebug
        while parse_page.css('.feature-item')[$i]  do
          # while $i < $num  do
            name = parse_page.css('.feature-item')[$i].css('.feature-item__content').css('.feature-item__column').css('h3').children.text.strip

            url = "https://www.timeout.com" + parse_page.css('.feature-item')[$i].css('.feature-item__content').css('.feature-item__column').css('a[data-tracking]')[0]['href']

          description = parse_page.css('.feature-item')[$i].css('.feature-item__content').css('.feature-item__column').css('div.feature_item__annotation--truncated').css('p').text
          
          image = parse_page.css('.feature-item')[$i].css('.feature-item__content').css('.feature-item__column--image').css('.image_wrapper').children[1] ? parse_page.css('.feature-item')[$i].css('.feature-item__content').css('.feature-item__column--image').css('.image_wrapper').children[1].attributes['src'].value : nil

          date = parse_page.css('.feature-item')[$i].css(' .listing_meta_controls > .listings_flags_bar > .listings_flags > .icon_calendar').text.strip

          Event.create(name: name, url: url, description: description, date: date, month: month, source_id: 1, image_url: image)

          $i += 1
        end

      end

end
