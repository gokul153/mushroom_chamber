import 'package:b_green/bottomnav_added.dart';
import 'package:b_green/login.dart/Authcontroller.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: const Color.fromARGB(224, 85, 139, 47),
        padding: const EdgeInsets.all(16),
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => BottomPage(
                                    email: '',
                                  )));
                    },
                    child: Container(
                      // padding: EdgeInsets.only(top: 30),
                      margin: const EdgeInsets.only(top: 30),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Color.fromARGB(255, 85, 139, 47),
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 3.0,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: ExactAssetImage('assets/images/farmer.png'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Farmer",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: SizedBox(
                    //height: size.height,
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const ProfileWidget(
                          icon: Icons.person,
                          title: 'My Profile',
                        ),
                        const ProfileWidget(
                          icon: Icons.settings,
                          title: 'Settings',
                        ),
                        const ProfileWidget(
                          icon: Icons.notifications,
                          title: 'Notifications',
                        ),
                        const ProfileWidget(
                          icon: Icons.share,
                          title: 'Share',
                        ),
                        GestureDetector(
                          onTap: () {
                            AuthController.instance.logout();
                          },
                          child: const ProfileWidget(
                            icon: Icons.logout,
                            title: 'Log Out',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const ProfileWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.black,
                size: 24,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
            size: 16,
          )
        ],
      ),
    );
  }
}
