import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ASFastAndFuel2FirebaseUser {
  ASFastAndFuel2FirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

ASFastAndFuel2FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ASFastAndFuel2FirebaseUser> aSFastAndFuel2FirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ASFastAndFuel2FirebaseUser>(
            (user) => currentUser = ASFastAndFuel2FirebaseUser(user));
