require "./world.rb"
require "./person.rb"
require "./voter.rb"
require "./politician.rb"
require "./error.rb"
require "./error.rb"


class Simulator < World
#     attr_accessor 
    attr_reader :options, :message, :reg_ppl, :view, :pawty, :firststop, :c, :l, :u, :d, :q
    
    @options = { #<<<<<<<<<<simulator options
        "(C)reate a new registration" => "c",
        "(L)ist people who have registered " => "l",
        "(U)pdate the list" => "u",
        "(D)elete someone from the list" => "d",
        "(Q)uit the simulation" => "q"
        }

    @message = [ # <<<<<<<<<<<  message bank
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

    @reg_ppl = { #<<<<< type of voter options
        "(V)oter" => "v", #0
        "   or" => nil, #1
        "(P)olitician" => "p" #2
        }

    @view = {#<<<<political view options for voter
        "(L)iberal" => "l", #0
        "(C)onservative" => "c",  #1
        "(T)ea Party" => "t",  #2
        "(S)ocialist" => "s", #3
        "or" => nil,  #4
        "(N)eutral" => "n" #5
        }

    @pawty = {#<<<<<< party options for politician
        "(D)emocrat" => "d", #0
        "    or" => "or",  #1
        "(R)epublican" => "r" #2
        }
    def initialize(name, party, politics, voter)
        super(name, party, politics)
        @message = message
        @options = options
        @reg_ppl = reg_ppl
        @view = view
        @pawty = pawty
        
    end
    
    def first_stop
        begin
            puts "\nWelcome to Terry Robinson's Voter Simulator " # <<< welcome message   
            puts @message[0]
        rescue Invalid_Input
            puts @options  
            choice = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')[0] # getting the first letter from user response

            if @options.each.values.include? choice
                puts @message[1] + @options.key("#{choice}").downcase.gsub(/[()]/, "")
                
            else
                raise Invalid_Input
            end
        end
        
        @simulation.choice
    end
    
    def c
        begin
            puts @message[5]
            new_name = gets.downcase.gsub(/,/, "").split(" ").map(&:capitalize)
        rescue Invalid_Name
            if new_name.length != (2)
                raise Invalid_Name
            else
                verified = new_name.join(" ")
                puts @message[9] + verified
                puts @message[4]+@reg_ppl.keys.to_s.gsub(/[()]/, '')
                mice_n_men = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')[0]#<asking user if they want to be a voter or politician
                puts @message[7] + @reg_ppl.key("#{mice_n_men}")
                puts @message[8] 
                puts @view.keys
                decision = gets.chomp.downcase.gsub(/[^a-z0-9\s]/, '')[0]
                future_vote = @view.key("#{decision}").gsub(/[()]/, "")

                if @view.values.include? decision
                    puts @message[10]+future_vote
                    if decision == @view.value("(V)oter")
                        waynes_world.create_voter(verified, future_vote)
                    end
                    
                    if decision == @view.value("(P)olitician")
                        waynes_world.create_politician(verified, future_vote)
                    end
                end

                unless @view.values.include? decision 
                    puts @message[2]
                end
            end
        end
            @simulation.first_stop
    end

    if @pawty.values.include? @mice_n_men
        puts @message[7] + @reg_ppl.key("#{mice_n_men}")
        puts @message[8]
        puts @pawty.keys
        dishizzin = gets.chomp.downcase.gsub(/[^a-z0-9\s]/, '')[0]
        future_pol = @pawty.key("#{dishizzin}").gsub(/[()]/, "")

        if dishizzin == "d" || "r"
            puts @message[10] + future_pol
            waynes_world.create_politician(verified, future_pol)
        end

        unless @pawty.values.include? dishizzin
            puts @message[2]
        end      
    end
    
    def l#<<<<<< for l-q its all the same code
        
        begin
            puts @message[11]+@reg_ppl.each.keys
            
        rescue Invalid_Input
            choice2 = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')[0]

            if choice2 == @reg_ppl.value("(V)oter")
                @simulation.list_voters
            end
            
            if choice2 == @reg_ppl.value("(P)olitician")
                @simulation.list_politicians
            
            else
                raise Invalid_Input
            end
        end
        @simulation.first_stop
    end
    
    def u
        begin
            puts @message[11]+@reg_ppl.each.keys
            
        rescue Invalid_Input
            choice3 = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')[0]

            if choice3 == @reg_ppl.value("(V)oter")
                puts "who would you like to update?"
                updatev = gets.chomp.downcase.gsub(/,/, "").split(" ").map(&:capitalize).join(" ")
                if voters.include? updatev
                    puts "what would you like to change? (name or politics)?"
                    changev = gets.chomp
                    if changev = "name"
                        puts "okay, what would you like the new name to be?"
                        newnamev = gets.chomp.downcase.gsub(/,/, "").split(" ").map(&:capitalize).join(" ")
                        @simulation.update_voter(updatev, "name", newname)
                        puts "Your new name is #{newnamev}!"
                    end
                    
                    if changev = "politics"
                        puts "okay, what are your new political views?"
                        newviewv = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')
                        if politics.each.values.include? newviewv[0]
                            @simulation.update_voter(updatev, "politics", newviewv)
                            puts @voters.each(updatev)
                        end
                    end
                end
            end
                         
                
            
            if choice3 == @reg_ppl.value("(P)olitician")
                  puts "who would you like to update?"
                updatep = gets.chomp.downcase.gsub(/,/, "").split(" ").map(&:capitalize).join(" ")
                if politicians.include? updatep
                    puts "what would you like to change? (name or politics)?"
                    changep = gets.chomp
                    if changep = "name"
                        puts "okay, what would you like the new name to be?"
                        newnamep = gets.chomp.downcase.gsub(/,/, "").split(" ").map(&:capitalize).join(" ")
                        @simulation.update_voter(updatep, "name", newnamep)
                        puts "Your new name is #{newnamep}!"
                    end
                    
                    if changev = "politics"
                        puts "okay, what are your new political views?"
                        newviewp = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')
                        if pawty.each.values.include? newviewp[0]
                            @simulation.update_voter(updatep, "politics", newviewp)
                        end
                        puts @voters.each(updatep)
                    end
                end
            
            else
                raise Invalid_Input
            end
        end
        @simulation.first_stop
    end
    
    def d
        begin
        puts @message[11]+@reg_ppl.each.keys

    rescue Invalid_Input
        choice4 = gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')[0]

        if choice4 == @reg_ppl.value("(V)oter")
            puts "who would you like to delete?"
            deletedv = gets.chomp.downcase.gsub(/,/, "").split(" ").map(&:capitalize).join(" ")
            
            if @voters.include? deletedv
                puts "Are you sure you would like to delete #{deleted}? THIS CAN NOT BE UNDONE!"
                ultimatumv = gets.chomp
                
                if ultimatumv == "y"
                    @simulation.delete_voter(deletedv)
                end
            end
        end
            
        if choice4 == @reg_ppl.value("(P)olitician")
            puts "who would you like to delete?"
            deleted = gets.chomp.downcase.gsub(/,/, "").split(" ").map(&:capitalize).join(" ")
            
            if @politicians.include? deleted
                puts "Are you sure you would like to delete #{deleted}? THIS CAN NOT BE UNDONE!"
                ultimatum = gets.chomp
                
                if ultimatum == "y"
                    @simulation.delete_politician(deleted)
                end
            end
        end
                
        else
            raise Invalid_Input
        end
       @simulation.first_stop
    end
    
    def q
        puts "\nThank you for using the Simulator, Good-Bye!"
        sleep 2.0
        abort
    end
end
