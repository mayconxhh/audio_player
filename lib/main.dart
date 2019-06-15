import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player screen',
      home: MyHomePage(),
    );
  }
}

final blueColor = new Color(0xFF090e42);
final pinkColor = new Color(0xFFff6b80);

class MyHomePage extends StatelessWidget {

  final imageCover = 'https://i.pinimg.com/originals/af/6f/a0/af6fa0471818551e8bcdd5dc79f5cfb4.jpg';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: blueColor,
      body: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: new ListView(
          children: <Widget>[
            new SizedBox(
              height: 32.0,
            ),
            new CustomTextField(),
            new SizedBox(
              height: 32.0,
            ),
            new Text(
              'Listas de reproducción',
              style: new TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            new SizedBox(
              height: 16.0,
            ),
            new Row(
              children: <Widget>[
                new ItemCard(imageCover, 'Audio Extremo'),
                new SizedBox(
                  width: 16.0,
                ),
                new ItemCard(imageCover, 'Paz y calma')
              ],
            ),
            new SizedBox(
              height: 32.0,
            ),
            new Row(
              children: <Widget>[
                new ItemCard(imageCover, 'Clásico'),
                new SizedBox(
                  width: 16.0,
                ),
                new ItemCard(imageCover, 'Antiguas')
              ],
            ),
            new SizedBox(
              height: 32.0,
            ),
            new Text(
              'Recomendados',
              style: new TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            new SizedBox(
              height: 16.0,
            ),
            new SongItem(
              imageCover,
              'Paramore',
              'Hard Times'
            ),
            new SongItem(
              imageCover,
              'Paramore',
              'Told you so'
            ),
            new SongItem(
              imageCover,
              'Paramore',
              'Rose Colored Boy'
            ),
            new SongItem(
              imageCover,
              'Paramore',
              'Fake Happy'
            )
          ],
        )
      ),
    );
  }
}

class SongItem extends StatelessWidget {

  final String imageCover;
  final String artist;
  final String title;

  SongItem(this.imageCover, this.artist, this.title);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=> DetailedScreen(title, artist, imageCover),
        ));
      },
      child: new Padding(
        padding: const EdgeInsets.only(bottom: 26.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Container(
                  height: 80.0,
                  width: 80.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: new Image.network(
                      imageCover,
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                new Container(
                  height: 80.0,
                  width: 80.0,
                  child: new Icon(
                    Icons.play_circle_filled,
                    color: Colors.white.withOpacity(0.7),
                    size: 42.0,
                  ),
                )
              ],
            ),
            new SizedBox(
              width: 16.0,
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  title,
                  style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                new SizedBox(
                  height: 8.0,
                ),
                new Text(
                  artist,
                  style: new TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                )
              ],
            ),
            new Spacer(),
            new Icon(
              Icons.more_horiz, 
              color: Colors.white.withOpacity(0.6),
              size: 32.0,
            )
          ],
        )
      ),
    );
  }
}

class ItemCard extends StatelessWidget {

  final String imageCover;
  final String titleCard;

  ItemCard(this.imageCover, this.titleCard);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      flex: 1,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            height: 120.0,
            child: new Stack(
              children: <Widget>[
                new ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    imageCover,
                    fit: BoxFit.cover,
                    height: 140,
                    width: double.infinity,
                  ),
                ),
                new Positioned(
                  right: 16.0,
                  top: 16.0,
                  child: new Icon(
                    Icons.bookmark,
                    color: Colors.white.withOpacity(0.6),
                    size: 24.0,
                  ),
                ),
              ], 
            ),
          ),
          new SizedBox(
            height: 8.0,
          ),
          new Text(
            titleCard,
            style: new TextStyle(
              color: Colors.white,
              fontSize: 17.0,
            ),
          )
        ],
      )
    );
  }
}

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.grey.withOpacity(0.1),
      child: new Row(
        children: <Widget>[
          new SizedBox(
            width: 8.0,
          ),
          new Icon(Icons.search, color: Colors.white),
          new SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: new TextField(
              decoration: new InputDecoration(
                hintText: 'Buscar música...',
                hintStyle: new TextStyle(
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          new SizedBox(
            width: 8.0,
          ),
          new Icon(
            Icons.mic,
            color: Colors.white,
          ),
          new SizedBox(
            width: 8.0,
          )
        ], 
      )
    );
  }
}

class DetailedScreen extends StatelessWidget {

  final String title;
  final String artist;
  final String imageCover;

  DetailedScreen(this.title, this.artist, this.imageCover);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: blueColor,
      body: new Column(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Container(
                height: 400.0,
                child: new Stack(
                  children: <Widget>[
                    new Container(
                      height: 400.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imageCover),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    new Container(
                      height: 400.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [blueColor.withOpacity(0.4), blueColor],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: new Column(
                        children: <Widget>[
                          new SizedBox(
                            height: 52.0,
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: new Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                )
                              ),
                              new Column(
                                children: <Widget>[
                                  new Text(
                                    'PLAYLIST',
                                    style: new TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  new Text(
                                    'Best vibes of the week',
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  )
                                ], 
                              ),
                              new Icon(
                                Icons.playlist_add,
                                color: Colors.white,
                              )
                            ],
                          ),
                          new Spacer(),
                          new Text(
                            title,
                            style: new TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0,
                            ),
                          ),
                          new SizedBox(
                            height: 12.0,
                          ),
                          new Text(
                            artist,
                            style: new TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 18.0,
                            ),
                          ),
                          new SizedBox(
                            height: 16.0,
                          ),
                        ],
                      )
                    )
                  ],
                )
              ),
            ],
          ),
          new SizedBox(
            height: 32.0,
          ),
          new Slider(
            onChanged: (double value){},
            value: 0.2,
            activeColor: pinkColor,
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  '2:10',
                  style: new TextStyle(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                new Text(
                  '-3:56',
                  style: new TextStyle(
                    color: Colors.white.withOpacity(0.7),
                  ),
                )
              ],
            )
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.fast_rewind,
                color: Colors.white54,
                size: 42.0,
              ),
              new SizedBox(
                width: 32.0,
              ),
              new Container(
                decoration: new BoxDecoration(
                  color: pinkColor,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: new Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 58.0,
                ),
              ),
              new SizedBox(
                width: 32.0,
              ),
              new Icon(
                Icons.fast_forward,
                color: Colors.white54,
                size: 42.0,
              )
            ],
          ),
          new Spacer(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Icon(
                Icons.bookmark_border,
                color: pinkColor,
                size: 32,
              ),
              new Icon(
                Icons.shuffle,
                color: pinkColor,
                size: 32,
              ),
              new Icon(
                Icons.repeat,
                color: pinkColor,
                size: 32,
              )
            ],
          ),
          new SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}