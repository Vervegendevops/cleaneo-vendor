import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Trainings extends StatefulWidget {
  const Trainings({Key? key}) : super(key: key);

  @override
  State<Trainings> createState() => _TrainingsState();
}

class _TrainingsState extends State<Trainings> {
  final List<String> videoUrls = [
    'https://www.shutterstock.com/image-vector/banner-training-concept-keywords-vector-260nw-576193165.jpg', // Example image URL
    'https://thumbs.dreamstime.com/b/training-webinar-e-learning-skills-business-internet-technology-concept-training-webinar-e-learning-skills-business-internet-99211231.jpg',
    'https://media.istockphoto.com/id/1312139041/photo/learning-on-the-job.jpg?s=612x612&w=0&k=20&c=KmGoZhp92ukKgYCtxulX9yViM1aQTtYtq-pvLr7Q2TA='
    // Add more URLs for your videos
  ];

  final List<String> videoTitles = [
    'Training concepts 1',
    'Training concepts 2',
    'Training concepts 3',
    // Add corresponding titles for each video
  ];

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff006acb),
        ),
        child: Column(
          children: [
            SizedBox(height: mQuery.size.height * 0.034),
            Padding(
              padding: EdgeInsets.only(
                top: mQuery.size.height * 0.058,
                bottom: mQuery.size.height * 0.03,
                left: mQuery.size.width * 0.045,
                right: mQuery.size.width * 0.045,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: mQuery.size.width * 0.045,
                  ),
                  Text(
                    "Training Modules",
                    style: TextStyle(
                      fontSize: mQuery.size.height * 0.027,
                      color: Colors.white,
                      fontFamily: 'SatoshiBold',
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                child: ListView.builder(
                  itemCount: videoUrls.length,
                  itemBuilder: (context, index) {
                    return VideoListItem(
                      videoUrl: videoUrls[index],
                      videoTitle: videoTitles[index],
                    );
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

class VideoListItem extends StatelessWidget {
  final String videoUrl;
  final String videoTitle;

  VideoListItem({required this.videoUrl, required this.videoTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 7,
              offset: Offset(0,0)
            )
          ]
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    width: 200,
                    height: 100,
                    child: Image.network(
                      videoUrl,
                      fit: BoxFit.contain,
                    )),
                Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.play_circle_fill,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                width: 100,
                child: Center(
                  child: Text(
                    videoTitle,
                    style: TextStyle(
                      fontFamily: 'SatoshiBold',
                      fontSize: 13
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



