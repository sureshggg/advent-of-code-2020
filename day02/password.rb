class Password

  def initialize(line)
    data = line.match /(.*)-(.*) (.*): (.*)/
    if data
      @min = data[1].to_i
      @max = data[2].to_i
      @char = data[3].to_s
      @password = data[4]
    end

    check_valid
  end

  # def check_valid
  #   count = @password.scan(@char).count

  #   @is_valid = ( count >= @min && count <= @max)
  # end

  def check_valid
    first_match = (@password[@min - 1] == @char) 
    second_match =  (@password[@max - 1] == @char )
    @is_valid = (  first_match || second_match ) && !(first_match && second_match)
  end

  def valid?
    @is_valid
  end

end

class PasswordValidator

  def self.validate(lines)
    c = lines.filter do |l|
      p = Password.new(l)
      p.valid?
    end.count
    puts c
  end
end

input = File.readlines("input.txt").map {|l| l.strip}

PasswordValidator.validate(input)
