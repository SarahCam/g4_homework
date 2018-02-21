require('minitest/autorun')
require('minitest/rg')
require('pry')
require('date')

require_relative('../models/animal')
require_relative('../models/owner')
require_relative('../models/adoption')


class AnimalTest < MiniTest::Test

  def setup

    # DELETE ADOPTIONS
    Adoption.delete_all()
    # DELETE ANIMALS
    Animal.delete_all()
    # DELETE ANIMALS
    Owner.delete_all()

    # CREATE ANIMALS
    @animal_1 = Animal.new({ "name" => "Harry",
                            "species" => "Dog",
                            "breed" => "Mongrel",
                            "gender" => "Male",
                            "age" => 7,
                            "photo" => "harry.jpg",
                            "healthy" => "Yes",
                            "safe" => "No",
                            "adopted" => false,
                            "admission_date" => DateTime.new(2018,1,22).to_s
                          })
    @animal_1.save()
    @animal_2 = Animal.new({ "name" => "Mog",
                            "species" => "Cat",
                            "breed" => "Tabby",
                            "gender" => "Female",
                            "age" => 4,
                            "photo" => "mog.jpg",
                            "healthy" => "No",
                            "safe" => "Yes",
                            "adopted" => false,
                            "admission_date" => DateTime.new(2018,2,3).to_s
                          })
    @animal_2.save()
    @animal_3 = Animal.new({ "name" => "Blue",
                            "species_id" => "Dog",
                            # "breed" => "Alsation",
                            # "gender" => "Male",
                            # "age" => 2,
                            # "photo" => "mog.jpg",
                            "healthy" => "No",
                            "safe" => "Check",
                            "adopted" => false,
                            "admission_date" => DateTime.new(2018,2,11).to_s
                          })
    @animal_3.save()

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
  end

  def test_get_dog_name___Harry
    assert_equal("Harry", @animal_1.name)
  end

  def test_find_all___3
    assert_equal(3, Animal.find_all().count())
  end

  def test_find_by_id___Mog
    assert_equal("Mog", Animal.find_by_id(@animal_2.id).name)
  end

  def test_find_by_name___Mog
    assert_equal("Mog", Animal.find_by_name(@animal_2.name).name)
  end

  def test_delete___2
    @animal_3.delete()
    assert_equal(2, Animal.find_all().count())
  end

  def test_update__name___Moggy
    @animal_2.name = "Moggy"
    @animal_2.update()
    assert_equal("Moggy", Animal.find_by_id(@animal_2.id).name)
  end

  def test_update__age___Moggy
    @animal_2.age = 10
    @animal_2.update()
    assert_equal(10, Animal.find_by_id(@animal_2.id).age)
  end

  def test_update__gender___Moggy
    @animal_2.gender = "Male"
    @animal_2.update()
    assert_equal("Male", Animal.find_by_id(@animal_2.id).gender)
  end

  def test_adopt_by___Harry_is_adopted_by_Bill
    @animal_1.adopted_by(@owner_1)
    assert_equal(true, @animal_1.adopted)
    assert_equal(false, @owner_1.seeks_pet)
    assert_equal(1, Adoption.find_all().count())
  end

  # def test_update__admission_date___Moggy
  #   new_date = DateTime.new(2018,1,10).to_s
  #   @animal_2.admission_date = new_date
  #   @animal_2.update()
  #   assert_equal(new_date, Animal.find_by_id(@animal_2.id).admission_date)
  # end

end
