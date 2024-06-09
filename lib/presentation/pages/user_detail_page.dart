import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:impactapp/core/utils/ui_strings.dart';
import 'package:impactapp/data/repositories/user_repository.dart';
import 'package:impactapp/presentation/blocs/user_bloc.dart';

class UserDetailPage extends StatelessWidget {
  final int userId;

  const UserDetailPage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _animate = true;
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        foregroundColor: Color(0xffffffff),
        backgroundColor: Color(0xff000000),
        title: const Text(userDetails,
            style: TextStyle(
              fontFamily: 'SFPro',
              fontWeight: FontWeight.w500,
              color: Color(0xffffffff),
            )),
      ),
      body: BlocProvider(
        create: (context) => UserBloc(UserRepository())..add(FetchUserDetail(userId)),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserDetailLoaded) {
              final user = state.user;
              return Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: AvatarGlow(
                      animate: _animate,
                      glowColor: Colors.red,
                      child: Material(
                        elevation: 8.0,
                        shape: const CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[100],
                          radius: 40.0,
                          backgroundImage: NetworkImage(user.avatar),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontFamily: 'SFPro',
                      fontWeight: FontWeight.w500,
                      color: Color(0xffffffff),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.email,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'SFPro',
                      fontWeight: FontWeight.w400,
                      color: Color(0xffffffff),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      height: 0.2,
                      color: Color.fromARGB(255, 103, 97, 97),
                      indent: BorderSide.strokeAlignCenter,
                    ),
                  )
                ],
              );
            } else if (state is UserError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
