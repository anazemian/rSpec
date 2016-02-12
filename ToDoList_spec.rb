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

# Story: As a developer, I can create a to do item with a due date, which can be changed.
  it "can add a due date to an item and that date can be changed" do
    #create an instance of ToDoItem
    toDoItem = ToDoItem.new
    dueDate = "02-18-2016"
    expect {toDoItem.setDueDate(dueDate)}.to_not raise_error
    #test to convert the date into a string
    expect(toDoItem.setDueDate(dueDate)).to eq("02-18-2016")
    #change the due date
    expect(toDoItem.setDueDate("06-30-2016")).to eq("06-30-2016")
  end

# Story: As a developer, I can print an item with a due date with field labels and values.
  it "includes the due date when printed if applicable" do
    #create an instance of ToDoItem, give it a title and description, and set the due date
    toDoItem = ToDoItem.new
    toDoItem.setTitle("Item number one")
    toDoItem.setDescription("This is my first To Do List Item")
    expect(toDoItem.printItem).to eq("Title: Item number one, Description: This is my first To Do List Item, Status: Not Done, Due Date: N/A")
    toDoItem.setDueDate("02-18-2016")
    #test that we can print the due date
    expect(toDoItem.printItem).to eq("Title: Item number one, Description: This is my first To Do List Item, Status: Not Done, Due Date: 02-18-2016")
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
#     expect(toDoList.printDone).to eq("Title: Item number two, Description: This is my second To Do List Item, Status: Done Title: Item number four, Description: This is my fourth To Do List Item, Status: Done ")
# # Story: As a developer with a ToDoList, I can show all the not completed items.
#     expect(toDoList.printNotDone).to eq("Title: Item number one, Description: This is my first To Do List Item, Status: Not Done Title: Item number three, Description: This is my third To Do List Item, Status: Not Done ")
#   end

# Story: As a developer, I can add items with due dates to my ToDoList.
  it "can add a ToDoItem with a due date to a ToDoList" do
    #creating a new instance of ToDoList and ToDoItem
    toDoList = ToDoList.new
    toDoItem = ToDoItem.new
    # add a due date to the toDoItem
    toDoItem.setDueDate("04-02-2016")
    #test that toDoItem with due date was added to ToDoList array
    expect(toDoList.addItem(toDoItem)).to match_array [toDoItem]
  end

# Story: As a developer with a ToDoList, I can list all the not completed items that are due today.
  it "can list items not done which are due today" do
    #Create a new list, and 4 new items to put into that list
    toDoList = ToDoList.new
    toDoItem1 = ToDoItem.new
    toDoItem2 = ToDoItem.new
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
    toDoItem1.setDueDate("11-02-2016")
    toDoItem2.setDueDate("11-02-2016")
    # add all 4 items to the list
    toDoList.addItem(toDoItem1)
    toDoList.addItem(toDoItem2)
    toDoList.addItem(toDoItem3)
    toDoList.addItem(toDoItem4)
    #we need the due date of an item to be returned in order to determine if we should print it
    expect(toDoItem1.dueDate).to be_a(Date)
    expect(toDoItem1.dueDate).to eq(Date.today)
    #print the items not done which are due today
    expect(toDoList.dueToday).to eq ("Title: Item number one, Description: This is my first To Do List Item, Status: Not Done, Due Date: 11-02-2016")
  end
end






#
# Story: As a developer with a ToDoList, I can list all the not completed items in order of due date.
#
# Story: As a developer with a ToDoList with and without due dates, I can show all the not completed items in order of due date, and then the items without due dates.
