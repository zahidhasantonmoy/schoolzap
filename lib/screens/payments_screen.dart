import 'package:flutter/material.dart';
import 'package:schoolzap/shared/widgets/custom_button.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  String _selectedChild = 'Alex Johnson';
  List<Map<String, dynamic>> _children = [
    {
      'name': 'Alex Johnson',
      'grade': 'Grade 9',
    },
    {
      'name': 'Sam Johnson',
      'grade': 'Grade 6',
    },
  ];
  String _selectedPaymentMethod = 'bKash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payments'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Child selector
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Child',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedChild,
                      items: _children
                          .map((child) => DropdownMenuItem(
                                value: child['name'],
                                child: Text('${child['name']} - ${child['grade']}'),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedChild = value!;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Outstanding fees
            const Text(
              'Outstanding Fees',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...[
              {
                'title': 'Tuition Fee - June',
                'amount': '\$50.00',
                'dueDate': 'Due Jun 15',
                'status': 'Pending',
              },
              {
                'title': 'Library Fee',
                'amount': '\$10.00',
                'dueDate': 'Due Jun 30',
                'status': 'Pending',
              },
              {
                'title': 'Lab Fee',
                'amount': '\$15.00',
                'dueDate': 'Due Jul 15',
                'status': 'Pending',
              },
            ].map((fee) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            fee['title']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            fee['amount']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            fee['dueDate']!,
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Pending',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        onPressed: () {
                          _showPaymentDialog(context, fee);
                        },
                        text: 'Pay Now',
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
            const SizedBox(height: 20),
            // Payment history
            const Text(
              'Payment History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...[
              {
                'title': 'Tuition Fee - May',
                'amount': '\$50.00',
                'date': 'Paid May 10',
                'status': 'Completed',
              },
              {
                'title': 'Annual Sports Fee',
                'amount': '\$25.00',
                'date': 'Paid Apr 5',
                'status': 'Completed',
              },
            ].map((payment) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  title: Text(payment['title']!),
                  subtitle: Text(payment['date']!),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        payment['amount']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Paid',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  void _showPaymentDialog(BuildContext context, Map<String, dynamic> fee) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Make Payment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Fee: ${fee['title']}'),
              Text('Amount: ${fee['amount']}'),
              const SizedBox(height: 16),
              const Text(
                'Select Payment Method',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedPaymentMethod,
                items: const [
                  DropdownMenuItem(value: 'bKash', child: Text('bKash')),
                  DropdownMenuItem(value: 'Rocket', child: Text('Rocket')),
                  DropdownMenuItem(value: 'Nagad', child: Text('Nagad')),
                  DropdownMenuItem(value: 'Visa', child: Text('Visa/MasterCard')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            CustomButton(
              onPressed: () {
                Navigator.of(context).pop();
                _processPayment(fee);
              },
              text: 'Pay ${fee['amount']}',
            ),
          ],
        );
      },
    );
  }

  void _processPayment(Map<String, dynamic> fee) {
    // TODO: Implement actual payment processing
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Payment processed successfully')),
    );
  }
}
