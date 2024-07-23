import 'package:flutter/material.dart';
import 'food.dart';
void main() {
  runApp(const Jam1());
}


class Jam1 extends StatelessWidget {
  const Jam1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Jam(),
        ]),
      ),
    );
  }
}


class Jam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 812,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Align(
          alignment: Alignment.topLeft,
          
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Food1()),
                    );
                  },
              child: const Text('이전'),
            ),
          ),
        ),
              Positioned(
                left: 1,
                top: 373,
                child: Container(
                  width: 375,
                  height: 349,
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        
                        child: Text(
                          '재료 : 사과, 설탕,  물, 레몬즙',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.12,
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '만드는 방법 : \n',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                              TextSpan(
                                text: '사과는 깨끗히 씻고 껍질을 벗겨 씨를 제거한 뒤 채를 썰어준다.\n냄비에 사과와 물을 넣고 뭉그러질 때까지 끓인 후 사과를 걸러준다.\n냄비에 채에 건 사과와 설탕을 넣고 저어가며 끓여준다.\n레몬즙을 넣고 약한 불에서 주걱으로 저어가며 졸이다가 거품을 제거한다.\n소독된 유리병에 사과잼을 넣고 밀봉하면 완성',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 1,
                top: 87,
                child: SizedBox(
                  width: 375,
                  child: Text(
                    '사과잼',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: -0.48,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 159,
                child: Container(
                  width: 345,
                  height: 200,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/jam.jpg'),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
