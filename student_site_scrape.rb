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




def student_social(url, student)
  individual_page = Nokogiri::HTML(open(url))

  icons = (individual_page.css('.social-icons a'))

  icons.each do |value|
      if value.attribute('href').value.include?("twitter")
          #add to twitter 
          student.twitter = value.attribute('href').value
      end
      if value.attribute('href').value.include?("github")
     
      student.github = value.attribute('href').value      
      end
      if value.attribute('href').value.include?("linkedin")
    
      student.linkedin = value.attribute('href').value      
      end
  end

  puts "Here is a link to the students account #{student.twitter}"
  puts "Here is a link to the students account #{student.github}"
  puts "Here is a link to the students account #{student.linkedin}"



  #ok-text-column-2
  biography = (individual_page.css('#ok-text-column-2 p').first.text)
  puts "The Biography of #{student.name} is: #{biography}"


end






