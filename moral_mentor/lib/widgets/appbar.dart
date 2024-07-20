// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const ResponsiveAppBar({super.key});

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth > 600) {
//           // Desktop view
//           return AppBar(
//             title: const Text('MoralMentor'),
//             backgroundColor: Colors.blue,
//             actions: [
//               TextButton(
//                 onPressed: () => GoRouter.of(context).go('/'),
//                 child: const Text('Home', style: TextStyle(color: Colors.white)),
//               ),
//               TextButton(
//                 onPressed: () => GoRouter.of(context).go('/scenario'),
//                 child: const Text('Scenarios', style: TextStyle(color: Colors.white)),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.person),
//                 onPressed: () => GoRouter.of(context).go('/profile'),
//               ),
//             ],
//           );
//         } else {
//           // Mobile view
//           return AppBar(
//             title: const Text('MoralMentor'),
//             centerTitle: true,
//             backgroundColor: Colors.blue,
//             actions: [
//               Builder(
//                 builder: (context) => IconButton(
//                   icon: const Icon(Icons.menu),
//                   onPressed: () {
//                     Scaffold.of(context).openEndDrawer();
//                   },
//                 ),
//               ),
//             ],
//           );
//         }
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ResponsiveAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AppBar(
          title: const Text('MoralMentor'),
          centerTitle: constraints.maxWidth <= 600,
          backgroundColor: Colors.blue,
          elevation: 4,
          actions: constraints.maxWidth > 600
              ? _buildDesktopActions(context)
              : _buildMobileActions(context),
        );
      },
    );
  }

  List<Widget> _buildDesktopActions(BuildContext context) {
    return [
      _buildNavButton(context, 'Home', '/'),
      _buildNavButton(context, 'Scenarios', '/scenario'),
      IconButton(
        icon: const Icon(Icons.person),
        onPressed: () => GoRouter.of(context).go('/profile'),
        tooltip: 'Profile',
      ),
    ];
  }

  List<Widget> _buildMobileActions(BuildContext context) {
    return [
      Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          tooltip: 'Menu',
        ),
      ),
    ];
  }

  Widget _buildNavButton(BuildContext context, String label, String route) {
    return TextButton(
      onPressed: () => GoRouter.of(context).go(route),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}