import 'package:delivery_app/components/dividerSection.dart';
import 'package:delivery_app/pages/MainPages/setting/settingPage.dart';
import 'package:delivery_app/pages/MainPages/wallet/availableAmountPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../order/orderPage.dart';
import 'orderDetailsPage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 4);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: const [
        OrdersPage(),
        WalletPage(),
        SettingsPage(),
        OrdersPage(),
        HomePage(),
      ],
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style16,
      backgroundColor: Colors.white,
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: NavSvgIcon(
          controller: _controller,
          index: 0,
          asset: "assets/svg/setting-2.svg",
        ),
        title: ("مقدار موجودی"),
        activeColorPrimary: const Color(0xff1D668E),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: NavSvgIcon(
          controller: _controller,
          index: 1,
          asset: "assets/svg/wallet.svg",
        ),
        title: ("مقدار موجودی"),
        activeColorPrimary: const Color(0xff1D668E),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: NavSvgIcon(
          controller: _controller,
          index: 2,
          asset: "assets/svg/scanner.svg",
        ),
        title: ("تنظیمات"),
        activeColorPrimary: const Color(0xff1D668E),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: NavSvgIcon(
          controller: _controller,
          index: 3,
          asset: "assets/svg/box.svg",
        ),
        title: ("سفارشات"),
        activeColorPrimary: const Color(0xff1D668E),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: NavSvgIcon(
          controller: _controller,
          index: 4,
          asset: "assets/svg/MainPages-2.svg",
        ),
        title: ("خانه"),
        activeColorPrimary: const Color(0xff1D668E),
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}

// Used this widget for colorize the selected Icon in bottom navigation bar, because the
class NavSvgIcon extends StatelessWidget {
  final PersistentTabController controller;
  final int index;
  final String asset;

  const NavSvgIcon({
    super.key,
    required this.controller,
    required this.index,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final bool isSelected = controller.index == index;
        final Color color =
            isSelected ? const Color(0xff1D668E) : Colors.grey.shade300;
        return SvgPicture.asset(
          asset,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
   const HomePage({super.key});

   @override
   Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Header section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            // borderRadius: BorderRadius.circular(12),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.notifications_none, size: 22),
                        ),
                        Positioned(
                          right: 6,
                          top: 2,
                          child: Container(
                            width: 9,
                            height: 9,
                            decoration: const BoxDecoration(
                              color: Colors.redAccent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text(
                              'محمد ایمان',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/300?img=56',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),

               //Search Bar section
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: const [
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                            hintText: 'سفارش خود را پیگیری کنید...',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // Banner section
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    height: 193,
                    width: 397,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end:
                            Alignment
                                .centerRight,
                        colors: [
                          Color(0xFF0F374C),
                          Color(0xFF154B68),
                          Color(0xFF2481B2),
                        ],
                        stops: [
                          0.0,
                          0.73,
                          1.0,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: w * 0.01),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                          ),
                          child: Image.asset(
                            "assets/images/bike.png",
                            width: 166,
                            height: 193,
                            fit: BoxFit.cover,
                          ),
                        ),
                       // Text and send bottom
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 14,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'ارسال سفارش',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'اطمینان خاطر را با اقصی دیلیوری تجربه کنید',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFFBEE8FF),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: const Text(
                                      'ثبت ارسال',
                                      style: TextStyle(
                                        color: Color(0xFF0A6CFF),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 18),
                /// Current Orders
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    'سفارش کنونی',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ),

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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OrderDetailPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "جزئیات بیشتر",
                              style: TextStyle(
                                color: Color(0xff1D668E),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.015),
                      divider(),

                      ///TimeLine from start to destination
                      SizedBox(
                        height: height * 0.15,
                        child: FixedTimeline.tileBuilder(
                          theme: TimelineThemeData(
                            nodePosition: 0.0,
                            indicatorTheme: IndicatorThemeData(
                              size: width * 0.04,
                            ),
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
                                  gap:
                                      6.0,
                                  dash:
                                      2.0,
                                ),

                            itemCount: 2,
                          ),
                        ),
                      ),

                      divider(),
                      SizedBox(height: height * 0.015),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/status.svg",
                            width: width * 0.08,
                            height: width * 0.08,
                          ),
                          SizedBox(width: width * 0.03),
                          Row(
                            children: const [
                              Text(
                                "وضعیت: ",
                                style: TextStyle(
                                  color: Color(0xff666666),
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "در حال ارسال ",
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // Recent Orders
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'سفارش های اخیر',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'دیدن همه',
                      style: TextStyle(color: Color(0xff1D668E)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
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
                      ),
                      const Icon(Icons.more_vert, color: Colors.grey),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}