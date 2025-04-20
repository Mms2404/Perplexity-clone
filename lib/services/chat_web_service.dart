import 'dart:async';
import 'dart:convert';

import 'package:web_socket_client/web_socket_client.dart';

class ChatWebService {

  //managing insatnce only within the class 
  static final _instance = ChatWebService.__internal();
  WebSocket? _socket;

  //same instance is returned rather than creating a new object
  factory ChatWebService() => _instance;

  // we need one instance of the class ...so that data is not lost/new page is opened when we search again
  // the constructor is privatized
  ChatWebService.__internal();   
  final _searchResultController = StreamController<Map<String , dynamic>>.broadcast();
  final _contentController = StreamController<Map<String , dynamic>>.broadcast(); 
  final _imageController = StreamController<List<String>>.broadcast();

  Stream<Map<String , dynamic>> get searchResultStream =>
      _searchResultController.stream;

  Stream<Map<String , dynamic>> get contentStream =>
      _contentController.stream;

   Stream<List<String>> get imageStream => _imageController.stream;

  // connect and start listening to websocket 
  void connect(){
    _socket = WebSocket(Uri.parse("ws://localhost:8000/websocket/chat"));

    _socket!.messages.listen((message){
      final data = json.decode(message); 
      if(data['type']=='search_results'){
        _searchResultController.add(data);
      }
      else if (data['type']=='content'){
        _contentController.add(data);
      }
      else if (data['type']=="images"){
        final List<String> imageUrls = List<String>.from(data['data']);
        _imageController.add(imageUrls);
      }
    });
  }

  void chat(String query){
    print(query);
    print(_socket);
    _socket!.send(json.encode({'query':query}));
  }
}
