// The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array or list of integers:

// maxSequence([-2, 1, -3, 4, -1, 2, 1, -5, 4])
// // should be 6: [4, -1, 2, 1]

// Easy case is when the list is made up of only positive numbers and the maximum sum is the sum of the whole array. If the list is made up of only negative numbers, return 0 instead.

// Empty list is considered to have zero greatest sum. Note that the empty list or array is also a valid sublist/subarray.

const maxSequence = (arr) => {
  const sort_arr = arr.sort((a, b) => a - b);;
  console.log(sort_arr);
  let list = []
  let sub_arr;
  let left_ptr = 0;
  let right_ptr; 

  while (left_ptr < arr.length) {
    sub_arr = [sort_arr[left_ptr]];
    right_ptr = left_ptr + 1;
    while (sort_arr[right_ptr] === sort_arr[right_ptr - 1] + 1) {
      sub_arr.push(sort_arr[right_ptr]);
      right_ptr += 1; 
    }
    list.push(sub_arr);
    left_ptr = right_ptrt;
  }
  console.log(list);
}

class Test {
  static assertEquals(left, right) {
    const result = (left === right ? "PASSED" : "FAILED" );
    console.log(result);
    if (result === "FAILED") {
      console.log(`EXPECTED ${left}`);
      console.log(` TO EQUAL ${right}`);
    }
  }
}
maxSequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]);
// Test.assertEquals(maxSequence([]), 0);
// Test.assertEquals(maxSequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]), 6);
//

// Solution:
  // var min = 0, ans = 0, i, sum = 0;
  // for (i = 0; i < arr.length; ++i) {
  //   sum += arr[i];
  //   min = Math.min(sum, min);
  //   ans = Math.max(ans, sum - min);
  // }
  // return ans;
