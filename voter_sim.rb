require "./world.rb"
require "./person.rb"
require "./voter.rb"
require "./politician.rb"

options = { #<<<<<<<<<<simulator options
    "c" => "(C)reate a new registration",#0
    "l" => "(L)ist people who have registered",#1
    "u" => "(U)pdate the list",#2
    "d" => "(D)elete someone from the list",#3
    "q" => "(Q)uit the simulation"#4
    }


message = { # <<<<<<<<<<<  message bank
    "what now" => "What would you like do do? ",#0
    "chosen" => "You have chosen to ",#1
    "sorry" => "I'm sorry, I do not understand that response. Please try again \n",#2
    "bye" => "Thank you for using the Simulator, Good-Bye!",#3
    "register?" => "Would you like to register as a ", #4
    "name?" => "What is your name? (First, Last)", #5
    "bad name" => "Sorry that is an invalid name or has already been registered", #6
    "register a" => "You have chosen to register as a ", #7
    "consider?" => "Which would you consider yourself?\n", #8
    "hello" => "Great! lets get started ", #9
    "register as" => "You have selected to register as ", #10
    "see what" => "Which would you like to see?", #11
    "hello world" => "Welcome to Terry Robinson's Voter Simulator ",
    "here" => "Here are the "
    }

reg_ppl = { #<<<<< type of voter options
    "v" => "(V)oter", #0
    nil => "   or", #1
    "p" => "(P)olitician" #2
    }

view = {#<<<<political view options for voter
    "l" => "(L)iberal", #0
    "c" => "(C)onservative",  #1
    "t" => "(T)ea Party",  #2
    "s" => "(S)ocialist", #3
    nil => "or",  #4
    "n" => "(N)eutral" #5
    }

pawty = {#<<<<<< party options for politician
    "d" => "(D)emocrat", #0
    "or" => "or",  #1
    "r" => "(R)epublican" #2
    }

def first_stop
    puts @message["hello world"]
    puts @message["what now"]
    hash_values(@options) 
    choice = get_one
    puts @message["chosen"], hash_clean(@options, choice)
    send(choice)
end

def c #<< first stop to applying as a voter or politician     
    puts message["name?"]
    name_here
    puts message["hello"]+verified+"!"
    puts message["register?"]
    hash_values(reg_ppl)
    mice_n_men = get_one#  <asking user if they want to be a voter or politician
    gud_choice = (hash_clean(reg_ppl, mice_n_men)).downcase
    puts message["register a"]+gud_choice
    puts message["consider?"] 
    send(gud_choice)
end

def voter
    hash_values(view)
    decision = get_one
    check_up(view, decision)
    future_vote = hash_clean(view, decision)
    puts message["register as"]+future_vote
    @world.create_voter(verified, future_vote)
end

def politician
    hash_values(pawty)
    dishizzin = get_one
    check_up(pawty, dishizzin)
    future_pol = hash_clean(pawty,dishizzin)
    puts message["register as"]+future_pol
    @world.create_politician(verified, future_pol)
end

def l#<<<<<< listing people
    puts message["see_what"]
    hash_values(reg_ppl)
    choice2 = get_one
    check_up(reg_ppl, choice2)
    puts message["here"]
    hash_clean(reg_ppl, choice2)
    if choice2 == "v"
        @world.list_voters
        first_stop
    end
    if choice2 == "p"
        @world.list_politicians
        first_stop
    end
end

# def u
#     puts see_what+ordinary_peeps
#     choice3 = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')[0]

#     if choice3 == "v"
#         puts "who would you like to update?"
#         updatev = gets.chomp.downcase.gsub(/,/, "").split(" ").map(&:capitalize).join(" ")
#         if voters.include? updatev
#             puts "what would you like to change? (name or politics)?"
#             changev = gets.chomp
#             if changev == "name"
#                 puts "okay, what would you like the new name to be?"
#                 newnamev = gets.chomp.downcase.gsub(/,/, "").split(" ").map(&:capitalize).join(" ")
#                 @world.update_voter(updatev, "name", newname)
#                 puts "Your new name is #{newnamev}!"
#             end

#             if changev == "politics"
#                 puts "okay, what are your new political views?"
#                 newviewv = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')
#                 if politics.values.include? newviewv[0]
#                     @world.update_voter(updatev, "politics", newviewv)
#                     puts @voters.each(updatev)
#                 end
#             end
#         end
#     end          


#     if choice3 == "p"
#         puts "who would you like to update?"
#         updatep = gets.chomp.downcase.gsub(/,/, "").split(" ").map(&:capitalize).join(" ")
#         if politicians.include? updatep
#             puts "what would you like to change? (name or politics)?"
#             changep = gets.chomp
#             if changep == "name"
#                 puts "okay, what would you like the new name to be?"
#                 newnamep = gets.chomp.downcase.gsub(/,/, "").split(" ").map(&:capitalize).join(" ")
#                 @world.update_voter(updatep, "name", newnamep)
#                 puts "Your new name is #{newnamep}!"
#             end

#             if changev == "politics"
#                 puts "okay, what are your new political views?"
#                 newviewp = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')
#                 if pawty.values.include? newviewp[0]
#                     @world.update_voter(updatep, "politics", newviewp)
#                 end
#             end
#             puts @voters.each(updatep)
#         end

#     else
#         invalid_input
#     end
#     first_stop
# end

# def d
#     dileet
#     ordinary_peeps
#     choice4 = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')[0]

#     if choice4 == @reg_ppl.value("(V)oter")
#         puts "who would you like to delete?"
#         deletedv = gets.chomp.downcase.gsub(/,/, "").split(" ").map(&:capitalize).join(" ")

#         if @voters.include? deletedv
#             puts "Are you sure you would like to delete #{deleted}? THIS CAN NOT BE UNDONE!"
#             ultimatumv = gets.chomp

#             if ultimatumv == "y"
#                 @world.delete_voter(deletedv)
#             else
#                 puts "#{deletedv} has NOT been deleted."
#             end
#         end
#     end

#     if choice4 == "p"
#         puts "who would you like to delete?"
#         deleted = gets.chomp.downcase.gsub(/,/, "").split(" ").map(&:capitalize).join(" ")

#         if @politicians.include? deleted
#             puts "Are you sure you would like to delete #{deleted}? THIS CAN NOT BE UNDONE!"
#             ultimatum = gets.chomp

#             if ultimatum == "y"
#                 @world.delete_politician(deleted)
#             else
#                 puts "#{deleted} has NOT been deleted"
#             end
#         end

#     else
#         invalid_input
#     end
#    first_stop
# end

def q
    puts message["bye"]
    sleep 1
    abort()
end 
 
def hash_clean(hash, key)
    if hash.keys.include? key
        return hash.value?(key).to_s.gsub(/[()]/, "")
    else
        invalid_input
    end
end
    
def check_up(hash, check)
    if hash.values.include? check_up
        return true
    else
        invalid_input
    end
end

def hash_values(hash)
    puts hash.values
end

def ktov
    puts value.to_s.gsub(/[{}]/, "")
end

def get_one
    gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')[0] # get the 1st letter lowercased from user input
end

def ready_txt
    gets.downcase.gsub(/,/, "").capitalize # strips user input of comas if any, and capitalizes it
end

def string_strip(string)
    string.values.to_s.downcase.gsub(/[({})]/, "").capitalize # turns a string from an array above into a display-ready string
end

def name_here
    new_name = gets.downcase.gsub(/,/, "").split(" ").map(&:capitalize)
    if new_name.length == (2)
        verified = new_name.join(" ")
        return verified
    else
        invalid_name
    end
end

def invalid_name
    puts "please register with your First and Last name as it appears on your drivers license"
    sleep 1
end

def user_exists
    puts"Sorry that person has already been registered"
    sleep 1
end

def invalid_input
    puts "\nI'm sorry, I do not understand that response. Please try again "
    sleep 1
    restart()
end
@world = World.new
first_stop