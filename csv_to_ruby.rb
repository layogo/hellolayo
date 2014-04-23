require 'csv'

def csv_to_ruby(path_to='/Users/yulin/Documents/ge-push-locales.csv')
  ruby_file_path = path_to.gsub('csv', 'rb')
  csv = CSV.open path_to
  header = csv.first
  content = {}
 # content[title]={'cn' => [msg1, msg2], 'en' => [msg1, msg2]}
  csv.each_with_index do |row, r_index|

    next if row.nil? || row[0].nil? || r_index == 0
    
    # p row
    title = row[0]
    content[title] = {} if content[title].nil?
    # msg = {}
    row.each_with_index do |col, c_index|
      
      next if c_index == 0
      
      if content[title][header[c_index]].nil?
        # content[title][header[c_index]]
        content[title][header[c_index]] = [col]
      else
        content[title][header[c_index]] << col
      end
      
    end
    # content[title] << msg

  end
  # require 'yaml'
  p content
   # content[title]={'cn' => [msg1, msg2], 'en' => [msg1, msg2]}
  File.open(ruby_file_path, 'w+') do |file|
    # file.write content.to_yaml
    content.each do |title, msg|
      
      # file.write "\# #{title}\n"
      file.write "msgs = {\n"
  
      next if msg.nil? || msg.size == 0
      msg.each do |lan, con|
        if con.nil?
          file.write "\"\",\n"
          next
        end
        p con
        if con.size == 1
          con = con.first.gsub('"', '\"').gsub("\n", '')
          file.write "'#{lan}' => \"#{con}\",\n"
        else
          file.write "'#{lan}' => [ \n"
          con.each do |c|
            if c.nil?
              file.write "\"\",\n"
            else
              c = c.gsub('"', '\"').gsub("\n", '')
              file.write "\"#{c}\", \n"
            end
          end
          file.write "],\n"
        end
          
      end
      file.write "}\n"
      file.write "\# #{title.gsub('.', '-')}\n"
      file.write "add_chat_msg_notifiy msgs, title, from, to\n\n\n"
    end
    file.write "\n\n\n"
    # file.write 'msgs = '
    # file.write content.inspect
    # file.write "\n\n"
  end
end

csv_to_ruby