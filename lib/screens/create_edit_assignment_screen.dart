import 'package:flutter/material.dart';
import 'package:schoolzap/shared/widgets/custom_button.dart';
import 'package:schoolzap/shared/widgets/custom_text_field.dart';

class CreateEditAssignmentScreen extends StatefulWidget {
  const CreateEditAssignmentScreen({super.key});

  @override
  State<CreateEditAssignmentScreen> createState() => _CreateEditAssignmentScreenState();
}

class _CreateEditAssignmentScreenState extends State<CreateEditAssignmentScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _dueDate;
  TimeOfDay? _dueTime;
  bool _allowLateSubmissions = false;
  List<String> _attachedFiles = [];
  bool _isLoading = false;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // TODO: Check if we're editing an existing assignment and load data
    // For now, we'll assume we're creating a new assignment
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _saveAssignment() async {
    // Form validation
    if (_titleController.text.isEmpty || _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields')),
      );
      return;
    }

    if (_dueDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a due date')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // TODO: Save assignment to repository
      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Assignment saved successfully')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving assignment: ${e.toString()}')),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _selectDueDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _dueDate = picked;
      });
    }
  }

  Future<void> _selectDueTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _dueTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _dueTime = picked;
      });
    }
  }

  void _addFile() {
    // TODO: Implement file picker
    setState(() {
      _attachedFiles.add('document_${_attachedFiles.length + 1}.pdf');
    });
  }

  void _removeFile(int index) {
    setState(() {
      _attachedFiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Assignment' : 'Create Assignment'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: _titleController,
              labelText: 'Assignment Title',
              prefixIcon: Icons.title,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _descriptionController,
              labelText: 'Description',
              prefixIcon: Icons.description,
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            const Text(
              'Due Date & Time',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                CustomButton(
                  onPressed: _selectDueDate,
                  text: _dueDate == null
                      ? 'Select Date'
                      : '${_dueDate!.day}/${_dueDate!.month}/${_dueDate!.year}',
                  color: Colors.grey,
                ),
                const SizedBox(width: 16),
                CustomButton(
                  onPressed: _selectDueTime,
                  text: _dueTime == null
                      ? 'Select Time'
                      : '${_dueTime!.hour}:${_dueTime!.minute.toString().padLeft(2, '0')}',
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _allowLateSubmissions,
                  onChanged: (value) {
                    setState(() {
                      _allowLateSubmissions = value!;
                    });
                  },
                ),
                const Text('Allow late submissions'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Attached Files',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            if (_attachedFiles.isEmpty)
              const Text('No files attached')
            else
              ListView.builder(
                shrinkWrap: true,
                itemCount: _attachedFiles.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_attachedFiles[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _removeFile(index),
                    ),
                  );
                },
              ),
            const SizedBox(height: 16),
            CustomButton(
              onPressed: _addFile,
              text: 'Attach File',
              icon: Icons.attach_file,
              color: Colors.grey,
            ),
            const SizedBox(height: 30),
            CustomButton(
              onPressed: _isLoading ? () {} : _saveAssignment,
              text: _isEditing ? 'Update Assignment' : 'Create Assignment',
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
