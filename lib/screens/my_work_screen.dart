import 'package:flutter/material.dart';
import 'package:schoolzap/shared/widgets/custom_button.dart';

class MyWorkScreen extends StatefulWidget {
  const MyWorkScreen({super.key});

  @override
  State<MyWorkScreen> createState() => _MyWorkScreenState();
}

class _MyWorkScreenState extends State<MyWorkScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedSubject = 'All';
  String _selectedStatus = 'All';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Work'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Assignments'),
            Tab(text: 'Quizzes'),
            Tab(text: 'Submissions'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Filters
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedSubject,
                    items: const [
                      DropdownMenuItem(value: 'All', child: Text('All Subjects')),
                      DropdownMenuItem(value: 'Math', child: Text('Mathematics')),
                      DropdownMenuItem(value: 'Physics', child: Text('Physics')),
                      DropdownMenuItem(value: 'Chemistry', child: Text('Chemistry')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedSubject = value!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Subject',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedStatus,
                    items: const [
                      DropdownMenuItem(value: 'All', child: Text('All Status')),
                      DropdownMenuItem(value: 'Submitted', child: Text('Submitted')),
                      DropdownMenuItem(value: 'Pending', child: Text('Pending')),
                      DropdownMenuItem(value: 'Graded', child: Text('Graded')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedStatus = value!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Assignments tab
                _buildAssignmentsList(),
                // Quizzes tab
                _buildQuizzesList(),
                // Submissions tab
                _buildSubmissionsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssignmentsList() {
    // Mock data for assignments
    final assignments = [
      {
        'title': 'Algebra Problem Set',
        'subject': 'Mathematics',
        'dueDate': 'Jun 15',
        'status': 'Submitted',
        'grade': 'A',
      },
      {
        'title': 'Physics Lab Report',
        'subject': 'Physics',
        'dueDate': 'Jun 20',
        'status': 'Pending',
        'grade': '-',
      },
      {
        'title': 'Chemistry Experiment',
        'subject': 'Chemistry',
        'dueDate': 'Jun 25',
        'status': 'Pending',
        'grade': '-',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: assignments.length,
      itemBuilder: (context, index) {
        final assignment = assignments[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      assignment['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: assignment['status'] == 'Submitted'
                            ? Colors.green
                            : Colors.orange,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        assignment['status']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  assignment['subject']!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Due: ${assignment['dueDate']!}'),
                    Text('Grade: ${assignment['grade']!}'),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (assignment['status'] == 'Pending')
                      CustomButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/submission');
                        },
                        text: 'Submit',
                        color: Colors.grey,
                      )
                    else
                      CustomButton(
                        onPressed: () {
                          // TODO: View submission/feedback
                        },
                        text: 'View Feedback',
                        color: Colors.grey,
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuizzesList() {
    return const Center(
      child: Text('Quizzes will be displayed here'),
    );
  }

  Widget _buildSubmissionsList() {
    return const Center(
      child: Text('Submissions will be displayed here'),
    );
  }
}
