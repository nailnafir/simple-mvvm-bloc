import 'package:flutter/material.dart';
import 'package:flutter_mvvm_bloc/model/user.dart';

class UserCard extends StatelessWidget {
  final User? user;
  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(user!.avatar!),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ID: ${user!.id}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Nama: ${user!.firstName} ${user!.lastName}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Email: ${user!.email}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
