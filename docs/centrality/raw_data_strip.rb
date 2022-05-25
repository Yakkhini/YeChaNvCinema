# frozen_string_literal: true

require 'csv'

# Read raw data file.
raw_data_file = CSV.read('raw_data.csv', headers: false, encoding: 'BOM|UTF-8')

# Creat a csv file named "raw_data_stripped.csv" to save the stripped data.
CSV.open('raw_data_stripped.csv', 'wb') do |csv|
  # Iter the raw data file by lines.
  raw_data_file.each do |row|
    # Generate a empty array.
    result_row = []
    # Let the potent code be the first column.
    result_row << row[0]
    # Split the potent owner string by pattern " | " into an array, and append it to result row.
    result_row += row[4].split(' | ')
    csv << result_row
  end
end
