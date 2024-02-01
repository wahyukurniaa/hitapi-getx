import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hitapi/app/modules/articles/controller/article_controller.dart';

class ArticleSCreen extends StatelessWidget {
  const ArticleSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ArticleController());

    Future.delayed(Duration.zero, () async {
      controller.getData();
    });
    return Scaffold(
      body: Center(
        child: Obx(
          () => ListView.builder(
            itemCount: controller.results.length,
            itemBuilder: (context, index) {
              var item = controller.results[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ListTile(
                  title: Text(controller.results[index]['author'] ?? ''),
                  leading: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: item['urlToImage'] != null
                            ? NetworkImage(item['urlToImage'])
                            : const NetworkImage(
                                'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2023/03/13032551/Kenali-X-Jenis-dan-Manfaat-Pisang-untuk-Kesehatan-Tubuh.jpg.webp'),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
