class Node {
  int data;
  Node? next;

  Node(this.data);
}

Node? removeOccurrences(Node? head, int value) {
  while (head != null && head.data == value) {
    head = head.next;
  }

  Node? curr = head;
  while (curr != null && curr.next != null) {
    if (curr.next!.data == value) {
      curr.next = curr.next!.next;
    } else {
      curr = curr.next;
    }
  }
  return head;
}

void printList(Node? head) {
  while (head != null) {
    print(head.data);
    head = head.next;
  }
}

void main() {
  Node? head = Node(1);
  head.next = Node(2);
  head.next!.next = Node(3);
  head.next!.next!.next = Node(2);

  print("List:");
  printList(head);  

  head = removeOccurrences(head, 2);

  print("List after removing 2:");
  printList(head);  
}
