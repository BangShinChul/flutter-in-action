import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const MyHomePage(title: 'Hot Reload Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // _counter에 1을 합산합니다.
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // _counter에 1을 차감합니다.
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  // _counter를 0으로 초기화합니다.
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // Column 위젯은 자식들을 열로 배치한다.
          // MainAxisAlignment는 CSS의 FlexBox와 비슷한 정렬 프로퍼티를 제공한다. 정렬 프로퍼티는 Column의 자식들을 서로 어떻게 배치할 지 결정한다.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 어떤 위젯은 한 개의 자식이 아니라 여러 위젯 자식을 갖는다.
            Container(
              margin: const EdgeInsets.only(
                  bottom:
                      100.0), // 위젯 사이의 간격 설정. EdgeInsets.only 생성자는 여백을 어디에 추가할 지 설정하는 생성자이다.
              padding: const EdgeInsets.all(
                  8.0), // 현재 위젯 주변에 공간 추가. EdgeInsets.all은 모든 면에 공간을 추가하는 생성자이다.
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.25), // 배경색을 설정한다.
                borderRadius: BorderRadius.circular(
                    4.0), // BorderRadius는 여러 생성자를 제공함. circular로 상자의 모든 귀퉁이를 둥그렇게 만들 수 있다.
              ),
              child: Image.asset('lib/images/smile_face.png', width: 200.0),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              // Row 위젯은 왼쪽에서 오른쪽으로 수평축으로 자식을 배치한다.
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                PanicButton(
                  display: const Text("Decrement"),
                  onPressed: _decrementCounter,
                ),
                PanicButton(
                  display: const Text("Increment"),
                  onPressed: _incrementCounter,
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'Reset Counter',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

///
class PanicButton extends StatelessWidget {
  final Widget display;
  final VoidCallback onPressed;

  const PanicButton({Key? key, required this.display, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: display,
      onPressed: onPressed,
    );
  }
}
