require 'csv'

def csv_to_ruby(path_to='/Users/yulin/Documents/ge-locales.csv')
  ruby_file_path = path_to.gsub('csv', 'rb')
  csv = CSV.open path_to
  header = {}
  content = []
  csv.each_with_index do |row, r_index|
    msg = {}
    row.each_with_index do |col, c_index|
      if r_index == 0
        header[c_index] = col
      else
        msg[header[c_index]]=col
      end
    end
    
    content << msg
  end
  
  File.open(ruby_file_path, 'w+') do |file|
    content.each do |msg|
      next if msg.size == 0
      file.write "msg = {\n"
      msg.each do |lan, con|
        con = con.gsub('"', '\"')
        file.write "'#{lan}' => \"#{con}\",\n"
      end
      file.write "}\n"
    end
    file.write "\n\n"
    file.write 'msgs = '
    file.write content.inspect
    file.write "\n\n"
  end
end

csv_to_ruby