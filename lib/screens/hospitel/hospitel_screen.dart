import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';
import '../routes.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}
List<Map> hotels = [
  {
    'img': 'assets/images/img_2.png',
    'doctorName': ' Gardner Pearson',
    'doctorTitle': 'Heart Specialist'
  },
  {
    'img': 'assets/images/img_2.png',
    'doctorName': 'Dr. Rosa Williamson',
    'doctorTitle': 'Skin Specialist'
  },
  {
    'img': 'assets/images/img_1.png',
    'doctorName': 'Dr. Gardner Pearson',
    'doctorTitle': 'Heart Specialist'
  },
  {
    'img': 'assets/images/img_3.png',
    'doctorName': 'Dr. Rosa Williamson',
    'doctorTitle': 'Skin Specialist'
  },
  {
    'img': 'assets/images/img_4.png',
    'doctorName': 'Dr. Gardner Pearson',
    'doctorTitle': 'Heart Specialist'
  },
  {
    'img': 'assets/images/img_4.png',
    'doctorName': 'Dr. Rosa Williamson',
    'doctorTitle': 'Skin Specialist'
  },
  {
    'img': 'assets/images/img_3.png',
    'doctorName': 'Dr. Gardner Pearson',
    'doctorTitle': 'Heart Specialist'
  },
  {
    'img': 'assets/images/img_2.png',
    'doctorName': 'Dr. Rosa Williamson',
    'doctorTitle': 'Skin Specialist'
  },
  {
    'img': 'assets/images/img_3.png',
    'doctorName': 'Dr. Gardner Pearson',
    'doctorTitle': 'Heart Specialist'
  },
  {
    'img': 'assets/images/img.png',
    'doctorName': 'Dr. Rosa Williamson',
    'doctorTitle': 'Skin Specialist'
  },
  {
    'img': 'assets/images/img_4.png',
    'doctorName': 'Dr. Gardner Pearson',
    'doctorTitle': 'Heart Specialist'
  },
  {
    'img': 'assets/images/img_5.png',
    'doctorName': 'Dr. Rosa Williamson',
    'doctorTitle': 'Skin Specialist'
  }
];
class _HotelScreenState extends State<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text("Sizga mos Shifoxonalar",style: TextStyle(
            color: Colors.black
        ),)),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          ...List.generate(hotels.length, (index) {
            return TopHotelCard(
                img: hotels[index]["img"],
                doctorName: hotels[index]["doctorName"],
                doctorTitle: hotels[index]["doctorTitle"]
            );
          })
        ],
      ),
    );
  }
}

class TopHotelCard extends StatelessWidget {
  String img;
  String doctorName;
  String doctorTitle;

  TopHotelCard({
    super.key,
    required this.img,
    required this.doctorName,
    required this.doctorTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const  EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RouteNames.hotelDetailRoute);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: AppColors.grey01,
              child: Image(
                width: 100,
                height: 60,
                image: AssetImage(img),
                fit: BoxFit.cover,
              ),
            ),
            const  SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  doctorName,
                  style: const TextStyle(
                    color: AppColors.header01,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  doctorTitle,
                  style: const TextStyle(
                    color: AppColors.grey02,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const  SizedBox(
                  height: 5,
                ),
                const   Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.yellow02,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '4.0 - 50 Reviews',
                      style: TextStyle(color: AppColors.grey02),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
