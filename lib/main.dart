
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


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
    // getAllBooks();
  }

  Future<void> getAllBooks() async {
    _getBooksInProgress = true;
    setState(() {});
    books.clear();
    await firebaseFirestore.collection('books').get().then((documents) {
      for (var doc in documents.docs) {
        books.add(
            BookList(doc.get('name'), doc.get('writter'), doc.get('year')));
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
      body: StreamBuilder<QuerySnapshot>(
          stream: firebaseFirestore.collection('books').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
              books.clear();
              for (var doc in snapshot.data!.docs) {
                books.add(BookList(
                    doc.get('name'), doc.get('writter'), doc.get('year')));
              }

              return ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(books[index].name),
                      subtitle: Text(books[index].writter),
                      trailing: Text(books[index].year),
                    );
                  });
            } else {
              return const Center(
                child: Text('No Data available'),
              );
            }
          }),
    );
  }
}

class BookList {
  final String name, writter, year;

  BookList(this.name, this.writter, this.year);
}
