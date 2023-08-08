#  '''
# Write a function that reverses characters in (possibly nested) parentheses in the input string.
# Input strings will always be well-formed with matching ()s.
# Example
# For inputString = "(bar)", the output should be
# solution(inputString) = "rab";
# For inputString = "foo(bar)baz", the output should be
# solution(inputString) = "foorabbaz";
# For inputString = "foo(bar)baz(blim)", the output should be
# solution(inputString) = "foorabbazmilb";
# For inputString = "foo(bar(baz))blim", the output should be
# solution(inputString) = "foobazrabblim".
# Because "foo(bar(baz))blim" becomes "foo(barzab)blim" and then "foobazrabblim".
# '''
def solution(word):
    """"To reverse random parentheses words."""
    for index in range(len(word)):
        if word[index] == "(":
            start = index
        if word[index] == ")":
            end = index
            return solution(word[:start] + word[start + 1:end][::-1] + word[end + 1:])
    return word
            
print(solution("foo(bar(baz)f)blim"))