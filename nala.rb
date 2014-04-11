# 
# ~/Downloads/nala
# gem install spreadsheet
require 'csv'
require 'spreadsheet'

def csv_to_xls(csv_content)

  ary = CSV.parse(csv_content)

  book = Spreadsheet::Workbook.new
  sheet = book.create_worksheet
  ary.each_with_index do |row_ary, index|
    row = sheet.row(index)
    row.push(*row_ary)
  end
  content = ''
  ios = StringIO.new(content)
  book.write(ios)
  content
end

def file_to_csv(path_to)
  files = `ls #{path_to}`.split("\n")
  files.each do |file_name|
    next if file_name == 'csv' || file_name == 'excls'
    p file_name
    file_names = file_name.split('.')
    file_names.delete file_names.last
    `cp #{path_to}/#{file_name} #{path_to}/csv/#{file_names.join('.')}.csv`
  end
end


def file_to_xls(path_to)
  files = `ls #{path_to}/csv`.split("\n")
  files.each do |file_name|
    # file_content = `cat #{path_to}/csv/#{file_name}`
    # p "covert #{path_to}/csv/#{file_name} to xls"
    xls_con = csv_to_xls `cat #{path_to}/csv/#{file_name}`
    file_names = file_name.split('.')
    file_names.delete file_names.last
    
    File.new("#{path_to}/xls/#{file_names.join('.')}.xls", 'w+').write(xls_con)
    p "#{path_to}/csv/#{file_name} ====>>> #{path_to}/xls/#{file_names.join('.')}.xls ----> OK "
  end
end

def start
  curr_dir = `cd ~ && pwd`.gsub("\n", '')
  path_to = ENV['path'] || '~/Downloads/nala'
  path_to = path_to.gsub('~', curr_dir)
  if File.exists? "#{path_to}/csv"
    `rm -rf #{path_to}/csv`
  end
  if File.exists? "#{path_to}/csv"
    `rm -rf #{path_to}/xls`
  end
  `mkdir #{path_to}/csv`
  `mkdir #{path_to}/xls`
  file_to_csv path_to
  file_to_xls path_to
end

start




