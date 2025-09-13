import 'package:flutter/material.dart';
import 'package:schoolzap/models/school.dart';
import 'package:schoolzap/shared/widgets/custom_button.dart';

class TenantListScreen extends StatefulWidget {
  const TenantListScreen({super.key});

  @override
  State<TenantListScreen> createState() => _TenantListScreenState();
}

class _TenantListScreenState extends State<TenantListScreen> {
  late List<School> _tenants;
  late List<School> _filteredTenants;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTenants();
    _searchController.addListener(_filterTenants);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterTenants);
    _searchController.dispose();
    super.dispose();
  }

  void _loadTenants() {
    // TODO: Load tenants from repository
    // For now, using mock data
    _tenants = [
      School(
        id: '1',
        name: 'Greenwood High School',
        domain: 'greenwood.schoolzap.com',
        subscriptionPlan: 'Premium',
        status: 'Active',
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
      ),
      School(
        id: '2',
        name: 'Oakridge International',
        domain: 'oakridge.schoolzap.com',
        subscriptionPlan: 'Basic',
        status: 'Active',
        createdAt: DateTime.now().subtract(const Duration(days: 15)),
      ),
      School(
        id: '3',
        name: 'North Star Academy',
        domain: 'northstar.schoolzap.com',
        subscriptionPlan: 'Premium',
        status: 'Suspended',
        createdAt: DateTime.now().subtract(const Duration(days: 45)),
      ),
    ];
    _filteredTenants = List.from(_tenants);
  }

  void _filterTenants() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredTenants = _tenants.where((tenant) {
        return tenant.name.toLowerCase().contains(query) ||
            tenant.domain.toLowerCase().contains(query) ||
            tenant.subscriptionPlan.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _addNewTenant() {
    // TODO: Implement add new tenant functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add new tenant functionality to be implemented')),
    );
  }

  void _viewTenantDetails(School tenant) {
    // TODO: Navigate to tenant detail screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('View details for ${tenant.name}')),
    );
  }

  void _suspendTenant(School tenant) {
    // TODO: Implement suspend tenant functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Suspend ${tenant.name} functionality to be implemented')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Tenants'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addNewTenant,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search tenants...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white.withOpacity(0.8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: _filteredTenants.isEmpty
                ? const Center(
                    child: Text('No tenants found'),
                  )
                : ListView.builder(
                    itemCount: _filteredTenants.length,
                    itemBuilder: (context, index) {
                      final tenant = _filteredTenants[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: ListTile(
                          title: Text(tenant.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(tenant.domain),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 4.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: tenant.status == 'Active'
                                          ? Colors.green
                                          : Colors.red,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      tenant.status,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 4.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      tenant.subscriptionPlan,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: PopupMenuButton<String>(
                            onSelected: (value) {
                              switch (value) {
                                case 'view':
                                  _viewTenantDetails(tenant);
                                  break;
                                case 'suspend':
                                  _suspendTenant(tenant);
                                  break;
                              }
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'view',
                                child: Text('View Details'),
                              ),
                              const PopupMenuItem(
                                value: 'suspend',
                                child: Text('Suspend'),
                              ),
                            ],
                          ),
                          onTap: () => _viewTenantDetails(tenant),
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
