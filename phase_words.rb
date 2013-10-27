#!/usr/bin/ruby

# Challenge: make a function which "phases" two given words through 
# eachoher, like so:

  # Word 1: Hello
  # Word 2: World

  # Output: 
    # HelloWorld, HellWoorld, HelWloorld, HeWlolrold, HWeolrllod, 
    # WHoerllldo, WoHrelldlo, WorHledllo, WorlHdello, WorldHello

class Array
  def swap!(a,b)
    self[a], self[b] = self[b], self[a]
    self
  end
end

class String
  def phase(other)
    if self.empty?
      [other]
    elsif other.empty?
      [self]
    else
      @word1 = self.split("")
      @word2 = other.split("")
      @combined_words = []

      @word2.each { |letter| @combined_words.push({:letter => nil, :word => nil}) }
      
      @word1.each do |letter|
        @combined_words.push({:letter => letter, :word => 1})
        @combined_words.push({:letter => nil,  :word => nil})
      end
      
      @word2.each { |letter| @combined_words.push({:letter => letter, :word => 2}) }
    end

    while @combined_words.include?({:letter => nil, :word => nil}) 
      nil_loc = @combined_words.rindex{ |addr| addr[:word].nil? }.to_i
      word2_subloc = @combined_words.drop(nil_loc).index{ |addr| addr[:word] == 2 }.to_i

      if word2_subloc == 0
        @combined_words.delete_at(nil_loc)
        print "\n\n"
        
        @combined_words.each do |addr|
        if not addr[:letter].nil?
          print addr[:letter]
        end
      end
          
      print "\n\n"
        
      else
        @combined_words.swap!(nil_loc, word2_subloc + nil_loc)
      end
    end
  end
end

puts "What is your first word?"

param1 = gets
 
puts "Cool, what is your second word?"

param2 = gets

puts param1.chomp.phase(param2.chomp)



