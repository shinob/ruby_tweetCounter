#!/usr/local/bin/ruby

require 'cgi'
require 'twitter'

$client ||= Twitter::REST::Client.new do |config|
  config.consumer_key = '[your key]'
  config.consumer_secret = '[your secret]'
end

$cgi = CGI.new()

$_GET = {}
CGI::parse($cgi.query_string).each {|key, val|
 $_GET[key] = val[0]
}

puts <<EOF
Content-Type: text/html;charset=utf-8
Status: 200 OK

EOF

def make_page(title, body)
  
  puts <<EOF
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <title>#{title}</title>
  <link href="main.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <h1>#{title}</h1>
  <form>
    <input type="text" name="tag" />
    <input type="submit" name="submit" value="submit" />
  </form>
  <p>#{body}</p>
</body>
</html>
EOF

end

def get_twieet(tag)
  
  wk = []
  
  $client.search("#{tag}").map do |tweet|
    tmp = {}
    tmp["name"] = tweet.user.name
    tmp["text"] = tweet.text

    wk.push(tmp)
  end
  
  return wk
  
end
