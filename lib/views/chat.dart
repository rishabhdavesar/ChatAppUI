import 'package:chatapp/helper/theme.dart';

import 'package:chatapp/widget/widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Map<String, UserInfo> chats = {
  'Rishabh': UserInfo(messages: [
    {'sentByMe': 'false', 'text': 'Hey, how are you?'},
    {'sentByMe': 'true', 'text': 'Good !'},
    {'sentByMe': 'true', 'text': 'What about you ?'},
    {'sentByMe': 'false', 'text': 'I am also good'},
    {'sentByMe': ' true', 'text': 'Okay , how is your work going on'},
    {'sentByMe': 'true', 'text': 'It is going great'},
    {'sentByMe': ' true', 'text': 'Where were you working ?'},
    {'sentByMe': 'true', 'text': 'At Zoomentum '},
  ], dp: 'https://cdn.sharechat.com/cccbcdd8-38e6-45f5-ad88-dcf7c5dc2b38-d8e1f3f0-8489-417e-898b-219d8a6eede0.jpeg'),
  'Ankit': UserInfo(messages: [
    {'sentByMe': 'true', 'text': 'Hello'},
    {'sentByMe': 'true', 'text': '?'},
    {'sentByMe': 'false', 'text': 'Yes'},
    {'sentByMe': 'false', 'text': 'How are you ?'}
  ], dp: 'https://images.pexels.com/photos/1315741/pexels-photo-1315741.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
  'Shobhit': UserInfo(messages: [
    {'sentByMe': 'true', 'text': 'yo!'},
    {'sentByMe': 'true', 'text': 'wassup?'},
    {'sentByMe': 'false', 'text': 'hi'},
    {'sentByMe': 'false', 'text': 'nothing much!'}
  ], dp: 'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/01/326507_2200-732x549.jpg'),
   'Kartik': UserInfo(messages: [
    {'sentByMe': 'true', 'text': 'yo!'},
    {'sentByMe': 'true', 'text': 'wassup?'},
    {'sentByMe': 'false', 'text': 'hi'},
    {'sentByMe': 'false', 'text': 'The work is done '}
  ], dp: 'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/01/326507_2200-732x549.jpg'),
   'Parth': UserInfo(messages: [
    {'sentByMe': 'true', 'text': 'yo!'},
    {'sentByMe': 'true', 'text': 'wassup?'},
    {'sentByMe': 'false', 'text': 'hi'},
    {'sentByMe': 'false', 'text': 'right'}
  ], dp: 'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/01/326507_2200-732x549.jpg'),
   'Siddhart': UserInfo(messages: [
    {'sentByMe': 'true', 'text': 'yo!'},
    {'sentByMe': 'true', 'text': 'wassup?'},
    {'sentByMe': 'false', 'text': 'hi'},
    {'sentByMe': 'false', 'text': 'Hey'}
  ], dp: 'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/01/326507_2200-732x549.jpg'),
};

class UserInfo {
  final List<Map<String, String>> messages;
  final String dp;

  UserInfo({this.messages, this.dp});

  addMessage(String val) {
    messages.add({'sentByMe': 'true', 'text': val});
  }
}

class Chat extends StatefulWidget {
  final String chatRoomId;
  final String chatUsername;
  Chat({this.chatRoomId, this.chatUsername});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController messageEditingController = new TextEditingController();

  Widget chatMessages() {
    double h = MediaQuery.of(context).size.height;

    return Container(
      color: CustomTheme.darkBlack,
      height: h / 1.2,
      child: ListView.builder(
          reverse: true,
          //  controller:_scrollController ,
          itemCount: chats[widget.chatUsername] == null
              ? 0
              : chats[widget.chatUsername].messages.length,
          itemBuilder: (context, index) {
            return MessageTile(
              name: widget.chatUsername,
              message: chats[widget.chatUsername].messages[
                      chats[widget.chatUsername].messages.length - 1 - index]
                  ['text'],
              sendByMe: chats[widget.chatUsername].messages[
                          chats[widget.chatUsername].messages.length -
                              1 -
                              index]['sentByMe'] ==
                      'true'
                  ? true
                  : false,
            );
          }),
    );
  }

  addMessage() {
    if (messageEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "sendBy": 9000,
        "message": messageEditingController.text,
        'time': DateTime.now().millisecondsSinceEpoch,
      };

      //chat[selecteduser].addMessage();

      setState(() {
        messageEditingController.text = "";
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  onTextFieldKey(RawKeyEvent event) {
    if (event is RawKeyUpEvent) {
      if (event.logicalKey == LogicalKeyboardKey.enter) {
        submit();
      } else if (event.data is RawKeyEventDataWeb) {
        final data = event.data as RawKeyEventDataWeb;
        if (data.keyLabel == 'Enter') submit();
      } else if (event.data is RawKeyEventDataAndroid) {
        final data = event.data as RawKeyEventDataAndroid;
        if (data.keyCode == 13) submit();
      }
    }
  }

  submit() {
    addMessage();
    // have fun
  }

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return widget.chatUsername == null
        ? Container()
        : Scaffold(
            backgroundColor: CustomTheme.darkBlack,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(h / 15),
              child: Container(
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  centerTitle: false,
                  title: Row(
                    children: [
                      Text(widget.chatUsername),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffff3b15),
                          ),
                          child: Icon(Icons.video_call_outlined, size: 20)),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff654df9),
                          ),
                          child: Icon(
                            Icons.call_outlined,
                            size: 18,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            body: Container(
              color: CustomTheme.darkBlack,
              child: Stack(
                children: [
                  chatMessages(),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(left: 45, right: 45, bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      height: h / 15,
                      padding: EdgeInsets.only(left: 25, right: 25),
                      decoration: BoxDecoration(
                          color: CustomTheme.lightBlack,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Expanded(
                              child: RawKeyboardListener(
                            focusNode: focusNode,
                            onKey: onTextFieldKey,
                            child: TextFormField(
                              onFieldSubmitted: (_textController) {
                                addMessage();
                                chats[widget.chatUsername]
                                    .addMessage(_textController);

                                setState(() {});
                              },
                              textInputAction: TextInputAction.go,
                              controller: messageEditingController,
                              style: simpleTextStyle(),
                              decoration: InputDecoration(
                                  hintText: "Type Something ...",
                                  hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 16,
                                  ),
                                  border: InputBorder.none),
                            ),
                          )),
                          SizedBox(
                            width: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              addMessage();
                            },
                            child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          const Color(0x36FFFFFF),
                                          const Color(0x0FFFFFFF)
                                        ],
                                        begin: FractionalOffset.topLeft,
                                        end: FractionalOffset.bottomRight),
                                    borderRadius: BorderRadius.circular(40)),
                                padding: EdgeInsets.all(12),
                                child: Image.asset(
                                  "assets/images/send.png",
                                  height: 25,
                                  width: 25,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final bool sendByMe;
  final String name;

  MessageTile({@required this.message, @required this.sendByMe, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 8, bottom: 8, left: sendByMe ? 0 : 24, right: sendByMe ? 24 : 0),
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin:
            sendByMe ? EdgeInsets.only(left: 30) : EdgeInsets.only(right: 30),
        padding: EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: sendByMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))
                : BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
            gradient: LinearGradient(
              begin: const FractionalOffset(0.5, 1.1),
              end: const FractionalOffset(1.0, 10.1),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
              colors: sendByMe
                  ? [const Color(0xFF8988e9), const Color(0xFF664ff7)]
                  : [
                      const Color(0xFF664ff7),
                      const Color(0xFF8988e9),
                    ],
            )),
        child: Text(message,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'OverpassRegular',
                fontWeight: FontWeight.w300)),
      ),
    );
  }
}
