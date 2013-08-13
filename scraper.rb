require 'open-uri'
require 'nokogiri'
require 'ap'
require_relative 'symbols'

puts SYMBOLS
root_domain = "http://projecteuler.net/"
index = root_domain + "show=all"
folder = "all_problems"

doc = Nokogiri::HTML(open(index))

# Parse specific content from each problem
def parse(doc)

  # Replace all images with alt text if it exists
  doc.css('img').each do |img| 
    src = img.attribute("src").value

    symbol_to_add = nil
    symbol_to_add = SYMBOLS[src] if SYMBOLS.keys.include?(src)

    text_to_add = symbol_to_add || src

    # new_node = Nokogiri::XML::Node.new "span", doc
    # new_node.content = text_to_add

    img.next_sibling.content = text_to_add + img.next_sibling.content
  end

  doc
end

# Parse HTML for each problem
problems = doc.css(".problem_content").map do |content|
  title = content.previous_element
  url   = root_domain + title.css("a").attribute("href").text
  number = title.text[/\d+/].to_i
  parsed_content = parse(content).text
  # puts parsed_content.class

  {number: number, title: title.text, url: url, content: parsed_content}
end
ap problems[3..7]


# Write to files
problems.each do |problem|
  filename = "%s/%03d.rb" % [folder, problem[:number]]
  # p filename
   
  text  = "# #{problem[:title]}\n"
  text += "# #{problem[:url]}\n"

  content = problem[:content].gsub(/\r\n?/, "\n").gsub(/\n+\z/,"").gsub(/\n/,"\n# ")
  content.prepend("\n# ") << "\n\n"

  text += content

  File.open(filename, 'w+') do |file| 
    file.write(text) 
  end
end