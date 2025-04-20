import 'package:flutter/material.dart';
import 'package:mytry/services/chat_web_service.dart';
import 'package:mytry/widgets/search_section.dart';
import 'package:mytry/widgets/sidebar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    ChatWebService().connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(),

          SearchSection()
        ],
      )
    );
  }
}