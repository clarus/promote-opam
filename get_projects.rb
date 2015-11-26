# Get the JSON list of projects.
require 'json'

all_repos = []

for i in 31..35
  repos = `curl https://api.github.com/search/repositories?q=language:Coq&sort=updated&order=desc&page=#{i}`
  all_repos += JSON.parse(repos)["items"]
end

File.open("projects4.json", "w") do |f|
  f << JSON.generate(all_repos)
end
