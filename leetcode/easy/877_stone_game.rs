// Alex and Lee play a game with piles of stones.  There are an even number of piles arranged in a row, and each pile has a positive integer number of stones piles[i].

// The objective of the game is to end with the most stones.  The total number of stones is odd, so there are no ties.

// Alex and Lee take turns, with Alex starting first.  Each turn, a player takes the entire pile of stones from either the beginning or the end of the row.  This continues until there are no more piles left, at which point the person with the most stones wins.

// Assuming Alex and Lee play optimally, return True if and only if Alex wins the game.

struct Solution;

impl Solution {
    pub fn stone_game(piles: Vec<i32>) -> bool {
        let scores: (i32, i32) = Solution::stone_fun(&piles, true);
        return scores.0 > scores.1;
    }
    
    // Considering some pointers to the vec to pass around!
    fn stone_fun(piles: &[i32], alex_turn: bool) -> (i32, i32) {
        if piles.len() == 2 {
            if piles[0] > piles[1] {
                return (piles[0], piles[1]);
            } else {
                return (piles[1], piles[0]);
            }
        }
        if alex_turn {
            let (alex_front, lee_front) = Solution::stone_fun(&piles[1..], false);
            let alex_f_final = alex_front + piles[0];
            
            let (alex_back, lee_back) = Solution::stone_fun(&piles[..piles.len()-1], false);
            let alex_b_final = alex_back + piles[piles.len()-1];
            
            if alex_f_final > alex_b_final {
                return (alex_f_final, lee_front);
            } else {
                return (alex_b_final, lee_back);
            }
        } else {
            let (alex_front, lee_front) = Solution::stone_fun(&piles[1..], true);
            let lee_f_final = lee_front + piles[0];
            let (alex_back, lee_back) = Solution::stone_fun(&piles[..piles.len()-1], true);
            let lee_b_final = lee_back + piles[piles.len()-1];
            if lee_f_final > lee_b_final {
                return (alex_front, lee_f_final);
            } else {
                return (alex_back, lee_b_final);
            }
        }
        
    }
}

fn main() {
    let pile = vec![5,3,4,5];
    let sol = Solution::stone_game(pile);
    println!("Result: {}, expected: {}", sol, true);
}
