require 'dotenv'
Dotenv.load
require 'aws-sdk'

client = Aws::Rekognition::Client.new

resp = client.detect_faces(
         image: { bytes: File.read(ARGV.first) }
       )

puts resp.face_details.count
#resp.labels.each do |label|
#  puts "#{label.name}-#{label.confidence.to_i}"
#end
