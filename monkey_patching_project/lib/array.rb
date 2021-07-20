# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span 
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum / (self.length / 1.0)
    end

    def median
        return nil if self.empty?

        if self.length.odd?
            odd_num = self.length / 2
            self.sort[odd_num]
        elsif self.length.even?
            even_num = self.length / 2
            sorted = self.sort
            (sorted[even_num] + sorted[even_num - 1]) / 2.0
        end
    end
    def counts
        hash_count = Hash.new(0) 
        self.each do |ele|
            hash_count[ele] += 1
        end
        hash_count
    end

# ["a", "b", "c", "d"] c

    # def my_count(ele)
    #     hash = Hash.new(0)
    #     self.each do |arr_ele|
    #         if arr_ele == ele
    #             hash[ele] += 1
    #         end
    #     end

    #     hash[ele]
    # end

    def my_count(ele1)
        count = 0
        
        self.each do |ele2|
            if ele1 == ele2
                count += 1
            end
        end

        count
    end

    def my_index(val)
        if !self.include?(val)
            return nil
        end
        self.each_with_index do |ele, idx|
            if val == ele
                return idx
            end
        end
    end

    def my_uniq 
        hash = Hash.new(0)
        self.each { |arr_ele| hash[arr_ele] += 1 }

        hash.keys
    end

    def my_transpose
        new_arr = Array.new(self[0].length) { Array.new() }
        (0...self[0].length).each do |i|
            self.each do |sub_arr|
            new_arr[i] << sub_arr[i]
            end
        end

        new_arr
    end
  
end

    