require 'uri'
require 'net/http'

uri = URI('your_endpoint')

resp = Net::HTTP.get_response(uri)

if resp.is_a?(Net::HTTPSuccess)
  puts resp.body
else
  puts "Status: #{resp.code}, message: #{resp.message}"
end
