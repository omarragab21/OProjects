import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTextFeild extends StatelessWidget {
 final String label;
 final TextEditingController controller;
 final IconData iconData;
 final Function(String) function;

   DateTextFeild({ Key? key,  required this.controller, required this.label, required this.function, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      onTap: (){
     showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2019), lastDate: DateTime(2090)).then((value) {
       controller.text = DateFormat('yyyy-MM-dd').format(value!);
       print(controller.text);
     });
      },
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