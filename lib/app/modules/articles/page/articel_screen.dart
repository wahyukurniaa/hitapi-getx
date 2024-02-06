import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hitapi/app/modules/articles/controller/article_controller.dart';
import 'package:hitapi/app/routes/app_routes.dart';

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text(item['author'] ?? ''),
                        leading: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black),
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
                      ButtonBar(
                        children: <Widget>[
                          TextButton(
                            onPressed: () async {
                              await Get.toNamed(AppRoutes.detailScreen.name,
                                  arguments: item);
                              // debugPrint(item['author']);
                            },
                            child: const Text('Lihat'),
                          ),
                        ],
                      ),
                    ],
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

//   ListTile(
                    //     title: Text(controller.results[index]['author'] ?? ''),
                    //     leading: Container(
                    //       width: 100,
                    //       decoration: BoxDecoration(
                    //         border: Border.all(width: 1, color: Colors.black),
                    //         image: DecorationImage(
                    //           fit: BoxFit.cover,
                    //           image: item['urlToImage'] != null
                    //               ? NetworkImage(item['urlToImage'])
                    //               : const NetworkImage(
                    //                   'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2023/03/13032551/Kenali-X-Jenis-dan-Manfaat-Pisang-untuk-Kesehatan-Tubuh.jpg.webp'),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // );
// Card(
//       elevation: 4, // Shadow depth
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10), // Rounded corners
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           ListTile(
//             leading: Icon(Icons.album),
//             title: Text('Card Title'),
//             subtitle: Text('This is a simple card example in Flutter.'),
//           ),
//           ButtonBar(
//             children: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   // Add your action here
//                 },
//                 child: Text('BUTTON 1'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   // Add your action here
//                 },
//                 child: Text('BUTTON 2'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );