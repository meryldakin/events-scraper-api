# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Source.create(name: "Time Out", url: "https://www.timeout.com")

# , "February", "March", "April", "May", "June", "July", "August", "September", "October", 
months = ["November", "December"]

months.collect do |month|
    # if  Date::MONTHNAMES.index(month) >= Date.today.month
        Importer.import("https://www.timeout.com/newyork/events-calendar/#{month}-events-calendar", Date::MONTHNAMES.index(month))
    # end
end