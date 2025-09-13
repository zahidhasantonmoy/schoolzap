import 'package:flutter/material.dart';
import 'package:schoolzap/shared/widgets/custom_button.dart';

class StudentDashboardScreen extends StatelessWidget {
  const StudentDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              // TODO: Navigate to calendar
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
                'Student Portal',
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
              leading: const Icon(Icons.class_),
              title: const Text('My Classes'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to classes
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text('My Work'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/my-work');
              },
            ),
            ListTile(
              leading: const Icon(Icons.grade),
              title: const Text('Grades'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to grades
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
            // Welcome section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Good morning, Alex!',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'You have 3 assignments due today',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Today's assignments
            const Text(
              'Due Today',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...[
              {
                'title': 'Algebra Problem Set',
                'subject': 'Mathematics',
                'time': 'Due 11:59 PM',
              },
              {
                'title': 'Physics Lab Report',
                'subject': 'Physics',
                'time': 'Due 11:59 PM',
              },
            ].map((assignment) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  title: Text(assignment['title']!),
                  subtitle: Text('${assignment['subject']!} • ${assignment['time']!}'),
                  trailing: CustomButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/submission');
                    },
                    text: 'Submit',
                    color: Colors.grey,
                  ),
                ),
              );
            }).toList(),
            const SizedBox(height: 20),
            // Upcoming assignments
            const Text(
              'Upcoming',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...[
              {
                'title': 'Chemistry Experiment',
                'subject': 'Chemistry',
                'date': 'Due Jun 20',
              },
              {
                'title': 'History Essay',
                'subject': 'History',
                'date': 'Due Jun 22',
              },
            ].map((assignment) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  title: Text(assignment['title']!),
                  subtitle: Text('${assignment['subject']!} • ${assignment['date']!}'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.pushNamed(context, '/submission');
                  },
                ),
              );
            }).toList(),
            const SizedBox(height: 20),
            // Quick actions
            const Text(
              'Quick Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(
                  context,
                  icon: Icons.assignment,
                  label: 'My Work',
                  onTap: () {
                    Navigator.pushNamed(context, '/my-work');
                  },
                ),
                _buildActionButton(
                  context,
                  icon: Icons.grade,
                  label: 'Grades',
                  onTap: () {
                    // TODO: Navigate to grades
                  },
                ),
                _buildActionButton(
                  context,
                  icon: Icons.event_available,
                  label: 'Attendance',
                  onTap: () {
                    // TODO: Navigate to attendance
                  },
                ),
              ],
            ),
          ],
        ),
      ),
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
