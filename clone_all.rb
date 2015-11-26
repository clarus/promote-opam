# Clone all the Git projects.
require 'json'

projects = JSON.parse(File.read("projects.json"))

for project in projects do
  puts(project["full_name"], project["html_url"])
  system("git", "clone", project["ssh_url"], File.join("clones", project["full_name"]))
end
