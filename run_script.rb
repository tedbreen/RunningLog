runs = File.readlines('logs.txt')
runs.map!{ |run| run.split('$') }
runs.each do |run|
  run.map!{ |r| r.strip }
end
runs.each do |run|
  run[1] = run[1].split('/')
end
runs.each do |run|
  run[2] = run[2].split(':')
end
f = File.new("seeds.rb", "w")

runs.each do |run|

  type = run[0]
  year = run[1][2]
  month = run[1][0]
  day = run[1][1]
  hour = (run[2][0]).to_i
  min = (run[2][1]).to_i
  sec = (run[2][2]).to_i
  distance = run[3]
  title = run[4]
  city = run[5]
  state = run[6]
  description = run[7]

  hour = hour - 8
  
  if hour < 0
    hour = 24 + hour
  end


  line = "Run.create(user_id:1, run_type:#{type}, start_time: Time.new(2010, 1, 1, #{hour}, #{min}, #{sec}), start_date: DateTime.new(#{year},#{month},#{day},12,0,0), distance:#{distance}, city:'#{city}', state:'#{state}', title:'#{title}', description:'#{description}')\n"
  f.write(line)
end

f.close