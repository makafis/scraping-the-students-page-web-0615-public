require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative 'Student_Class.rb'
require_relative 'student_site_scrape.rb'

url = 'http://web0615.students.flatironschool.com/'
data = Nokogiri::HTML(open(url))
profiles = data.css('.home-blog-post')



set_up_student_hash(profiles)


def get_user_name
  puts "please enter a student name"
  name = gets.chomp
  name

end


def get_student_info

  input_name = get_user_name #METHOD CALL
  name = input_name.upcase
  student_hash = Student.hash_getter

  if student_hash.has_key?(name)
    student = student_hash[name]
    puts "Name: #{student.name}"
    puts "Excerpt: #{student.excerpt}"
    # puts student.student_link
    url = "http://web0615.students.flatironschool.com/" << student.student_link
    student_hash[:student_link]
    system('open',url)
    puts  puts student.meta

    ###INDIVIDUAL USER PAGES SCRAPE
    x = individual_page(url, student)

    puts x
    
  else
    puts "#{input_name} does not exist"
    get_student_info
  end


end

get_student_info
