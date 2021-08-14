# Basic Countdown numbers solver
# Principally ported from Jake Archibald's JS solution
# at https://jsbin.com/yimejin/4/edit?js,console

def solve(nums, target)
  bs = nil
  nums.sort.reverse.combination(2).each do |i, j|
    %I{+ - * /}.each do |op|
      next if op == :* && (i == 1 || j == 1)
      next if op == :/ && (j == 1 || i % j != 0)
      res = i.send(op, j)
      next if op == :- && res == 0

      return "#{i} #{op} #{j} = #{res}" if res == target

      nn = nums.dup + [res]
      nn.delete_at(nn.index(i))
      nn.delete_at(nn.index(j))
      if ss = solve(nn, target)
        bs = "#{i} #{op} #{j} = #{res}\n#{ss}"
      end
    end
  end
  bs
end

target = Random.new.rand(100..999)
  nums = [25, 50, 75, 100].sample(2) +
         (Array(1..10) * 2).sample(4)

puts "Goal: Reach #{target} with #{nums}"
puts solve(nums, target) || "No solution"