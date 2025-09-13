import 'package:flutter/material.dart';
import 'package:schoolzap/models/user.dart';
import 'package:schoolzap/shared/widgets/custom_button.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  late List<User> _users;
  late List<User> _filteredUsers;
  final TextEditingController _searchController = TextEditingController();
  String _selectedRole = 'All';

  @override
  void initState() {
    super.initState();
    _loadUsers();
    _searchController.addListener(_filterUsers);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterUsers);
    _searchController.dispose();
    super.dispose();
  }

  void _loadUsers() {
    // TODO: Load users from repository
    // For now, using mock data
    _users = [
      User(
        id: '1',
        name: 'John Doe',
        email: 'john.doe@school.edu',
        role: 'teacher',
      ),
      User(
        id: '2',
        name: 'Jane Smith',
        email: 'jane.smith@school.edu',
        role: 'student',
      ),
      User(
        id: '3',
        name: 'Robert Johnson',
        email: 'robert.j@school.edu',
        role: 'parent',
      ),
      User(
        id: '4',
        name: 'Emily Davis',
        email: 'emily.d@school.edu',
        role: 'teacher',
      ),
      User(
        id: '5',
        name: 'Michael Wilson',
        email: 'michael.w@school.edu',
        role: 'student',
      ),
    ];
    _filteredUsers = List.from(_users);
  }

  void _filterUsers() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredUsers = _users.where((user) {
        return (user.name.toLowerCase().contains(query) ||
                user.email.toLowerCase().contains(query)) &&
            (_selectedRole == 'All' || user.role == _selectedRole);
      }).toList();
    });
  }

  void _onRoleChanged(String? newValue) {
    setState(() {
      _selectedRole = newValue!;
      _filterUsers();
    });
  }

  void _addNewUser() {
    Navigator.pushNamed(context, '/add-edit-user');
  }

  void _editUser(User user) {
    // TODO: Navigate to edit user screen with user data
    Navigator.pushNamed(context, '/add-edit-user');
  }

  void _deleteUser(User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: Text('Are you sure you want to delete ${user.name}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _users.removeWhere((u) => u.id == user.id);
                  _filterUsers();
                });
                // TODO: Delete user from repository
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${user.name} deleted successfully')),
                );
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addNewUser,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search users...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                DropdownButton<String>(
                  value: _selectedRole,
                  items: const [
                    DropdownMenuItem(value: 'All', child: Text('All Roles')),
                    DropdownMenuItem(value: 'teacher', child: Text('Teachers')),
                    DropdownMenuItem(value: 'student', child: Text('Students')),
                    DropdownMenuItem(value: 'parent', child: Text('Parents')),
                  ],
                  onChanged: _onRoleChanged,
                ),
              ],
            ),
          ),
          Expanded(
            child: _filteredUsers.isEmpty
                ? const Center(
                    child: Text('No users found'),
                  )
                : ListView.builder(
                    itemCount: _filteredUsers.length,
                    itemBuilder: (context, index) {
                      final user = _filteredUsers[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text(
                              user.name.substring(0, 1).toUpperCase(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(user.name),
                          subtitle: Text('${user.email} • ${user.role}'),
                          trailing: PopupMenuButton<String>(
                            onSelected: (value) {
                              switch (value) {
                                case 'edit':
                                  _editUser(user);
                                  break;
                                case 'delete':
                                  _deleteUser(user);
                                  break;
                              }
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'edit',
                                child: Text('Edit'),
                              ),
                              const PopupMenuItem(
                                value: 'delete',
                                child: Text('Delete'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
