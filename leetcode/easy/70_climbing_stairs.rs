// You are climbing a staircase. It takes n steps to reach the top.

// Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

struct Solution;

impl Solution {
    pub fn climb_stairs(n: i32) -> i32 {
        let mut memo: Vec<Option<usize>> = vec![None; (n as usize) + 1];
        Solution::climb_on_up(n as usize, &mut memo) as i32
    }
    
    fn climb_on_up(n: usize, memo: &mut Vec<Option<usize>>) -> usize {
        if n == 1 || n == 0 { return 1; }
        
        if memo[n].is_none() {
            memo[n] = Some(Solution::climb_on_up(n - 1, memo) + Solution::climb_on_up(n - 2, memo));
        }
       
        memo[n].unwrap()
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
