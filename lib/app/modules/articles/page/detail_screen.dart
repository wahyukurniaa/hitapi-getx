// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final item = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(item['author'] ?? 'data kosong'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gap(),
              Text(
                item['title'] ?? ' data kosong',
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Text(
                item['publishedAt'],
                style: const TextStyle(fontSize: 11),
              ),
              gap(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 400,
                height: 300,
                decoration: BoxDecoration(
                  // border: Border.all(width: 1, color: Colors.black),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: item['urlToImage'] != null
                        ? NetworkImage(item['urlToImage'])
                        : const NetworkImage(
                            'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2023/03/13032551/Kenali-X-Jenis-dan-Manfaat-Pisang-untuk-Kesehatan-Tubuh.jpg.webp'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Future<void> launchUrl(String? url) async {
                    if (url == null) {
                      throw 'URL is null';
                    }
                    final Uri uri = Uri.parse(url);
                    if (await canLaunch(uri.toString())) {
                      await launch(uri.toString());
                    } else {
                      throw 'Could not launch $url';
                    }
                  }

                  try {
                    await launchUrl(item['url']);
                    debugPrint(item['url']);
                  } catch (e) {
                    debugPrint('Failed to launch URL: $e');
                  }
                },
                child: Text(
                  item['url'],
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
              ),
              gap(),
              Text(item['description'] ?? 'data kosong'),
              gap(),
              Text(
                item['content'] ?? 'data kosong',
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget gap() {
    return const SizedBox(
      height: 30,
    );
  }
}
