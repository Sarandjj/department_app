// ignore_for_file: library_private_types_in_public_api

import 'package:dep_app/add_fac.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FacultyMember {
  final String name;
  final String position;
  final String photoUrl;
  final String websiteUrl;
  final Map<String, String> socialMediaLinks;

  FacultyMember({
    required this.name,
    required this.position,
    required this.photoUrl,
    required this.websiteUrl,
    required this.socialMediaLinks,
  });
}

class FacultyMembersPage extends StatefulWidget {
  const FacultyMembersPage({super.key});

  @override
  _FacultyMembersPageState createState() => _FacultyMembersPageState();
}

class _FacultyMembersPageState extends State<FacultyMembersPage> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty Members'),
        actions: [
          Visibility(
            visible: false,
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddFacultyMemberPage()),
                );
                // navigate to add new member page
              },
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 7, 8, 98),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _db.collection('faculty_members').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          List<FacultyMember> facultyMembers = snapshot.data!.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return FacultyMember(
              name: data['name'],
              position: data['position'],
              photoUrl: data['photo_url'],
              websiteUrl: data['website_url'],
              socialMediaLinks:
                  Map<String, String>.from(data['social_media_links']),
            );
          }).toList();

          return ListView.builder(
            itemCount: facultyMembers.length,
            itemBuilder: (context, index) {
              FacultyMember facultyMember = facultyMembers[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        child: Center(
                          child: Image.network(facultyMember.photoUrl),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(facultyMember.name),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(facultyMember.position),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          facultyMember.websiteUrl,
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ), // Add this line
                    ],
                  ),
                  subtitle:
                      _buildSocialMediaIcons(facultyMember.socialMediaLinks),
                  onTap: () {
                    // navigate to faculty member details page
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildSocialMediaIcons(Map<String, String> socialMediaLinks) {
    List<Widget> icons = [];
    socialMediaLinks.forEach((key, value) {
      IconData iconData = Icons.error;
      switch (key) {
        case 'facebook':
          iconData = Icons.facebook;
          break;
        case 'twitter':
          iconData = Icons.tab;
          break;
        case 'linkedin':
          iconData = Icons.label_important;
          break;
        default:
          break;
      }
      if (iconData != Icons.error) {
        icons.add(
          IconButton(
            icon: Icon(iconData),
            onPressed: () {
              // ignore: deprecated_member_use
              launch(value);
            },
          ),
        );
      }
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: icons,
    );
  }
}
