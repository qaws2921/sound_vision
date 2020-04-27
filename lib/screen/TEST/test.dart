import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soundvision/screen/TEST/bloc/post_event.dart';
import 'package:soundvision/screen/TEST/bloc/post_state.dart';
import 'package:soundvision/screen/TEST/post.dart';
import 'package:soundvision/screen/TEST/post_bloc.dart';



class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Infinite Scroll',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: BlocProvider(
          create: (context) =>
          PostBloc(httpClient: http.Client())..add(Fetch()),
          child: TestPage(),
        ),
      ),
    );
  }
}


class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  PostBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _postBloc = BlocProvider.of<PostBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("조회"),
            onPressed: () {
              setState(() {
                    (context) =>
                PostBloc(httpClient: http.Client())..add(Fetch());
                //_postBloc.add(Fetch());
              });
            },
          ),

          Expanded(
          child: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state is PostUninitialized) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PostError) {
                return Center(
                  child: Text('failed to fetch posts'),
                );
              }
              if (state is PostLoaded) {
                if (state.posts.isEmpty) {
                  return Center(
                    child: Text('no posts'),
                  );
                }
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return index >= state.posts.length
                        ? BottomLoader()
                        : PostWidget(post: state.posts[index]);
                  },
                  itemCount: state.hasReachedMax
                      ? state.posts.length
                      : state.posts.length + 1,
                  controller: _scrollController,
                );
              }
            },
          ),
        )
          ]
      ),
    );
  }



  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _postBloc.add(Fetch());
    }
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${post.id}',
        style: TextStyle(fontSize: 10.0),
      ),
      title: Text(post.title),
      isThreeLine: true,
      subtitle: Text(post.body),
      dense: true,
    );
  }
}