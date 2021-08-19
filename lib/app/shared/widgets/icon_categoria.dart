import 'package:flutter/material.dart';
import 'package:marajoar/app/core/colors.dart';

class IconWidgetCategoria extends StatelessWidget {
  final String nome;
  final IconData icone;
  final Color iconeColor;
  final Color containerColor;
  final VoidCallback ontap;

  IconWidgetCategoria(
    {
      @required this.nome, 
      @required this.icone, 
      @required this.containerColor, 
      @required this.iconeColor,
      @required this.ontap
      }
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> this.ontap(),
      child: Container(
        width: 100,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primaryColor,width: 1)
        ),
        child: Center(
          child: Column(
            children: [
              Icon(
                icone,
                size: 50,
                color: iconeColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(nome),
              )
            ],
          ),
        ),
      ),
    );
  }
}