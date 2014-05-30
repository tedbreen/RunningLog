runs = File.readlines('logs.txt')
runs.map!{ |run| run.split('$') }
runs.each do |run|
  run.map!{ |r| r.strip }
end
runs.each do |run|
  run[0] = run[0].split('/')
end

f = File.new("seed_data.rb", "w")

runs.each do |run|
  run_type = run[2]
  year = run[0][2]
  month = run[0][0]
  day = run[0][1]
  city = run[4]
  state = run[5]
  title = run[3]
  distance = run[1]

  line = "Run.create(user_id:2, run_type:#{run_type}, city:'#{city}', state:'#{state}', start_date: DateTime.new(#{year},#{month},#{day},12,0,0), title:'#{title}', description:'The description of your run will go here.  It can include anything you want to say about your run! Hopefully it was a good expereience', distance:#{distance})\n"
  f.write(line)
end

f.close