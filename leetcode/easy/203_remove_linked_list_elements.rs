// Given the head of a linked list and an integer val, 
// remove all the nodes of the linked list that has Node.val == val, 
// and return the new head.

 #[derive(PartialEq, Eq, Clone, Debug)]
 pub struct ListNode {
   pub val: i32,
   pub next: Option<Box<ListNode>>
 }
 
 impl ListNode {
   #[inline]
   fn new(val: i32) -> Self {
     ListNode {
       next: None,
       val
     }
   }
 }
impl Solution {
    pub fn remove_elements(mut head: Option<Box<ListNode>>, val: i32) -> Option<Box<ListNode>> {
        if head.is_none() { return None; }
        
        let mut prev: Option<Box<ListNode>> = None;
        let mut current = head.clone();

        while let Some(node) = current {
            current = node.next.clone();  

            if node.val == val {
                if prev.is_none() {
                    head = current.clone();
                } else {
                    prev.unwrap().next = node.next.clone(); 
                }
            }
            prev = Some(node);
        }
        head

    }
}

fn main() {
    let mut head = 0; // [1,2,6,3,4,5,6], val 6
    let sol = Solution::remove_elements(head, 6);
    println!("{}", sol);
}
