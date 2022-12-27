# https://leetcode.com/problems/linked-list-cycle-ii/?envType=study-plan&id=level-1

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def detect_cycle(head)
  slow = head
  fast = head

  while fast&.next
    fast = fast.next.next
    slow = slow.next
    if fast == slow
      slow2 = head
      while slow != slow2
        slow2 = slow2.next
        slow = slow.next
      end

      return slow
    end
  end

  nil
end
