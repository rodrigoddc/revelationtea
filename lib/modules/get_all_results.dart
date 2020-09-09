import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListAllResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('votes')
            .orderBy('created_at', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return new Text("There is no votes");
          } else {
            final votes = snapshot.data.docs;

            List<VotesList> votesList = [];

            for (var vote in votes) {
              //only get username from email
              if (vote.get('user_email') != 'link_live') {
                final String userEmail = vote.get('user_email');
                final userName = vote.get('user_name');
                final choicedGender = vote.get('choice_gender');
                final createdAt = vote.get('created_at');

                final voteToAdd = VotesList(
                  userName: userName,
                  userEmail: userEmail,
                  gender: choicedGender,
                  createdAt: createdAt.toDate(),
                );
                votesList.add(voteToAdd);
              }
            }
            return Expanded(
              child: ListView(
                children: votesList,
              ),
            );
          }
        });
  }
}

class VotesList extends StatelessWidget {
  VotesList({this.userName, this.userEmail, this.gender, this.createdAt});

  final String userName;
  final String userEmail;
  final String gender;
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black45,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  '$userName',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ArchitectsDaughter',
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                '$gender',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: gender == 'menina'
                      ? Colors.purpleAccent
                      : Colors.lightBlueAccent,
                  fontFamily: 'ArchitectsDaughter',
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
