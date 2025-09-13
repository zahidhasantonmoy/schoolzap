import 'package:flutter/material.dart';
import 'package:schoolzap/shared/widgets/custom_button.dart';

class ParentDashboardScreen extends StatefulWidget {
  const ParentDashboardScreen({super.key});

  @override
  State<ParentDashboardScreen> createState() => _ParentDashboardScreenState();
}

class _ParentDashboardScreenState extends State<ParentDashboardScreen> {
  String _selectedChild = 'Alex Johnson';
  List<Map<String, dynamic>> _children = [
    {
      'name': 'Alex Johnson',
      'grade': 'Grade 9',
      'school': 'Greenwood High School',
    },
    {
      'name': 'Sam Johnson',
      'grade': 'Grade 6',
      'school': 'Greenwood High School',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parent Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Parent Portal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Academic Insights'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to academic insights
              },
            ),
            ListTile(
              leading: const Icon(Icons.event_available),
              title: const Text('Attendance'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to attendance
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Payments'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/payments');
              },
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Communication'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to communication
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sign Out'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Implement sign out
              },
            ),
          ],
        ),
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
            // Child info
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Alex Johnson',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Grade 9 - Greenwood High School',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    // Stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatCard('Attendance', '92%', Icons.event_available),
                        _buildStatCard('Assignments', '8/10', Icons.assignment),
                        _buildStatCard('Grades', 'A-', Icons.grade),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Recent activity
            const Text(
              'Recent Activity',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...[
              {
                'title': 'Math Assignment Graded',
                'description': 'Alex received an A+ on the Algebra Problem Set',
                'time': '2 hours ago',
              },
              {
                'title': 'Parent-Teacher Meeting',
                'description': 'Meeting scheduled for June 20th at 3:00 PM',
                'time': '1 day ago',
              },
              {
                'title': 'Tuition Fee Due',
                'description': 'Monthly fee of \$50 is due by June 15th',
                'time': '2 days ago',
              },
            ].map((activity) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  title: Text(activity['title']!),
                  subtitle: Text(activity['description']!),
                  trailing: Text(
                    activity['time']!,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              );
            }).toList(),
            const Spacer(),
            // Quick actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(
                  context,
                  icon: Icons.payment,
                  label: 'Pay Fees',
                  onTap: () {
                    Navigator.pushNamed(context, '/payments');
                  },
                ),
                _buildActionButton(
                  context,
                  icon: Icons.message,
                  label: 'Message Teacher',
                  onTap: () {
                    // TODO: Navigate to messaging
                  },
                ),
                _buildActionButton(
                  context,
                  icon: Icons.bar_chart,
                  label: 'View Grades',
                  onTap: () {
                    // TODO: Navigate to grades
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.deepPurple),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        IconButton(
          iconSize: 40,
          icon: CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
          ),
          onPressed: onTap,
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
