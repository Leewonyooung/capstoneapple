import 'package:flutter/material.dart';
import 'food.dart';
void main() {
  runApp(Cramble1());
}


class Cramble1 extends StatelessWidget {
  const Cramble1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          cramble(),
        ]),
      ),
    );
  }
}


class cramble extends StatelessWidget {
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
              onPressed: (){
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
                          '재료 : 사과, 박력분, 베이킹파우더, 설탕, 버터, 달걀, 시나몬 가루,소금, 레몬즙',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1,
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
                                text: '큰 볼에 박력분 300g, 베이킹파우더 5g, 설탕 100g, 버터 85g, 달걀 1개, 시나몬 가루 약간, 소금 조금을 넣고 고루 섞어 소보루를 만든다.\n소보루를 냉동실에 잠시동안 보관한다.\n깨끗이 씻은 사과는 잘게 썰어준다.\n냄비에 손질한 사과를 넣고 설탕 80g, 버터 30g, 시나몬 조금, 레몬즙 조금을 넣고 중불에서 끓인 후, 식힌다.\n오븐 용기에 졸인 사과를 올리고 그 위에 소보루를 가득 올린다.\n180도로 예열한 오븐에 20분간 굽는다.\n블루베리 또는 딸기와 함께 곁들여 먹으면 더욱 좋다.',
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
                    '사과크럼블',
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
                      image: AssetImage('assets/images/크럼블.jpg'),
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
