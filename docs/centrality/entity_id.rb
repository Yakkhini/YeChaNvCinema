# frozen_string_literal: true

require 'csv'

# Read data from file.
stripped_raw = CSV.read('raw_data_stripped.csv', headers: false, encoding: 'BOM|UTF-8')

company_list = []
institute_list = []
indie_list = []

stripped_raw.each do |row|
  row.each do |item|
    if item.include?('公司') || item.include?('联盟')
      checker = true
      company_list.each do |cmp|
        checker = false if cmp == item
      end
      company_list << item if checker
    elsif item.include?('大学') || item.include?('院') || item.include?('所') ||
          item.include?('实验室') || item.include?('建设中心')
      checker = true
      institute_list.each do |ist|
        checker = false if ist == item
      end
      institute_list << item if checker
    elsif item.include?('CN') == false
      checker = true
      indie_list.each do |ind|
        checker = false if ind == item
      end
      indie_list << item if checker
    end
  end
end

company_list.sort!
institute_list.sort!
indie_list.sort!

puts company_list
puts institute_list
puts indie_list

CSV.open('entity_id.csv', 'wb') do |csv|
  code = 0
  company_list.each do |entity|
    csv << [entity, "C#{code}"]
    code += 1
  end
  code = 0
  institute_list.each do |entity|
    csv << [entity, "I#{code}"]
    code += 1
  end
  code = 0
  indie_list.each do |entity|
    csv << [entity, "S#{code}"]
    code += 1
  end
end

entity_id = CSV.read('entity_id.csv', headers: false, encoding: 'BOM|UTF-8')

CSV.open('raw_data_with_id.csv', 'wb') do |csv|
  stripped_raw.each do |row|
    result_row = []
    result_row << row[0]
    row.each do |item|
      entity_id.each do |id|
        result_row << id[1] if item == id[0]
      end
    end
    csv << result_row
  end
end
