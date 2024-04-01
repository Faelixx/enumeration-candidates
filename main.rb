# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'pp'
require './candidates'
require './filters'

## Your test code can go here


# pp @candidates

# experienced?(@candidates[1])
# experienced?(@candidates[2])
# experienced?(@candidates[3])

# puts find(10)

puts ordered_by_qualifications(@candidates)