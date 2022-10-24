import 'package:flutter/material.dart';

void main() {
  runApp(const LayoutTrainingApp());
}

class LayoutTrainingApp extends StatelessWidget {
  const LayoutTrainingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LayoutTrainingMainScreen(),
    );
  }
}

class LayoutTrainingMainScreen extends StatelessWidget {
  const LayoutTrainingMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Layout Training')),
      body: ChatCell(
        model: ChatCellModel(
          'IT Step Flutter Course',
          lastMessage:
              'Як мене пофіксати щоб це не було по центру. О тепер все працює норм і я задоволентй! Але чи весь текст вміститься?',
          lastMessageSendDate: '12:38',
          countMessages: '10',
          isMuted: true,
          isPremium: true,
          isVerified: true
        ),
      ),
    );
  }
}

class ChatCellModel {
  final String name;
  final String? imageUrl;
  final String? lastMessage;
  final String? lastMessageSendDate;
  final String? countMessages;
  final bool isMuted;
  final bool isPremium;
  final bool isVerified;

  ChatCellModel(
    this.name, {
    this.imageUrl,
    required this.lastMessage,
    required this.lastMessageSendDate,
    this.countMessages,
    this.isMuted = false,
    this.isPremium = false,
    this.isVerified = false,
  });
}

class ChatCell extends StatelessWidget {
  const ChatCell({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ChatCellModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade800,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(radius: 30.0),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                model.name,
                                maxLines: 1,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            if (model.isPremium)
                              const Icon(Icons.star,
                                color: Colors.yellow,
                              ),
                            if (model.isMuted)
                              const Icon(
                                Icons.volume_mute,
                                color: Colors.grey,
                              ),
                            if (model.isVerified)
                              const Icon(
                                Icons.verified,
                                color: Colors.blue,
                              )
                          ],
                        ),
                      ),
                      if (model.lastMessageSendDate != null)
                        Text(
                          model.lastMessageSendDate!,
                          style: const TextStyle(color: Colors.grey),
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          model.lastMessage ?? 'No messages yet',
                          style: const TextStyle(color: Colors.grey),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: Colors.grey
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Text(model.countMessages ?? '0',
                            style: const TextStyle(
                              color: Colors.black
                            ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
