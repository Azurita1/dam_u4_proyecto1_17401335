

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dam_u4_proyecto1_17401335/pages/insertarBit.dart';
import 'package:dam_u4_proyecto1_17401335/services/firebase_service.dart';
import 'package:flutter/material.dart';

class Bitacora extends StatefulWidget {
  final String vehiculoId;
  const Bitacora({Key? key,required this.vehiculoId}) : super(key: key);

  @override
  State<Bitacora> createState() => _BitacoraState();
}

class _BitacoraState extends State<Bitacora> {
  TextEditingController verificoController = TextEditingController();
  DateTime fechaverificacion = DateTime.now();
  @override
  Widget build(BuildContext context) {
    String vehiculoId = widget.vehiculoId;
    return Scaffold(
      appBar: AppBar(title: Text("BITACORA"),),
      body: FutureBuilder(
          future: getBitacoras(widget.vehiculoId),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context,index){
                  return ListTile(
                          title: Text(snapshot.data?[index]['evento']),
                          onTap: (()async{
                            //await Navigator.pushNamed(context, '/');
                            setState(() {

                            });
                          }),
                          subtitle: Row(
                            children: [
                              Text("   Verificó: "+snapshot.data?[index]['verifico']),
                            ],

                          ),
                      );
                },
              );
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }}),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await Navigator.push(context, MaterialPageRoute(builder: (builder)=>InsertarB(vehiculoId: vehiculoId)));
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}
