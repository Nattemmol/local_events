class Solution:
    def sortColors(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        zero=0
        one=0
        two=0

        for i in nums:
            if i==0:
                zero+=1
            if i==1:
                one+=1
            if i==2:
                two+=1

        for i in range(len(nums)):
            if zero:
                nums[i]=0
                zero-=1
            elif one:
                nums[i]=1
                one-=1
            elif two:
                nums[i]=2
                two-=1
        print(nums)