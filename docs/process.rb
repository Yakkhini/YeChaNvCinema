require 'csv'

data = CSV.read('data.csv', headers:true)

CSV.open("result.csv", "wb") do |csv|
    for row in data do
        if row[4].include? '|' and row[6] != "驳回" and row[6] != "撤回" then
            csv << row
        end
    end
end

