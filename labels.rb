require 'dotenv'
Dotenv.load
require 'aws-sdk'

client = Aws::Rekognition::Client.new

resp = client.detect_labels(
         image: { bytes: File.read(ARGV.first) }
       )
       
resp.labels.each do |label|
  puts "#{label.name}-#{label.confidence.to_i}"
end
