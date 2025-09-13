import 'package:flutter/material.dart';
import 'package:schoolzap/shared/widgets/custom_button.dart';
import 'package:schoolzap/shared/widgets/custom_text_field.dart';

class SubmissionScreen extends StatefulWidget {
  const SubmissionScreen({super.key});

  @override
  State<SubmissionScreen> createState() => _SubmissionScreenState();
}

class _SubmissionScreenState extends State<SubmissionScreen> {
  final _answerController = TextEditingController();
  List<String> _attachedFiles = [];
  bool _isLoading = false;

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  Future<void> _submitAssignment() async {
    // Form validation
    if (_answerController.text.isEmpty && _attachedFiles.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please provide an answer or attach files')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // TODO: Submit assignment to repository
      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Assignment submitted successfully')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error submitting assignment: ${e.toString()}')),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
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
        title: const Text('Submit Assignment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Assignment info
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Algebra Problem Set',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Mathematics - Grade 9A',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Due: Jun 15, 11:59 PM',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Answer section
            const Text(
              'Your Answer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _answerController,
              labelText: 'Write your answer here...',
              maxLines: 6,
            ),
            const SizedBox(height: 20),
            // Attached files
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
            const Spacer(),
            CustomButton(
              onPressed: _isLoading ? () {} : _submitAssignment,
              text: 'Submit Assignment',
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
