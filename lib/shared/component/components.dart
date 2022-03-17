import 'package:flutter/material.dart';
Widget buildPersonItem() {
  return Padding(
    padding: const EdgeInsets.all(9),
    child: Row(
      children: [
        const CircleAvatar(
          child: Icon(
            Icons.person,
            size: 30,
          ),
        ),
        const SizedBox(width: 20),
        const Text('Patient Name'),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.chat)),
        const SizedBox(width: 8,),
        IconButton(onPressed: () {}, icon: const Icon(Icons.person))
      ],
    ),
  );


}

Widget patientBuilder(){
  return ListView.separated(
      itemBuilder: (context, index) => buildPersonItem(),
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Divider(
          height: 3,
          color: Colors.grey,
        ),
      ),
      itemCount: 10);
}

Widget measurementItem(
    {
      @required String? title,
      @required String? measurement,
      @required IconData? icon
    })
{

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 95,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const SizedBox(width: 20,),
            Expanded(
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$title',style: const TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text('$measurement',style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                    ),
                  ],
                )
            ),
            Center(child: Icon(icon)),
            const SizedBox(width: 20,)
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
    ),
  );
}

Widget notificationItem(){
  return Padding(
    padding: const EdgeInsets.only(top: 10,bottom: 10),
    child: Row(
      children: [
        const SizedBox(width: 20,),
        CircleAvatar(
          radius: 30.0,

          child: ClipOval(
            child: Image.network('https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-6/273002158_1347655305699750_8217268371809239581_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeGeM-IXFkHMgopHeuifGcLiPhJkEke6y9o-EmQSR7rL2uHsjyTspjchTwjTfQ0ZtXKhkzVjMgjwk2YUBH9ctseA&_nc_ohc=3l5LVpPf_lYAX_0TN4f&_nc_ht=scontent.faly1-2.fna&oh=00_AT_Wm2Tbzk9qr3ZBASyzlc166UhN6BJkFuXmj4SoseMfUw&oe=6227D658',
            fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20,),
        const Expanded(child: Text('patient name')),
        const CircleAvatar(
          radius: 6.0,
          backgroundColor: Colors.red,
        ),
        const SizedBox(width: 20,),
      ],
    ),
  );
}

Widget notificationBuilder(){
  return ListView.separated(
      itemBuilder: (context, index) => notificationItem(),
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Divider(
          height: 3,
          color: Colors.grey,
        ),
      ),
      itemCount: 10);
}

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
