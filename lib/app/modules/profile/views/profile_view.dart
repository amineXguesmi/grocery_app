import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: context.theme.textTheme.headline3),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white54,
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 65,
                  backgroundImage: AssetImage(Constants.avatar),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Thomas Shelby",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView(
              children: [
                Card(
                  margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  color: Colors.white70,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  child: const ListTile(
                    leading: Icon(
                      Icons.privacy_tip_sharp,
                      color: Colors.black54,
                    ),
                    title: Text(
                      'Privacy',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white70,
                  margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  child: const ListTile(
                    leading: Icon(
                      Icons.history,
                      color: Colors.black54,
                    ),
                    title: Text(
                      'Purchase History',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white70,
                  margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  child: const ListTile(
                    leading: Icon(Icons.help_outline, color: Colors.black54),
                    title: Text(
                      'Help & Support',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white70,
                  margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  child: const ListTile(
                    leading: Icon(
                      Icons.privacy_tip_sharp,
                      color: Colors.black54,
                    ),
                    title: Text(
                      'Settings',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white70,
                  margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  child: const ListTile(
                    leading: Icon(
                      Icons.add_reaction_sharp,
                      color: Colors.black54,
                    ),
                    title: Text(
                      'Invite a Friend',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white70,
                  margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  child: const ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.black54,
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
