// You are climbing a staircase. It takes n steps to reach the top.

// Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

struct Solution;

impl Solution {
    pub fn climb_stairs(n: i32) -> i32 {
       0 
    }
}

fn main() {
    let sol1 = Solution::climb_stairs(2);
    let exp1 = 2;
    println!("Result: {:?}, Expected: {}", sol1, exp1);

    let sol2 = Solution::climb_stairs(3);
    let exp2 = 3;
    println!("Result: {:?}, Expected: {}", sol2, exp2);
}
