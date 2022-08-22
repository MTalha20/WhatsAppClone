import 'dart:math';
import 'package:flutter/material.dart';

class OtherStatus extends StatelessWidget {
  
  const OtherStatus(this.name, this.time, this.image, this.seen, this.statusNumber);

  final String name;
  final String time;
  final String image;
  final bool seen;
  final int statusNumber; 
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: 
            CustomPaint(
              painter: statusborder(seen: seen, number: statusNumber),
              child: CircleAvatar(
                radius: 25,
                foregroundImage: AssetImage(image)),
            ),
            title: Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(time, style: TextStyle(fontWeight: FontWeight.bold),),
          ),]          
          )  
      );
  }
}


double radian(double degree){
  return degree * pi/180;
}

class statusborder extends CustomPainter{
  @override
  
  bool seen;
  int number;

  statusborder({required this.seen, required this.number});

  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.isAntiAlias = true;
    paint.strokeWidth = 6;
    paint.color = seen ? Colors.green : Colors.grey;
    paint.style = PaintingStyle.stroke;
    circularPartitions(canvas, size, paint);
  }

  void circularPartitions(Canvas canvas,Size size, Paint paint ){

    if (number == 1)
    {
      canvas.drawArc(Rect.fromLTRB(0, 0, size.width, size.height), radian(0), radian(360), false, paint);
    }
    else 
    {
      double angle_1  = -90;
      double  angle_2 = 360/number;
      for (int i = 0 ; i < number; i++)
      {
        canvas.drawArc(Rect.fromLTRB(0, 0, size.width, size.height), radian(angle_1 + 6), radian(angle_2 - 12), false, paint);
        angle_1 += angle_2;
        
      }
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    return true;
  
  }

}

