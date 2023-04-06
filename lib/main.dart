import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const BookListScreen());
  }
}

class BookListScreen extends StatefulWidget {
  const BookListScreen({Key? key}) : super(key: key);

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<BookList> books = [];
  bool _getBooksInProgress = false;

  @override
  void initState() {
    super.initState();
    getAllBooks();
  }

  Future<void> getAllBooks() async {
    _getBooksInProgress = true;
    setState(() {});
    books.clear();
    await firebaseFirestore.collection('books').get().then((value) {
      for(var doc in value.docs ){
        books.add(BookList(doc.get('name'), doc.get('writter'),doc.get('year')));
      }
    });
    _getBooksInProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Collection'),
      ),
      body: _getBooksInProgress
          ? const Center(
          child: CircularProgressIndicator()
      )
          : RefreshIndicator(
        onRefresh:()async {
          getAllBooks();
        },
            child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(books[index].name),
                    subtitle: Text(books[index].writter),
                    trailing: Text(books[index].year),
                  );
                }),
          ),
    );
  }
}

class BookList {
  final String name, writter, year;

  BookList(this.name, this.writter, this.year);
}
