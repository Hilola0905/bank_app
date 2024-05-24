
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

Widget profileScrollPage(context) {
  String name = "Marina Volkova";
  String icon_profile = "assets/images/profile/profile_icons/ic_person_box_in.png";
  String icon_prize = "assets/images/profile/profile_icons/ic_gift.png";
  String icon_faq = "assets/images/profile/profile_icons/ic_faq.png";
  String icon_info = "assets/images/profile/profile_icons/ic_about.png";
  String icon_logout = "assets/images/profile/profile_icons/ic_exit.png";

  return SingleChildScrollView(
    child: Stack(
      children: [
        // SizedBox(height: 20,),
        Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(35)),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Color(0xff878B9A)),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Image.asset(
                              "assets/images/ic_official.png",
                              scale: 1.8,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "ID: 233256",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xff32B179)),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          "0 cym",
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w800,
                              fontFamily: "Montserrat",
                              color: Color(0xff12154C)),
                        ),
                      ),
                      const Text(
                        "Лицевой счет",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Mont",
                            color: Color(0xff12154C)),
                      ),
                    ],
                  ),
                  Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 12),
                     child: Column(
                      children: [
                        ListTile(
                           title: const Text(
                             "Личная информация",
                           style: TextStyle(fontWeight: FontWeight.w500,color: Color(0xff121F3E)),
                           ),
                          leading: Image.asset(
                            'assets/images/person.jpeg',
                           height: 30,
                             width: 30,
                           ),
                          trailing: const Icon(
                            Icons.chevron_right,
                            color: Color(0xff33409E),
                            size: 28,
                           ),
                         ),
                         const Divider(
                          indent: 18,
                          endIndent: 18,
                         ),
                         ListTile(
                          title: const Text(
                            "Потратить бонусы",
                             style: TextStyle(fontWeight: FontWeight.w500),
                           ),
                          leading: Image.asset(
                            'assets/images/bonus.png',
                            height: 30,
                            width: 30,
                           ),
                           trailing: const Icon(
                             Icons.chevron_right,
                             color: Color(0xff33409E),
                            size: 28,
                          ),
                         ),
                         const Divider(
                           indent: 18,
                           endIndent: 18,
                         ),
                         ListTile(
                           onTap: () {
                           //  Navigator.push(
                             //    context,
                               // MaterialPageRoute(
                                 //    builder: (BuildContext) => FaqPage()));
                           },
                           title: const Text(
                             "Частно задаваемые вопросы",
                             style: TextStyle(fontWeight: FontWeight.w500),
                           ),
                             leading: Image.asset(
                            'assets/images/faq.png',
                            height: 30,
                  width: 30,
  ),
                           trailing: const Icon(
                             Icons.chevron_right,
                             color: Color(0xff33409E),
                             size: 28,
                          ),
                        ),
                        const Divider(
                          indent: 18,
                           endIndent: 18,
                         ),
                         ListTile(
                          title: const Text(
                             "О приложении",
                            style: TextStyle(fontWeight: FontWeight.w500),
                           ),
                            leading: Image.asset(
                           'assets/images/abut.png',
                             height: 30,
                            width: 30,
                           ),
                           trailing: const Icon(
                             Icons.chevron_right,
                             color: Color(0xff33409E),
                             size: 28,
                          ),
                       ),
                         const Divider(
                           indent: 18,
                           endIndent: 18,
                         ),
                         ListTile(
                           title: const Text(
                             "Личная информация",
                            style: TextStyle(fontWeight: FontWeight.w500),
                           ),
                            leading: Image.asset(
                             'assets/images/exit.png',
                             height: 30,
                             width: 30,
                           ),
                           trailing: const Icon(
                             Icons.chevron_right,
                             color: Color(0xff33409E),
                             size: 28,
                           ),
                         ),
                       ],
                     ),
                   ),
                   SizedBox(
                     height: 20,
                   ),

                  SizedBox(height: 40),
                  noCard(context),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.11,),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: ListTile(
                      leading:
                      Icon(Icons.logout_outlined),
                      title: Text(
                        "Выйти",
                        style:
                        TextStyle(fontSize: 16, color: Color(0xff121F3E)),
                      ),
                      trailing: Text(
                        "Версия 1.0.1",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff878B9A)),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Divider(
                      color: Color(0xffEAEFF3),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
        Column(
          children: const [
            SizedBox(
              height: 100,
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                child: CircleAvatar(
                  backgroundImage:
                  AssetImage("assets/images/profileTab_image.png"),
                  radius: 48,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

noCard(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 24, right: 24),
    child: Column(
      children: [
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.only(right: 20, top: 30, bottom: 30, left: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff3554D1), Color(0xff1E3CA5)])),
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              width: 195,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Кошелек Кешбека",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Пройдите Верификацию чтобы активировать кошелек",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff46EBA2),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Image.asset("assets/images/wallet.png"),
          ]),
        ),
        SizedBox(height: 16),
      ],
    ),
  );
}
