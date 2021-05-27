// 543. Diameter of Binary Tree
// link: https://leetcode.com/problems/diameter-of-binary-tree/
// Given the root of a binary tree, return the length of the diameter of the tree.

// The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

// The length of a path between two nodes is represented by the number of edges between them.

// Example:
// Input: root = [1,2,3,4,5]
// Output: 3
// Explanation: 3is the length of the path [4,2,1,3] or [5,2,1,3].

use std::rc::Rc;
use std::cell::RefCell;

// Definition for a binary tree node.
#[derive(Debug, PartialEq, Eq)]
pub struct TreeNode {
    pub val: i32,
    pub left: Option<Rc<RefCell<TreeNode>>>,
    pub right: Option<Rc<RefCell<TreeNode>>>,
}

impl TreeNode {
#[inline]
pub fn new(val: i32) -> Self {
 TreeNode {
   val,
   left: None,
   right: None
 }
}
}

struct Solution;

impl Solution {
    pub fn diameter_of_binary_tree(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        let mut max: i32 = 1;

        Solution::height(root, &mut max);

        return max - 1;
    }

    fn height(node: Option<Rc<RefCell<TreeNode>>>, max: &mut i32) -> i32 {
        match node {
            Some(curr_node_rc) => {
                let curr_node = curr_node_rc.borrow();

                let left_height = Solution::height(curr_node.left.clone(), max);
                let right_height = Solution::height(curr_node.right.clone(), max);

                let curr_diameter = left_height + right_height;
                *max = std::cmp::max(*max, curr_diameter + 1);
                return 1 + std::cmp::max(left_height, right_height) 
            }
            None => 0
        }
    }
}



fn main() {
    let dumb_tree = Some(Rc::new(RefCell::new(TreeNode { 
        val: 1,
        right: Some(Rc::new(RefCell::new(TreeNode::new(3),
        ))),
        left: Some(Rc::new(RefCell::new(TreeNode { 
            val: 2, 
            left: Some(Rc::new(RefCell::new(TreeNode::new(4)))),
            right: Some(Rc::new(RefCell::new(TreeNode::new(5)))),
        } )))
        }
        )));
    
    println!("{:?}", dumb_tree);
    let sol = Solution::diameter_of_binary_tree(dumb_tree);

    println!("{:?}", sol);
}

