import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_state.dart';
part 'authentication_event.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthenticationBloc() : super(AuthenticationInitial());

  @override
  Future<AuthenticationState> mapEventToState(AuthenticationEvent event) async {
    if (event is AppStarted) {
      return _mapAppStartedToState();
    } else if (event is UserLoggedIn) {
      return _mapUserLoggedInToState();
    } else if (event is UserLoggedOut) {
      return _mapUserLoggedOutToState();
    } else {
      throw UnimplementedError();
    }
  }

  Future<AuthenticationState> _mapAppStartedToState() async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      return AuthenticationSuccess();
    } else {
      return AuthenticationInitial();
    }
  }

  Future<AuthenticationSuccess> _mapUserLoggedInToState() async {
    return AuthenticationSuccess();
  }

  Future<AuthenticationInitial> _mapUserLoggedOutToState() async {
    await _auth.signOut();
    return AuthenticationInitial();
  }

  Future<void> signUp(String email, String password, String fullName) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
      });
    } catch (e) {
    }
  }
}




