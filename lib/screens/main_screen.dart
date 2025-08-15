import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_app/l10n/app_localizations.dart';
import 'package:solar_app/logic/home_provider.dart';
import 'package:solar_app/routing/app_routes.dart';
import 'package:solar_app/screens/home_screen.dart';
import 'package:solar_app/screens/settings_screen.dart';
import 'package:solar_app/utils/navigation_extention.dart';
import 'package:solar_app/widgets/dialogs/show_not_connected_dialog.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> screens = [HomeScreen(), SettingsScreen()];
  void _onNavigationBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var result = context.read<HomeProvider>().result;
          if(result == ApiResult.failer) { 
            showNotConnectedDialog(context);
          }
          else { 
          context.pushNamed(AppRoutes.addLoad);
          }
        },
        backgroundColor: Colors.blue,
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          0.6,
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: AppLocalizations.of(context)!.home,
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: AppLocalizations.of(context)!.settings,
            activeIcon: Icon(Icons.settings),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onNavigationBarItemTapped,
      ),
    );
  }
}
