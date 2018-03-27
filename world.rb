require "./error.rb"
require "./person.rb"
require "./voter.rb"
require "./politician.rb"
require "./wurds_n_frazes.rb"

class World 
    attr_accessor :voters, :politicians
    def initialize
        @voters = []
        @politicians = []
    end
    
    def create_voter(name, politics)
        @voter = Voter.new(name, politics)
        @voters.push(@voter)
    end
    
    def create_politician(name, party)
        @politician = Politician.new(name, party)
        @politicians.push(@politician)
    end
    
    def list_voters
        pool = ""
        @voters.each do |v|
            pool += "Voter, #{v.name}, #{v.politics}\n"
        end
        pool
    end
    
    def list_politicians
         pool = ""
        @politicians.each do |p|
            pool += "Politician, #{p.name}, #{p.party}\n"
        end
        pool
    end
    
    def update_voter(veg, info, updated_info)
        person = nil 
        @voters.each do |p| 
            if p.name == veg 
              person = p
            end  
        end
            
        if person.nil?
            return "that voter is not in our records"

        else
            case info
                when "name"
                    person.name = updated_info
                when "politics"
                    person.politics = updated_info
            end
        end   
    end
    
    def update_politician(poly, info, updated_info)
         person = nil 
        @politicians.each do |p| 
            if p.name == poly 
              person = p
            end  
        end
            
        if person.nil?
            return "that politician is not in our records"
        
        else
            case info
                when "name"
                    person.name = updated_info
                when "party"
                    person.party = updated_info
            end
        end
    end 
    
    def delete_voter(name) 
        person = nil 
        @voters.each do |v|
            if v.name == name 
               person = v
            end
        end

        if person.nil? 
            "That voter is not in our records" 
        else
            @voters.delete(person)
        end
    end

    def delete_politician(name) 
        person = nil 
        @politicians.each do |p|
            if p.name == name 
               person = p
            end
        end

        if person.nil? 
            "That politician is not in our records" 
        else
            @politicians.delete(person)
        end
    end
end

