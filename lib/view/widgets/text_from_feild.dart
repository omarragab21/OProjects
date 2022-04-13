import 'package:flutter/material.dart';

class MyformTextFeild extends StatelessWidget {
 final String label;
 final TextEditingController controller;
 final IconData iconData;
 final Function(String) function;
  Function()? functionTime ;
   MyformTextFeild({ Key? key,  required this.controller, required this.label, required this.function, required this.iconData,this.functionTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      onTap: ()=>functionTime,
      validator: (String ?value)=>function(value!),
      decoration: InputDecoration(
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(color:  Color.fromRGBO(105, 71, 255, 1))
        ),
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(color:  Color.fromRGBO(105, 71, 255, 1))
        ),
        prefixIcon: Icon(iconData,color:const Color.fromRGBO(105, 71, 255, 1) ,) 
      ),
    );
  }
}