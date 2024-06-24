import 'package:akademik/services/subject_service.dart';
import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  String? _subjects;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchSubjects();
  }

  Future<void> _fetchSubjects() async {
    final subjects = await SubjectService.fetchSubjects();
    setState(() {
      _subjects = subjects as String?;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pelajaran'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.deepOrangeAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: _isLoading
              ? const CircularProgressIndicator()
              : _subjects != null
                  ? SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        _subjects!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : const Text(
                      'Failed to load subjects',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
        ),
      ),
    );
  }
}