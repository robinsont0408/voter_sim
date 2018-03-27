class Invalid_Name
  def initialize(msg="please register with your First and Last name as it appears on your drivers license")
      action = sleep 1 + restart()
  end
end

class User_Exists
  def initialize(msg="Sorry that person has already been registered")
      action = sleep 1 + restart()
  end
end

class Invalid_Input
  def initialize(msg="\nI'm sorry, I do not understand that response. Please try again ")
      action = sleep 1 + restart()
  end
end
