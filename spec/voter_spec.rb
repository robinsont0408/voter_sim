require "./voter.rb"

describe Voter do
    
    it "reports that it is a voter" do
        person = Voter.new("Jane Doe", "Neutral")
        expect(person).to be_a(Voter)
    end
    
    it "can tell its name" do 
        person = Voter.new("Jane Doe", "Neutral")
        expect(person.name).to eq ("Jane Doe")       
    end
    
    it "can tell its politics" do 
        person = Voter.new("Jane Doe", "Neutral")
        expect(person.politics).to eq("Neutral")
    end
end