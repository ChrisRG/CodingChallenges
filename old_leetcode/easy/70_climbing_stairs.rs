// You are climbing a staircase. It takes n steps to reach the top.

// Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

struct Solution;

impl Solution {
    pub fn climb_stairs(n: i32) -> i32 {
        // let n = n as usize;
        // let mut memo: Vec<Option<usize>> = vec![None; n + 1];
        Solution::climb_on_up_again(n)
    }

    // Top town:
    fn climb_on_up(n: usize, memo: &mut Vec<Option<usize>>) -> usize {
        if n == 1 || n == 0 { return 1; }
        
        if memo[n].is_none() {
            memo[n] = Some(Solution::climb_on_up(n - 1, memo) + Solution::climb_on_up(n - 2, memo));
        }

        memo[n].unwrap()
    }

    // Bottom up
    fn climb_on_up_again(n: i32) -> i32 { 
        let (mut prev1, mut prev2, mut accumulator) = (1, 1, 1);
        
        for _ in 2..=n {
            accumulator = prev1 + prev2;
            prev2 = prev1;
            prev1 = accumulator;
        }
        accumulator
    }
}

fn main() {
    let sol1 = Solution::climb_stairs(45);
    let exp1 = 1836311903;
    println!("Result: {:?}, Expected: {}", sol1, exp1);

    let sol2 = Solution::climb_stairs(3);
    let exp2 = 3;
    println!("Result: {:?}, Expected: {}", sol2, exp2);
}
