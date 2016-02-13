require 'rspec'
require_relative 'ToDoList'

# Story: As a developer, I can create a ToDoItem.
describe 'ToDoItem' do
  it "can create a ToDoItem" do
    expect {ToDoItem.new}.to_not raise_error
    expect(ToDoItem.new).to be_a(ToDoItem)
  end

# Story: As a developer, I can give a ToDoItem a title and retrieve it.
  it "can have a title, and I can retrieve it" do
    #create an instance of ToDoItem
    toDoItem = ToDoItem.new
    #test that we can give a title to the item
    expect {toDoItem.setTitle("test")}.to_not raise_error
    #test that we can retrieve the title of an item
    expect(toDoItem.title).to be_a(String)
    #set the title of ToDoItem
    toDoItem.setTitle("My Title")
    #test that we can retrieve the given title
    expect(toDoItem.title).to eq("My Title")
  end

# Story: As a developer, I can give a ToDoItem a description and retrieve it.
  it "can have a description and I can retrieve it" do
    #create an instance of ToDoItem
    toDoItem = ToDoItem.new
    #test that we can give a description to the item
    expect {toDoItem.setDescription("test")}.to_not raise_error
    #test that we can retrieve the description
    expect(toDoItem.description).to be_a(String)
    #set the description of toDoItem
    toDoItem.setDescription("My description")
    #test that we can retrieve the given description
    expect(toDoItem.description).to eq("My description")
  end

# # Story: As a developer, I can print a ToDoItem with field labels and values.
#   it "can print the toDoItem with field labels and values" do
#     #create an instance of ToDoItem and give it a title and description
#     toDoItem = ToDoItem.new
#     toDoItem.setTitle("Item number one")
#     toDoItem.setDescription("This is my first To Do List Item")
#     #test that we can print the given title and description of the to do Item
#     expect {toDoItem.printItem}.to_not raise_error
#     expect(toDoItem.printItem).to be_a(String)
#     expect(toDoItem.printItem).to eq("Title: Item number one, Description: This is my first To Do List Item")
#   end

# Story: As a developer, I can mark a ToDoItem done.
  it "can be marked as completed" do
    #create an instance of ToDoItem
    toDoItem = ToDoItem.new
    #test that we can mark the To Do Item as done
    expect(toDoItem.done).to eq(true)
  end

# # Story: As a developer, when I print a ToDoItem that is done, status is shown, otherwise show status not done - This test builds upon the previous printItem story test
#   it "includes the done status when printed" do
#     #create an instance of ToDoItem, give it a title and description, and mark as done
#     toDoItem = ToDoItem.new
#     toDoItem.setTitle("Item number one")
#     toDoItem.setDescription("This is my first To Do List Item")
#     toDoItem.done
#     #test that we can print the status as done
#     expect(toDoItem.printItem).to eq("Title: Item number one, Description: This is my first To Do List Item, Status: Done")
#     #resetting toDoItem, without marking as done
#     toDoItem = ToDoItem.new
#     toDoItem.setTitle("Item number one")
#     toDoItem.setDescription("This is my first To Do List Item")
#     #test that we can print with the status as not done
#     expect(toDoItem.printItem).to eq("Title: Item number one, Description: This is my first To Do List Item, Status: Not Done")
#   end
end

# Story: As a developer, I can create a to do item with a due date, which can be changed
describe 'DueItem' do
  it "can create a DueItem" do
    expect {DueItem.new}.to_not raise_error
    expect(DueItem.new).to be_a(DueItem)
  end
  it "can be given a due date and the date can be changed" do
    #create a new instance of DueItem
    dueItem = DueItem.new
    #test giving a dueItem a dueDate
    expect{dueItem.setDueDate("04-02-2016")}.to_not raise_error
    #test that we can get the due date
    expect(dueItem.date).to be_a(Date)
    expect(dueItem.date).to eq(Date.strptime("04-02-2016", "%m-%d-%Y"))
    #test that we can change the due date
    dueItem.setDueDate("02-18-2016")
    expect(dueItem.date).to eq(Date.strptime("02-18-2016", "%m-%d-%Y"))
  end

# Story: As a developer, I can print an item with a due date with field labels and values.
  it "can print an item with the due date" do
    #create a new instance of due item, and give it a new title, new description, and a due date.
    dueItem = DueItem.new
    dueItem.setTitle("Item first")
    dueItem.setDescription("The first item")
    dueItem.setDueDate("06-30-2016")
    #test printing the item with the due date
    expect(dueItem.print).to be_a(String)
    expect(dueItem.date).to eq(Date.strptime("06-30-2016", "%m-%d-%Y"))
    expect(dueItem.print).to eq("Title: Item first, Description: The first item, Status: Not Done, Due Date: 06-30-2016")
  end
end

# Story: As a developer, I can create a to do item for an anniversary (a yearly recurring event) .
describe 'Anniversary' do
  it "can create an Anniversary" do
    expect {Anniversary.new}.to_not raise_error
    expect(Anniversary.new).to be_an(Anniversary)
    #create an instance of the Anniversary class
    anniversary = Anniversary.new
    #test that we can give an Anniversary an anniversary date
    expect(anniversary.setAnniversaryDate("05-22")).to be_a(String)
  end

# Story: As a developer, I can print an item for an anniversary with field labels and values.
  it "can print an anniversary" do
    #create an instance of the Anniversary class and give it an anniversary date, title and description
    anniversary = Anniversary.new
    anniversary.setTitle("Birthday")
    anniversary.setDescription("Krista's Dad's Birthday")
    anniversary.setAnniversaryDate("05-22")
    #test printing an anniversary
    expect(anniversary.print).to be_a(String)
    expect(anniversary.print).to eq("Title: Birthday, Description: Krista's Dad's Birthday, Status: Not Done, Anniversary Date: 05-22")
  end

  #We need to add the current year to the anniversary in order to later sort in the toDoList
  it "can add the current year to all yearly events" do
    #create an instance of the Anniversary class and give it an anniversary date
    anniversary = Anniversary.new
    anniversary.setAnniversaryDate("05-22")
    #test that we can add the year to the anniversary date
    expect(anniversary.date).to be_a(Date)
    expect(anniversary.date).to eq(Date.strptime("05-22-2016", "%m-%d-%Y"))
  end
end

# Story: As a developer, I can add all of my ToDoItems to a ToDoList.
describe 'ToDoList' do
  it "can create a ToDoList" do
    expect {ToDoList.new}.to_not raise_error
    expect(ToDoList.new).to be_a(ToDoList)
  end

  #adding ToDoItem to ToDoList
  it "can add a ToDoItem to a ToDoList" do
    #creating a new instance of ToDoList and ToDoItem
    toDoList = ToDoList.new
    toDoItem = ToDoItem.new
    #test that toDoItem was added to ToDoList array
    expect(toDoList.addItem(toDoItem)).to match_array [toDoItem]
  end

# Story: As a developer with a ToDoList, I can show all the completed items.
#   it "can print only the items marked done in the list" do
#     #Create a new list, and 4 new items to put into that list
#     toDoList = ToDoList.new
#     toDoItem1 = ToDoItem.new
#     toDoItem2 = ToDoItem.new
#     toDoItem3 = ToDoItem.new
#     toDoItem4 = ToDoItem.new
#     #give a title and description to our to do items
#     toDoItem1.setTitle("Item number one")
#     toDoItem1.setDescription("This is my first To Do List Item")
#     toDoItem2.setTitle("Item number two")
#     toDoItem2.setDescription("This is my second To Do List Item")
#     toDoItem3.setTitle("Item number three")
#     toDoItem3.setDescription("This is my third To Do List Item")
#     toDoItem4.setTitle("Item number four")
#     toDoItem4.setDescription("This is my fourth To Do List Item")
#     #mark items 2 and 4 as done
#     toDoItem2.done
#     toDoItem4.done
#     # add all 4 items to the list
#     toDoList.addItem(toDoItem1)
#     toDoList.addItem(toDoItem2)
#     toDoList.addItem(toDoItem3)
#     toDoList.addItem(toDoItem4)
#     #we need the status of an item to be returned in order to determine if we should print it
#     expect(toDoItem1.status).to eq(false)
#     #print the items marked as done
#     expect(toDoList.printDone).to be_a(String)
#     expect(toDoList.printDone).to eq("Title: Item number two, Description: This is my second To Do List Item, Status: Done Title: Item number four, Description: This is my fourth To Do List Item, Status: Done")
# # Story: As a developer with a ToDoList, I can show all the not completed items.
#     expect(toDoList.printNotDone).to eq("Title: Item number one, Description: This is my first To Do List Item, Status: Not Done Title: Item number three, Description: This is my third To Do List Item, Status: Not Done")
#   end

# Story: As a developer, I can add items with due dates to my ToDoList.
  it "can add DueItems to the ToDoList" do
    #creating a new instance of ToDoList and DueItem
    toDoList = ToDoList.new
    dueItem = DueItem.new
    #test that dueItem was added to toDoDueListArray
    expect(toDoList.addDueItem(dueItem)).to match_array [dueItem]
  end

# Story: As a developer with a ToDoList, I can list all the not completed items that are due today.
   it "can list items not done which are due today" do
    #Create a new list, and 4 new items to put into that list
    toDoList = ToDoList.new
    toDoItem1 = DueItem.new
    toDoItem2 = DueItem.new
    toDoItem3 = ToDoItem.new
    toDoItem4 = ToDoItem.new
    #give a title and description to our to do items
    toDoItem1.setTitle("Item number one")
    toDoItem1.setDescription("This is my first To Do List Item")
    toDoItem2.setTitle("Item number two")
    toDoItem2.setDescription("This is my second To Do List Item")
    toDoItem3.setTitle("Item number three")
    toDoItem3.setDescription("This is my third To Do List Item")
    toDoItem4.setTitle("Item number four")
    toDoItem4.setDescription("This is my fourth To Do List Item")
    #mark items 2 and 4 as done
    toDoItem2.done
    toDoItem4.done
    #give items 1 and 2 a due date of today
    toDoItem1.setDueDate("02-12-2016")
    toDoItem2.setDueDate("02-12-2016")
    # add all 4 items to the list
    toDoList.addDueItem(toDoItem1)
    toDoList.addDueItem(toDoItem2)
    toDoList.addItem(toDoItem3)
    toDoList.addItem(toDoItem4)
    #print the items not done which are due today
    expect(toDoList.dueToday).to eq ("Title: Item number one, Description: This is my first To Do List Item, Status: Not Done, Due Date: 02-12-2016")
   end

   # Story: As a developer with a ToDoList, I can list all the not completed items in order of due date.
   it "can print items not done in order of due date" do
     #Create a new list, and 4 new items to put into that list
     toDoList = ToDoList.new
     dueItem1 = DueItem.new
     dueItem2 = DueItem.new
     dueItem3 = DueItem.new
     dueItem4 = DueItem.new
     #give a title and description to our to do items
     dueItem1.setTitle("Item number one")
     dueItem1.setDescription("This is my first To Do List Item")
     dueItem2.setTitle("Item number two")
     dueItem2.setDescription("This is my second To Do List Item")
     dueItem3.setTitle("Item number three")
     dueItem3.setDescription("This is my third To Do List Item")
     dueItem4.setTitle("Item number four")
     dueItem4.setDescription("This is my fourth To Do List Item")
     #mark item 2 as done
     dueItem2.done
     #give items a due date
     dueItem1.setDueDate("08-12-2016")
     dueItem2.setDueDate("05-15-2016")
     dueItem3.setDueDate("02-18-2016")
     dueItem4.setDueDate("03-12-2016")
     # add all 4 items to the list
     toDoList.addDueItem(dueItem1)
     toDoList.addDueItem(dueItem2)
     toDoList.addDueItem(dueItem3)
     toDoList.addDueItem(dueItem4)
     #print the items that are not done and order them by due date
     expect(toDoList.printNotDone).to eq("Title: Item number three, Description: This is my third To Do List Item, Status: Not Done, Due Date: 02-18-2016 Title: Item number four, Description: This is my fourth To Do List Item, Status: Not Done, Due Date: 03-12-2016 Title: Item number one, Description: This is my first To Do List Item, Status: Not Done, Due Date: 08-12-2016")
   end

# Story: As a developer with a ToDoList with and without due dates, I can show all the not completed items in order of due date, and then the items without due dates.
  # it "can print all not done items in order - first by date, then by no date" do
  #   #Create a new list, and 7 new items to put into that list
  #   toDoList = ToDoList.new
  #   dueItem1 = DueItem.new
  #   dueItem2 = DueItem.new
  #   dueItem3 = DueItem.new
  #   dueItem4 = DueItem.new
  #   toDoItem5 = ToDoItem.new
  #   toDoItem6 = ToDoItem.new
  #   toDoItem7 = ToDoItem.new
  #   #give a title and description to our to do items
  #   dueItem1.setTitle("Item number one")
  #   dueItem1.setDescription("This is my first To Do List Item")
  #   dueItem2.setTitle("Item number two")
  #   dueItem2.setDescription("This is my second To Do List Item")
  #   dueItem3.setTitle("Item number three")
  #   dueItem3.setDescription("This is my third To Do List Item")
  #   dueItem4.setTitle("Item number four")
  #   dueItem4.setDescription("This is my fourth To Do List Item")
  #   toDoItem5.setTitle("Item number five")
  #   toDoItem5.setDescription("This is my fifth To Do List Item")
  #   toDoItem6.setTitle("Item number six")
  #   toDoItem6.setDescription("This is my sixth To Do List Item")
  #   toDoItem7.setTitle("Item number seven")
  #   toDoItem7.setDescription("This is my seventh To Do List Item")
  #   #mark item 2 and 6 as done
  #   dueItem2.done
  #   toDoItem6.done
  #   #give items a due date
  #   dueItem1.setDueDate("08-12-2016")
  #   dueItem2.setDueDate("05-15-2016")
  #   dueItem3.setDueDate("02-18-2016")
  #   dueItem4.setDueDate("03-12-2016")
  #   # add all 7 items to the list
  #   toDoList.addDueItem(dueItem1)
  #   toDoList.addItem(toDoItem5)
  #   toDoList.addItem(toDoItem7)
  #   toDoList.addDueItem(dueItem2)
  #   toDoList.addDueItem(dueItem3)
  #   toDoList.addItem(toDoItem6)
  #   toDoList.addDueItem(dueItem4)
  #   #print the items that are not done and order them by due date
  #   expect(toDoList.printNotDone).to eq("Title: Item number three, Description: This is my third To Do List Item, Status: Not Done, Due Date: 02-18-2016 Title: Item number four, Description: This is my fourth To Do List Item, Status: Not Done, Due Date: 03-12-2016 Title: Item number one, Description: This is my first To Do List Item, Status: Not Done, Due Date: 08-12-2016 Title: Item number five, Description: This is my fifth To Do List Item, Status: Not Done Title: Item number seven, Description: This is my seventh To Do List Item, Status: Not Done")
  # end

# Story: As a developer with a ToDoList with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month.
# Story: As a developer with a ToDoList with a collection of items with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month, then the items without due dates.
  it "can add an anniversary to a ToDoList and print all not done to do items in order" do
    #Create a new list, and 7 new items to put into that list
    toDoList = ToDoList.new
    dueItem1 = DueItem.new
    dueItem2 = DueItem.new
    dueItem3 = DueItem.new
    dueItem4 = DueItem.new
    toDoItem5 = ToDoItem.new
    toDoItem6 = ToDoItem.new
    toDoItem7 = ToDoItem.new
    anniversary8 = Anniversary.new
    anniversary9 = Anniversary.new
    #give a title and description to our to do items
    dueItem1.setTitle("Item number one")
    dueItem1.setDescription("This is my first To Do List Item")
    dueItem2.setTitle("Item number two")
    dueItem2.setDescription("This is my second To Do List Item")
    dueItem3.setTitle("Item number three")
    dueItem3.setDescription("This is my third To Do List Item")
    dueItem4.setTitle("Item number four")
    dueItem4.setDescription("This is my fourth To Do List Item")
    toDoItem5.setTitle("Item number five")
    toDoItem5.setDescription("This is my fifth To Do List Item")
    toDoItem6.setTitle("Item number six")
    toDoItem6.setDescription("This is my sixth To Do List Item")
    toDoItem7.setTitle("Item number seven")
    toDoItem7.setDescription("This is my seventh To Do List Item")
    anniversary8.setTitle("anniversary8")
    anniversary8.setDescription("This is my eighth To Do List Item")
    anniversary9.setTitle("anniversary9")
    anniversary9.setDescription("This is my ninth To Do List Item")
    #mark item 2 and 6 as done
    dueItem2.done
    toDoItem6.done
    #give items a due date
    dueItem1.setDueDate("08-12-2016")
    dueItem2.setDueDate("05-15-2016")
    dueItem3.setDueDate("02-18-2016")
    dueItem4.setDueDate("03-12-2016")
    #give anniversaries a date
    anniversary8.setAnniversaryDate("02-22")
    anniversary9.setAnniversaryDate("03-10")
    # add all 9 items to the list
    toDoList.addDueItem(dueItem1)
    toDoList.addItem(toDoItem5)
    toDoList.addAnniversaryItem(anniversary8)
    toDoList.addItem(toDoItem7)
    toDoList.addDueItem(dueItem2)
    toDoList.addAnniversaryItem(anniversary9)
    toDoList.addDueItem(dueItem3)
    toDoList.addItem(toDoItem6)
    toDoList.addDueItem(dueItem4)
    #test printing all the items not done in order
    expect(toDoList.printNotDone).to eq("Title: Item number three, Description: This is my third To Do List Item, Status: Not Done, Due Date: 02-18-2016 Title: anniversary8, Description: This is my eighth To Do List Item, Status: Not Done, Anniversary Date: 02-22 Title: anniversary9, Description: This is my ninth To Do List Item, Status: Not Done, Anniversary Date: 03-10 Title: Item number four, Description: This is my fourth To Do List Item, Status: Not Done, Due Date: 03-12-2016 Title: Item number one, Description: This is my first To Do List Item, Status: Not Done, Due Date: 08-12-2016")
  end
end
