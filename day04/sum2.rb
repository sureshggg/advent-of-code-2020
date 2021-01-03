class Passport
  REQD_FIELDS = [:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid]

  def initialize
    @details = {}
  end

  def add_detail(line)
    line.strip.split(" ").each do |field|
      key, value = field.split(":")
      @details[key.to_sym] = value
    end
  end

  def present?
    REQD_FIELDS.all? {|f| @details.key?(f) }
  end

  def valid?
    return false unless present?

    byr = @details[:byr].to_i
    return false unless byr >= 1920 && byr <= 2002

    iyr = @details[:iyr].to_i
    return false unless iyr >= 2010 && iyr <= 2020

    eyr = @details[:eyr].to_i
    return false unless eyr >= 2020 && eyr <= 2030

    m = @details[:hgt].match /(.*)(in|cm)$/
    return false unless m

    hgt = m[1].to_i
    unit = m[2]
    if unit == "cm"
      return false unless hgt >= 150 && eyr <= 193 
    elsif unit == "in"
      return false unless hgt >= 59 && eyr <= 76 
    end

    hcl = @details[:hcl].to_i
    return false unless hcl.match /^#[a-f0-9]{6}$/ 


    true
  end
end


lines = File.readlines('input.txt')
passports = []
passport = Passport.new

lines.each do |l|
  if l.strip.empty?
    passports << passport
    passport = Passport.new
    next
  end

  passport.add_detail(l)
end
passports << passport

puts passports.filter {|f| f.present?}.count

