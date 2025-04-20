import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mytry/widgets/answer_section.dart';
import 'package:mytry/widgets/sidebar.dart';
import 'package:mytry/widgets/sources_section.dart';
import 'package:mytry/services/chat_web_service.dart';

class ChatPage extends StatefulWidget {
  final String question;
  const ChatPage({
    super.key,
    required this.question,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<String> _images = [];

  @override
  void initState() {
    super.initState();
    ChatWebService().imageStream.listen((imageUrls) {
      setState(() {
        _images = imageUrls;
      });
    });
  }

  Widget imageWidget(String url) {
  if (url.endsWith(".svg")) {
    return SvgPicture.network(
      url,
      width: 250,
      placeholderBuilder: (context) =>
          const SizedBox(height: 200, child: Center(child: CircularProgressIndicator())),
    );
  } else {
    return Image.network(
      url,
      width: 250,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const SizedBox(height: 200, child: Center(child: CircularProgressIndicator()));
      },
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error);
      },
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          kIsWeb ? Sidebar() : const SizedBox(),
          kIsWeb ? const SizedBox(width: 100) : const SizedBox(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.question,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const SourcesSection(),
                    const SizedBox(height: 24),
                    const AnswerSection(),
                  ],
                ),
              ),
            ),
          ),

          // image section 
          kIsWeb
              ? SizedBox(
                  width: 300,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: _images.map((url) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: imageWidget(url),
                          ),
                        );
                      }).toList(),

                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
