import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../components/dividerSection.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "جزئیات سفارش",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: width * 0.95,
              padding: EdgeInsets.all(width * 0.03),
              decoration: BoxDecoration(
                color: const Color(0xffF1F3F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/package.svg",
                            width: width * 0.08,
                            height: width * 0.08,
                          ),
                          SizedBox(width: width * 0.03),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "1 بسته",
                                style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "آی دی سفارش: 7788",
                                style: TextStyle(
                                  color: Color(0xff666666),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          print("map clicked");
                        },
                        child: SvgPicture.asset("assets/svg/map.svg"),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.015),

                  //Divider widget

                  divider(),

                  SizedBox(
                    height: height * 0.15,
                    child: FixedTimeline.tileBuilder(
                      theme: TimelineThemeData(
                        nodePosition: 0.0,
                        indicatorTheme: IndicatorThemeData(size: width * 0.04),
                        connectorTheme: const ConnectorThemeData(
                          color: Color(0xff1D668E),
                          thickness: 1.5,
                        ),
                      ),
                      builder: TimelineTileBuilder.connected(
                        connectionDirection: ConnectionDirection.before,
                        itemExtentBuilder: (_, __) => height * 0.07,
                        contentsBuilder: (context, index) {
                          if (index == 0) {
                            return Padding(
                              padding: EdgeInsets.only(
                                right: width * 0.03,
                                top: 6,
                              ),
                              child: const Text(
                                "مبدا:\nفروشگاه زیتون",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff333333),
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsets.only(
                                right: width * 0.03,
                                top: 6,
                              ),
                              child: const Text(
                                "مقصد:\nهرات، چهارراهی آمریت، کوچه حفظ‌الله یادغیسی...",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff333333),
                                ),
                              ),
                            );
                          }
                        },
                        indicatorBuilder: (context, index) {
                          if (index == 0) {
                            return DotIndicator(
                              color: const Color(0xff1D668E),
                              size: width * 0.04,
                            );
                          } else {
                            return OutlinedDotIndicator(
                              color: const Color(0xff1D668E),
                              size: width * 0.04,
                              borderWidth: 2,
                            );
                          }
                        },
                        connectorBuilder:
                            (_, __, ___) => const DashedLineConnector(
                          color: Colors.grey,
                          gap: 6.0,
                          dash: 2.0,
                        ),

                        itemCount: 2, // list of items
                      ),
                    ),
                  ),

                  divider(),
                  SizedBox(height: height * 0.015),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/profile.svg",
                                    width: width * 0.08,
                                    height: width * 0.08,
                                  ),
                                  SizedBox(width: width * 0.03),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "اسم مشتری:",
                                        style: TextStyle(
                                          color: Color(0xff666666),
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "میثم",
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/date.svg",
                                    width: width * 0.08,
                                    height: width * 0.08,
                                  ),
                                  SizedBox(width: width * 0.03),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "تاریخ سفارش:",
                                        style: TextStyle(
                                          color: Color(0xff666666),
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "1403/03/16",
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/status.svg",
                                    width: width * 0.08,
                                    height: width * 0.08,
                                  ),
                                  SizedBox(width: width * 0.03),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "وضعیت:",
                                        style: TextStyle(
                                          color: Color(0xff666666),
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "در حال ارسال",
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/call_circle.svg",
                                    width: width * 0.08,
                                    height: width * 0.08,
                                  ),
                                  SizedBox(width: width * 0.03),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "شماره تماس مشتری:",
                                        style: TextStyle(
                                          color: Color(0xff666666),
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "0790000000",
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/clock.svg",
                                    width: width * 0.08,
                                    height: width * 0.08,
                                  ),
                                  SizedBox(width: width * 0.03),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "زمان تحویل:",
                                        style: TextStyle(
                                          color: Color(0xff666666),
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "11:45 ب.ظ",
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/money.svg",
                                    width: width * 0.08,
                                    height: width * 0.08,
                                  ),
                                  SizedBox(width: width * 0.03),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "مبلغ:",
                                        style: TextStyle(
                                          color: Color(0xff666666),
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "2000 افغانی",
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: width * 0.03),
                      const SizedBox(height: 16),

                      // Bottoms
                      Row(
                        children: [
                          // Delivered bottom
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF0F374C),
                                    Color(0xFF154B68),
                                    Color(0xFF2481B2),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "تحویل شد",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          // Rejected bottom
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                side: const BorderSide(
                                  color: Color(0xff1D668E),
                                  width: 1.5,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "برگشت خورد",
                                style: TextStyle(color: Color(0xff1D668E)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Tabs for call
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: const TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.black,
                      indicatorColor: Color(0xff1D668E),
                      tabs: [
                        Tab(text: "تماس با مشتری"),
                        Tab(text: "تماس با فروشگاه"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: TabBarView(
                      children: [
                        // call with customer
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: height * 0.01),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: width * 0.01,
                                  horizontal: width * 0.03,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xffF1F3F5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/svg/profile.svg",
                                          width: width * 0.08,
                                          height: width * 0.08,
                                        ),
                                        SizedBox(width: width * 0.03),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "شماره تماس مشتری:",
                                              style: TextStyle(
                                                color: Color(0xff666666),
                                                fontSize: 13,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "0790000000",
                                              style: TextStyle(
                                                color: Color(0xff333333),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print("the call bottom clicked");
                                      },
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFF0F374C),
                                              Color(0xFF154B68),
                                              Color(0xFF2481B2),
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.call_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.02),

                              // TextField for getting user opinion
                              Container(
                                height: height * 0.11,

                                padding: EdgeInsets.symmetric(
                                  vertical: width * 0.01,
                                  horizontal: width * 0.03,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  color: const Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Expanded(
                                  child: TextField(
                                    minLines: 1,
                                    maxLines: 5,
                                    keyboardType: TextInputType.multiline,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      hintText:
                                      'توضیحات در صورت برگشت خوردن سفارش...',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: width * 0.025,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),

                              // Send bottom for call with customer
                              SizedBox(
                                width: width,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF0F374C),
                                        Color(0xFF154B68),
                                        Color(0xFF2481B2),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 14,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      "ارسال",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Call with Store
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: height * 0.01),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: width * 0.01,
                                  horizontal: width * 0.03,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xffF1F3F5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/svg/store.svg",
                                          width: width * 0.08,
                                          height: width * 0.08,
                                        ),
                                        SizedBox(width: width * 0.03),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "شماره تماس مشتری:",
                                              style: TextStyle(
                                                color: Color(0xff666666),
                                                fontSize: 13,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "0790000000",
                                              style: TextStyle(
                                                color: Color(0xff333333),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print("the call bottom clicked");
                                      },
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFF0F374C),
                                              Color(0xFF154B68),
                                              Color(0xFF2481B2),
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.call_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.02),
                              Container(
                                height: height * 0.11,

                                padding: EdgeInsets.symmetric(
                                  vertical: width * 0.01,
                                  horizontal: width * 0.03,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  color: const Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Expanded(
                                  child: TextField(
                                    minLines: 1,
                                    maxLines: 5,
                                    keyboardType: TextInputType.multiline,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      hintText:
                                      'توضیحات در صورت برگشت خوردن سفارش...',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: width * 0.025,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),

                              // Send bottom
                              SizedBox(
                                width: width,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF0F374C),
                                        Color(0xFF154B68),
                                        Color(0xFF2481B2),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      Colors.transparent,
                                      shadowColor:
                                      Colors.transparent,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 14,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      "ارسال",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


