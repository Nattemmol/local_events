class Solution(object):
    def twoSum(self, nums, target):
        for i,v in enumerate(nums):
            y=target-v
            if y in nums and i !=nums.index(y):
                return [i,nums.index(y)] 
        return []
        