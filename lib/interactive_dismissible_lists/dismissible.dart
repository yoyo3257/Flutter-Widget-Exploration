import 'package:flutter/material.dart';

class TaskManagement extends StatefulWidget {
  const TaskManagement({super.key});

  @override
  State<TaskManagement> createState() => _TaskManagementState();
}

class _TaskManagementState extends State<TaskManagement> {
  final List<String> _items = [
    'Complete The UI challenge',
    'Complete the 3 Widget tasks',
    'Complete The assignments',
    'Solve problem in leetCode',
  ];

  // Track completed tasks
  final Set<int> _completedTasks = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Management'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ReorderableListView(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              children: <Widget>[
                for (int index = 0; index < _items.length; index++)
                  Dismissible(
                    key: ValueKey(_items[index]),
                    direction: DismissDirection.endToStart,
                    background: Container(color: Colors.red),
                    confirmDismiss: (direction) async {
                      return await showDialog<bool>(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: const Text("Confirm Delete"),
                              content: Text(
                                "Are you sure you want to delete '${_items[index]}'?",
                              ),
                              actions: [
                                TextButton(
                                  onPressed:
                                      () => Navigator.of(context).pop(false),
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed:
                                      () => Navigator.of(context).pop(true),
                                  child: const Text("Delete"),
                                ),
                              ],
                            ),
                      );
                    },
                    onDismissed: (direction) {
                      final removedItem = _items[index];
                      setState(() {
                        _items.removeAt(index);
                        _completedTasks.remove(index);
                      });

                      // Show SnackBar with undo
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("'$removedItem' deleted"),
                          action: SnackBarAction(
                            label: "UNDO",
                            onPressed: () {
                              setState(() {
                                _items.insert(index, removedItem);
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.drag_handle),
                        title: Text(
                          _items[index],
                          style: TextStyle(
                            decoration:
                                _completedTasks.contains(index)
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            _completedTasks.contains(index)
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color:
                                _completedTasks.contains(index)
                                    ? Colors.green
                                    : null,
                          ),
                          onPressed: () {
                            setState(() {
                              if (_completedTasks.contains(index)) {
                                _completedTasks.remove(index);
                              } else {
                                _completedTasks.add(index);
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
              ],
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final String item = _items.removeAt(oldIndex);
                  _items.insert(newIndex, item);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
