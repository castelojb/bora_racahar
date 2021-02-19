import 'package:bora_rachar/components/inputFilds.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:easy_localization/easy_localization.dart';


class QuotaCalc extends StatefulWidget {

  String peoples ='';

  String price = '';

  String quote_valor = '0.00';

  FlutterTts flutterTts = FlutterTts();

  QuotaCalc();

  @override
  _QuotaCalcState createState() => _QuotaCalcState();
}

class _QuotaCalcState extends State<QuotaCalc> {

   void calcQuote(){

     if (widget.peoples.isEmpty || widget.price.isEmpty) {
       setState(() {
         widget.quote_valor = '0.00';
       });

     }

     var peoples = double.tryParse(widget.peoples);
     var price = double.tryParse(widget.price);


     if (peoples == 0 ) return;

     var quote = price/peoples;

     setState(() {
       widget.quote_valor = quote.toStringAsFixed(2);
     });


   }
   void onChangePrice(String text){
     setState(() {
       widget.price = text;
     });

     calcQuote();

   }

   void onChangePeople(String text){

     setState(() {
       widget.peoples = text;
     });

     calcQuote();

  }

  void share_valor(){
     Share.share('share_text'.tr().toString() + widget.quote_valor + 'share_text_complement'.tr().toString());
  }

  Future speach_racha() async {
    await widget.flutterTts.speak('share_text'.tr().toString() + widget.quote_valor + 'share_text_complement'.tr().toString());
  }

  @override
  Widget build(BuildContext context) {



    NumericInput number_people = new NumericInput('people'.tr().toString(), onChangePeople);

    NumericInput price = new NumericInput('price'.tr().toString(), onChangePrice);


    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,

      children: <Widget>[


        Flexible(child: Row(
          children: [

            Expanded(child: Icon(
              Icons.monetization_on,
              size: 50,
              color: Colors.blueAccent,),
            ),

            Expanded(
              child: price,
              flex: 2,
            ),

          ],
        ),
        ),
        Flexible(child: Row(
          children: [
            Expanded(
              child: Icon(
                Icons.people,
                size: 50,
                color: Colors.blueAccent,
              ),
            ),
            Expanded(
              child: number_people,
              flex: 2,
            ),
          ],
        ),
        ),
        Expanded(child:Center(

          child: Text(
              "racha_text".tr().toString() + widget.quote_valor + 'share_text_complement'.tr().toString(),
          style: TextStyle(

            color: Colors.blueAccent,
            fontSize: 25,

          ),
          ),
        )
        ),

        Flexible(
          child: Row(
            children:[
             Expanded(child:Material(

                child: Center(
                  child: Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.blueAccent,
                      shape: CircleBorder()
                    ),
                    child: IconButton(
                      icon: Icon(Icons.share),
                      color: Colors.white,
                      onPressed: share_valor,
                    ),
                  ),
                ),
              ),
             ),

              Expanded(child:Material(

                child: Center(
                  child: Ink(
                    decoration: const ShapeDecoration(
                        color: Colors.blueAccent,
                        shape: CircleBorder()
                    ),
                    child: IconButton(
                      icon: Icon(Icons.multitrack_audio),
                      color: Colors.white,
                      onPressed: speach_racha,
                    ),
                  ),
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



