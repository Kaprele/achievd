import 'package:achievd/screens/profile-screen.dart';
import 'package:achievd/screens/welcome-screen.dart';
import 'package:achievd/widgets/custom-scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String route = '/main-screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  int _selectedIndex = 4; //todo: change standard index to feed?

  var destinations = {
    {'label': 'feed', 'icon': Icons.newspaper},
    {'label': 'search', 'icon': Icons.search},
    {'label': 'home', 'icon': Icons.home},
    {'label': 'friends', 'icon': Icons.people_alt_outlined},
    {'label': 'profile', 'icon': Icons.account_circle},
  };

  @override
  Widget build(BuildContext context) {


    PageController controller = PageController(
      initialPage: _selectedIndex,
    );
    var navDestinations = destinations
        .map((e) => NavigationDestination(
              icon: Icon( e['icon'] as IconData?),
      label: e['label'] as String,
            )
    ).toList();

    // BottomAppBar(
    //     height: 60,
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: iconButtons,
    //     )),

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        destinations: navDestinations,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
            controller.animateToPage(index,
                duration: const Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
      ),
      body: PageView(
        controller: controller,
        children: [
          Container(
            color: Colors.red,),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          ),
          ProfileScreen(),
        ],
      ),
    );
  }
}
