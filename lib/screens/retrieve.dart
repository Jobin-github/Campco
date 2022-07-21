import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class retrieve extends StatelessWidget {
  const retrieve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => Container(
                    child: Row(
                      children: [

                        Container(
                          width: 240,height: 40,
                          child: Text(snapshot.data!.docs[index]['Name']),
                        ),
                        Container(
                          child: Text(snapshot.data!.docs[index]['Mail']),

                        )
                      ],
                    )
                    
                    
                    
                  )
                  );
                  

            } else {
              return Container();
            }
            
          },
        ),
        
        
      ),
      
    );
  }
}
