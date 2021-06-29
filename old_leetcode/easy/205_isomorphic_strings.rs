struct Solution;
impl Solution {
    pub fn is_isomorphic(s: String, t: String) -> bool {
        use std::collections::HashMap;
        
        let h_map = HashMap::new();
        
        for (left, right) in s.bytes().zip(t.bytes()) {
            if let Some(mapping) = h_map.get(&left) {
                if mapping != right  {
                    return false;
                }
            } else {
                if h_map.values().any(|elem| elem == right) {
                    return false;
                }
                h_map.insert(left, right);
            }
        }
        true
    }
}

fn main() {
    assert_eq!(Solution::is_isomorphic(String::from"badc", String::from("baba")), false)
}
