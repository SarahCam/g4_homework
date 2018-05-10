
# C. Given the following data structure:
#
united_kingdom = [
  {
    name: "Scotland",
    population: 5295000,
    capital: "Edinburgh"
  }, {
    name: "Wales",
    population: 3063000,
    capital: "Swansea"
  }, {
    name: "England",
    population: 53010000,
    capital: "London"
  }
]
# Change the capital of Wales from "Swansea" to "Cardiff".
for country in united_kingdom
  if country[:name] == "Wales"
    country[:capital] = "Cardiff"
  end
end
p united_kingdom

# Create a Hash for Northern Ireland and add it to the united_kingdom array
# (The capital is Belfast, and the population is 1,811,000).
united_kingdom[3] = Hash.new
united_kingdom[3][:name] = "Northern Ireland"
united_kingdom[3][:population] = 1811000
united_kingdom[3][:capital] = "Belfast"
p united_kingdom

# Use a loop to print the names of all the countries in the UK.
for country in united_kingdom
  p country[:name]
end

# Use a loop to find the total population of the UK.
total_pop = 0
for country in united_kingdom
  total_pop += country[:population]
end
p total_pop
