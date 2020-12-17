require 'json'

data = %({
  "emails": [
    {
      "subject": "Here's this week's homework!!",
      "date": "2015-01-04",
      "from": "Ariane"
    }
  ]
})

data = JSON.parse(data) 
# JSON.parse converts the string to a Ruby hash
# so we can call keys on it, and it will output an array with the single key defined on the outer hash:

p data.keys
p data["emails"].first["date"]