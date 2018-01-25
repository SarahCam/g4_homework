#############################################################################

# A. Given the following data structure:
#
# stops = [ "Croy", "Cumbernauld", "Falkirk High", "Linlithgow", "Livingston", "Haymarket" ]
stops = [ "Croy", "Cumbernauld", "Falkirk High", "Linlithgow", "Livingston", "Haymarket" ]
# Add "Edinburgh Waverley" to the end of the array
stops.push("Edinburgh Waverley")
# stops << "Edinburgh Waverley"
# Add "Glasgow Queen St" to the start of the array
stops.unshift("Glasgow Queen St")
# stops.insert(0, "Glasgow Queen St")
# Add "Polmont" at the appropriate point (between "Falkirk High" and "Linlithgow")
falkirk_high_index = stops.find_index("Linlithgow")
stops.insert(falkirk_high_index, "Polmont")
# Work out the index position of "Linlithgow"
# p stops.find_index("Linlithgow")
p stops.index("Linlithgow")
# Remove "Livingston" from the array using its name
stops.delete("Livingston")
# Delete "Cumbernauld" from the array by index
cumbernauld_index = stops.find_index("Cumbernauld")
stops.delete_at(cumbernauld_index)
# stops.delete("Cumbernauld")
# How many stops there are in the array?
p stops.count()
# How many ways can we return "Falkirk High" from the array?
p stops[2]
p stops[stops.find_index("Falkirk High")]
p stops[-5]
p stops.fetch(2)
p stops.fetch(-5)
# Reverse the positions of the stops in the array
stops.reverse!()
# Print out all the stops using a for loop
p "---------------"
for stop in stops
  p stop
end

p stops
p "END OF EXERCISE A"
p "-----------------"


#############################################################################

# B. Given the following data structure:
#
  users = {
    "Jonathan" => {
      :twitter => "jonnyt",
      :favourite_numbers => [12, 42, 75, 12, 5],
      :home_town => "Stirling",
      :pets => {
        "fluffy" => :cat,
        "fido" => :dog,
        "spike" => :dog
      }
    },
    "Erik" => {
      :twitter => "eriksf",
      :favourite_numbers => [8, 12, 24],
      :home_town => "Linlithgow",
      :pets => {
        "nemo" => :fish,
        "kevin" => :fish,
        "spike" => :dog,
        "rupert" => :parrot
      }
    },
    "Avril" => {
      :twitter => "bridgpally",
      :favourite_numbers => [12, 14, 85, 88],
      :home_town => "Dunbar",
      :pets => {
        "colin" => :snake
      }
    },
  }
# Get Jonathan's Twitter handle (i.e. the string "jonnyt")
p users["Jonathan"][:twitter]
# Get Erik's hometown
p users["Erik"][:home_town]
# Get the array of Erik's favourite numbers
p users["Erik"][:favourite_numbers]
# Get the type of Avril's pet Colin
p users["Avril"][:pets]["colin"]
# Get the smallest of Erik's favourite numbers
p users["Erik"][:favourite_numbers][0]
p users["Erik"][:favourite_numbers].min()
p users["Erik"][:favourite_numbers].sort().first
# Add the number 7 to Erik's favourite numbers
# users["Erik"][:favourite_numbers].push(7)   # Adds to end of array
# users["Erik"][:favourite_numbers] << 7
users["Erik"][:favourite_numbers].unshift(7)  # Adds to start of array
p users["Erik"][:favourite_numbers]
# Change Erik's hometown to Edinburgh
users["Erik"][:home_town] = "Edinburgh"
p users["Erik"][:home_town]
# Add a pet dog to Erik called "Fluffy"
users["Erik"][:pets]["fluffy"] = :dog
p users["Erik"][:pets]["fluffy"]
# users["Erik"][:pets].store("fluffy", :dog)
# Add yourself to the users hash
# users["Sarah"] = {
#   twitter: "stuff",
#   favourite_numbers: [1, 2, 3],
#   home_town: "Doune"
# }
users["Sarah"] = Hash.new
users["Sarah"][:twitter] = "stuff"
users["Sarah"][:favourite_numbers] = Array.new
users["Sarah"][:home_town] = "Doune"
p users["Sarah"]

p "END OF EXERCISE B"
p "-----------------"

#############################################################################

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

# def find_country_by_capital(array, capital)
#   for country in array
#     if country[:capital] = capital
#       return find_country
#     end
#   end
#   return nil
# end
#
# country = find_country_by_capital(united_kingdom, "Swansea")
# country[:capital] = "Cardiff"

# Create a Hash for Northern Ireland and add it to the united_kingdom array
# (The capital is Belfast, and the population is 1,811,000).
united_kingdom[3] = Hash.new
united_kingdom[3][:name] = "Northern Ireland"
united_kingdom[3][:population] = 1811000
united_kingdom[3][:capital] = "Belfast"
p united_kingdom

# northern_ireland = {
#   name: "Northern Ireland"
# }
# united_kingdom << northern_ireland

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

p "END OF EXERCISE C"
p "-----------------"
