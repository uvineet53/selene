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
