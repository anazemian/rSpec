# #vehicle class
class Vehicle
#   #initialize the vehicle class by taking in a model year, and setting the lights to off (false)
 def initialize(modelYear=1800)
   @year = modelYear
   @lightsOn = false
 end
#
#  #year returns the year of the instance it is called on
 def year
   return @year
 end
#
#  #turnLightsOn sets the lightsOn instance variable to true
 def turnLightsOn
   @lightsOn = true
 end
#
#  #turnLightsOff sets the lightsOn instance variable to false
 def turnLightsOff
   @lightsOn = false
 end
#
#  #lightsOn? returns the value of the lightsOn instance variable
 def lightsOn?
   return @lightsOn
 end
end
#
# # Create a new vehicle and test the turnLightsOff, turnLightsOn and lightsOn? functions
# myVehicle = Vehicle.new(1999)
# # puts myVehicle.lightsOn?
# # myVehicle.turnLightsOn
# # puts myVehicle.lightsOn?
# # myVehicle.turnLightsOff
# # puts myVehicle.lightsOn?
#
# #car class inherits the vehicle class
class Car < Vehicle
#   #override the initialize method of vehicle; use the vehicle initialize to set the modelYear, initialize @wheels to 4, initialize @speed to 0
  def initialize #(modelYear)
#     super(modelYear)
    @wheels = 4
    @speed = 0
  end
#
#   #wheels returns the number of wheels
  def wheels
    return @wheels
  end
#
#   #speed returns the speed
  def speed
    return @speed
  end
#
#   #accelerate takes in a rate of acceleration, and increases the speed of the instance by that rate
  def accelerate (rateOfAcceleration)
    @speed = @speed + rateOfAcceleration
  end
#
#   #brake takes in a rate of braking, and decreases the speed of the instance by that rate
  def brake (rateOfBraking)
    @speed = @speed - rateOfBraking
    #If the rate of braking takes the speed below zero, set the speed to zero
    if (@speed < 0)
      @speed = 0
    end
  end
end
#
# myCar = Car.new(2005)
# # test the speed and wheels methods on myCar
# # puts myCar.wheels
# # puts myCar.speed
# # myCar.accelerate(10)
# # puts myCar.speed
# # myCar.brake(15)
# # puts myCar.speed
#
#
# #Tesla inherits the car class
class Tesla < Car
#   #accelerate overrides the car accelerate method using the specific rate of 10
#   def accelerate
#     @speed = @speed + 10
#   end
#   #brake overrides the car brake method using the specific rate of 7
#   def brake
#     @speed = @speed - 7
#     if (@speed < 0)
#       @speed = 0
#     end
#   end
end
#
# myTesla = Tesla.new(2016)
# #test the accelerate and brake methods on myTesla
# # puts myTesla.speed
# # myTesla.accelerate
# # puts myTesla.speed
# # myTesla.brake
# # puts myTesla.speed
# # myTesla.brake
# # puts myTesla.speed
#
# yourTesla = Tesla.new(2017)
#
# #Tata inherits the car class
class Tata < Car
#   #accelerate overrides the car accelerate method using the specific rate of 2 (Tatas are slow)
#   def accelerate
#     @speed = @speed + 2
#   end
#   #brake overrides the car brake method using the specific rate of 1.25
#   def brake
#     @speed = @speed - 1.25
#     if (@speed < 0)
#       @speed = 0
#     end
#   end
end
#
# myTata = Tata.new(2012)
# #test the accelerate and brake methods on myTata
# # puts myTata.speed
# # myTata.accelerate
# # puts myTata.speed
# # myTata.brake
# # puts myTata.speed
# # myTata.brake
# # puts myTata.speed
#
# yourTata = Tata.new(1964)
#
# #Toyota inherits the car class
class Toyota < Car
#   #accelerate overrides the car accelerate method using the specific rate of 7
#   def accelerate
#     @speed = @speed + 7
#   end
#   #brake overrides the car brake method using the specific rate of 5
#   def brake
#     @speed = @speed - 5
#     if (@speed < 0)
#       @speed = 0
#     end
#   end
end
#
# myToyota = Toyota.new(2015)
# #test the accelerate and brake methods on myToyota
# # puts myToyota.year
# # puts myToyota.wheels
# # puts myToyota.speed
# # myToyota.accelerate
# # puts myToyota.speed
# # myToyota.brake
# # puts myToyota.speed
# # myToyota.brake
# # puts myToyota.speed
# yourToyota = Toyota.new(1985)
#
# #carCollection is an array of the cars we've created
# carCollection = [myTesla, yourToyota, myTata, yourTata, yourTesla, myToyota]
#
# #sortByYear sorts the carCollection by the year of each car in the array
# def sortByYear(carArray)
#   carArray.sort_by {|e| e.year}
# end
#
# #sortByModel sorts the carCollection by the model of each car in the array
# def sortByModel(carArray)
#   carArray.sort_by {|e| e.class.to_s}
# end
#
# #sortBoth sorts the carCollection by the model of each car in the array, and then by the year
# def sortBoth (carArray)
#   carArray.sort_by {|e| [e.class.to_s, e.year]}
# end
#
# newArray = sortBoth(carCollection)
#
# #lets us check if our sortBoth method works
# newArray.each do |e|
#   puts e.year.to_s + " " + e.class.to_s
# end
