require "./world.rb"
require "./person.rb"
require "./voter.rb"
require "./politician.rb"


class Simulator
#     attr_reader :options, :message, :reg_ppl, :view, :pawty
    attr_accessor :applicant, :voters, :politicians
    
    def initialize
        @options = { #<<<<<<<<<<simulator options
            "c" => "(C)reate a new registration",#0
            "l" => "(L)ist people who have registered",#1
            "u" => "(U)pdate the list",#2
            "d" => "(D)elete someone from the list",#3
            "q" => "(Q)uit the simulation"#4
            }


        @message = { # <<<<<<<<<<<  message bank
            "what now" => "\nWhat would you like do do? ",#0
            "chosen" => "You have chosen to ",#1
            "sorry" => "I'm sorry, I do not understand that response. Please try again",#2
            "bye" => "Thank you for using the Simulator, Good-Bye!",#3
            "register?" => "Would you like to register as a ", #4
            "name?" => "What is your name? (First, Last)", #5
            "bad name" => "Sorry that is an invalid name or has already been registered", #6
            "register a" => "You have chosen to register as a ", #7
            "consider?" => "Which would you consider yourself?\n", #8
            "hello" => "Great! lets get started ", #9
            "register as" => "You have selected to register as ", #10
            "see what" => "Which would you like to see?", #11
            "hello world" => "\nWelcome to Terry Robinson's Voter Simulator!", #12
            "here" => "Okay, here are the ", #13
            "update" => "Which would you like to update?", #14
            "update who" => "Who would you like to update?", #15
            "chews" => "You can choose a ", #16
            "lists?" => "would you like to see a list? (Y/N)", #17
            "name or p" => "what would you like to change? (name or politics)?", #18
            "name or v" => "what would you like to change? (name or views)?", #19
            "newest names" => "okay, what would you like the new name to be?", #20
            "delete a" => "Would you like to delete a ",#21
            "delete who?" => "Who would you like to delete?"#22
            }

        @reg_ppl = { #<<<<< type of voter options
            "v" => "(V)oter", #0
            nil => "   or", #1
            "p" => "(P)olitician" #2
            }

        @view = {#<<<<political view options for voter
            "l" => "(L)iberal", #0
            "c" => "(C)onservative",  #1
            "t" => "(T)ea Party",  #2
            "s" => "(S)ocialist", #3
            nil => "or",  #4
            "n" => "(N)eutral" #5
            }

        @pawty = {#<<<<<< party options for politician
            "d" => "(D)emocrat", #0
            "or" => "or",  #1
            "r" => "(R)epublican" #2
            }
        
        @named = ["Sorry it appears a user has not been selected"]
        @world = World.new
    end

    def first_stop
        puts @message["hello world"]
        puts @message["what now"]
        hash_values(@options) 
        choice = get_one
        puts @message["chosen"], hash_clean(@options, choice)
        send(choice)
    end

    def c #<< first stop to applying as a voter or politician     
        puts @message["name?"]
        verify = name_here
        print @message["hello"], verify
        puts "!"
        puts @message["register?"]
        hash_values(@reg_ppl)
        mice_n_men = get_one#  <asking user if they want to be a voter or politician
        gud_choice = (hash_clean(@reg_ppl, mice_n_men)).downcase
        puts @message["register a"]+gud_choice
        puts @message["consider?"] 
        send(gud_choice)
    end

    def voter
        hash_values(@view)
        decision = get_one
        check_up(@view, decision)
        future_vote = hash_clean(@view, decision)
        puts @message["register as"]+future_vote
        @world.create_voter(@named[0], future_vote)
        restart()
    end

    def politician
        hash_values(@pawty)
        dishizzin = get_one
        check_up(@pawty, dishizzin)
        future_pol = hash_clean(@pawty,dishizzin)
        puts @message["register as"], future_pol
        @world.create_politician(@named[0], future_pol)
        restart()
    end

    def l#<<<<<< listing people
        puts @message["see_what"]
        hash_values(@reg_ppl)
        choice2 = get_one
        check_up(@reg_ppl, choice2)
        puts @message["here"]
        print hash_clean(@reg_ppl, choice2)
        puts "'s:"
        if choice2 == ("v")
            puts @world.list_voters()
            sleep 2
            first_stop
        end
        if choice2 == ("p")
            puts @world.list_politicians()
            sleep 2
            restart()
        end
    end

    def u#update method
        puts @message["update"]
        puts @message["chews"]
        hash_values(@reg_ppl)
        choice3 = get_one
        check_up(@reg_ppl, choice3)
        puts @message["update who"]
        
        
        if choice3 == "v"#update voter
            puts @message["lists?"]
            answv = get_one
            
            if answv == "y"
                puts @message["here"]
                print hash_clean(@reg_ppl, choice3)
                puts "'s:"
                puts @world.list_voters()
                puts @message["update who"]
            end
            
            updatev = name_here
            checked_up(@voters, @named)
            puts message["name or p"]
            changev = gets.chomp
            
            if changev == "name"
                puts @message["newest name"]
                newnamev = name_here
                @world.update_voter(updatev, "name", @named)
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


        if choice3 == "p"#update politicians
            puts @message["lists?"]
            answp = get_one
            if answp == "y"
                puts @message["here"]
                print hash_clean(@reg_ppl, choice3)
                puts "'s:"
                puts @world.list_politicians()
                puts @message["update who"]
            end
            updatep = name_here
            checked_up(@politicians, updatep)
            puts message["name or v"]
            changev = gets.chomp
            
            if changep == "name"
                puts puts @message["newest name"]
                newnamep = name_here
                @world.update_politician(updatep, "name", newnamep)
                puts "Your new name is #{newnamep}!"
            end

            if changev == "politics"
                puts "okay, what are your new political views?"
                newviewp = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')
                if pawty.values.include? newviewp[0]
                    @world.update_politician(updatep, "politics", newviewp)
                end
            puts @politicians.each(updatep)
            end

        else
            invalid_input
        end
        first_stop
    end

    def d
        puts @message["delete a"]
        hash_values(@reg_ppl)
        choice4 = get_one

        if choice4 == "v"
            puts @message["delete who?"]
            deletedv = name_here

            if @voters.each.include?(deletedv)
                deh_leeet_em_liz(deletedv)
                ultimatumv = get_one

                if ultimatumv == "y"
                    return @world.delete_voter(deletedv)
                else
                    puts "#{deletedv} has NOT been deleted."
                end
            end
        end

        if choice4 == "p"
            puts @message["delete who?"]
            deleted = name_here

            if @politicians.each.include? deleted
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
        puts @message["bye"]
        sleep 1
        abort()
    end 

    def hash_clean(hash, key)
        if hash.keys.include? key
            return hash[key].to_s.gsub(/[()]/, "")
        else
            invalid_input
        end
    end

    def check_up(hash, check)
        if hash.keys.include? check
            return true
        else
            invalid_input
        end
    end
    
    def checked_up(array, check)
        if (array).include?(check) 
            return true
        else
            invalid_input

        end
    end
    
    def deh_leeet_em_liz(gator)
        puts "Are you sure you would like to delete #{(gator)}? THIS CAN NOT BE UNDONE!"
    end
       
    def u_missed_lizz(swim)
        puts "#{(swim)} has NOT been deleted."
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
    
    def strip_it(string)
        string.to_s.chomp("[]")
    end
    
    def string_strip(string)
        string.values.to_s.downcase.gsub(/[({})]/, "").capitalize # turns a string from an array above into a display-ready string
    end

    def name_here
        new_name = gets.downcase.gsub(/,/, "").split(" ").map(&:capitalize)
        if new_name.length == (2)
            verified = new_name.join(" ")
            @named.replace([verified.to_s])
            return verified
        else
            invalid_name
        end
    end

    def invalid_name
        puts "please register with your First and Last name as it appears on your drivers license"
        sleep 1
        restart()
    end

    def user_exists
        puts"Sorry that person has already been registered"
        sleep 1
        restart()
    end

    def invalid_input
        puts "\nI'm sorry, I do not understand that response. Please try again "
        sleep 1
        restart()
    end
    
    def restart
        first_stop()
    end
end

world = Simulator.new()
world.first_stop()