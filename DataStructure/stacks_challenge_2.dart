void main() {
  String test1 = "((()))";
  String test2 = "(()))";
  String test3 = "(()";

  print("$test1 is balanced: ${isBalancedParentheses(test1)}"); // true
  print("$test2 is balanced: ${isBalancedParentheses(test2)}"); // false
  print("$test3 is balanced: ${isBalancedParentheses(test3)}"); // false
}

bool isBalancedParentheses(String input) {
  List<String> stack = [];

  for (int i = 0; i < input.length; i++) {
    String char = input[i];

    if (char == '(') {
      stack.add(char);
    } else if (char == ')') {
      if (stack.isEmpty) {
        return false; // More closing parentheses than opening ones
      }
      stack.removeLast(); // Pop from the stack for a match
    }
  }

  return stack.isEmpty; // If stack is empty, all parentheses are balanced
}
