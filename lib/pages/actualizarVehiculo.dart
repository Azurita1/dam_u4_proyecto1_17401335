import 'package:dam_u4_proyecto1_17401335/services/firebase_service.dart';
import 'package:flutter/material.dart';

class ActualizarV extends StatefulWidget {
  const ActualizarV({Key? key}) : super(key: key);

  @override
  State<ActualizarV> createState() => _ActualizarVState();
}

class _ActualizarVState extends State<ActualizarV> {
  final CombustibleC = TextEditingController();
  final DeptoC = TextEditingController();
  final NoSerieC = TextEditingController();
  final PlacaC = TextEditingController();
  final ResguardadorC = TextEditingController();
  final TanqueC = TextEditingController();
  final TipoC = TextEditingController();
  final TrabajadorC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map? ?? {};
    if(arguments.isNotEmpty){
      CombustibleC.text = arguments['combustible'];
      DeptoC.text = arguments['depto'];
      NoSerieC.text = arguments['numeroserie'];
      PlacaC.text = arguments['placa'];
      ResguardadorC.text = arguments['resguardadopor'];
      TanqueC.text = arguments['tanque'].toString()??'';
      TipoC.text = arguments['tipo'];
      TrabajadorC.text = arguments['trabajador'];
    }
    return Scaffold(
      appBar: AppBar(title: const Text("ACTUALIZAR  VEHICULO"),),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
        TextField(decoration: InputDecoration(labelText: "Combustible"),
        controller: CombustibleC, autofocus: true,),
        SizedBox(height: 20,),
        TextField(decoration: InputDecoration(labelText: "Departamento"),
        controller: DeptoC, autofocus: true,),
        SizedBox(height: 20,),
        TextField(decoration: InputDecoration(labelText: "Número de serie"),
        controller: NoSerieC, autofocus: true,),
        SizedBox(height: 20,),
        TextField(decoration: InputDecoration(labelText: "Placa"),
        controller: PlacaC, autofocus: true,),
        SizedBox(height: 20,),
        TextField(decoration: InputDecoration(labelText: "Resguardador"),
        controller: ResguardadorC, autofocus: true,),
        SizedBox(height: 20,),
        TextField(decoration: InputDecoration(labelText: "Tanque"),
        controller: TanqueC, autofocus: true,),
        SizedBox(height: 20,),
        TextField(decoration: InputDecoration(labelText: "Tipo"),
        controller: TipoC, autofocus: true,),
        SizedBox(height: 20,),
        TextField(decoration: InputDecoration(labelText: "Trabajador"),
        controller: TrabajadorC, autofocus: true,),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: ()async{
          await updateVehiculo(
              arguments['uid'],
              CombustibleC.text,
              DeptoC.text,
              NoSerieC.text,
              PlacaC.text,
              ResguardadorC.text,
              int.parse(TanqueC.text),
              TipoC.text,
              TrabajadorC.text).then((_){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("¡Se actualizó el dato correctamente!")));
                    Navigator.pop(context);
                });
                }, child: const Text("Guardar"))
          ],
        ),
    );
  }
}
