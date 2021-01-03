require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4] # Coercion over questions
end

def legislators_by_zipcode(zipcode)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = ~
  legislators = civic_info.representative_info_by_address(
    address: zipcode, 
    levels: 'country', 
    roles: ['legislatorUpperBody', 'legislatorLowerBody']
  ).officials
  rescue 
    "You can find your representatives by visiting: www.commoncause.org/take-action/find-elected-officials"
end

puts 'EventManager Initialized...'

contents = CSV.open(
  'event_attendees.csv', 
  headers: true, 
  header_converters: :symbol
)

template_letter = File.read 'form_letter.erb'
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0] # Assign an ID for the attendee
  first_name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislator_names = legislators_by_zipcode(zipcode)
  form_letter = erb_template.result(binding)
  
  # Create an output folder
  Dir.mkdir('output') unless Dir.exist?('output')
  filename = "output/thanks_#{id}.html"

  # Save each form letter to a file based on the id of the attendee
  File.open(filename, 'w') do | file |
    file.puts form_letter
  end
end
