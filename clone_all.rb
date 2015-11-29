# Clone all the Git projects.
require 'json'

projects = JSON.parse(File.read("projects.json"))

i = 0
for project in projects do
  i += 1
  puts("#{i} / #{projects.size}", project["full_name"], project["html_url"])
  system("git", "clone", project["ssh_url"], File.join("clones", project["full_name"]))
end
