# frozen_string_literal: true

puts "Seeding..."

Land::HttpMethod.seed 'GET', 'POST', 'PUT', 'HEAD', 'OPTIONS'
Land::Path.seed "/test"
Land::QueryString.seed ""
