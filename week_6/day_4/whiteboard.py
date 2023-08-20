# Ticket numbers usually consist of an even number of digits. A ticket number 
# is considered lucky if the sum of the first half of the digits is equal 
# to the sum of the second half.
# Given a ticket number n, determine if it's lucky or not.
# Example
# For n = 1230, the output should be
# solution(n) = true;
# For n = 239017, the output should be
# solution(n) = false.

# Understand:
# The input is an integer and its length will always be even.
# return True if the sum of the first half is equal to the sum of the second half

# Plan:
# turn the integer into a string then iterate though it by length
# return a conditional statement

# Execute
def solution(num:int):
    fh = 0
    sh = 0
    for i in range(len(str(num))):
        if i+1 <= ((len(str(num)))/2):
            fh += int(str(num)[i])
        elif i+1 > ((len(str(num)))/2):
            sh += int(str(num)[i])
    return fh == sh

print(solution(239017))
