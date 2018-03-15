require "./world.rb"
require "./person.rb"
require "./voter.rb"
require "./politician.rb"

options = { #<<<<<<<<<<simulator options
    "(C)reate a new registration" => "c",
    "(L)ist people who have registered " => "l",
    "(U)pdate the list" => "u",
    "(D)elete someone from the list" => "d",
    "(Q)uit the simulation" => "q"
    }
    
message = [ # <<<<<<<<<<<  message bank
    "\nWhat would you like do do? ",#0
    "\nYou have chosen to ",#1
    "\nI'm sorry, I do not understand that response. Please try again \n",#2
    "\nThank you for using the Simulator, Good-Bye!",#3
    "\nWould you like to register as a ", #4
    "What is your name? (First, Last)", #5
    "\nSorry that is an invalid name or has already been registered", #6
    "\nYou have chosen to register as a ", #7
    "\nWhich would you consider yourself?\n", #8
    "\nHello ", #9
    "\nYou have selected to register as ", #10
    "\nWhich would you like to see?" #11
    ] 
    
reg_ppl = { #<<<<< type of voter options
    "(V)oter" => "v", #0
    "   or" => nil, #1
    "(P)olitician" => "p" #3
    }
    
view = {#<<<<political view options for voter
    "(L)iberal" => "l", #0
    "(C)onservative" => "c",  #1
    "(T)ea Party" => "t",  #2
    "(S)ocialist" => "s", #3
    "or" => nil,  #4
    "(N)eutral" => "n" #5
    }
    
pawty = {#<<<<<< party options for politician
    "(D)emocrat" => "d", #0
    "    or" => "or",  #1
    "(R)epublican" => "r" #2
    }

# chompy = [
#     gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')[0], # get the 1st letter lowercased from user input
#     gets.downcase.gsub(/,/, "").capitalize, # strips user input of comas if any, and capitalizes it
#     downcase.gsub(/[()]/, "") # turns a string from an array above into a display-ready string
#     ]

waynes_world = World.new

puts "\nWelcome to Terry Robinson's Voter Simulator " # <<< welcome message

while true   #<<< begin loop here
    
puts message[0] 
    
puts options  

choice = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')[0] # getting the first letter from user response
    
    if choice == "c"#<< voter or politician rester here       
        puts message[1] + options[0].downcase.gsub(/[()]/, "")
        puts message[5]
        new_name = gets.downcase.gsub(/,/, "").split(" ").map(&:capitalize)
        
        if new_name.length != (2)
            puts "please register with your First and Last name as it appears on your drivers license"
            
        else
            verified = new_name.join(" ")
        end
        
        puts message[9] + verified
#         @valid_name(new_name)
#         
        puts "Would you like to register as a #{reg_ppl.keys.to_s.gsub(/[^a-z()0-9\s]/i, '')} \n"
        mice_n_men = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')[0]#<asking user if they want to be a voter or politician

        if mice_n_men == "v"
            puts message[7] + reg_ppl.key("#{mice_n_men}")
            puts message[8] 
            puts view.keys
            decision = gets.chomp.downcase.gsub(/[^a-z0-9\s]/, '')[0]
            future_vote = view.key("#{decision}").gsub(/[()]/, "")
            
            if view.values.include? decision
                puts message[10]+future_vote
                waynes_world.create_voter(verified, future_vote)
            end
                
            unless view.values.include? decision 
                puts message[2]
            end
        end

        if pawty.values.include? mice_n_men
            puts message[7] + reg_ppl.key("#{mice_n_men}")
            puts message[8]
            puts pawty.keys
            dishizzin = gets.chomp.downcase.gsub(/[^a-z0-9\s]/, '')[0]
            future_pol = pawty.key("#{dishizzin}").gsub(/[()]/, "")
            
            if dishizzin == "d" || "r"
#                 pawty.find{|"#{dishizzin}", value|}
                puts message[10] + future_pol
#                 puts reg_ppl[2].to_s.gsub(/[()]/, "") + " " + verified + " " + future_pol
                waynes_world.create_politician(verified, future_pol)
            end
                
            unless pawty.values.include? dishizzin
                puts message[2]
            end      
        end
    
    if choice == "l"
        puts message[1]+options[1].downcase.gsub(/[()]/, "")
    end

    
    if choice == "u"
        puts message[1]+options[2].downcase.gsub(/[()]/, "")
    end
            
    if choice == "d"
        puts message[1]+options[3].downcase.gsub(/[()]/, "")
    end

    if choice == "q"
        puts message[3]
            break loop;
        end
    end

    unless opt.include? choice
        puts message[2]
    end          
end    
       