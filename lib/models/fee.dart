class Fee {
  final String id;
  final String studentId;
  final String description;
  final double amount;
  final DateTime dueDate;
  final bool isPaid;

  Fee({
    required this.id,
    required this.studentId,
    required this.description,
    required this.amount,
    required this.dueDate,
    required this.isPaid,
  });
}
