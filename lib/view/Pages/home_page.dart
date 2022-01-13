import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:youtube_ui_clone/model/video_data.dart';
import 'package:youtube_ui_clone/view/Styles/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: white,
      ),
      backgroundColor: black,
      body: SafeArea(
        child: ListView(
          children: [
            StickyHeader(
              header: Container(
                color: black,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Builder(builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: SvgPicture.asset(
                                  'assets/images/svg_icons/drawer_icon.svg'),
                            );
                          }),
                          Row(
                            children: [
                              const Text(
                                'YouTube',
                                style: TextStyle(
                                    color: white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              ),
                              SvgPicture.asset(
                                  'assets/images/svg_icons/youtube.svg')
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryList.length,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: EdgeInsets.only(left: index == 0 ? 5 : 10),
                            child: Chip(
                              backgroundColor: lightBlack,
                              label: Text(
                                categoryList[index],
                                style: const TextStyle(color: white),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              content: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const VideoSection(
                    sectionTitle: 'Recomnended',
                  ),
                  const SizedBox(height: 25),
                  const VideoSection(sectionTitle: 'From your subscription'),
                  const SizedBox(height: 25),
                  const CreatorStorySection(),
                  const SizedBox(height: 25),
                  const VideoSection(sectionTitle: 'From your subscription'),
                  Column(
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: VideoContainer(video: videoList[index],),
                            )),
                  ),
                  const SizedBox(height: 25),
                  const VideoSection(sectionTitle: 'Trending'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreatorStorySection extends StatelessWidget {
  const CreatorStorySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightBlack,
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
        color: black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                'Story',
                style: TextStyle(
                    color: white, fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 0 : 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 250,
                          width: 150,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              Positioned(
                                bottom: 10,
                                child: Container(
                                  height: 75,
                                  width: 75,
                                  decoration: BoxDecoration(
                                      color: black,
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoSection extends StatelessWidget {
  const VideoSection({
    required this.sectionTitle,
    Key? key,
  }) : super(key: key);
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionTitle,
                style: const TextStyle(
                    color: white, fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: white,
                size: 20,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          height: 320,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: videoList.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 0 : 25),
                  child: VideoContainer(video: videoList[index]),
                );
              }),
        ),
      ],
    );
  }
}

class VideoContainer extends StatelessWidget {
  const VideoContainer({
    required this.video,
    Key? key,
  }) : super(key: key);
  final video;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 250,
          width: ScreenUtil().screenWidth,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: NetworkImage(video['thumbnail'],), fit: BoxFit.cover)
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
            width: ScreenUtil().screenWidth - 50,
            child: Text(
              video['title'],
              style: const TextStyle(
                color: white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'MovieInfo',
            style: TextStyle(
              color: offWhite,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}