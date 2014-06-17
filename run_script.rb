runs = File.readlines('logs.txt')
runs.map!{ |run| run.split('$') }
runs.each do |run|
  run.map!{ |r| r.strip }
end
runs.each do |run|
  run[2] = run[2].split('/')
end
runs.each do |run|
  run[3] = run[3].split(':')
end
f = File.new("seed_data.rb", "w")

runs.each do |run|

  user_id = run[0]
  type = run[1]
  year = (run[2][2]).to_i
  month = (run[2][0]).to_i
  day = (run[2][1]).to_i
  hour = (run[3][0]).to_i
  min = (run[3][1]).to_i
  sec = (run[3][2]).to_i
  distance = run[4]
  title = run[5]
  city = run[6]
  state = run[7]
  description = run[8]


  line = "Run.create(user_id:#{user_id}, run_type:#{type}, time_date: DateTime.new(#{year},#{month},#{day},#{hour},#{min},#{sec},'-7'), distance:#{distance}, city:'#{city}', state:'#{state}', title:'#{title}', description:'#{description}')\n"
  f.write(line)
end

f.close
