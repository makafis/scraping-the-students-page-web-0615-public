require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative 'Student_Class.rb'




  url = 'http://web0615.students.flatironschool.com/'
  data = Nokogiri::HTML(open(url))




  profiles = data.css('.home-blog-post')


def set_up_student_hash(profiles)
    profiles.each do |element|

      student = Student.new("#{element.css('.big-comment h3 a').text}")
      student.excerpt = "#{element.css('.excerpt p').text}"
      student.student_link = ("#{element.css('.big-comment h3 a').attribute('href').value}")
    
      student.meta = ("#{element.css('.home-blog-post-meta').text}")
    end
    # binding.pry
end







