import 'package:flutter/material.dart';
import 'package:marajoar/app/modules/home/controller/home_controller.dart';
import 'package:marajoar/app/modules/home/pages/categoria/categoria_page.dart';
import 'package:marajoar/app/modules/home/pages/sobre/sobre_page.dart';
import 'package:marajoar/app/shared/enums/categoria_enum.dart';
import 'package:marajoar/app/shared/models/ar_model.dart';
import 'package:marajoar/app/shared/widgets/card_widget.dart';
import 'package:marajoar/app/shared/widgets/icon_categoria.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State <HomePage> {
  
  HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getRecomendados();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    onPressed: (){},
                    iconSize: 40, 
                    icon: Icon(Icons.share),
                  ),
                  Text(
                    'Ar Marajó',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/sobre');
                    }, 
                    iconSize: 40,
                    icon: Icon(Icons.info_outline),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Categorias',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconWidgetCategoria(
                      nome: 'Artesanato', 
                      icone: Icons.panorama_vertical, 
                      containerColor: Colors.white,
                      iconeColor: Colors.black, 
                      ontap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_)=> CategoriaPage(CategoriasEnum.artesanato)));
                      }
                    ),
                    IconWidgetCategoria(
                      nome: 'Animais', 
                      icone: Icons.grass, 
                      containerColor: Colors.white,
                      iconeColor: Colors.black, 
                      ontap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_)=> CategoriaPage(CategoriasEnum.animais)));
                      }
                    ),
                    IconWidgetCategoria(
                      nome: 'Comidas', 
                      icone: Icons.local_dining, 
                      containerColor: Colors.white,
                      iconeColor: Colors.black, 
                      ontap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_)=> CategoriaPage(CategoriasEnum.comidas)));
                      }
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Recomendados',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

              Expanded(
                child: StreamBuilder<List<ArModel>>(
                  stream: controller.dados.stream,
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<ArModel> dados = snapshot.data;
                    return ListView.builder(
                      itemCount: dados.length,
                      itemBuilder: (context,index){
                        return CardWidget(dados[index]);
                      },
                    );
                  }
                )
              )

            ],
          ),
        ),
      ),
    );
  }
}