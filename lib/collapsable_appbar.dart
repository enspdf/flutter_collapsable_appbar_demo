import 'package:flutter/material.dart';

class CollapsableAppbar extends StatefulWidget {
  CollapsableAppbar() : super();

  final String title = 'Collapsable Appbar';

  @override
  CollapsableAppbarState createState() => CollapsableAppbarState();
}

class CollapsableAppbarState extends State<CollapsableAppbar> {
  custom() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              'Collapsing bar',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            background: Image.network(
              'https://picsum.photos/350',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
                  title: Text('List Item $index'),
                ),
          ),
        ),
      ],
    );
  }

  nested() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Collapsing bar',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              background: Image.network(
                'https://picsum.photos/350',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ];
      },
      body: Center(
        child: Text('Network Image Sample'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //child: nested(),
        child: custom(),
      ),
    );
  }
}
