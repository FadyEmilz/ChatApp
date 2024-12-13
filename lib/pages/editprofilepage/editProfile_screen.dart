import 'package:chatapp/controllers/edit_controller.dart';
import 'package:chatapp/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late EditController controller ;
  @override
  void initState() {
    controller = EditController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _saveUsername() {
    if (_formKey.currentState!.validate()) {
      String newUsername = _usernameController.text.trim();
      controller.editUserName(newName: _usernameController.text, context: context);
      Provider.of<UsersProvider>(context,listen: false).getData();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Username updated to $newUsername")),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UsersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Edit Username",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  hintText: userProvider.userName,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Username cannot be empty";
                  }
                  if (value.length < 3) {
                    return "Username must be at least 3 characters";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveUsername,
                child: Text("Save"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
