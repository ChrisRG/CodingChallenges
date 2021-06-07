
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
    pub fn rotate_right(head: Option<Box<ListNode>>, k: i32) -> Option<Box<ListNode>> {

    }
    fn build_list(value_list: Vec<i32>) -> Option<Box<ListNode>> {
        let mut head = Some(Box::new(ListNode::new(value_list[0])));
        let mut current = &mut head;
        for val in value_list[1..].iter() {
            let new_node = Some(Box::new(ListNode::new(*val)));
            if let Some(c) = current {
                c.next = new_node;
                current = &mut c.next;
            }
        }
        head
    }
}
