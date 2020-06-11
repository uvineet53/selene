import 'package:selene/services/auth.dart';

Future<void> signInWIthGoogle(AuthBase auth) async {
  try {
    await auth.signInWithGoogle();
  } catch (e) {
    print(e);
  }
}

Future<void> signOut(AuthBase auth) async {
  try {
    await auth.signOut();
  } catch (e) {
    print(e);
  }
}

Future<String> getDpUrl(AuthBase auth) async {
  final user = await auth.currentUser();
  final dpUrl = user.photoUrl.toString();
  return dpUrl;
}

Future<String> getFname(AuthBase auth) async {
  final user = await auth.currentUser();
  final username = user.displayName;
  final firstName = username.substring(0, username.indexOf(" "));
  return firstName;
}

Future<String> getLname(AuthBase auth) async {
  final user = await auth.currentUser();
  final username = user.displayName;
  final lastname = username.substring(username.indexOf(" "));
  return lastname;
}
