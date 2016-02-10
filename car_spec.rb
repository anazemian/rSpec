require 'rspec'
require_relative 'rubyCarChallenge'

#testing the Vehicle Class
describe Vehicle do
  #Story: I can make a vehicle
  it "should create the Vehicle class" do
    expect {Vehicle.new}.to_not raise_error
    expect(Vehicle.new).to be_a Vehicle
  end
  # Story: As a programmer, I can tell which model year a vehicle is from. Model years never change.
  it "can tell me what year the car is from, but can't change the model year" do
    vehicle = Vehicle.new(1801)
    expect {vehicle.year}.to_not raise_error
    expect(vehicle.year).to be_a(Integer)
    expect(vehicle.year).to be > 1800
  end
  # Story: As a programmer, I can turn on and off the lights on a given vehicle.
  it "turns the lights on and off. They start off, you bozo." do
    vehicle = Vehicle.new
    #test to check the lights are off
    expect(vehicle.lightsOn?).to be false
    #test the lights turning on
    vehicle.turnLightsOn
    expect(vehicle.lightsOn?).to be true
    #test the lights turning off
    vehicle.turnLightsOff
    expect(vehicle.lightsOn?).to be false
  end
end

#testing the Car Class
describe 'Car' do
  # Story: As a programmer, I can make a car.
  it "should create the Car class" do
    expect {Car.new}.to_not raise_error
    expect(Car.new).to be_a Car
  end
  # Story: As a programmer, I can tell how many wheels a car has; default is four.
  # We do not have the ability to set or change the number of wheels, according to this story
  it "has four wheels as default" do
    car = Car.new
    expect {car.wheels}.to_not raise_error
    expect(car.wheels).to eq(4)
  end
  # Story: As a programmer, I can determine the speed of a car. Speed starts at 0
  it "will determine the speed of a car and starts speed at 0" do
    car = Car.new
    expect(car.speed).to be_an(Integer)
    expect(car.speed).to be(0)
  end
  # Story: As a programmer, I can speed a car up.
  it "will speed a car up" do
    car = Car.new
    car.accelerate(10)
    expect(car.speed).to be > 0
  end
  # Story: As a programmer, I can slow a car down to zero.
  it "will slow a car down to zero" do
    car = Car.new
    car.accelerate(10)
    car.brake(7)
    expect(car.speed).to be < 10
    car.brake(7)
    expect(car.speed).to eq(0)
  end
end

#testing the Tesla Class
describe 'Tesla' do
  # Story: As a programmer, I can make a Tesla car.
  it "should create the Tesla class" do
    expect {Tesla.new}.to_not raise_error
    expect(Tesla.new).to be_a Tesla
  end
end

#testing the Tata Class
describe 'Tata' do
  # Story: As a programmer, I can make a Tata car.
  it "should create the Tata class" do
    expect {Tata.new}.to_not raise_error
    expect(Tata.new).to be_a Tata
  end
end

#testing the Toyota Class
describe 'Toyota' do
  # Story: As a programmer, I can make a Toyota car.
  it "should create the Toyota class" do
    expect {Toyota.new}.to_not raise_error
    expect(Toyota.new).to be_a Toyota
  end
end


#

#

#
# Story: As a programmer, I can speed my Teslas up by 10 per acceleration.
#
# Story: As a programmer, I can slow my Teslas down by 7 per braking.
#
# Story: As a programmer, I can speed my Tatas up by 2 per acceleration.
#
# Story: As a programmer, I can slow my Tatas down by 1.25 per braking.
#
# Story: As a programmer, I can speed my Toyotas up by 7 per acceleration.
#
# Story: As a programmer, I can slow my Toyotas down by 5 per braking.
#
# Story: As a programmer, I can keep a collection of two of each kind of vehicle, all from different years.
# Task: Create two of each vehicles, all from different model years, and put them into an Array.
#
# Story: As a programmer, I can sort my collection of cars based on model year.
#
# Story: As a programmer, I can sort my collection of cars based on model.
# Task: Sort based on class name.
#
# Story: As a programmer, I can sort my collection of cars based on model and then year.
