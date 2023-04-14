// ignore_for_file: library_private_types_in_public_api

import 'package:dep_app/page/fac_mem.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddFacultyMemberPage extends StatefulWidget {
  const AddFacultyMemberPage({super.key});

  @override
  _AddFacultyMemberPageState createState() => _AddFacultyMemberPageState();
}

class _AddFacultyMemberPageState extends State<AddFacultyMemberPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _photoUrlController = TextEditingController();
  final TextEditingController _websiteUrlController = TextEditingController();
  final TextEditingController _facebookUrlController = TextEditingController();
  final TextEditingController _twitterUrlController = TextEditingController();
  final TextEditingController _linkedinUrlController = TextEditingController();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Faculty Member'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _positionController,
                decoration: const InputDecoration(
                  labelText: 'Position',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a position';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _photoUrlController,
                decoration: const InputDecoration(
                  labelText: 'Photo URL',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a photo URL';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _websiteUrlController,
                decoration: const InputDecoration(
                  labelText: 'Website URL',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a website URL';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _facebookUrlController,
                decoration: const InputDecoration(
                  labelText: 'Facebook URL',
                ),
              ),
              TextFormField(
                controller: _twitterUrlController,
                decoration: const InputDecoration(
                  labelText: 'Twitter URL',
                ),
              ),
              TextFormField(
                controller: _linkedinUrlController,
                decoration: const InputDecoration(
                  labelText: 'LinkedIn URL',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FacultyMember facultyMember = FacultyMember(
                      name: _nameController.text,
                      position: _positionController.text,
                      photoUrl: _photoUrlController.text,
                      websiteUrl: _websiteUrlController.text,
                      socialMediaLinks: {
                        'facebook': _facebookUrlController.text,
                        'twitter': _twitterUrlController.text,
                        'linkedin': _linkedinUrlController.text,
                      },
                    );
                    _addFacultyMember(facultyMember);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }

 
void _addFacultyMember(FacultyMember facultyMember) {
    _db.collection('faculty_members').add({
      'name': facultyMember.name,
      'position': facultyMember.position,
      'photo_url': facultyMember.photoUrl,
      'website_url': facultyMember.websiteUrl,
      'social_media_links': facultyMember.socialMediaLinks,
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Faculty member added')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding faculty member: $error')),
      );
    });
  }
    }