import 'package:flutter/material.dart';
import 'pagemodel.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  List<PageModel> pages;

  int _currentIndex = 0;

  void _addPages(){
    pages = List<PageModel>();
    pages.add(PageModel('Welcome',
        '1- Making friends is easy as waving your hand back and forth in easy step',
        Icons.ac_unit, 'assets/images/bg.png'));
    pages.add(PageModel('Alarm',
        '2- Making friends is easy as waving your hand back and forth in easy step',
        Icons.access_alarms, 'assets/images/bg3.png'));
    pages.add(PageModel('Print',
        '3- Making friends is easy as waving your hand back and forth in easy step',
        Icons.map, 'assets/images/bg.png'));
    pages.add(PageModel('Map',
        '4- Making friends is easy as waving your hand back and forth in easy step',
        Icons.ac_unit, 'assets/images/bg4.png'));
  }

  @override
  Widget build(BuildContext context) {
    _addPages();

    return Stack(
        children: <Widget>[
          Scaffold(
            body: PageView.builder(
              itemBuilder: (context, index) {
                return Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage(
                            pages[ index ].image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Transform.translate(
                          child: Icon(
                            pages[ index ].icon,
                            size: 150,
                            color: Colors.white,
                          ),
                          offset: Offset(0, -100),
                        ),
                        Text(
                          pages[index].title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 48, right: 48, top: 18),
                          child: Text(
                            pages[ index ].description,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
              itemCount: pages.length,
              onPageChanged: ( index ){
                setState(() {
                  _currentIndex = index;
                });
                print( _currentIndex );
              },
            ),
          ),
          Transform.translate(
            offset: Offset(0, 175),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _drawPageIndicators(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  color: Colors.red.shade900,
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      );
  }

  List<Widget> _drawPageIndicators(){
    List<Widget> _widgets = List<Widget>();
    for( int i = 0; i < pages.length; i++ ){
      _widgets.add( _drawCircle( Colors.red ) );
    }
    return _widgets;
  }


  Widget _drawCircle( Color color ){
    return Container(
      margin: EdgeInsets.only( right: 8 ),
      width: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

}

class PageIndicator{
  int _index;
  Color color;

  PageIndicator(this._index, this.color);

  Widget _drawCircle( Color color ){
    return Container(
      margin: EdgeInsets.only( right: 8 ),
      width: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }


}


