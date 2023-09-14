import 'package:cv_hng/screens/edit_cv_screen.dart';
import 'package:cv_hng/user.dart';
import 'package:flutter/material.dart';

class CVScreen extends StatefulWidget {
  const CVScreen({super.key});
  static const routeName = 'cv_screen';

  @override
  State<CVScreen> createState() => _CVScreenState();
}

class _CVScreenState extends State<CVScreen> {
  User user = User(
    fullName: 'Amaechi Onyeka Emmanuel',
    slackName: 'Onyeka Emmanuel',
    githandle: 'Emmanuel-Onyeka',
    bio:
        'My name is Onyeka, and i\'m a student in the discipline Electronics engineering in the university of Port Harcourt, Nigeria.'
        ' I\'ve always been a tech enthusiast which is why i\'ve immersed myself into the dynamic world of '
        'technology. I am proficient in core languages like, phython, java and dart. Am also a mobile developer using flutter '
        'with closed to a year of experience. I play tennis as a hubby and also have strong passion for football',
  );
  //team player, continous learner
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curriculum vitae'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'images/profile.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  user.fullName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'amaechionyeka2002@gmail.com',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: Image.asset(
                    'images/slack.png',
                    height: 30,
                    width: 30,
                  ),
                  title: Text(
                    user.slackName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    'images/github.png',
                    height: 30,
                    width: 30,
                  ),
                  title: Text(
                    user.githandle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'About Me:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  user.bio,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(EditCvScreen.routeName, arguments: user)
                          .then((value) {
                        if (value != null) {
                          User editedUser = value as User;
                          setState(() {
                            user = editedUser;
                          });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Edit profile',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
