import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class WhatsappChats extends StatelessWidget {
  const WhatsappChats({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chatsData = [
      {
        'avatar': 'assets/images/1_95.png',
        'name': 'Martin Randolph',
        'message': 'Yes, 2pm is awesome',
        'time': '11/19/19',
        'isRead': true,
        'messageType': 'text',
      },
      {
        'avatar': 'assets/images/1_34.png',
        'name': 'Andrew Parker',
        'message': 'What kind of strategy is better?',
        'time': '11/16/19',
        'isRead': true,
        'messageType': 'text',
      },
      {
        'avatar': 'assets/images/1_107.png',
        'name': 'Karen Castillo',
        'message': '0:14',
        'time': '11/15/19',
        'isRead': false,
        'messageType': 'voice',
      },
      {
        'avatar': 'assets/images/1_22.png',
        'name': 'Maximillian Jacobson',
        'message': 'Bro, I have a good idea!',
        'time': '10/30/19',
        'isRead': true,
        'messageType': 'text',
      },
      {
        'avatar': 'assets/images/1_80.png',
        'name': 'Martha Craig',
        'message': 'Photo',
        'time': '10/28/19',
        'isRead': false,
        'messageType': 'photo',
      },
      {
        'avatar': 'assets/images/1_58.png',
        'name': 'Tabitha Potter',
        'message':
            'Actually I wanted to check with you about your online business plan on our…',
        'time': '8/25/19',
        'isRead': false,
        'messageType': 'text',
      },
      {
        'avatar': 'assets/images/1_66.png',
        'name': 'Maisy Humphrey',
        'message':
            'Welcome, to make design process faster, look at Pixsellz',
        'time': '8/20/19',
        'isRead': true,
        'messageType': 'text',
      },
      {
        'avatar': 'assets/images/1_46.png',
        'name': 'Kieron Dotson',
        'message': 'Ok, have a good trip!',
        'time': '7/29/19',
        'isRead': true,
        'messageType': 'text',
      },
      {
        'avatar': 'assets/images/1_119.png',
        'name': 'Joshua Lawrence',
        'message': 'Do you like WhatsApp UI?',
        'time': '10/20/19',
        'isRead': true,
        'messageType': 'text',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFFF6F6F6),
            pinned: true,
            floating: true,
            elevation: 0.5,
            title: Text(
              'Chats',
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            leading: Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Edit',
                  style: GoogleFonts.sourceSansPro(
                    color: const Color(0xFF007AFF),
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.create_outlined,
                    color: Color(0xFF007AFF)),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Broadcast Lists',
                      style: GoogleFonts.sourceSansPro(
                        color: const Color(0xFF007AFF),
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'New Group',
                      style: GoogleFonts.sourceSansPro(
                        color: const Color(0xFF007AFF),
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final chat = chatsData[index];
                return _ChatItem(
                  avatar: chat['avatar']!,
                  name: chat['name']!,
                  message: chat['message']!,
                  time: chat['time']!,
                  isRead: chat['isRead'],
                  messageType: chat['messageType'],
                  onTap: () => context.go('/whatsapp_chat'),
                  isLastItem: index == chatsData.length - 1,
                );
              },
              childCount: chatsData.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFF6F6F6),
        currentIndex: 3,
        onTap: (index) {},
        selectedItemColor: const Color(0xFF007AFF),
        unselectedItemColor: const Color(0xFF545458).withOpacity(0.65),
        selectedLabelStyle: GoogleFonts.sourceSansPro(
            fontSize: 10, fontWeight: FontWeight.w500),
        unselectedLabelStyle: GoogleFonts.sourceSansPro(
            fontSize: 10, fontWeight: FontWeight.w500),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage_outlined),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_outlined),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class _ChatItem extends StatelessWidget {
  final String avatar;
  final String name;
  final String message;
  final String time;
  final bool isRead;
  final String messageType;
  final VoidCallback onTap;
  final bool isLastItem;

  const _ChatItem({
    required this.avatar,
    required this.name,
    required this.message,
    required this.time,
    required this.isRead,
    required this.messageType,
    required this.onTap,
    this.isLastItem = false,
  });

  Widget _buildMessagePreview() {
    List<Widget> children = [];
    if (isRead && messageType == 'text') {
      children.add(
          const Icon(Icons.done_all, color: Color(0xFF3498DB), size: 16));
      children.add(const SizedBox(width: 4));
    }
    if (messageType == 'photo') {
      children.add(const Icon(Icons.photo_camera_outlined,
          color: Color(0xFF8E8E93), size: 16));
      children.add(const SizedBox(width: 4));
    }
    if (messageType == 'voice') {
      children
          .add(const Icon(Icons.mic, color: Color(0xFF60BC58), size: 16));
      children.add(const SizedBox(width: 4));
    }

    children.add(
      Expanded(
        child: Text(
          message,
          style: GoogleFonts.sourceSansPro(
            color: const Color(0xFF8E8E93),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );

    return Row(children: children);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage(avatar),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              style: GoogleFonts.sourceSansPro(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            time,
                            style: GoogleFonts.sourceSansPro(
                              color: const Color(0xFF8E8E93),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(Icons.arrow_forward_ios,
                              size: 14, color: Color(0x4D3C3C43)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      _buildMessagePreview(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (!isLastItem)
            Padding(
              padding: const EdgeInsets.only(left: 86.0, right: 16.0),
              child: Divider(
                height: 1,
                thickness: 0.5,
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
        ],
      ),
    );
  }
}