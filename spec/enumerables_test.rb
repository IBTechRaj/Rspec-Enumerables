#spec/enumerables_spec.rb
require './enumerables.rb'
RSpec.describe Enumerable do

    let (:array) {[2,3,2,4,3]}
    let (:array1) {[1,2,3,4,5]}

describe "#my_any?" do
        it "returns true if any of the numbers meets the condition" do
         expect(array.my_any?{ |x| x > 3 }).to eql(true)
     end

     it "returns false uf any of the numbers does not meet the condition" do
        expect(array.my_any?{ |x| x > 5 }).to eql(false)
    end
end

describe "#my_each" do
    it "Takes a block as argument" do
        expect(array.my_each {|x| x}).to eql([2,3,2,4,3])
    end
end

describe "#my_select" do
    it "returns a new array with elements that pass a condition given inside a block" do
        expect(array.my_select {|x| x % 2 == 0}).to eql([2,2,4])
    end
end

describe "#my_all?" do
    it "returns false if any element in the array is not an integer" do
        expect([1,2,3,"4"].my_all? {|x| x.is_a? Integer }).to eql(false)
    end

    it "returns true if every element in the array pass a condition, otherwise returns false" do
        expect([1,2,3,4].my_all? {|x| x.is_a? Integer }).to eql(true)
    end
end


describe "#my_none?" do
    it "returns true if none of the element in the array pass a condition, otherwise returns false" do
        expect(array1.my_none? {|x| x > 6}).to eql(true)
    end

    it "returns false if none of the element in the array pass a condition, otherwise returns true" do
        expect(array1.my_none? {|x| x < 6}).to eql(false)
    end
end

describe "#my_count" do
    it "returns the numbers of element in an array" do
        expect(array1.my_count).to eql(5)
    end
end

describe "#my_map" do
    it "creates a new array containing the values returned by the block" do
        expect([0,1,2].my_map {|x| x + 1}).to eql([1,2,3])
    end
end

describe "#my_inject" do
    it "Reduce all elements of an array into an single element" do
        expect([1,2,3,4].my_inject {|a,b| a + b}).to eql(10)
    end
end

end
