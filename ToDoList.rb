require 'Date'
#create a ToDoItem class
class ToDoItem
  #initialize the item status to not done and the due date to N/A
  def initialize
    @status = false
    @dueDate = "N/A"
  end

  #method to set the title
  def setTitle (title)
    @title = title.to_s
  end

  #method to return the title
  def title
    @title
  end

  #method to set the description
  def setDescription(description)
    @description = description.to_s
  end

  #new method to return the description
  def description
    @description
  end

  #method to print the item
  def printItem
    if @status
      "Title: " + @title + ", Description: " + @description + ", Status: Done, Due Date: " + @dueDate
    else
      "Title: " + @title + ", Description: " + @description + ", Status: Not Done, Due Date: " + @dueDate
    end
  end

  #method to mark the item as done
  def done
    @status = true
  end

  #method to return the status of an item
  def status
    @status
  end

  #method to add a due date to the item
  def setDueDate(date)
    @dueDate = date
  end

  #method to return the due date of an items
  def dueDate
    Date.parse(@dueDate)
  end
end

#-----------------------------------------------

#creating the ToDoList class
class ToDoList
  #initialize a blank array to store our to do items
  def initialize
    @toDoListArray = []
  end
  #method to add a toDoItem
  def addItem(item)
    @toDoListArray.push(item)
  end

  #method to print items that are marked as done
  def printDone
    doneList = ""
    @toDoListArray.each do |e|
      if e.status
        doneList = doneList + e.printItem + " "
      end
    end
    doneList
  end

  #method to print items that are not marked as done
  def printNotDone
    notDoneList = ""
    @toDoListArray.each do |e|
      if !e.status
        notDoneList = notDoneList + e.printItem + " "
      end
    end
    notDoneList
  end

  #method to print the items not done which are due today
  def dueToday
    dueTodayList = ""
    @toDoListArray.each do |e|
      if !e.status && e.dueDate == Date.today
        dueTodayList = dueTodayList + e.printItem + " "
      end
    end
    dueTodayList
  end

end
