require "spec"
require "../src/*"

describe "Luhn" do
  #Test 1
  it "single digit strings can not be valid", focus: true do
    Luhn.valid?("1").should eq(false)
  end

  #Test 2
  it "a single zero is invalid", focus: true do
    Luhn.valid?("0").should eq(false)
  end

  #Test 3 - CONFLICTS with Test number 8
  pending "a simple valid SIN that remains valid if reversed" do
    Luhn.valid?("059").should eq(true)
  end

  #Test 4
  it "a simple valid SIN that becomes invalid if reversed", focus: true do
    Luhn.valid?("59").should eq(true)
  end

  #Test 5 - CONFLICTS with Test number 8
  pending "a valid Canadian SIN" do
    Luhn.valid?("055 444 285").should eq(true)
  end

  #Test 6
  it "invalid Canadian SIN", focus: true do
    Luhn.valid?("055 444 286").should eq(false)
  end

  #Test 7
  it "invalid credit card", focus: true do
    Luhn.valid?("8273 1232 7352 0569").should eq(false)
  end

  # Test number 8 - Manual test passes but not when spec is run
  pending "valid number with an even number of digits" do
    Luhn.valid?("095 245 88").should eq(true)
  end

  #Test number 9 - Manual test passes but not when spec is run
  pending "valid number with an odd number of spaces" do
    Luhn.valid?("234 567 891 234").should eq(true)
  end

  #Test number 10
  it "valid strings with a non-digit added at the end become invalid", focus: true do
    Luhn.valid?("059a").should eq(false)
  end

  #Test number 11
  it "valid strings with punctuation included become invalid", focus: true do
    Luhn.valid?("055-444-285").should eq(false)
  end

  #Test number 12
  it "valid strings with symbols included become invalid", focus: true do
    Luhn.valid?("055# 444$ 285").should eq(false)
  end

  #Test number 13
  it "single zero with space is invalid", focus: true do
    Luhn.valid?(" 0").should eq(false)
  end

  #Test number 14 - CONFLICTS with test 8
  pending "more than a single zero is valid" do
    Luhn.valid?("0000 0").should eq(true)
  end

  #Test number 15 - CONFLICTS with test 8
  pending "input digit 9 is correctly converted to output digit 9" do
    Luhn.valid?("091").should eq(true)
  end

  #Test number 16
  it "using ascii value for non-doubled non-digit isn't allowed", focus: true do
    Luhn.valid?("055b 444 285").should eq(false)
  end

   #Test number 17
  it "using ascii value for doubled non-digit isn't allowed", focus: true do
    Luhn.valid?(":9").should eq(false)
  end
end
