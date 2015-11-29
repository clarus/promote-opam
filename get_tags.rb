require 'csv'

CSV.open("tags.csv", "w") do |output|
  Dir.glob("clones/*/*") do |path|
    _, user, project = path.split("/")
    tags = `cd #{path} && git tag`
    puts "#{user}/#{project}: #{tags.split.size}"
    output << [user, project, tags.split.size]
  end
end
