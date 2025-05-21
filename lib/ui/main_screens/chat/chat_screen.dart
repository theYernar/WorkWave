import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = []; // Список для хранения сообщений

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add(_messageController.text); // Добавляем сообщение в список
        _messageController.clear(); // Очищаем поле ввода
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat'
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // Показываем новые сообщения снизу
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final reversedIndex = _messages.length - 1 - index; // Инвертируем индекс
                return Align(
                  alignment: Alignment.centerRight, // Выравниваем сообщение справа
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.blue[100], // Цвет фона сообщения
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(_messages[reversedIndex]),
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _messageController, // Привязываем контроллер к TextField
                    decoration: InputDecoration(
                      prefixIcon: Icon(HugeIcons.strokeRoundedAttachment),
                      hintText: 'Cпрашивайте что угодно...',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)
                      )
                    ),
                    onSubmitted: (_) => _sendMessage(), // Отправка по нажатию Enter
                  ),
                ),
              ),
              IconButton(
                onPressed: _sendMessage, // Отправка по нажатию кнопки
                icon: Icon(Icons.send, size: 30,)
              ),
            ],
          )
        ],
      )
    );
  }
}