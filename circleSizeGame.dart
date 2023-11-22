import 'package:flutter/material.dart';

class circleSize extends StatefulWidget{
  @override
  State<circleSize> createState()=> _circleSizeState();
}

class _circleSizeState extends State<circleSize>{
  double vall=10;
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Hello"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
        Container(
          width: double.infinity,
          height: 500,
          child:CustomPaint(
            painter: ShapesPainter(sz: vall),
          ),
        ),
        SizedBox(height: 20,),
        Slider(
          value: vall,
          onChanged: (value){
            setState(() {
              vall=value;
            });
          },
          min:10,
          max:200
        )
    ]
      ),
    );
  }

}

class ShapesPainter extends CustomPainter{
  final double sz;
  ShapesPainter({required this.sz});
  @override
  void paint(Canvas canvas, Size size){
    final paint=Paint()
       ..color=Colors.blue
       ..style=PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width*1/2, size.height*1/4),sz,paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>false;

}