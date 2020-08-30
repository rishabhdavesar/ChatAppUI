import 'package:chatapp/helper/theme.dart';

import 'package:chatapp/views/chat.dart';

import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

String chatName = '';

Map<String, String> names = {
  '02m': 'Rishabh',
  '10m': 'Shobhit',
  '12m': 'Ankit',
  '08m': 'Kartik',
  '11m': 'Parth',
  '13m': 'Siddhart',
  '26m': 'Arastoo',
  '27m': 'Kshitij',
  '28m': 'Yash',
  '31m': 'Vedant',
  '34m': 'Aman',
  '45m': 'Aryan',
  '06w': 'Raghvi',
};
List images = [
  'https://www.freepnglogos.com/uploads/youtube-logo-hd-8.png',
  'https://www.freepnglogos.com/uploads/youtube-logo-hd-8.png',
  'https://www.freepnglogos.com/uploads/youtube-logo-hd-8.png'
];

class _ChatRoomState extends State<ChatRoom> {
  int selected = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(chatName);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustomTheme.darkBlack,
      body: Row(
        children: [
          Container(
            color: Color(0xff9872cb),
            height: h,
            width: w / 23,
            child: ListView(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color: CustomTheme.lightBlue,
                        image: DecorationImage(
                            image: AssetImage(
                          'assets/images/12m.jpg',
                        )),
                        borderRadius: BorderRadius.circular(20)),
                    //  child:
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.home_outlined,
                        color: Colors.white.withOpacity(0.6))),
                SizedBox(
                  height: 6,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.call_made_outlined,
                        color: Colors.white.withOpacity(0.6))),
                SizedBox(
                  height: 6,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.call_outlined,
                        color: Colors.white.withOpacity(0.6))),
                SizedBox(
                  height: 8,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.message_outlined,
                        color: Colors.white.withOpacity(0.6))),
                SizedBox(
                  height: 8,
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.settings_outlined,
                        color: Colors.white.withOpacity(0.6)))
              ],
            ),
          ),
          Container(
            color: CustomTheme.lightBlack,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CustomTheme.darkBlack),
                  width: w / 6,
                  height: 40,
                  padding: EdgeInsets.only(left: 15, top: 15),
                  child: Center(
                    child: TextField(
                      style: TextStyle(
                          fontSize: 14, color: Colors.white.withOpacity(0.6)),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,

                        hintText: 'Search',
                        hintStyle: TextStyle(
                            fontSize: 14, color: Colors.white.withOpacity(0.6)),
                        //   icon: Container(
                        //  margin: EdgeInsets.only(left: 10),
                        //     child: Icon(Icons.search,color: Colors.white.withOpacity(0.6)))
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: w / 6,
                  height: 50,
                  margin: EdgeInsets.only(
                      left: w / 30, right: w / 30, top: 10, bottom: 10),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: new LinearGradient(
                        colors: [
                          CustomTheme.lBlue,
                          CustomTheme.dBlue,
                        ],
                        begin: const FractionalOffset(1.1, 0.1),
                        end: const FractionalOffset(1.0, .5),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: Center(
                      child: Text(
                    "Start new chat",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: h / 1.6, //change h
                  color: CustomTheme.lightBlack,
                  width: w / 5,
                  child: chatRoomsList(),
                ),
                Container(
                  width: w / 10,
                  height: 60,
                  margin: EdgeInsets.only(
                      left: w / 30, right: w / 30, top: 10, bottom: 10),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xfffef000),
                  ),
                  child: Center(child: Icon(Icons.lock_outline)),
                ),
              ],
            ),
          ),
          Expanded(
              child: Chat(
            chatRoomId: 'id',
            chatUsername: chatName,
          ))
        ],
      ),
    );
  }

  Widget chatRoomsList() {
    return ListView.builder(
        itemCount: names.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return chatRoomTile(
              names.values.elementAt(index),
              names.keys.elementAt(index),
              selected != index
                  ? CustomTheme.lightBlack
                  : CustomTheme.darkBlack,
              index);
        });
  }

  chatRoomTile(String userName, String userDp, Color color, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          chatName = userName;
          selected = index;
        });
      },
      child: Container(
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: CustomTheme.lightBlue,
                    borderRadius: BorderRadius.circular(30)),
                child: Image.asset('assets/images/${userDp}.jpg'),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userName,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: '',
                        fontWeight: FontWeight.w300)),
                Text(
                    chats[userName] == null
                        ? ""
                        : chats[userName].messages.last['text'],
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 13,
                        fontFamily: '',
                        fontWeight: FontWeight.w300))
              ],
            )
          ],
        ),
      ),
    );
  }
}
