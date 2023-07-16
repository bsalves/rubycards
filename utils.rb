class Utils
  def readFile
    content = ''
    File.open('cards', "r") do |f|
      f.each_line do |line|
        content << line
      end
    end
    return content
  end

  def write(content)
    File.open('cards', 'w') do |file|
      file.write(content)
    end
  end
end
