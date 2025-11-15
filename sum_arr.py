class Solution:
    def runningSum(self, nums: List[int]) -> List[int]:
        sum_arr = []
        s =0
        for i in nums:
            s+=i
            sum_arr.append(s)
        return sum_arr