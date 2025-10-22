import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WhatsappChat extends StatelessWidget {
  const WhatsappChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/1_464.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                reverse: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                children: [
                  _buildFileMessageBubble(
                    isSender: true,
                    fileName: 'IMG_0484',
                    fileInfo: '2.6 MB png',
                    time: '11:51',
                    isRead: true,
                  ),
                  _buildFileMessageBubble(
                    isSender: true,
                    fileName: 'IMG_0483',
                    fileInfo: '2.8 MB png',
                    time: '11:51',
                    isRead: true,
                  ),
                  _buildMessageBubble(
                    text: 'I think top two are:',
                    time: '11:50',
                    isSender: true,
                    isRead: true,
                  ),
                  _buildMessageBubble(
                    text: 'Do you like it?',
                    time: '11:45',
                    isSender: false,
                  ),
                  _buildMessageBubble(
                    text: 'What is the most popular meal in Japan?',
                    time: '11:45',
                    isSender: false,
                  ),
                  _buildMessageBubble(
                    text: 'It’s morning in Tokyo 😎',
                    time: '11:43',
                    isSender: true,
                    isRead: true,
                  ),
                  _buildMessageBubble(
                    text: 'Do you know what time is it?',
                    time: '11:40',
                    isSender: false,
                  ),
                  _buildFileMessageBubble(
                    isSender: true,
                    fileName: 'IMG_0481',
                    fileInfo: '2.8 MB png',
                    time: '10:15',
                    isRead: true,
                  ),
                  _buildFileMessageBubble(
                    isSender: true,
                    fileName: 'IMG_0475',
                    fileInfo: '2.4 MB png',
                    time: '10:15',
                    isRead: true,
                  ),
                  _buildMessageBubble(
                    text: 'Japan looks amazing!',
                    time: '10:10',
                    isSender: true,
                    isRead: true,
                  ),
                  _buildMessageBubble(
                    text: 'Good morning!',
                    time: '10:10',
                    isSender: true,
                    isRead: true,
                  ),
                  _buildDateChip('Fri, Jul 26'),
                  _buildMessageBubble(
                    text: 'Good bye!',
                    time: '17:47',
                    isSender: true,
                    isRead: true,
                  ),
                  _buildMessageBubble(
                    text: 'I will write from Japan',
                    time: '17:47',
                    isSender: true,
                    isRead: true,
                  ),
                ].reversed.toList(),
              ),
            ),
            _buildMessageInputBar(context),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF6F6F6),
      elevation: 1,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF007AFF)),
        onPressed: () => context.go('/whatsapp_chats'),
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/1_656.png'),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Martha Craig',
                style: GoogleFonts.inter( // <--- تم التعديل
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                'tap here for contact info',
                style: GoogleFonts.inter( // <--- تم التعديل
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.videocam_outlined,
              color: Color(0xFF007AFF), size: 28),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.call_outlined,
              color: Color(0xFF007AFF), size: 24),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildDateChip(String date) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFDDE0EA),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          date,
          style: GoogleFonts.inter( // <--- تم التعديل
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF3C3C43),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble({
    required String text,
    required String time,
    required bool isSender,
    bool isRead = false,
  }) {
    final color = isSender ? const Color(0xFFDCF8C6) : const Color(0xFFFCFCFC);

    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 250),
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Wrap(
          alignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.end,
          spacing: 8,
          children: [
            Text(
              text,
              style: GoogleFonts.inter(fontSize: 16, color: Colors.black), // <--- تم التعديل
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  time,
                  style: GoogleFonts.inter( // <--- تم التعديل
                    fontSize: 11,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                if (isSender) ...[
                  const SizedBox(width: 4),
                  Icon(
                    Icons.done_all,
                    size: 16,
                    color: isRead ? const Color(0xFF007AFF) : Colors.grey,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFileMessageBubble({
    required bool isSender,
    required String fileName,
    required String fileInfo,
    required String time,
    required bool isRead,
  }) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 250),
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSender ? const Color(0xFFDCF8C6) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.insert_drive_file,
                      color: Color(0xFF007AFF), size: 28),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      fileName,
                      style: GoogleFonts.inter( // <--- تم التعديل
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  fileInfo,
                  style: GoogleFonts.inter( // <--- تم التعديل
                    fontSize: 11,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  time,
                  style: GoogleFonts.inter( // <--- تم التعديل
                    fontSize: 11,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                if (isSender) ...[
                  const SizedBox(width: 4),
                  Icon(
                    Icons.done_all,
                    size: 16,
                    color: isRead ? const Color(0xFF007AFF) : Colors.grey,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInputBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: 8 + MediaQuery.of(context).padding.bottom,
      ),
      color: const Color(0xFFF6F6F6),
      child: Row(
        children: [
          IconButton(
              icon: const Icon(Icons.add_circle,
                  color: Color(0xFF007AFF), size: 28),
              onPressed: () {}),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300, width: 0.5)),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Message',
                        hintStyle: GoogleFonts.inter(color: Colors.grey[500]), // <--- تم التعديل
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.mood, color: Colors.grey[500]),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          IconButton(
              icon: const Icon(Icons.camera_alt_outlined,
                  color: Color(0xFF007AFF), size: 28),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.mic_none,
                  color: Color(0xFF007AFF), size: 28),
              onPressed: () {}),
        ],
      ),
    );
  }
}
