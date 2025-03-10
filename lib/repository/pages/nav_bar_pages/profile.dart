import 'package:flutter/material.dart';
import 'package:spliters/repository/widgets/model_bottom_sheet/logout/logout_sheet.dart';

import '../../widgets/profle/profile_item/profile_items_list.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   backgroundColor: const Color.fromARGB(255, 239, 242, 243),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.account_circle, size: 40),
                title: Text(
                  "user name",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                subtitle: Text("Naresh Kumar"),

                // subtitle: Text(
                //   FirebaseHelper.firebaseAuth.currentUser!.displayName!,
                // ),
              ),
            ),

            Flexible(
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),

                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: ProfileItemsList.allItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          color: Colors.primaries[index].withAlpha(40),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            ProfileItemsList.allItems[index]["icon"],
                            color: Colors.primaries[index],
                          ),
                        ),
                      ),
                      title: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      ProfileItemsList.profileMenupages[index],
                            ),
                          );
                        },
                        child: Text(
                          ProfileItemsList.allItems[index]["title"],
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(fontSize: 15),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),

                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      color: Colors.red.withAlpha(40),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(Icons.logout),
                    ),
                  ),
                  title: InkWell(
                    onTap: () => LogoutUserSheet.logoutSheet(context: context),
                    child: Text(
                      "LogOut",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
