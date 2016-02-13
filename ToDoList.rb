require 'Date'
#create a ToDoItem class
class ToDoItem
  #initialize the item status to not done and the due date to N/A
  def initialize
    @status = false
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
      "Title: " + @title + ", Description: " + @description + ", Status: Done"
    else
      "Title: " + @title + ", Description: " + @description + ", Status: Not Done"
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
end

#-----------------------------------------------

#creating the ToDoList class
class ToDoList
  #initialize a blank array to store our to do items
  def initialize
    @toDoListArray = []
    @toDoDueListArray = []
  end

  #method to add a ToDoItem
  def addItem(item)
    @toDoListArray.push(item)
  end

  #method to add a DueItem
  def addDueItem(dueItem)
    @toDoDueListArray.push(dueItem)
  end
  #method to add an anniversary
  def addAnniversaryItem(anniversaryItem)
    @toDoDueListArray.push(anniversaryItem)
  end

  #method to print items that are marked as done
  def printDone
    doneList = ""
    @toDoListArray.each do |e|
      if e.status
        doneList = doneList + e.printItem + " "
      end
    end
    doneList.rstrip
  end

  #method to print items that are not marked as done
  def printNotDone
    notDoneList = self.printNotDone + " "
    @toDoListArray.each do |e|
      if !e.status
        notDoneList = notDoneList + e.printItem + " "
      end
    end
    notDoneList.strip
  end

  #method to print the items not done which are due today
  def dueToday
    dueTodayList = ""
    @toDoDueListArray.each do |e|
      if !e.status && e.date == Date.today
        dueTodayList = dueTodayList + e.print + " "
      end
    end
    dueTodayList.rstrip
  end

  #method to print the items that are still due in order of due date
  def printNotDone
    @toDoDueListArray = @toDoDueListArray.sort_by do |d|
      d.date
    end
    sortDueList = ""
    @toDoDueListArray.each do |e|
      if !e.status
        sortDueList = sortDueList + e.print + " "
      end
    end
    sortDueList.rstrip
  end

end

#-----------------------------------------------
#create a class DueItem which inherits from the class ToDoItem
class DueItem < ToDoItem
  #method to add a due date to the item
  def setDueDate(date)
    @dueDate = date.to_s
  end

  #method to return the due date of an items
  def date
    Date.strptime(@dueDate, "%m-%d-%Y")
  end

  #method to print items with a due date
  def print
    self.printItem + ", Due Date: " + @dueDate
  end

end

#-----------------------------------------------
#create a class Anniversary which inherits from the class ToDoItem
class Anniversary < ToDoItem
  #method to set an Anniversary date
  def setAnniversaryDate(date)
    @anniversary = date.to_s
  end

  #method to return Anniversary date
  def date
    Date.strptime(@anniversary + "-" + Date.today.year.to_s, "%m-%d-%Y")
  end

  #method to print anniversary
  def print
    self.printItem + ", Anniversary Date: " + @anniversary
  end
end
