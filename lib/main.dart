import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Home'),
    const Tab(text: 'About Us'),
    const Tab(text: 'Careers'),
    const Tab(text: 'Blog'),
    const Tab(text: 'Contact Us'),
  ];

  void _launchAppStore() async {
    const String appStoreUrl =
        'https://apps.apple.com/us/app/whatsapp-messenger/id310633997';
    if (await canLaunch(appStoreUrl)) {
      await launch(appStoreUrl);
    } else {
      throw 'Could not launch $appStoreUrl';
    }
  }

  void _launchPlayStore() async {
    const String playStoreUrl =
        'https://play.google.com/store/apps/details?id=com.whatsapp&hl=en_IN&gl=US';
    if (await canLaunch(playStoreUrl)) {
      await launch(playStoreUrl);
    } else {
      throw 'Could not launch $playStoreUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Web Demo'),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: const Color.fromARGB(0, 238, 238, 238),
              padding: const EdgeInsets.all(20.0),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Welcome to our website!',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Create Events hear and and invite family and friends',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: DefaultTabController(
              length: myTabs.length,
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: const Text('Eventbased Application'),
                  bottom: TabBar(
                    tabs: myTabs,
                  ),
                ),
                body: TabBarView(
                  children: <Widget>[
                    Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Column(children: [
                                  const Text(
                                    'India’s largest',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const Text('Create events and invite',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  const Text('first and fastest-growing '),
                                  const Text(
                                      'app with a whopping 25 Million+ app downloads.'),
                                  const Text(
                                      ' We are now running operations in more than 100 cities.'),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: _launchAppStore,
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(10)),
                                        child: const Text('Open App Store'),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                        onPressed: _launchPlayStore,
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(10)),
                                        child: const Text('Open Play Store'),
                                      ),
                                    ],
                                  )
                                ]),
                                const CircleAvatar(
                                  radius: 300,
                                  backgroundImage:
                                      (AssetImage('assets/events.jpg')),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const Center(child: Text('About Us Page')),
                    const Center(child: Text('Careers Page')),
                    const Center(child: Text('Blog Page')),
                    const Center(child: Text('Contact Us Page')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
