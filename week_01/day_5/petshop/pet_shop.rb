def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, amount)
  shop[:admin][:total_cash] += amount
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, number)
  shop[:admin][:pets_sold] += number
end

def stock_count(shop)
  count = 0
  for pets in shop[:pets]
    count += 1
  end
  return count
end

def pets_by_breed(shop, breed)
  pets_array = []
  for pet in shop[:pets]
    if pet[:breed] == breed
      pets_array << pet[:name]
    end
  end
  return pets_array
end

def find_pet_by_name(shop, name)
  for pet in shop[:pets]
    if pet[:name] == name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(shop, name)
  removed_pet = {}
  for pet in shop[:pets]
    if pet[:name] == name
      shop[:pets].delete(pet)
    end
  end
end

def stock_count(shop)
  return shop[:pets].count()
end

def add_pet_to_stock(shop, pet)
  shop[:pets] << pet
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end
















#
