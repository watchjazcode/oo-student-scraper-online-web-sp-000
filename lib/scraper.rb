require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    students = []
    doc.css(".student-card").each do |row|
      students << {
      :name => row.css(".student-name").text,
      :location => row.css(".student-location").text,
      :profile_url => row.css("a").attribute("href").value
      }
    end
    return students
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(index_url))
    profile = {}
    doc.css(".social-icon-container a").each do |link| 
      href = link.attribute("href").value 
    end
    doc.css(".student-card")
      {
      :twitter => doc.css("a").attribute("href").value,
      :linkedin => doc.css("a").attribute("href").value,
      :github => doc.css("a").attribute("href").value,
      :blog => doc.css("a").attribute("href").value,
      :profile_quote => doc.css(".profile-quote").text,
      :bio => doc.css("p").text
      }
  end

end

def scrape_horror_movies
				rows = @doc.css("table.table tr")
				rows.shift
				rows[0..24].each do |row| 
					listing = Horror::Movie::Listing.new(row)
				end
			end

