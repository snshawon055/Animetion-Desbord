import 'package:flutter/material.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class MenuDashbordPage extends StatefulWidget {
  const MenuDashbordPage({Key? key}) : super(key: key);

  @override
  State<MenuDashbordPage> createState() => _MenuDashbordPageState();
}

class _MenuDashbordPageState extends State<MenuDashbordPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  late double screenHeight, screenWidth;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _menuSlideAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuSlideAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      body: Stack(
        children: [
          menu(context),
          dashbord(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuSlideAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                ),
                Row(children: [
                  const SizedBox(width: 30),
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1640622656891-04960a7aa678?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
                  ),
                ]),
                const SizedBox(height: 25),
                Row(
                  children: [
                    SizedBox(width: 32),
                    Text(
                      "SN Shawon",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const SizedBox(width: 32),
                    Text(
                      "San Francisco, CA",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  children: <Widget>[
                    SizedBox(width: 32),
                    Icon(Icons.wallet_travel),
                    const SizedBox(width: 8),
                    Text(
                      "Dashbord",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  children: <Widget>[
                    SizedBox(width: 32),
                    Icon(Icons.message_sharp),
                    const SizedBox(width: 8),
                    Text(
                      "Message",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  children: <Widget>[
                    SizedBox(width: 32),
                    Icon(Icons.backpack),
                    const SizedBox(width: 8),
                    Text(
                      "Utility Bills",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  children: <Widget>[
                    SizedBox(width: 32),
                    Icon(Icons.arrow_circle_left),
                    const SizedBox(width: 8),
                    Text(
                      "Funds Transfer",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  children: <Widget>[
                    SizedBox(width: 32),
                    Icon(Icons.balance),
                    const SizedBox(width: 8),
                    Text(
                      "Branches",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                Row(
                  children: [
                    SizedBox(width: 32),
                    Icon(Icons.logout),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Log Out",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[400],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashbord(context) {
    return AnimatedPositioned(
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.4 * screenWidth,
      top: 0,
      bottom: 0,
      duration: duration,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          elevation: 8,
          color: backgroundColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () {
                          if (isCollapsed)
                            _controller.forward();
                          else
                            _controller.reverse();
                          setState(() {
                            isCollapsed = !isCollapsed;
                          });
                        },
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "My Cards",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.redAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.blueAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.greenAccent,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Transactions",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Today",
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                        ],
                      ),
                      Icon(Icons.line_style),
                    ],
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: 10,
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 16,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text("Macbook"),
                            subtitle: Text("Apple"),
                            trailing: Text("-2900"),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
