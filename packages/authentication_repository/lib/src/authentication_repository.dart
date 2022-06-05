import 'dart:async';
import 'dart:convert';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:cache/cache.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:meta/meta.dart';

/// {@template sign_up_with_email_and_password_failure}
/// Thrown if during the sign up process if a failure occurs.
/// {@endtemplate}
class SignUpWithEmailAndPasswordFailure implements Exception {
  /// {@macro sign_up_with_email_and_password_failure}
  const SignUpWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

/// {@template log_in_with_email_and_password_failure}
/// Thrown during the login process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
/// {@endtemplate}
class LogInWithEmailAndPasswordFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {
  final String message;
  const LogOutFailure([
    this.message = 'An unknown exception occurred.',
  ]);
}

/// {@template authentication_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class AuthenticationRepository {
  /// {@macro authentication_repository}
  AuthenticationRepository({
    CacheClient? cache,
  }) : _cache = cache ?? CacheClient();

  final CacheClient _cache;

  /// Whether or not the current environment is web
  /// Should only be overriden for testing purposes. Otherwise,
  /// defaults to [kIsWeb]
  @visibleForTesting
  bool isWeb = kIsWeb;

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  final _controller = StreamController<User>();
  //this is the var
  final String url = 'http://172.20.10.12/api';

  Stream<User> get user async* {
//    final user = fetchedUser == null ? User.empty : fetchedUser;
//    _cache.write(key: userCacheKey, value: user);
//    return _controller.stream;
//      return user;
    await Future<void>.delayed(const Duration(seconds: 1));
    yield currentUser;
    yield* _controller.stream;
    //final dd = {
    //  "authentication": "Bearer 1|u9jkQig3rq7tpo5OYeUQRNX0YKCv2Fmw0kDc6Jfv"
    //};
    //var data = await Dio().get<dynamic>("http://192.168.1.18/check_user",
    //    options: Options(headers: dd));
    //print("data");
    //yield User.empty;
    //yield* _controller.stream;
    //return; //_firebaseAuth.authStateChanges().map((firebaseUser) {
    //final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
    //_cache.write(key: userCacheKey, value: user);
    //return user;
    //});
  }

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  User get currentUser {
    return _cache.read<User>(key: userCacheKey) ?? User.empty;
  }

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [SignUpWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> signUp({required String email, required String password}) async {
    try {
      final data = {'email': email, 'password': password, 'name': 'hamza'};
      dynamic response = await Dio().post<dynamic>('$url/signup', data: data);
      dynamic newData = jsonDecode(response.toString());
      final dynamic inter_user = newData["user"];

      //final user = User(token: inter_user["token"].toString());
      //_controller.add(user);
      //SIGNUP CODE
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final data = {'email': email, 'password': password};
      dynamic response = await Dio().post<dynamic>('$url/login', data: data);
      dynamic newData = jsonDecode(response.toString());

      final user = User(
          //name: newData["name"].toString(),
          email: newData["email"].toString(),
          token: newData["token"].toString());

      _cache.write<User>(value: user, key: userCacheKey);
      _controller.add(user);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      dynamic response = await Dio().get<dynamic>('$url/logout',
          options: Options(
            headers: <String, String>{
              'authorization': 'Bearer ${currentUser.token}',
            },
            contentType: Headers.jsonContentType,
            validateStatus: (status) => true,
          ));
      _controller.add(User.empty);
      //LOGout CODE
    } catch (_) {
      throw LogOutFailure();
    }
  }
}
