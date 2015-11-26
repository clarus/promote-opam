# Generate the CSV file.
require 'json'
require 'csv'

projects = JSON.parse(File.read("projects.json"))
CSV.open("projects.csv", "w") do |f|
  for project in projects
    f << [project["html_url"]]
  end
end
