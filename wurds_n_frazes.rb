class Wurds_n_frazes
    attr_accessor :options, :message, :reg_ppl, :pawty, :get_first
    def initialize
        
    @options = { #<<<<<<<<<<simulator options
        "c" => "(C)reate a new registration",
        "l" => "(L)ist people who have registered ",
        "u" => "(U)pdate the list",
        "d" => "(D)elete someone from the list",
        "q" => "(Q)uit the simulation"
        }

    @message = { # <<<<<<<<<<<  message bank
        "what now" => "\nWhat would you like do do? ",#0
        "chosen" => "\nYou have chosen to ",#1
        "sorry" => "\nI'm sorry, I do not understand that response. Please try again \n",#2
        "bye" => "\nThank you for using the Simulator, Good-Bye!",#3
        "register?" => "\nWould you like to register as a ", #4
        "name?" => "What is your name? (First, Last)", #5
        "bad name" => "\nSorry that is an invalid name or has already been registered", #6
        "register a" => "\nYou have chosen to register as a ", #7
        "consider u" => "\nWhich would you consider yourself?\n", #8
        "hello" => "\nHello ", #9
        "register as" => "\nYou have selected to register as ", #10
        "see what" => "\nWhich would you like to see?" #11
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
        "or" => "    or",  #1
        "r" => "(R)epublican" #2
        }
        @get_first = get_first
    end
    
    def get_first
        gets.chomp.downcase.gsub(/[^a-z0-9\s]/i, '')[0] # getting the first letter from user response
    end
    
    def grab_hash
        hash.to_s.downcase.gsub(/[()]/, "")
    end
    
    
#     def get_a_name
# #         name
#     end
    
#     def p_s
#         lists = ""
#         hash.to_s.each do |k,v|
#             if v 
#                 lists += k 
#             end
            
#             if k
#                 lists += v
#             end
#         end
#         lists
#     end
    
 
end