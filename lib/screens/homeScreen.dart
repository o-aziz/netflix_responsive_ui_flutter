import 'package:flutter/material.dart';
import 'package:netflix_responisve_ui/data/data.dart';
import 'package:netflix_responisve_ui/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _scrollOffset = 0;
  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton(
          onPressed: () => print('Cast'),
          backgroundColor: Colors.grey[850],
          child: const Icon(Icons.cast),
        ),
        appBar: PreferredSize(
          child: CustomAppBar(
            scrollOffset: _scrollOffset,
          ),
          preferredSize: Size(screenSize.width, 50),
        ),
        body: CustomScrollView(controller: _scrollController, slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
        ]));
  }
}
