import 'package:flutter/material.dart';
import 'package:impactapp/data/models/user_model.dart';

class UserListItem extends StatelessWidget {
  final UserModel user;
  final VoidCallback onTap;

  const UserListItem({required this.user, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          // color: Color.fromARGB(255, 33, 32, 32),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            // Curve the edges with 14dp radius
            color: Color.fromARGB(255, 33, 32, 32), // Add background color
          ),
          height: MediaQuery.of(context).size.height / 6 - 20,
          child: Center(
            child: ListTile(
              leading: Container(
                color: Color.fromARGB(255, 33, 32, 32),
                margin: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 62, 61, 61),
                  backgroundImage: NetworkImage(user.avatar),
                ),
              ),
              title: Text(
                '${user.firstName} ${user.lastName}',
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'SFPro',
                  fontWeight: FontWeight.w600,
                  color: Color(0xffffffff),
                ),
              ),
              subtitle: Text(
                user.email,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'SFPro',
                  fontWeight: FontWeight.w400,
                  color: Color(0xffffffff),
                ),
              ),
              onTap: onTap,
            ),
          ),
        ),
      ),
    );
  }
}
//MediaQuery.of(context).size.height / 4