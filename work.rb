require "./world.rb"
require "./person.rb"
require "./voter.rb"
require "./politician.rb"


class Simulator < World
    attr_accessor :applicant
    
    def initialize
#         @applicant = []
    end
    
    def first_stop
        welcome_message
        
        choice = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')[0] # getting the first letter from user response
        
        if choice == ("c" || "l" || "u" || "d" || "q") 
            
        end
        @world.send(choice)
    end
 
    def c
        create
        name_q
        new_name = gets.downcase.gsub(/,/, "").split(" ").map(&:capitalize)

        if new_name.length == (2)
            verified = new_name.join(" ")
            puts "Hello #{verified}!"
            wood_u
            mice_n_men = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')[0]#<asking user if they want to be a voter or politician
            register_a
            send("#{mice_n_men}")
            consider_u 
            our_views
            decision = gets.chomp.downcase.gsub(/[^a-z0-9\s]/, '')[0]
            future_vote = send("decision")
        
            if decision == ("c" || "t" || "s" || "n")
                register
                puts future_vote
                
                if decision == "v"
                    @world.create_voter(verified, future_vote)
                    first_stop
                end

                if decision == "p"
                    @world.create_politician(verified, future_vote)
                    first_stop
                end
                
            end
        end
        
        if new_name.length != (2)
            send(invalid_name)
        end
    end

    def l#<<<<<< for l-q its all the same code
        
        puts see_what + ordinary_peeps

        choice2 = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')[0]

        if choice2 == "v"
            @world.list_voters
        end

        if choice2 == "p"
            @world.list_politicians

        else
            invalid_input
        end
        first_stop
    end
    
    def u
        puts see_what+ordinary_peeps
        choice3 = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')[0]

        if choice3 == "v"
            puts "who would you like to update?"
            updatev = gets.chomp.downcase.gsub(/,/, "").split(" ").map(&:capitalize).join(" ")
            if voters.include? updatev
                puts "what would you like to change? (name or politics)?"
                changev = gets.chomp
                if changev == "name"
                    puts "okay, what would you like the new name to be?"
                    newnamev = gets.chomp.downcase.gsub(/,/, "").split(" ").map(&:capitalize).join(" ")
                    @world.update_voter(updatev, "name", newname)
                    puts "Your new name is #{newnamev}!"
                end

                if changev == "politics"
                    puts "okay, what are your new political views?"
                    newviewv = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')
                    if politics.values.include? newviewv[0]
                        @world.update_voter(updatev, "politics", newviewv)
                        puts @voters.each(updatev)
                    end
                end
            end
        end          
                
            
        if choice3 == "p"
            puts "who would you like to update?"
            updatep = gets.chomp.downcase.gsub(/,/, "").split(" ").map(&:capitalize).join(" ")
            if politicians.include? updatep
                puts "what would you like to change? (name or politics)?"
                changep = gets.chomp
                if changep == "name"
                    puts "okay, what would you like the new name to be?"
                    newnamep = gets.chomp.downcase.gsub(/,/, "").split(" ").map(&:capitalize).join(" ")
                    @world.update_voter(updatep, "name", newnamep)
                    puts "Your new name is #{newnamep}!"
                end

                if changev == "politics"
                    puts "okay, what are your new political views?"
                    newviewp = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')
                    if pawty.values.include? newviewp[0]
                        @world.update_voter(updatep, "politics", newviewp)
                    end
                end
                puts @voters.each(updatep)
            end

        else
            invalid_input
        end
        first_stop
    end
    
    def d
        dileet
        ordinary_peeps
        choice4 = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')[0]

        if choice4 == @reg_ppl.value("(V)oter")
            puts "who would you like to delete?"
            deletedv = gets.chomp.downcase.gsub(/,/, "").split(" ").map(&:capitalize).join(" ")
            
            if @voters.include? deletedv
                puts "Are you sure you would like to delete #{deleted}? THIS CAN NOT BE UNDONE!"
                ultimatumv = gets.chomp
                
                if ultimatumv == "y"
                    @world.delete_voter(deletedv)
                else
                    puts "#{deletedv} has NOT been deleted."
                end
            end
        end
            
        if choice4 == "p"
            puts "who would you like to delete?"
            deleted = gets.chomp.downcase.gsub(/,/, "").split(" ").map(&:capitalize).join(" ")
            
            if @politicians.include? deleted
                puts "Are you sure you would like to delete #{deleted}? THIS CAN NOT BE UNDONE!"
                ultimatum = gets.chomp
                
                if ultimatum == "y"
                    @world.delete_politician(deleted)
                else
                    puts "#{deleted} has NOT been deleted"
                end
            end
                
        else
            invalid_input
        end
       first_stop
    end
    
    def q
        puts "\nThank you for using the Simulator, Good-Bye!"
        sleep 2.0
        abort
    end
    
    def dor
        puts "A (D)emocrat or (R)epublican" 
    end
    
    def dem
        puts "Democrat"
    end
    
    def rep
        puts "Republican" 
    end
    
    def welcome_message
        puts "Welcome to Terry Robinson's Voter Simulator " # <<< welcome message 
        wut
        create
        lists
        updeight
        dileet
        qwit
    end
    
    def v
        puts "Voter "
    end

    def p
        puts "Politician "
    end
    
    def create  #<<<<<<<<<<simulator options
        puts "(C)reate a new registration"
    end
    
    def lists
        puts "(L)ist people who have registered"
    end
    
    def updeight
        puts "(U)pdate the list"
    end
    
    def dileet
        puts"(D)elete someone from the list"
    end
        
    def qwit
        puts "(Q)uit the simulation"
    end
    
    def l
        "Liberal"
    end
    
    def c
        "Conservative"
    end
    
    def t
        "Tea Party"
    end
    
    def s
        "Socialist"
    end
    
    def n
        "Neutral"
    end
    
    def create_msg
        puts chosen + opt_out.("c")
    end
    
    def vop 
        puts "(V)oter or (P)olitician?"
    end

    def ordinary_peeps 
        puts reg_ppl[0].join.to_s.gsub(/[()]/, '').each
    end

    def our_views 
        puts "(L)iberal"
        puts "(C)onservative"
        puts "(T)ea Party"
        puts "(S)ocialist"
        puts "or"
        puts "(N)eutral"
        
    end
        
    def wut 
        puts "What would you like do do? "
    end

    def chosen 
        puts "You have chosen to "
    end

    def sorry
        puts "I'm sorry, I do not understand that response. Please try again \n"
    end

    def bye 
        puts "Thank you for using the Simulator, Good-Bye!"
    end

    def register
        puts "Would you like to register as "
    end

    def name_q
        puts "What is your name? (First, Last)"
    end

    def bad_name
        puts "Sorry that is an invalid name or has already been registered"
    end

    def register_a
        puts "You have chosen to register as a "
    end

    def consider_u 
        puts "Which would you consider yourself?\n"
    end
    
    def wood_u
        puts "would you like to register as a (V)oter or (P)olitician?"

    def hello
        puts "Hello "
    end

    def register_as 
        puts "You have selected to register as "
    end

    def see_what
        puts "Which would you like to see?"
    end
    
    def delete
        puts "Would you like to delete a "
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
    end
    end
end
