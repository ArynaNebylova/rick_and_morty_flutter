import 'package:flutter/material.dart';
import 'package:rick_and_morty/character_model.dart';
import 'package:rick_and_morty/graphQL_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick And Morty',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Rick And Morty'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CharacterModel>? list;
  GraphQLService graphQLService = GraphQLService();

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    list = null;
    list = await graphQLService.getCharacters(limit: 5);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: list == null
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              )
            : list!.isEmpty
                ? const Center(
                    child: Text('no characters'),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                      leading: const Icon(Icons.star),
                      title: Text(list![index].name),
                      subtitle: Text(list![index].species),
                    ),
                    itemCount: list!.length,
                  ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
