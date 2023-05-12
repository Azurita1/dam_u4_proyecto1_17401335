

import 'package:dam_u4_proyecto1_17401335/services/firebase_service.dart';
import 'package:flutter/material.dart';

class InsertarV extends StatefulWidget {
  const InsertarV({Key? key}) : super(key: key);

  @override
  State<InsertarV> createState() => _InsertarVState();
}

class _InsertarVState extends State<InsertarV> {
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
    return Scaffold(
      appBar: AppBar(title: const Text("AGREGAR VEHICULO"),),
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
            await addVehiculo(
                CombustibleC.text,
                DeptoC.text,
                NoSerieC.text,
                PlacaC.text,
                ResguardadorC.text,
                int.parse(TanqueC.text),
                TipoC.text,
                TrabajadorC.text);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Se insertó con exito")));
            Navigator.pop(context);

          }, child: const Text("Guardar"))
        ],
      ),
    );
  }
}
