import 'package:flutter/material.dart';
import '../widgets/bottom_sheet.dart';
import './edit_profile_screen.dart';

class UserProfileScreen extends StatefulWidget {
  static const routeName = '/user-profile';
  const UserProfileScreen({super.key});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.orange,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: const Color.fromARGB(1, 255, 255, 255),
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w900),
        ),
      ),
      // bottomNavigationBar: followButton(),
      body: Stack(
        children: <Widget>[
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.height / 70.0,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://yt3.googleusercontent.com/ifZJFKoXaasijKlvMxM43d1lXCsvTjJgujLvEWCvv68e8rHKSg2OmixwdRBp_L_50uQBviQOHA=s900-c-k-c0x00ffffff-no-rj'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(100.0),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 0.01,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 100.0,
                      top: 110,
                      child: InkWell(
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: ((builder) => BottomShhetWidget()));
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Johnny Sins",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    InkWell(
                      child: const Icon(
                        Icons.create,
                        size: 18.0,
                        color: Colors.orange,
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(EditProfileScreen.routeName);
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Johnny@gmail.com",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 67,
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text(
                        'Edit Profile',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(EditProfileScreen.routeName);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 67,
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      leading: const Icon(Icons.security),
                      title: const Text(
                        'Change Password',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 67,
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Perform logout action
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
