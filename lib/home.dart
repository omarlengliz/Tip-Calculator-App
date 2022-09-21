import 'package:flutter/material.dart';



class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {

  int _tipPercentage = 0 ; 
  int _personCounter = 5 ; 
  double _billAmount = 0.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          color : Colors.white,
          child:ListView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(20.5),
              children: [
                  Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.purple[50],
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Text("Total Per Person",style: TextStyle (fontSize: 15.0,fontWeight: FontWeight.normal,color:Colors.purple ),)
                                    ,Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text("\$ ${calculateTotalePerPerson(_billAmount,_personCounter,_tipPercentage)}" , style: TextStyle(color: Colors.purple[800],fontWeight: FontWeight.bold,fontSize:34.9 ),),
                                    )],),
                    ),
                  ),
                  Container(
                      margin:EdgeInsets.only(top:20.0) ,
                      padding: EdgeInsets.all(12.5),
                      decoration: BoxDecoration(color: Colors.transparent,
                      border: Border.all(
                        color: Colors.blueGrey.shade100,
                        style: BorderStyle.solid
                      ),
                      borderRadius: BorderRadius.circular(12.0)
                      
                      ),
                      child: Column(
                        children: [
                          TextField(
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                              style :TextStyle(color: Colors.grey),
                              decoration: InputDecoration(
                                prefixText:"Bill Amount" ,
                                prefixIcon: Icon(Icons.attach_money)
                               ),
                               onChanged:(String value)
                               {
                                 try{
                                   _billAmount=double.parse(value);
                                 }catch(exepction)
                                 {
                                      _billAmount=0.0;
                                 }
                               } ,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Split " ,
                               style: TextStyle(
                                  color: Colors.grey.shade700,
                                  )),
                                  Row(
                                    children: [
                                        InkWell(
                                          onTap: (){ 
                                          setState((){

                                              if(_personCounter>1)
                                              {
                                                _personCounter--;
                                              }else
                                              {

                                              }


                                          }) ;
                                          },
                                          child: Container(
                                            width: 40.0,
                                            height:40.0,
                                            margin:EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7.0),
                                              color:Colors.purpleAccent.withOpacity(0.1)
                                            ),
                                            child: Center(
                                              child: Text("-",
                                              style: TextStyle(
                                                color: Colors.purple,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.0 
                                              ),),
                                            ),
                                          ),
                                        ),
                                        Text("$_personCounter",style: 
                                        TextStyle
                                          (
                                            color: Colors.purple,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.0,
                                          ),),
                                              InkWell(
                                          onTap: (){ 
                                          setState((){

                                              _personCounter++;

                                          }) ;
                                          },
                                          child: Container(
                                            width: 40.0,
                                            height:40.0,
                                            margin:EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7.0),
                                              color:Colors.purpleAccent.withOpacity(0.1)
                                            ),
                                            child: Center(
                                              child: Text("+",
                                              style: TextStyle(
                                                color: Colors.purple,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.0 
                                              ),),
                                            ),
                                          ),
                                        ),
                                        
   
                                    ],
                                    
                                  )   
                            ],
                          ),
                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Tip " , 
                                                style: TextStyle(color: Colors.grey.shade700),
                                              
                                              
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(18.0),
                                                child: Text("\$ ${calculateTotaleTip(_billAmount, _personCounter,_tipPercentage)}" , style: TextStyle (
                                                  
                                                  color: Colors.purple,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17.0,

                                                
                                                ),),
                                              )


                                            ],

                                        ),
                                        Column(children: [
                                           Text("$_tipPercentage%",
                                           style: TextStyle(
                                              color: Colors.purple,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17.0,

                                           ),)
                                        ],),
                                        Slider(
                                          min:0 ,
                                          max : 100 ,
                                          activeColor : Colors.purple,
                                          inactiveColor: Colors.grey ,
                                          value: _tipPercentage.toDouble(),
                                          divisions: 10,
                                         onChanged: (double value )
                                         {
                                           setState(() {
                                             _tipPercentage =value.round() ;
                                           });
                                         }
                                         
                                         
                                         )


                        ],
                      ) ,
                  )
              ],
          ) ,

      ),


    );

  }


  calculateTotalePerPerson(double billAmount , int splitBy,int tipPercentage)
  {
    var totalPerPerson = (calculateTotaleTip(billAmount, splitBy, tipPercentage) + billAmount) / splitBy ; 
    return totalPerPerson.toStringAsFixed(2);
  }
  calculateTotaleTip(double billAmount , int splitBy , int tipPercentage)
  {
    double totalTip = 0.0 ;
    if(billAmount<0 || billAmount.toString().isEmpty || billAmount == null)
    {

    }
    else
    {
      totalTip=(billAmount*tipPercentage)/100 ; 
      return totalTip;
    }

  }

  }

