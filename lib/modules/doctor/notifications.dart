import 'package:flutter/material.dart';

import '../../shared/component/components.dart';

class NotificationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return notificationBuilder();

    //   Center(
    //   child: Container(
    //     child:Stack(
    //     alignment: AlignmentDirectional.bottomEnd,
    //     children: [
    //       CircleAvatar(
    //         radius: 60.0,
    //       //   backgroundImage: NetworkImage(
    //       //       'https://avatars.githubusercontent.com/u/34492145?v=4'),
    //       //
    //         backgroundColor: Colors.grey,
    //         child: Icon(Icons.person,size: 60,color: Colors.white,),
    //          ),
    //       CircleAvatar(
    //         radius: 19.0,
    //         backgroundColor: Colors.white,
    //         child: Icon(Icons.camera_alt,size: 20,color: Colors.white,),
    //       ),
    //       Padding(
    //         padding: const EdgeInsetsDirectional.only(
    //           bottom: 2.0,
    //           end: 2.0,
    //         ),
    //         child: CircleAvatar(
    //           radius: 16.0,
    //           backgroundColor: Colors.grey,
    //           child: Icon(Icons.camera_alt,size: 20,color: Colors.white,),
    //         ),
    //       ),
    //     ],
    //   ),),
    // );
  }
}
