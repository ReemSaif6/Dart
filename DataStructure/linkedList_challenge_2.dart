class Node {
  int data;
  Node? next;

  Node(this.data);
}

Node? findMiddle(Node? head) {
  if (head == null) return null;

  Node? slow = head;
  Node? fast = head;

  while (fast != null && fast.next != null) {
    slow = slow!.next;
    fast = fast.next!.next;
  }

  return slow;
}

void main() {

  Node head = Node(5);
  head.next = Node(9);
  head.next!.next = Node(8);

  print(findMiddle(head)!.data);  

}
