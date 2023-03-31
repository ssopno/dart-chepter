
import 'package:flutter/material.dart';
import '../../data/auth_utils.dart';
import '../screens/login.dart';
import '../screens/update_profile_screen.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String,String>ProfileData={"photo":defaultProfilePic};
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const UpdateProfileScreen()));
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      leading:  CircleAvatar(child: Image.memory(showBase64Image(ProfileData['photo'])),),
      tileColor: Colors.green,
      title: Text('${AuthUtils.firstName ?? ''} ${AuthUtils.lastName ?? ''}'),
      subtitle: Text(AuthUtils.email ?? 'Unknown'),
      trailing: IconButton(
        onPressed: () async {
          await AuthUtils.clearData();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) => LoginScreen()), (route) => false);
        },
        icon: const Icon(Icons.logout, color: Colors.white,),
      ),
    );
  }
}