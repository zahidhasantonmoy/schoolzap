import 'package:flutter/material.dart';
import 'package:schoolzap/shared/widgets/custom_button.dart';

class ClassroomHubScreen extends StatefulWidget {
  const ClassroomHubScreen({super.key});

  @override
  State<ClassroomHubScreen> createState() => _ClassroomHubScreenState();
}

class _ClassroomHubScreenState extends State<ClassroomHubScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
        title: const Text('Classroom Hub'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.assignment), text: 'Assignments'),
            Tab(icon: Icon(Icons.quiz), text: 'Quizzes'),
            Tab(icon: Icon(Icons.folder), text: 'Study Materials'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Show options for creating new content
              _showCreateOptions(context);
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Assignments tab
          _buildAssignmentsTab(),
          // Quizzes tab
          _buildQuizzesTab(),
          // Study Materials tab
          _buildStudyMaterialsTab(),
        ],
      ),
    );
  }

  void _showCreateOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.assignment),
                title: const Text('Create Assignment'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/create-edit-assignment');
                },
              ),
              ListTile(
                leading: const Icon(Icons.quiz),
                title: const Text('Create Quiz'),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Navigate to create quiz screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.upload_file),
                title: const Text('Upload Study Material'),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Navigate to upload material screen
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAssignmentsTab() {
    // Mock data for assignments
    final assignments = [
      {
        'title': 'Algebra Problem Set',
        'class': 'Mathematics - Grade 9A',
        'dueDate': 'Tomorrow',
        'submissions': '25/30',
      },
      {
        'title': 'Physics Lab Report',
        'class': 'Physics - Grade 10B',
        'dueDate': 'Jun 20',
        'submissions': '18/25',
      },
      {
        'title': 'Chemistry Experiment',
        'class': 'Chemistry - Grade 11C',
        'dueDate': 'Jun 25',
        'submissions': '12/20',
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
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {
                        // Show assignment options
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  assignment['class']!,
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
                    Text('${assignment['submissions']!} submitted'),
                  ],
                ),
                const SizedBox(height: 16),
                LinearProgressIndicator(
                  value: 0.7,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      onPressed: () {
                        // TODO: Navigate to grading screen
                      },
                      text: 'Grade',
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    CustomButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/create-edit-assignment');
                      },
                      text: 'Edit',
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

  Widget _buildQuizzesTab() {
    return const Center(
      child: Text('Quizzes will be displayed here'),
    );
  }

  Widget _buildStudyMaterialsTab() {
    return const Center(
      child: Text('Study materials will be displayed here'),
    );
  }
}
