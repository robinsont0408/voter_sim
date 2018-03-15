class Invalid_Name < TypeError
  def initialize(msg="please register with your First and Last name as it appears on your drivers license")
    super
  end
end

class User_Exists < TypeError
  def initialize(msg="Sorry that person has already been registered")
    super
  end
end

class Invalid_Input < TypeError
  def initialize(msg="\nI'm sorry, I do not understand that response. Please try again ")
    super
  end
end
