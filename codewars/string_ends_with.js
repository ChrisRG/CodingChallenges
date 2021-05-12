// Complete the solution so that it returns true if the first argument(string) passed in ends with the 2nd argument (also a string).

// Examples:

// solution('abc', 'bc') // returns true
// solution('abc', 'd') // returns false

function solution(str, ending) {
  if (ending === '') {
    return true
  }
  return ending === '' || str.slice(0 - ending.length, str.length) === ending
}

class Test {
  static assertEquals(left, right) {
    const result = (left === right ? "PASSED" : "FAILED" );
    console.log(result);
    if (result === "FAILED") {
      console.log(`EXPECTED: ${right}`);
      console.log(`GOT: ${left}`);
    }
  }
}

Test.assertEquals(solution('abcde', 'cde'), true)
Test.assertEquals(solution('abcde', 'abc'), false)
