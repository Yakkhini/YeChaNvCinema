# frozen_string_literal: true

require 'csv'

# Read data from file.
entity_id_file = CSV.read('entity_id.csv', headers: false, encoding: 'BOM|UTF-8')

id = []

entity_id_file.each do |row|
  id << row[1]
end

puts id

matrix = Array.new(id.size) { Array.new(id.size, 0) }

puts matrix

raw_data_with_id = CSV.read('raw_data_with_id.csv', headers: false, encoding: 'BOM|UTF-8')

raw_data_with_id.each do |row|
  id.each do |entity|
    next unless row.include?(entity)

    row.each do |item|
      puts id.index(entity)
      puts id.index(item)
      matrix[id.index(entity)][id.index(item)] += 1 if item != entity && item.include?('CN') == false
    end
  end
end

puts matrix.length
puts matrix[1].length

CSV.open('matrix.csv', 'wb') do |csv|
  matrix.each do |row|
    csv << row
  end
end
