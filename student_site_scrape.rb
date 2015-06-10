require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative 'Student_Class.rb'
require_relative 'student_site_scrape.rb'



 


def set_up_student_hash(profiles)
    profiles.each do |element|

      student = Student.new("#{element.css('.big-comment h3 a').text}")
      student.excerpt = "#{element.css('.excerpt p').text}"
      student.student_link = ("#{element.css('.big-comment h3 a').attribute('href').value}")
    
      student.meta = ("#{element.css('.home-blog-post-meta').text}")
    end
    # binding.pry
end



def individual_page(url, student)
  individual_page = Nokogiri::HTML(open(url))
binding.pry
  individual_profile = (individual_page.css('.social-icons a').attribute('href').value)

  puts individual_profile


end






