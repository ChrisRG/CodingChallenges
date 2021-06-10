// Given a string s, return the number of palindromic substrings in it.

// A string is a palindrome when it reads the same backward as forward.

// A substring is a contiguous sequence of characters within the string.

struct Solution;

impl Solution {
    pub fn count_substrings(s: String) -> i32 {
        let mut table: Vec<Vec<i32>> = vec![vec![0; s.len()]; s.len()];
        let mut counter = 0;
        // Fill up strings length 1:
        for i in 0..s.len() {
            table[i][i] = 1;
            counter += 1;
        }

        for i in (0..=s.len()-1).rev() {
            for j in i..s.len() {
                if i == j {
                    continue;
                } else if &s.chars().nth(i) == &s.chars().nth(j) {
                    if j - i == 1 {
                        table[i][j] = 1;
                        counter += 1;
                        // println!("{:?}", &s[i..=j]);
                    } else if table[i + 1][j - 1] != 0 {
                        table[i][j] = 1;
                        counter += 1;
                        // println!("{:?}", &s[i..=j]);
                    }
                }
            }
        }
        
        // println!("{:?}", table);
        // let sum: i32 = table.iter().flatten().sum();
        // sum
        counter
    }
}

fn main() {
    let s1 = "abc".to_string();
    let s2 = "abc".to_string();
    let sol1 = Solution::count_substrings(s1);
    let sol2 = Solution::count_substrings(s2);
    println!("Result: {} Expected: 3", sol1);
    println!("Result: {} Expected: 3", sol2);
}
