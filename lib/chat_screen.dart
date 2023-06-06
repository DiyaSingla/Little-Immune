import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:little_immune/dashboard.dart';

class ChatBotScreen extends StatefulWidget {
  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final List<Message> _messages = [];

  final TextEditingController _textEditingController = TextEditingController();

  void initState() {
    super.initState();
    _messages.add(
        Message(text: "I am BoostBot! How may I assist you?", isMe: false));
  }

  void onSendMessage() async {
    Message message = Message(text: _textEditingController.text, isMe: true);

    if (message.text.isEmpty) return;

    _textEditingController.clear();

    setState(() {
      _messages.insert(0, message);
    });

    try {
      String response = await sendMessageToBot(message.text);

      Message chatGpt = Message(text: response, isMe: false);

      setState(() {
        _messages.insert(0, chatGpt);
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<String> sendMessageToBot(String message) async {
    String apiUrl = 'http://127.0.0.1:5000/api?input=$message';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> parsedResponse = json.decode(response.body);
      String reply = parsedResponse['response'];

      return reply;
    } else {
      throw Exception('Failed to send message to the chat bot.');
    }
  }

  Widget _buildMessage(Message message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment:
              message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              message.isMe ? 'You' : 'Bot',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: BoxDecoration(
                color: message.isMe
                    ? const Color.fromARGB(255, 166, 228, 243)
                    : Colors.pink[100],
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                message.text,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('BoostBot'),
          leading: IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Dashboard(
                            email: "diya@abc.com",
                          ))),
              // Navigate to about screen

              icon: const Icon(Icons.arrow_back))),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      hintText: 'Type a message...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: onSendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}

// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ChatBotScreen extends StatefulWidget {
//   @override
//   _ChatBotScreenState createState() => _ChatBotScreenState();
// }

// class _ChatBotScreenState extends State<ChatBotScreen> {
//   final List<Message> _messages = [];

//   final TextEditingController _textEditingController = TextEditingController();

//   void onSendMessage() async {
//     Message message = Message(text: _textEditingController.text, isMe: true);

//     if (message.text.isEmpty) return;

//     _textEditingController.clear();

//     setState(() {
//       _messages.insert(0, message);
//     });

//     //getResponse(message.text);
//     String response = await getResponse(message.text);
//     Message bot = Message(text: response, isMe: false);

//     setState(() {
//       _messages.insert(0, bot);
//     });
//   }

//   Future<String> getResponse(String message) async {
//     String apiUrl = 'http://127.0.0.1:5000/api?input=$message';
//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       final jsonResponse = json.decode(response.body);
//       return jsonResponse['response'];
//     } else {
//       throw Exception('Failed to load response');
//     }
//   }

//   Widget _buildMessage(Message message) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//           child: Column(
//             crossAxisAlignment: message.isMe
//                 ? CrossAxisAlignment.end
//                 : CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 message.isMe ? 'You' : 'Bot',
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Text(message.text),
//             ],
//           )),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('ChatBot'),
//         ),
//         body: Column(
//           children: <Widget>[
//             Expanded(
//               child: ListView.builder(
//                   reverse: true,
//                   itemCount: _messages.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return _buildMessage(_messages[index]);
//                   }),
//             ),
//             const Divider(
//               height: 1.0,
//             ),
//             Container(
//               decoration: BoxDecoration(color: Theme.of(context).cardColor),
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: TextField(
//                       controller: _textEditingController,
//                       decoration: const InputDecoration(
//                         contentPadding: EdgeInsets.all(10.0),
//                         hintText: 'Type a Message...',
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: onSendMessage,
//                     icon: const Icon(Icons.send),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ));
//   }
// }

// class Message {
//   final String text;
//   final bool isMe;

//   Message({required this.text, required this.isMe});
// }
