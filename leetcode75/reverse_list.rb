# https://leetcode.com/problems/reverse-linked-list/?envType=study-plan&id=level-1

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  return head unless head

  prev = head
  current = head.next
  prev.next = nil

  while current
    tmp = current.next
    current.next = prev
    prev = current
    current = tmp
  end

  prev
end
