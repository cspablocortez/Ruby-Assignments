require 'csv'
require 'google/apis/civicinfo_v2'

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
  )
  legislator_names = legislators.officials.map(&:name).join(", ")
  rescue 
    "You can find your representatives by visiting: www.commoncause.org/take-action/find-elected-officials"
end

puts 'EventManager Initialized...'

contents = CSV.open(
  'event_attendees.csv', 
  headers: true, 
  header_converters: :symbol
)

contents.each do |row|
  first_name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislator_names = legislators_by_zipcode(zipcode)
  puts "#{first_name} #{zipcode} #{legislator_names}"
end

# TODO: Iteration 4: Form Letters