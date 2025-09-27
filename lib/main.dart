import 'package:flutter/material.dart';
import 'advanced_animation_chain/animation.dart';
import 'interactive_dismissible_lists/dismissible.dart';
import 'interactive_physics_widget/interactive.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Exploration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CategoriesPage(),
    );
  }
}

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  final List<String> categories = const [
    'Interactive Dismissible Lists',
    'Interactive Physics Widget',
    'Advanced Animation Chain',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Challenges')),
      body: ListView.separated(
        itemCount: categories.length,
        separatorBuilder: (_, __) => const Divider(height: 5),
        itemBuilder: (context, index) {
          final category = categories[index];
          return ListTile(
            title: Text(category,style: TextStyle(fontWeight: FontWeight.bold),),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Widget page;
              switch (category) {
                case 'Advanced Animation Chain':
                  page = const AnimationChain();
                  break;
                case 'Interactive Physics Widget':
                  page = const PhysicsGame();
                  break;
                case 'Interactive Dismissible Lists':
                  page = const TaskManagement();
                  break;
                default:
                  page = Scaffold(
                    appBar: AppBar(title: Text(category)),
                    body: const Center(child: Text('Page not implemented')),
                  );
              }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => page),
              );
            },

          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}

