// 104. Maximum Depth of Binary Tree
// link: https://leetcode.com/problems/maximum-depth-of-binary-tree/
//Given the root of a binary tree, return its maximum depth.

//A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

use std::rc::Rc;
use std::cell::RefCell;

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
    pub fn max_depth(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        let mut depths: Vec<i32> = vec![0];
        let mut stack: Vec<(i32, Rc<RefCell<TreeNode>>)> = Vec::new();

        if let Some(root_node) = root {

            stack.push((1, root_node));

            while !stack.is_empty() {
                let (depth, tree_node_rc) = stack.pop().unwrap();
                let tree_node = tree_node_rc.borrow();

                if tree_node.left.is_some() {
                    stack.push((depth + 1, tree_node.left.clone().unwrap()));
                }
                if tree_node.right.is_some() {
                    stack.push((depth + 1, tree_node.right.clone().unwrap()));
                }
                depths.push(depth);
            }
        }
        return *depths.iter().max().unwrap();
    }
}

fn main() {
    let dumb_tree = Some(Rc::new(RefCell::new(TreeNode { 
        val: 3,
        left: Some(Rc::new(RefCell::new(TreeNode::new(9),
        ))),
        right: Some(Rc::new(RefCell::new(TreeNode { 
            val: 20, 
            left: Some(Rc::new(RefCell::new(TreeNode::new(15)))),
            right: Some(Rc::new(RefCell::new(TreeNode::new(7)))),
        } )))
        }
        )));
    
    let sol = Solution::max_depth(dumb_tree);
    println!("{:?}", sol);
}


// Ninevra's tree macro
macro_rules! tree {
        ($value:expr,,) => {
            TreeNode {
                val: $value,
                left: None,
                right: None,
            }
        };
        ($value:expr, $left:tt,) => {
            TreeNode {
                val: $value,
                left: Some(Rc::new(RefCell::new(tree!$left))),
                right: None,
            }
        };
        ($value:expr, $left:tt, $right:tt) => {
            TreeNode {
                val: $value,
                left: Some(Rc::new(RefCell::new(tree!$left))),
                right: Some(Rc::new(RefCell::new(tree!$right))),
            }
        };
        ($value:expr,, $right: tt) => {
            TreeNode {
                val: $value,
                left: None,
                right: Some(Rc::new(RefCell::new(tree!$right))),
            }
        };
    }

