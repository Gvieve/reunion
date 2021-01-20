require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exists_and_has_attributes
    activity = Activity.new("Brunch")

    assert_instance_of Activity, activity
    assert_equal "Brunch", activity.name
    assert_equal ({}), activity.participants
  end

  def test_it_can_add_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    expected1 = {"Maria" => 20}

    assert_equal expected1, activity.participants
    assert_equal 20, activity.total_cost

    activity.add_participant("Luther", 40)
    expected2 = {"Maria" => 20, "Luther" => 40}

    assert_equal expected2, activity.participants
    assert_equal 60, activity.total_cost
  end

  def test_it_can_split_costs
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    assert_equal 30, activity.split
  end

  def test_it_calculates_owed
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    expected =  {"Maria" => 10, "Luther" => -10}

    assert_equal expected, activity.owed
  end
end
