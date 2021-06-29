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
   pub fn sort_list(head: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
        
        if head.is_none() { return None; }
        
        let mut val_list = Solution::get_values(head);

        val_list.sort();
        return Solution::build_list(val_list);
        // Some(Box::new(ListNode::new(3)))
    }
    
    // Alternative: push it into a heap, rebuild the list from that

    fn get_values(mut head: Option<Box<ListNode>>) -> Vec<i32> {
        let mut val_list = Vec::new();
        while head.is_some() {
            val_list.push(head.as_ref().unwrap().val);
            head = head.as_ref().unwrap().next.clone();
        }
        val_list
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

fn main() {
    let mut head = 0; // [1,2,6,3,4,5,6], val 6
    let sol = Solution::remove_elements(head, 6);
    println!("{}", sol);
}
