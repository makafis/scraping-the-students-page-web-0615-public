require 'nokogiri'
require 'open-uri'
require 'pry'


class Student
  attr_accessor :name, :excerpt, :student_link, :meta
  @@student_hash = {}

  def initialize(name)
    @@student_hash[name.to_sym] = self
    @name = name
  end
  #hash getter
  def self.hash_getter
    @@student_hash
  end
end #end class Student



  url = 'http://web0615.students.flatironschool.com/'
  data = Nokogiri::HTML(open(url))




  profiles = data.css('.home-blog-post')


def get_student_names(profiles)
    name_array = []
    excerpt = []
    profiles.each do |element|

      name_array << "#{element.css('.big-comment h3 a').text}" 
      excerpt << "#{element.css('.excerpt p').text}"
    end
    binding.pry
end




get_student_names(profiles)




