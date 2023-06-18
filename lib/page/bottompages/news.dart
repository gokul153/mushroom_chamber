//News Feed

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class News extends StatelessWidget {
  const News({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 85, 139, 47),
        title: const Text(
          "News",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 5,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              GestureDetector(
                  onTap: () => _launchURL('https://agricoop.nic.in/'),
                  child: longBox("crop2", "Agriculture News")),
              GestureDetector(
                  onTap: () => _launchURL(
                      'https://www.thehindubusinessline.com/economy/agri-business/'),
                  child: longBox("crop3", "Crops This Season")),
              GestureDetector(
                  onTap: () => _launchURL(
                      'https://timesofindia.indiatimes.com/city/nashik/agri-dept-plans-contingency-for-delayed-rains/articleshow/100087541.cms'),
                  child: longBox("crop2", "Rainy Season Near?")),
            ],
          ))
        ],
      ),
    );
  }

  Widget longBox(String image, String folderName) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      //padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 100,
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                child: Image.asset(
                  'assets/images/$image.png',
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      folderName,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Tap to know more',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
