class Map
  attr_reader :rows

  def initialize(lines)
    @lines = lines
    @map = {}
    @rows = lines.length - 1
    @cols = -1
    init_map
  end

  def init_map
    row = 0
    col = nil
    @lines.each do |l|
      chars = l.split("")
      col = @cols + 1
      chars.each do |c|
        @map[[row, col].to_s] = c
        col += 1
      end
      row += 1
    end
    @cols = col - 1
  end

  def tree?(row, col)
    init_map if col > @cols

    @map[[row, col].to_s] == "#"
  end
end

class MapTraverse
  def initialize(map)
    @map = map
  end

  def trees(xinc = 1, yinc = 3)
    puts "for #{xinc} #{yinc}"
    x, y = 0, 0
    trees = []
    while @map.rows != x
      x, y = x + xinc, y + yinc
      trees << @map.tree?(x, y)
    end
    trees.filter { |t| t }.count
  end
end

input = File.readlines("input.txt").map { |l| l.strip }
m = Map.new(input)
mt = MapTraverse.new(m)
r = []
r << mt.trees(1,1)
r << mt.trees(1,3)
r << mt.trees(1,5)
r << mt.trees(1,7)
r << mt.trees(2,1)

puts r.inspect
puts r.reduce(1) {|v,prod| v * prod}
