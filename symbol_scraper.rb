require 'open-uri'
require 'nokogiri'
require 'ap'

# Find all images - actual images and those which are just math symbols

root_domain = "http://projecteuler.net/"
index = root_domain + "show=all"

folder = "all_problems"

# Set up Regexp patterns for finding images and img attributes
image_pattern = /<img (.*?)>/
attr_pattern  = "['\"](.*?)['\"]"
alt_pattern   = Regexp.new("alt="+attr_pattern)
src_pattern   = Regexp.new("src="+attr_pattern)
symbol_pattern = /src=['\"]images\/symbol_(.*?)\.gif/


# Scrape site
doc = Nokogiri::HTML(open(index))
html = doc.to_html

ap all_image_tags = html.scan(image_pattern).flatten.uniq

all_images = images.map do |tag|
  alt = tag[alt_pattern]
  src = tag[src_pattern]

  {alt: alt, src: src}
end

partitions = all_images.partition do |image|
  image[:src][symbol_pattern]
end

symbols = partitions[0]
images  = partitions[1]

p images
p symbols