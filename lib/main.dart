import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_restapi_firebase/bloc/product_bloc.dart';
import 'package:flutter_bloc_restapi_firebase/repo/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';
import 'home.dart';
import 'model/product_model.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(MaterialApp(
    home: RepositoryProvider(
      create: (context) => ProductRepository(),
      child: const Home(),
    ),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocProvider(
      create: (context) => ProductBloc(
          productRepository: RepositoryProvider.of<ProductRepository>(context)),
      child: HomePage(),
    );
  }
}
