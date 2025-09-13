class SubscriptionPlan {
  final String id;
  final String name;
  final double price;
  final String description;
  final List<String> features;

  SubscriptionPlan({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.features,
  });
}
