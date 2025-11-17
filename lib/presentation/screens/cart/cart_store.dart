class CartStore {
  static List<Map<String, String>> cartItems = [];

  static void addItem(String title, String image) {
    cartItems.add({"title": title, "image": image});
  }
}
