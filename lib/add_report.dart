import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddReport extends StatefulWidget {
  const AddReport({ Key? key }) : super(key: key);

  @override
  State<AddReport> createState() => _AddReportState();
}

class _AddReportState extends State<AddReport> {


  Color isColor = Colors.blueAccent;
  Color pickColor = Colors.greenAccent;

    
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 57, 201, 64),
        elevation: 0,
        title: const Text('Add Report',style: TextStyle(
          color: Colors.white,
          fontSize: 19,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic,
          fontFamily: 'Montserrat'
        ),
        ),
        centerTitle: true,
      
      ),
      
     body: SingleChildScrollView(
       scrollDirection: Axis.vertical,
       physics: const BouncingScrollPhysics(),
       child: Container(
         child: Padding(
           padding: const EdgeInsets.only(
             top: 40,
             right: 10,
             left: 10
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              buildTextForm( label: 'Name', ),
              const SizedBox(height: 10,),
              buildTextForm( label: 'Email'),
              const SizedBox(height: 10,),
              buildTextForm( label: 'Phone', ),
              const SizedBox(height: 10,),
              buildTextForm( label: 'Item', ),
              const SizedBox(height: 10,),
               Row(
                 children: [
                   Expanded(child: buildTextForm(label: 'Date', ),
                   
                   ),
                    Expanded(child: buildTextForm(label: 'Place', ),
                   
                   )
                 ],
               ),
               const SizedBox(height: 16,),
               Row(
                 children: [
                   Expanded(child: const Text('Choose Item Color',style: TextStyle(
                                                       color: Color.fromARGB(255, 24, 24, 26),
                                                       fontSize: 15,
                                                      fontWeight: FontWeight.w300,
                                                    fontStyle: FontStyle.italic,
                                                    fontFamily: 'Montserrat'
        ) ,)),
        Expanded(child:Container(
           height: 50,
                     width: 90,
                     decoration: BoxDecoration(
                       color: pickColor,
                       borderRadius: BorderRadius.circular(50),
                       boxShadow: [
                         BoxShadow(
                               color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                                         offset: Offset(0, 3), // changes position of shadow
                                         )
                       ]
                     )
        ))
        
                 ],
               ),
               const SizedBox(height: 15,),
               Center(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
                       height: 250,
                       width: 350,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(29),
                         image: DecorationImage(
                           fit: BoxFit.cover,
                           image: AssetImage('assets/images/image.jpg')
                         ),
                        
                       ),
                     ),
                     const SizedBox(height: 10,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         MaterialButton(onPressed: (){},child: Container(
                           height: 40,
                           width: 113,
                           decoration: BoxDecoration(
                             color: Color.fromARGB(255, 20, 202, 51),
                             borderRadius: BorderRadius.circular(25),
                             boxShadow: [
                                BoxShadow(
                               color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                                         offset: Offset(0, 3), // changes position of shadow
                                         )
                             ]
                           ),
                         child: Center(child: Text('Edit',style: TextStyle(
          color: Colors.white,
          fontSize: 19,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic,
          fontFamily: 'Montserrat'
        ),)),
                         )
                         ,
                         
                         ),
               MaterialButton(onPressed: (){},child: Container(
                           height: 40,
                           width: 113,
                           decoration: BoxDecoration(
                             color: Color.fromARGB(255, 20, 202, 51),
                             borderRadius: BorderRadius.circular(25),
                             boxShadow: [
                                BoxShadow(
                               color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                                         offset: Offset(0, 3), // changes position of shadow
                                         )
                             ]
                           ),
                         child: Center(child: Text('Delete',style: TextStyle(
          color: Colors.white,
          fontSize: 19,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic,
          fontFamily: 'Montserrat'
        ),)),
                         )
                         ,
                         
                         )          
                       ],
                     )
                   ],
                 ),
               ),
          
             ],
           ),
         ),
       ),
     ) 
    );
  }
}


Widget buildTextForm({

  required String label,
  
})=> Stack(
               alignment: AlignmentDirectional.topStart,
               children: [
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: Container(
                     height: 60,
                     width: double.infinity,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(27),
                       boxShadow: [
                         BoxShadow(
                               color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                                         offset: Offset(0, 3), // changes position of shadow
                                         )
                       ]
                     ),
                     
                   ),
                   
                 ),
             Container(
                   height: 30,
                   width: 130,
                   decoration: BoxDecoration(
                     color: Color.fromARGB(255, 31, 207, 25),
                     borderRadius: BorderRadius.circular(27),
                     boxShadow: [
                       BoxShadow(
                             color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                                       offset: Offset(0, 3), // changes position of shadow
                                       )
                     ]
                   ),
                   child: Center(child: Text(label,style: TextStyle(
          color: Colors.white,
          fontSize: 19,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.italic,
          fontFamily: 'Montserrat'
        ) ,),),
                 )    
               ],
             );