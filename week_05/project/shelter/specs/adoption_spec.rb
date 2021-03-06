require('minitest/autorun')
require('minitest/rg')
require('pry')
require('date')

require_relative('../models/owner')
require_relative('../models/animal')
require_relative('../models/adoption')


class AdoptionTest < MiniTest::Test

  def setup

    # DELETE ADOPTIONS
    Adoption.delete_all()
    # DELETE OWNERS
    Owner.delete_all()
    # DELETE ANIMALS
    Animal.delete_all()

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

    # CREATE ADOPTIONS
    @adoption_1 = Adoption.new({  "animal_id" => @animal_1.id,
                                  "owner_id" => @owner_1.id,
                                  "adoption_date" => DateTime.new(2018,2,14).to_s
                          })
    @adoption_1.save()
    @adoption_2 = Adoption.new({  "animal_id" => @animal_2.id,
                                  "owner_id" => @owner_2.id,
                                  "adoption_date" => DateTime.new(2018,2,15).to_s
                          })
    @adoption_2.save()
    @adoption_3 = Adoption.new({  "animal_id" => @animal_3.id,
                                  "owner_id" => @owner_3.id,
                                  "adoption_date" => DateTime.new(2018,2,16).to_s
                          })
    @adoption_3.save()

  end

  def test_get_date
    assert_equal(DateTime.new(2018,2,14).to_s, @adoption_1.adoption_date)
  end

  def test_find_all___3
    assert_equal(3, Adoption.find_all().count())
  end

  def test_find_by_animal_id___animal_1
    assert_equal(@animal_1.id, Adoption.find_by_animal_id(@animal_1.id).animal_id)
  end

  def test_find_by_owner_id___owner_1
    assert_equal(@owner_1.id, Adoption.find_by_owner_id(@owner_1.id).owner_id)
  end

  def test_delete___2
    @adoption_3.delete()
    assert_equal(2, Adoption.find_all().count())
  end

  def test_update__animal_id___owner_1__animal_2
    @adoption_1.animal_id = @animal_2.id
    @adoption_1.update()
    assert_equal(@animal_2.id, Adoption.find_by_owner_id(@owner_1.id).animal_id)
  end

  # def test_update__admission_date___Moggy
  #   new_date = DateTime.new(2018,1,10).to_s
  #   @animal_2.admission_date = new_date
  #   @animal_2.update()
  #   assert_equal(new_date, Animal.find_by_id(@animal_2.id).admission_date)
  # end

end
