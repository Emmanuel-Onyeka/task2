import 'package:cv_hng/user.dart';
import 'package:flutter/material.dart';

class EditCvScreen extends StatefulWidget {
  const EditCvScreen({super.key});
  static const routeName = 'editPage';

  @override
  State<EditCvScreen> createState() => _EditCvScreenState();
}

class _EditCvScreenState extends State<EditCvScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController slackController = TextEditingController();
  TextEditingController githubController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  bool isInit = true;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    slackController.dispose();
    githubController.dispose();
    bioController.dispose();
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      fetchAndSetData();
      isInit = false;
    }
    super.didChangeDependencies();
  }

  void fetchAndSetData() {
    final user = ModalRoute.of(context)!.settings.arguments as User;
    nameController.text = user.fullName;
    slackController.text = user.slackName;
    githubController.text = user.githandle;
    bioController.text = user.bio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: slackController,
                decoration: InputDecoration(
                  labelText: 'Slack Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: githubController,
                decoration: InputDecoration(
                  labelText: 'Github handle',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: bioController,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Bio',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(
                      User(
                        fullName: nameController.text,
                        slackName: slackController.text,
                        githandle: githubController.text,
                        bio: bioController.text,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Confirm',
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
    );
  }
}
