import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/news_controller.dart';
import 'package:weather_app/utils/DateTimeFormater/datatime_format.dart';

class ScreenNews extends StatelessWidget {
  ScreenNews({super.key});

  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    newsController.getNewsList();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppbarCustom(size: size),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GetX<NewsController>(
                  builder: (controller) {
                    if (controller.isloading.value == true) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepPurple,
                          strokeWidth: 1,
                        ),
                      );
                    } else if (controller.isError.value == true) {
                      return Center(
                        child: Column(
                          children: [
                            const Text('Error connecting to server'),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.refresh))
                          ],
                        ),
                      );
                    } else if (controller.isNetworkError.value == true) {
                      return Center(
                        child: Column(
                          children: [
                            const Text('Not connected to internet '),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.refresh))
                          ],
                        ),
                      );
                    } else if (controller.newsList.value == null ||
                        controller.newsList.value!.articles == null ||
                        controller.newsList.value!.articles!.isEmpty) {
                      return const Center(
                        child: Text('No data to show'),
                      );
                    } else {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          final getValue =
                              controller.newsList.value!.articles![index];

                          return NewsTileCustom(
                            size: size,
                            imageUrl: controller.newsList.value!
                                    .articles![index].urlToImage ??
                                '',
                            title: getValue.title!,
                            source: getValue.source!.name!,
                            description: getValue.description!,
                            date: getValue.publishedAt!,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: size.height * 0.015,
                          );
                        },
                        itemCount: controller.newsList.value!.articles!.length,
                      );
                    }
                  },
                ),
              ),
            )
            
          ],
        ),
      ),
    );
  }
}

class NewsTileCustom extends StatelessWidget {
  const NewsTileCustom(
      {super.key,
      required this.size,
      required this.imageUrl,
      required this.title,
      required this.source,
      required this.description,
      required this.date});

  final Size size;
  final String? imageUrl;
  final String? title;
  final String? source;
  final String? description;
  final String? date;

  @override
  Widget build(BuildContext context) {
    String? formateDate =
        CustomDateTimeFormatter.newsDateTimeFormat(dateTime: date!);

    return Container(
      child: Column(
        children: [
          //-----image goes here
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
                width: size.width,
                height: size.height * 0.25,
                // color: Colors.red,
                child: imageUrl!.isNotEmpty
                    ? Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                              color: Colors.deepPurple,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/image_placeholder.png',
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : Image.asset(
                        'assets/image_placeholder.png',
                        fit: BoxFit.cover,
                      )),
          ),

          //-------------------------------------news details here
          Container(
            width: size.width,
            // height: size.height * 0.15,
            // color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'source : $source',
                    style: TextStyle(
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    title ?? 'NA',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Text(
                    description ?? 'NA',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text(formateDate!),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AppbarCustom extends StatelessWidget {
  const AppbarCustom({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Container(
          width: size.width,
          height: size.height * 0.07,
          color: Colors.deepPurple,
          child: Center(
              child: Text(
            'Top Climate News',
            style: TextStyle(
                fontSize: size.width * 0.04,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          )),
        ),
        // Icon(Icons.arrow_back)
        IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ))
      ],
    );
  }
}
