require 'minitest/autorun'
require 'minitest/pride'
require './lib/school'

class SchoolTest < Minitest::Test
  #Iteration 1 Tests:
  def test_it_exists
    school = School.new('9:00', 7)

    assert_instance_of School, school
  end

  def test_it_has_start_time

    school = School.new('9:00', 7)

    assert_equal '9:00', school.start_time
  end

  def test_it_has_hours_in_school_day

    school = School.new('9:00', 7)

    assert_equal 7, school.hours_in_school_day
  end

  def test_it_starts_with_no_student_names
    school = School.new('9:00', 7)

    assert_equal [], school.student_names
  end

  #Iteration 2 Tests:
  def test_it_can_add_student_names
    school = School.new('9:00', 7)

    school.add_student_name('Aurora')
    school.add_student_name('tim')
    school.add_student_name('megan')

    assert_equal ['Aurora', 'tim', 'megan'], school.student_names
  end

  def test_it_can_calculate_end_time
    school1 = School.new('9:00', 7)
    school2 = School.new('9:00', 3)

    assert_equal '16:00', school1.end_time
    assert_equal '12:00', school2.end_time
  end

  def test_it_returns_full_time_status
    school1 = School.new('10:00', 5)
    school2 = School.new('9:00', 4)

    assert school1.is_full_time?
    refute school2.is_full_time?
  end

  def test_it_standardizes_names
    school = School.new('11:00', 4)
    school.add_student_name('Gigi')
    school.add_student_name('diesel')
    school.add_student_name('ralph')
    pretty_names = ['Gigi', 'Diesel', 'Ralph']

    assert_equal pretty_names, school.standard_student_names
  end

  def test_it_converts_end_time
    school1 = School.new('10:00', 8)
    school2 = School.new('8:00', 4)

    assert_equal '6:00', school1.convert_end_time_to_clock_time
    assert_equal '12:00', school2.convert_end_time_to_clock_time
  end
end
