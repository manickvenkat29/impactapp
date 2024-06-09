import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:impactapp/data/repositories/user_repository.dart';
import 'package:impactapp/presentation/blocs/user_bloc.dart';
import 'package:impactapp/presentation/pages/user_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(UserRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User List App',
        theme: ThemeData(
          fontFamily: 'SFPro',
          primarySwatch: Colors.blue,
        ),
        home: UserListPage(),
      ),
    );
  }
}
