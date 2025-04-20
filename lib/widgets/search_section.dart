import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytry/pages/chatpage.dart';
import 'package:mytry/services/chat_web_service.dart';
import 'package:mytry/theme/colors.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final queryController = TextEditingController();
  String fullResponse = "";

  @override
  void dispose() {
    queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color.fromARGB(184, 0, 150, 135),
        height: double.infinity,
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "  Now or Never ",
              style: GoogleFonts.ibmPlexMono(
                fontSize: 40,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 32),
            Container(
              width: 700,
              decoration: BoxDecoration(
                color: AppColors.searchBar,
                border: Border.all(color: AppColors.footerGrey),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: queryController,
                      decoration: InputDecoration(
                        hintText: "  Search Anything",
                        hintStyle: TextStyle(color: AppColors.textGrey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.auto_awesome,
                            color: AppColors.iconGrey,
                            size: 20,
                          ),
                          Text(
                            "  Focus",
                            style: TextStyle(color: AppColors.textGrey),
                          ),
                          SizedBox(width: 12),
                          Icon(
                            Icons.add_circle_outline,
                            color: AppColors.iconGrey,
                            size: 20,
                          ),
                          Text(
                            "  Attach",
                            style: TextStyle(color: AppColors.textGrey),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () { 
                              ChatWebService().chat(queryController.text.trim());
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => ChatPage(question: queryController.text.trim())));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.submitButton,
                              foregroundColor: AppColors.whiteColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Go"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: StreamBuilder(
                stream: ChatWebService().contentStream,
                builder: (context, snapshot) {
              
                  if (snapshot.hasData) {
                    fullResponse += snapshot.data?['data'] ?? '';
                  }
              
                  return Text(fullResponse);
                
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}