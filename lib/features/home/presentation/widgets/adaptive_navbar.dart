import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;
  final List<NavigationDestination> destinations;
  final List<TabItem<dynamic>> items;
  final Widget body;
  const AdaptiveNavbar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.body,
    this.destinations = const <NavigationDestination>[],
    this.items = const <TabItem<dynamic>>[],
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (kIsWeb) {
          return _buildNavigationRail(context);
        } else {
          return _buildBottomNavigation(context);
        }
      },
    );
  }

  Widget _buildNavigationRail(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            extended: MediaQuery.of(context).size.width > 800,
            minExtendedWidth: 180,
            destinations: destinations.map((destination) {
              return NavigationRailDestination(
                icon: destination.icon,
                selectedIcon: destination.selectedIcon ?? destination.icon,
                
                label: Text(destination.label),
              );
            }).toList(),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: body),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.flip,
        items: items,
        initialActiveIndex: selectedIndex,
        onTap: onDestinationSelected,
        backgroundColor: Theme.of(context).navigationBarTheme.backgroundColor,
        activeColor: Colors.white,
      ),
    );
  }
}
