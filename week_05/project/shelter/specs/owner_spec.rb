require('minitest/autorun')
require('minitest/rg')
require('pry')
require('date')

require_relative('../models/owner')


class OwnerTest < MiniTest::Test

  def setup

    # DELETE OWNERS
    Owner.delete_all()

    # CREATE OWNERS
    @owner_1 = Owner.new({  "first_name" => "Bill",
                            "last_name" => "Wardlaw",
                            "telephone" => "01786 832914",
                            "email" => "bill.wardlaw@gmail.com",
                            "address" => "11 PistolMakers Row",
                            "postcode" => "FK16 7RB",
                            "species" => "Dog",
                            "breed" => "No preference",
                            "seeks_pet" => true,
                            "registration_date" => DateTime.new(2018,2,18).to_s
                          })
    @owner_1.save()
    @owner_2 = Owner.new({  "first_name" => "Jemima",
                            "last_name" => "Price",
                            "telephone" => "01786 855294",
                            "email" => "jemima.price@btinternet.com",
                            "address" => "20 Main Street",
                            "postcode" => "FK16 8FD",
                            "species" => "Cat",
                            "breed" => "Tabby",
                            "seeks_pet" => true,
                            "registration_date" => DateTime.new(2017,12,30).to_s
                          })
    @owner_2.save()
    @owner_3 = Owner.new({  "first_name" => "Gavin",
                            "last_name" => "Templeton",
                            "telephone" => "01786 841050",
                            # "email" => "gavin@ideas.com",
                            # "address" => "???",
                            # "postcode" => "???",
                            "species" => "Snake",
                            # "breed" => "No preference",
                            "seeks_pet" => true,
                            "registration_date" => DateTime.new(2018,1,3).to_s
                          })
    @owner_3.save()
  end

  def test_get_owner_first_name___Bill
    assert_equal("Bill", @owner_1.first_name)
  end

  def test_find_all___3
    assert_equal(3, Owner.find_all().count())
  end

  def test_find_by_id___Bill
    assert_equal("Bill", Owner.find_by_id(@owner_1.id).first_name)
  end

  def test_find_by_first_name___Bill
    assert_equal("Bill", Owner.find_by_first_name(@owner_1.first_name).first_name)
  end

  # def test_delete___2
  #   @animal_3.delete()
  #   assert_equal(2, Animal.find_all().count())
  # end
  #
  # def test_update__name___Moggy
  #   @animal_2.name = "Moggy"
  #   @animal_2.update()
  #   assert_equal("Moggy", Animal.find_by_id(@animal_2.id).name)
  # end
  #
  # def test_update__age___Moggy
  #   @animal_2.age = 10
  #   @animal_2.update()
  #   assert_equal(10, Animal.find_by_id(@animal_2.id).age)
  # end
  #
  # def test_update__gender___Moggy
  #   @animal_2.gender = "Male"
  #   @animal_2.update()
  #   assert_equal("Male", Animal.find_by_id(@animal_2.id).gender)
  # end

  # def test_update__admission_date___Moggy
  #   new_date = DateTime.new(2018,1,10).to_s
  #   @animal_2.admission_date = new_date
  #   @animal_2.update()
  #   assert_equal(new_date, Animal.find_by_id(@animal_2.id).admission_date)
  # end

end
