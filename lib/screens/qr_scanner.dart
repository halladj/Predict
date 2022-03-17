import "package:flutter/material.dart";



class QRCodeScanner extends StatelessWidget{
  
  const QRCodeScanner({
    Key? key
  }): super(key: key);

  @override 
  Widget build(BuildContext context){
    return Padding(
        padding:const EdgeInsets.all(18.0),
        child: Container(
            child:const Center(
                child: SizedBox(
                    height: 100,
                    width: 250,
                    child: Card(
                        child: Center(
                            child: Text(
                                "Camera",
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: 
                                      FontWeight.bold
                                    ),
                            )
                        ),
                    ),
                ),

            ),
            color: Colors.red
        ),
    );
  }
}
