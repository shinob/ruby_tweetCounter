#!/usr/local/bin/ruby

load 'twitter.rb'

tag = "test"

if $_GET.key?("tag") then
  tag = $_GET["tag"]
end

if tag == "" then
  tag = "test"
end

tw = get_twieet("#{tag}")
i = 1

html = "<p>#{tag} = #{tw.length}</p>"
tw.each do |row|
  html += "<h2>#{i}. #{row["name"]}</h2><p>#{row["text"]}</p>"
  i += 1
end

make_page(tag, html)
