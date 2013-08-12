require 'open-uri'
require 'nokogiri'
require 'ap'
require_relative 'symbols'


root_domain = "http://projecteuler.net/"
index = root_domain + "show=all"
folder = "all_problems"

doc = Nokogiri::HTML(open(index))

# Parse specific content from each problem
def parse(content)
  content.text

  # Replace all images with alt text if it exists
  content.css('img[@alt]').each{ |i| i.swap( i['alt'] ) }
end

# Parse HTML for each problem
problems = doc.css(".problem_content").map do |content|
  title = content.previous_element
  url   = root_domain + title.css("a").attribute("href").text
  number = title.text[/\d+/].to_i
  parsed_content = parse(content)

  {number: number, title: title.text, url: url, content: parsed_content}
end
ap problems[3..7]


# # Write to files
# problems.each do |problem|
#   filename = "%s/%03d.rb" % [folder, problem[:number]]
#   # p filename
   
#   text  = "# #{problem[:title]}\n"
#   text += "# #{problem[:url]}\n"

#   content = problem[:content].gsub(/\r\n?/, "\n").gsub(/\n+\z/,"").gsub(/\n/,"\n# ")
#   content.prepend("\n# ") << "\n\n"

#   text += content

#   File.open(filename, 'w+') do |file| 
#     file.write(text) 
#   end
# end