// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';


// class AppDrawer extends StatelessWidget {
//   const AppDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           const DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//             ),
//             child: Text(
//               'Menu',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.home),
//             title: const Text('Home'),
//             onTap: () => GoRouter.of(context).go('/'),
//           ),
//           ListTile(
//             leading: const Icon(Icons.book),
//             title: const Text('Scenarios'),
//             onTap: () => GoRouter.of(context).go('/scenario'),
//           ),
//           ListTile(
//             leading: const Icon(Icons.person),
//             title: const Text('Profile'),
//             onTap: () => GoRouter.of(context).go('/profile'),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildDrawerHeader(context),
          ..._buildDrawerItems(context),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 40, color: Colors.blue),
          ),
          const SizedBox(height: 10),
          const Text(
            'John Doe',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Ethical Thinker Level: Advanced',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDrawerItems(BuildContext context) {
    final drawerItems = [
      {'icon': Icons.home, 'title': 'Home', 'route': '/'},
      {'icon': Icons.book, 'title': 'Scenarios', 'route': '/scenario'},
      {'icon': Icons.person, 'title': 'Profile', 'route': '/profile'},
      {'icon': Icons.settings, 'title': 'Settings', 'route': '/settings'},
    ];
    return drawerItems.map((item) {
      return _buildDrawerItem(
        context,
        icon: item['icon'] as IconData,
        title: item['title'] as String,
        route: item['route'] as String,
      );
    }).toList();
  }

  Widget _buildDrawerItem(BuildContext context, {required IconData icon, required String title, required String route}) {
    final isActive = GoRouterState.of(context).matchedLocation == route;
    return ListTile(
      leading: Icon(icon, color: isActive ? Theme.of(context).primaryColor : null),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? Theme.of(context).primaryColor : null,
        ),
      ),
      onTap: () {
        context.go(route);
        Navigator.pop(context); // Close the drawer
      },
      tileColor: isActive ? Theme.of(context).primaryColor.withOpacity(0.1) : null,
    );
  }
}