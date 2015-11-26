# Get the JSON list of projects.
require 'json'

all_repos = []

for i in 1..34
  request = "curl 'https://api.github.com/search/repositories?q=language:Coq&page=#{i}'"
  puts request
  repos = `#{request}`
  all_repos += JSON.parse(repos)["items"]
  sleep(7) # Because there is a maximum of 10 requests per minutes.
end

File.open("projects.json", "w") do |f|
  f << JSON.generate(all_repos)
end
