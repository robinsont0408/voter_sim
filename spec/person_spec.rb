require "./person.rb"

describe Person do
    
    it "verifies that it is a person" do
        person = Person.new("Joe Schmoe")
        expect(person).to be_a(Person)
    end
    
    it "can recall its name" do
        person = Person.new("Joe Schmoe")
        expect(person.name).to eq("Joe Schmoe")
    end
end