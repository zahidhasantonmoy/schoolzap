import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:schoolzap/shared/widgets/custom_button.dart';

class TeacherDashboardScreen extends StatelessWidget {
  const TeacherDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Dashboard'),
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
                'Teacher Portal',
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
                Navigator.pushNamed(context, '/classroom-hub');
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text('Assignments'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/classroom-hub');
              },
            ),
            ListTile(
              leading: const Icon(Icons.check_circle),
              title: const Text('Grading'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Navigate to grading screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.event_available),
              title: const Text('Attendance'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/attendance');
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
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: [
            // Today's agenda
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Today\'s Agenda',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      ...[
                        {
                          'time': '9:00 AM',
                          'class': 'Mathematics - Grade 9A',
                          'topic': 'Algebra Basics'
                        },
                        {
                          'time': '11:00 AM',
                          'class': 'Physics - Grade 10B',
                          'topic': 'Newton\'s Laws'
                        },
                        {
                          'time': '2:00 PM',
                          'class': 'Chemistry - Grade 11C',
                          'topic': 'Periodic Table'
                        },
                      ].map((event) {
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.deepPurple,
                              child: Text(
                                event['time']!.substring(0, 2),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(event['class']!),
                            subtitle: Text(event['topic']!),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
            ),
            // Quick actions
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 1,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            label: 'New Assignment',
                            onTap: () {
                              Navigator.pushNamed(context, '/create-edit-assignment');
                            },
                          ),
                          _buildActionButton(
                            context,
                            icon: Icons.quiz,
                            label: 'Create Quiz',
                            onTap: () {
                              // TODO: Navigate to create quiz
                            },
                          ),
                          _buildActionButton(
                            context,
                            icon: Icons.upload_file,
                            label: 'Share Material',
                            onTap: () {
                              // TODO: Navigate to share material
                            },
                          ),
                          _buildActionButton(
                            context,
                            icon: Icons.event_available,
                            label: 'Take Attendance',
                            onTap: () {
                              Navigator.pushNamed(context, '/attendance');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Recent assignments
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Recent Assignments',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      ...[
                        {
                          'title': 'Algebra Problem Set',
                          'class': 'Mathematics - Grade 9A',
                          'due': 'Due Tomorrow'
                        },
                        {
                          'title': 'Physics Lab Report',
                          'class': 'Physics - Grade 10B',
                          'due': 'Due in 3 days'
                        },
                      ].map((assignment) {
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            title: Text(assignment['title']!),
                            subtitle: Text('${assignment['class']!}\n${assignment['due']!}'),
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () {
                              // TODO: Navigate to assignment details
                            },
                          ),
                        );
                      }).toList(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/classroom-hub');
                        },
                        child: const Text('View All Assignments'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Class stats
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Class Statistics',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Average Performance',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      const LinearProgressIndicator(
                        value: 0.75,
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                      const SizedBox(height: 4),
                      const Text('75% - Good'),
                      const SizedBox(height: 16),
                      const Text(
                        'Attendance Rate',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      const LinearProgressIndicator(
                        value: 0.90,
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                      const SizedBox(height: 4),
                      const Text('90% - Excellent'),
                    ],
                  ),
                ),
              ),
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
