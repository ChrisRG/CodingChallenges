// 1382. Balance a Binary Search Tree
// https://leetcode.com/problems/balance-a-binary-search-tree/
// Given a binary search tree, return a balanced binary search tree with the same node values.

// A binary search tree is balanced if and only if the depth of the two subtrees of every node never differ by more than 1.

// If there is more than one answer, return any of them.

use std::rc::Rc;
use std::cell::RefCell;

#[derive(Debug, PartialEq, Eq, Clone)]
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
    pub fn balance_bst(root: Option<Rc<RefCell<TreeNode>>>) -> Option<Rc<RefCell<TreeNode>>> {
        let mut list = vec![];
        let new_list = Solution::sort(root, &mut list);
        println!("{:?}", new_list);
        return build(new_list);
    }

    fn sort(root: Option<Rc<RefCell<TreeNode>>>, mut list: &mut Vec<TreeNode>) -> &mut Vec<TreeNode> {
        match root {
            Some(node_rc) => {
                let node = node_rc.borrow();
                list = Solution::sort(node.left.clone(), list);
                list.push(node.clone());
                list = Solution::sort(node.right.clone(), list);
                list
                }
            None => list,
        }
    }

    fn build(list : &mut Vec<TreeNode>) -> Option<Rc<RefCell<TreeNode>>> {
        if list.len() == 0 { return list; }

        let middle = list.len() / 2;
        return Rc::new(RefCell::new(TreeNode
                                {
                                    val: 15,
                                    left: build, // .. middle
                                    right: build, // middle + 1 ... end
                                }
                        ));
    }

}


fn main() {
    let tree = tree![1,,[2,,[3,,[5,,]]]];
    
    let sol = Solution::balance_bst(Some(Rc::new(RefCell::new(tree))));
    println!("{:?}", sol);
}


// Make it easier to write tree initializations
#[macro_export]
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
