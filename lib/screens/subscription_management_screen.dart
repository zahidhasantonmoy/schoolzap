import 'package:flutter/material.dart';
import 'package:schoolzap/models/subscription_plan.dart';
import 'package:schoolzap/models/feature_flag.dart';
import 'package:schoolzap/shared/widgets/custom_button.dart';

class SubscriptionManagementScreen extends StatefulWidget {
  const SubscriptionManagementScreen({super.key});

  @override
  State<SubscriptionManagementScreen> createState() => _SubscriptionManagementScreenState();
}

class _SubscriptionManagementScreenState extends State<SubscriptionManagementScreen> {
  late List<SubscriptionPlan> _subscriptionPlans;
  late List<FeatureFlag> _allFeatures;

  @override
  void initState() {
    super.initState();
    _loadSubscriptionPlans();
    _loadFeatures();
  }

  void _loadSubscriptionPlans() {
    // TODO: Load subscription plans from repository
    // For now, using mock data
    _subscriptionPlans = [
      SubscriptionPlan(
        id: 'basic',
        name: 'Basic',
        price: 5.0,
        description: 'Essential features for small schools',
        features: ['assignments', 'attendance'],
      ),
      SubscriptionPlan(
        id: 'premium',
        name: 'Premium',
        price: 15.0,
        description: 'All features including advanced analytics',
        features: ['assignments', 'attendance', 'analytics', 'parent_communication'],
      ),
      SubscriptionPlan(
        id: 'enterprise',
        name: 'Enterprise',
        price: 25.0,
        description: 'All features plus payroll and admissions management',
        features: ['assignments', 'attendance', 'analytics', 'parent_communication', 'payroll', 'admissions'],
      ),
    ];
  }

  void _loadFeatures() {
    // TODO: Load features from repository
    // For now, using mock data
    _allFeatures = [
      FeatureFlag(id: 'assignments', name: 'Assignments & Tasks'),
      FeatureFlag(id: 'attendance', name: 'Attendance Tracking'),
      FeatureFlag(id: 'analytics', name: 'Analytics & Reports'),
      FeatureFlag(id: 'parent_communication', name: 'Parent Communication'),
      FeatureFlag(id: 'payroll', name: 'Payroll Management'),
      FeatureFlag(id: 'admissions', name: 'Admissions Management'),
    ];
  }

  void _addNewPlan() {
    // TODO: Implement add new plan functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add new plan functionality to be implemented')),
    );
  }

  void _editPlan(SubscriptionPlan plan) {
    // TODO: Navigate to plan edit screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit ${plan.name} plan')),
    );
  }

  bool _planHasFeature(SubscriptionPlan plan, FeatureFlag feature) {
    return plan.features.contains(feature.id);
  }

  void _toggleFeature(SubscriptionPlan plan, FeatureFlag feature) {
    setState(() {
      if (plan.features.contains(feature.id)) {
        plan.features.remove(feature.id);
      } else {
        plan.features.add(feature.id);
      }
    });
    // TODO: Save changes to repository
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Plan updated successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addNewPlan,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _subscriptionPlans.length,
        itemBuilder: (context, index) {
          final plan = _subscriptionPlans[index];
          return Card(
            margin: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        plan.name,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        '\${plan.price.toStringAsFixed(2)}/month',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    plan.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Features:',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  ..._allFeatures.map((feature) {
                    return CheckboxListTile(
                      title: Text(feature.name),
                      value: _planHasFeature(plan, feature),
                      onChanged: (value) {
                        _toggleFeature(plan, feature);
                      },
                    );
                  }).toList(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        onPressed: () => _editPlan(plan),
                        text: 'Edit Plan',
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
