# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def has_cycle(head)
 return false if head&.next.nil?
  hash = {}

  tail = head

  while tail
    hash[tail] = true
    return true if hash[tail.next]
    tail = tail.next
  end

  false
end