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
              final userEmail = vote.get('user_email');
              final choicedGender = vote.get('choice_gender');
              final createdAt = vote.get('created_at');

              final voteToAdd = VotesList(
                user: userEmail,
                gender: choicedGender,
                createdAt: createdAt.toDate(),
              );
              votesList.add(voteToAdd);
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
  VotesList({this.user, this.gender, this.createdAt});

  final String user;
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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(
                      Icons.account_circle,
                      color: gender == 'male'
                          ? Colors.lightBlueAccent
                          : Colors.purpleAccent,
                    ),
                  ),
                  Text(
                    '$user',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'ArchitectsDaughter',
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                '$gender',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: gender == 'female'
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
