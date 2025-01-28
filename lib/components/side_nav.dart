import 'package:alzpal/screens/carepal_screen.dart';
import 'package:alzpal/screens/chatpal_screen.dart';
import 'package:alzpal/screens/memory_game_screen.dart';
import 'package:alzpal/screens/monitor_screen.dart';
import 'package:alzpal/screens/songs_screen.dart';
import 'package:alzpal/utils/contants.dart';
import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  // final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 341,
            height: 250,
            decoration: const BoxDecoration(color: primaryColor),
            child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 109,
                    height: 109,
                    child: CircleAvatar(
                      backgroundColor: opaquePrimaryColor,
                      child: Icon(
                        Icons.person,
                        size: 70,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 143,
                    height: 26.60,
                    child: Text(
                      "John",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ]),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.medical_services),
            title: const Text("CarePal"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CarePalScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Monitor"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MonitorScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.memory),
            title: const Text('Memory Games'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MemoryGameScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.music_note),
            title: const Text('Songs'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SongsScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text("ChatPal"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatPalScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => PaymentPage()));
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.arrow_back),
            title: const Text("Log Out"),
            onTap: () async {
              // FirebaseAuth.instance.signOut();
              // Navigator.of(context).popUntil((route) => route.isFirst);
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => const LogIn()),
              // );
            },
          ),
        ],
      ),
    ));
  }
}
