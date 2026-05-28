import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<String> _tasks = [];
  final _taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _tasks.addAll(prefs.getStringList('todo_tasks') ?? []);
    });
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todo_tasks', _tasks);
  }

  void _addTask() {
    final text = _taskController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _tasks.add(text);
        _taskController.clear();
      });
      _saveTasks();
    }
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
    _saveTasks();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 600;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'To-Do Task Board',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: isDesktop ? 550 : double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: const Color(0xFF334155),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(51),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create New Task',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _taskController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'What needs to be done?',
                        hintStyle: const TextStyle(color: Color(0xFF64748B)),
                        filled: true,
                        fillColor: const Color(0xFF0F172A),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(color: Color(0xFF475569)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(color: Color(0xFF334155)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(color: Color(0xFF6366F1), width: 1.5),
                        ),
                      ),
                      onFieldSubmitted: (_) => _addTask(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6366F1),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6366F1).withAlpha(51),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add_rounded, color: Colors.white),
                      onPressed: _addTask,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Active Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6366F1).withAlpha(38),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${_tasks.length} remaining',
                      style: const TextStyle(
                        color: Color(0xFF818CF8),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _tasks.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.checklist_rounded,
                              color: const Color(0xFF64748B).withAlpha(127),
                              size: 64,
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'All caught up!',
                              style: TextStyle(
                                color: Color(0xFF64748B),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Add some tasks to get started.',
                              style: TextStyle(
                                color: Color(0xFF475569),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: _tasks.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0F172A),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFF334155),
                                width: 1.0,
                              ),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                              leading: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF6366F1).withAlpha(25),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.radio_button_unchecked_rounded,
                                  color: Color(0xFF818CF8),
                                  size: 18,
                                ),
                              ),
                              title: Text(
                                _tasks[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete_outline_rounded,
                                  color: Color(0xFFEF4444),
                                  size: 20,
                                ),
                                onPressed: () => _deleteTask(index),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
