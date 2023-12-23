class Node {
  int data;
  Node? next;

  Node(this.data);
}

void printReverse(Node? head) {
  if (head == null) return;
  printReverse(head.next);
  print(head.data);
}

void main() {
  Node head = Node(21);
  head.next = Node(34);
  head.next!.next = Node(52);
  head.next!.next!.next = Node(40);

  printReverse(head);  
}
