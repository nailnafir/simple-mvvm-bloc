import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvvm_bloc/bloc/user_bloc.dart';
import 'package:flutter_mvvm_bloc/ui/user_card.dart';

class MainPage extends StatelessWidget {
  final Random random = Random();
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc bloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          "MVVM BLOC",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepOrange,
              textStyle: Theme.of(context).textTheme.button,
            ),
            onPressed: () {
              bloc.add(FetchUser(id: random.nextInt(10) + 1));
            },
            child: const Text("Pilih Pengguna Acak"),
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserInitial) {
                return Container();
              } else if (state is UserLoaded) {
                return UserCard(user: state.user);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
