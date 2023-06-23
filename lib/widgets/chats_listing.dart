import 'package:chat_ncst/helpers/firebase_repository.dart';
import 'package:chat_ncst/models/message.dart';
import 'package:chat_ncst/widgets/chat_item_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatsListing extends StatelessWidget {
  const ChatsListing({
    super.key,
    required this.repository,
  });

  final FirebaseRepository repository;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(4),
        ),
        child: StreamBuilder<QuerySnapshot<Message>>(
          stream: repository.getMessages(),
          builder: (context, snapshot) {
            if (snapshot.hasData && !snapshot.hasError) {
              if (snapshot.data!.docs.isNotEmpty) {
                List<Message> messages =
                    snapshot.data!.docs.map((e) => e.data()).toList();

                return ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return (messages[index].senderId ==
                            FirebaseAuth.instance.currentUser?.uid)
                        ? ChatItemTile(
                            fullName: messages[index].senderName!,
                            message: messages[index].message!,
                            createdAt: messages[index].createdAt!,
                          )
                        : ChatItemTile.forReceiver(
                            fullName: messages[index].senderName!,
                            message: messages[index].message!,
                            createdAt: messages[index].createdAt!,
                          );
                  },
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.message,
                        size: 80,
                        color: Colors.white,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Be the first to start the conversation nation builders!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                );
              }
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
