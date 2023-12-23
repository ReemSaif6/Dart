class Node {
  int data;
  Node? next;

  Node(this.data);
}

Node? reverseList(Node? head) {
  Node? prev = null;
  Node? curr = head;
  Node? next;

  while (curr != null) {
    next = curr.next;
    curr.next = prev;
    prev = curr;
    curr = next;
  }

  return prev;
}

void main() {
  Node head = Node(13);
  head.next = Node(52);
  head.next!.next = Node(19);
  head.next!.next!.next = Node(40);

  Node? reversed = reverseList(head);
  while (reversed != null) {
    print(reversed.data);
    reversed = reversed.next;
  }
}
