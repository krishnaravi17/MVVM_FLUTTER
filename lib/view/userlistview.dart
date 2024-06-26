// views/user_list_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../viewmodels/user_viewmodel.dart';

class UserListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: FutureBuilder(
        future: userViewModel.fetchUsers(),
        builder: (context, snapshot) {
          print("snapshot.connectionState ${snapshot.connectionState }");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            print("snapshot.connectionState 2 ${snapshot.connectionState }");
            return (userViewModel.users.length>0)?ListView.builder(
              itemCount: userViewModel.users.length,
              itemBuilder: (context, index) {
                User user = userViewModel.users[index];
                return ListTile(
                  title: Text(user?.name??""),
                  subtitle: Text(user?.email??""),
                );
              },
            ): Center(child: Text('Error: SoMe ThInG WeNt WoRnG!'));
          }
        },
      ),
    );
  }
}
