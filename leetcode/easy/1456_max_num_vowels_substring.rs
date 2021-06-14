// Given a string s and an integer k.

// Return the maximum number of vowel letters in any substring of s with length k.

// Vowel letters in English are (a, e, i, o, u).

struct Solution;

impl Solution {
    pub fn max_vowels(s: String, k: i32) -> i32 {
        let mut vow_count: i32 = 0;
        let mut max_count: i32 = 0;
        let chars: Vec<char> = s.chars().collect();

        for (index, rp) in chars.iter().enumerate() {
            if index as i32 - k >= 0 {
                if "aeiou".contains(chars[index - k as usize]) {
                    vow_count -= 1;
                }
            }
            if "aeiou".contains(*rp) {
                vow_count += 1;
                if vow_count > max_count { max_count = vow_count; }
            }
        }
        max_count
    }
}
