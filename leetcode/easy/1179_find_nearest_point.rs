// 1779. Find Nearest Point That Has the Same X or Y Coordinate

// Link: https://leetcode.com/problems/find-nearest-point-that-has-the-same-x-or-y-coordinate/submissions/

// You are given two integers, x and y, which represent your current location on a Cartesian grid: (x, y). You are also given an array points where each points[i] = [ai, bi] represents that a point exists at (ai, bi). A point is valid if it shares the same x-coordinate or the same y-coordinate as your location.

// Return the index (0-indexed) of the valid point with the smallest Manhattan distance from your current location. If there are multiple, return the valid point with the smallest index. If there are no valid points, return -1.

// The Manhattan distance between two points (x1, y1) and (x2, y2) is abs(x1 - x2) + abs(y1 - y2).

// Example 1:

// Input: x = 3, y = 4, points = [[1,2],[3,1],[2,4],[2,3],[4,4]]
// Output: 2
// Explanation: Of all the points, only [3,1], [2,4] and [4,4] are valid. Of the valid points, [2,4] and [4,4] have the smallest Manhattan distance from your current location, with a distance of 1. [2,4] has the smallest index, so return 2.

// Example 2:

// Input: x = 3, y = 4, points = [[3,4]]
// Output: 0
// Explanation: The answer is allowed to be on the same location as your current location.

// Example 3:

// Input: x = 3, y = 4, points = [[2,3]]
// Output: -1
// Explanation: There are no valid points.

// Constraints:

//     1 <= points.length <= 104
//     points[i].length == 2
//     1 <= x, y, ai, bi <= 104


struct Solution;

impl Solution {
    pub fn nearest_valid_point(x: i32, y: i32, points: Vec<Vec<i32>>) -> i32 {
        let mut lowest_manhattan = (std::usize::MAX, std::i32::MAX);
        for (idx, point) in points.iter().enumerate() {
            if point[0] == x || point[1] == y {
                let current_distance = (point[0] - x).abs() + (point[1] - y).abs();
                if current_distance < lowest_manhattan.1 {
                    lowest_manhattan = (idx, current_distance);
                }
            }
        }
        if lowest_manhattan.0 == std::usize::MAX {
            return -1;
        }
            
        lowest_manhattan.0 as i32
    }
}
// 
// [[1,2],[3,1],[2,4],[2,3],[4,4]]
fn main() {
    let x = 3;
    let y = 4;
    let test_input = vec![vec![1,2], vec![3,1], vec![2,4], vec![2,3], vec![4,4]];
    let solution = Solution::nearest_valid_point(3, 4, test_input);
    println!("{}", solution);
}

