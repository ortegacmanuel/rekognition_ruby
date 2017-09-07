require 'dotenv'
Dotenv.load
require 'aws-sdk'

client = Aws::Rekognition::Client.new

resp = client.recognize_celebrities(
         image: { bytes: File.read(ARGV.first) }
       )

resp.celebrity_faces.each do |face|
  puts "En la foto está #{face.name}"
end
