def remove_duplicates(nums)
    index = 0
    while index < nums.length
      if nums[index] == nums[index+1]
        nums.delete_at(index+1)
        next
      end
      index += 1
    end
    return nums.length
end