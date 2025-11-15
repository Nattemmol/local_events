class Solution:
    def missingNumber(self, nums: List[int]) -> int:
        n = len(nums)
        xg = (n* (n+1))//2
        real_sum = sum(nums)
        return xg-real_sum