require 'open-uri'
require 'nokogiri'
require 'ap'

require_relative 'symbols'
ap SYMBOLS

root_domain = "http://projecteuler.net/"
index       = root_domain + "show=all"
folder      = "all_problems"

@doc = Nokogiri::HTML(open(index))


def add_next_text(element, text)
  new_node = Nokogiri::XML::Node.new "span", @doc
  new_node.content = text
  element.add_next_sibling(new_node)
end

def add_before_text(element, text)
  element.content = text + element.content
end

#=============================#
# Parse HTML for each problem #
#=============================#
problems = @doc.css('.problem_content').map do |problem_content|
  title  = problem_content.previous_element
  url    = root_domain + title.css('a').attribute('href').text
  number = title.text[/\d+/].to_i
  puts "Parsing: Problem #{number}"

  # Replace all images with alt text (math symbols) if it exists
  problem_content.css('img').each do |img|
    src = img.attribute('src').value

    symbol_to_add = nil
    symbol_to_add = SYMBOLS[src] if SYMBOLS.keys.include?(src)

    add_next_text(img, symbol_to_add || (root_domain + src))
  end

  problem_content.xpath('.//sup').each do |exp|
    add_before_text(exp, '^') unless (exp.next_sibling && exp.next_sibling.text == "/")
  end

  problem_content.css('blockquote > br').each do |br|
    add_next_text(br, "\n")
  end
  
  {number: number, title: title.text, url: url, content: problem_content.text}
end
# ap problems[3..7]


#================#
# Write to files #
#================#
problems.each do |problem|
  filename = "%s/%03d.rb" % [folder, problem[:number]]

  text  = "# #{problem[:title]}\n"
  text += "# #{problem[:url]}\n"

  content = problem[:content].gsub(/\r\n?/, "\n").gsub(/\n+\z/,"").gsub(/\n/,"\n# ")
  content.prepend("\n# ") << "\n\n"

  text += content

  File.open(filename, 'w+') do |file| 
    file.write(text) 
  end
end