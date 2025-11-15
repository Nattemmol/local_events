class Solution:
    def frequencySort(self, s: str) -> str:
        r = Counter(s)
        return "".join(sorted(s, key=lambda char: (-r[char], char)))