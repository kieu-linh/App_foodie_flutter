import 'package:flutter/material.dart';
import 'package:foodie_flutter_app/models/chat_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController mesController = TextEditingController();
  ScrollController scollController = ScrollController();
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff191970),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0)
                  .copyWith(top: 12.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/avt.png',
                    height: 44.0,
                    width: 44.0,
                  ),
                  const SizedBox(width: 12.0),
                  const Expanded(
                    child: Text(
                      'Virtusl Coach',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 122.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 7.5, horizontal: 15.0),
                            child: Image.asset(
                              'assets/images/bird.png',
                              width: 43.0,
                              height: 35.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSwitch = !isSwitch;
                              });
                            },
                            child: Container(
                              width: 37.0,
                              height: 23.0,
                              padding: EdgeInsets.all(2.3),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(11.5),
                              ),
                              child: Align(
                                alignment: !isSwitch
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: Container(
                                  width: 18.0,
                                  decoration: BoxDecoration(
                                    color:
                                        isSwitch ? Colors.pink : Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                controller: scollController,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 6.0,
                ),
                itemBuilder: (context, index) {
                  final chat = FakeChats.chats[index];
                  bool isMe = int.parse('${chat.id ?? 0}') % 2 == 0;
                  // bool isMe = chat.isMe
                  return Row(
                    mainAxisAlignment:
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ).copyWith(
                            top: isMe ? 10.0 : 0.0, bottom: isMe ? 10.0 : 0.0),
                        decoration: BoxDecoration(
                          color: isMe
                              ? Colors.grey.withOpacity(0.5)
                              : Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(isMe ? 16.0 : 2.0),
                            topRight: Radius.circular(16.0),
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(
                              isMe ? 2.0 : 16.0,
                            ),
                          ),
                        ),
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.8),
                        child: Text(
                          '${chat.message}',
                        ),
                      ),
                    ],
                  );
                },
                itemCount: FakeChats.chats.length,
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ).copyWith(bottom: 24.0),
          child: TextField(
            controller: mesController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xff383D3F).withOpacity(0.4),
              hintStyle: TextStyle(color: Color(0xffB7B8BA), fontSize: 14.0),
              hintText: 'Lorem ipsum bla blu blo',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    final newChat = ChatModel()
                      ..id = '2'
                      ..message = mesController.text;
                    FakeChats.chats.add(newChat);
                    mesController.clear();
                    scollController.animateTo(
                        scollController.position.maxScrollExtent + 80.0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.decelerate);
                  });
                },
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ));
  }
}
