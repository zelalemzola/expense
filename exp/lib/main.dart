import "package:bloc/bloc.dart";
import "package:exp/app.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "simple_bloc_observer.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('Initializing Firebase...');
  await Firebase.initializeApp();
  print('Firebase initialized');
  Bloc.observer = SimpleBlocObserver();
  print('Bloc observer set');
  runApp(const MyApp());
}

