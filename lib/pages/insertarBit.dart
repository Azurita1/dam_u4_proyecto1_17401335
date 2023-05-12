import 'package:dam_u4_proyecto1_17401335/services/firebase_service.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class InsertarB extends StatefulWidget {
  final vehiculoId;
  const InsertarB({Key? key, required this.vehiculoId}) : super(key: key);

  @override
  State<InsertarB> createState() => _InsertarBState();
}

class _InsertarBState extends State<InsertarB> {

  DateTime fechaControler = DateTime.now();
  TextEditingController eventoControler = TextEditingController();
  TextEditingController recursosControler = TextEditingController();
  TextEditingController verificoControler = TextEditingController();
  DateTime fechaverControler = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva Bitacora'),),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: eventoControler, decoration: const InputDecoration( labelText: 'Evento'),),
              TextButton(onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context, initialDate: fechaControler,
                  firstDate: DateTime(2023,5), lastDate: DateTime(2222),
                );
                if (picked != null && picked != fechaControler) {
                  setState(() { fechaControler = picked; });
                }
              }, child: Text('Fecha de ingreso : ${DateFormat.yMd().format(fechaControler)}'),),
              TextButton(onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context, initialDate: fechaverControler,
                  firstDate: DateTime(2023,5), lastDate: DateTime(2222),
                );
                if (picked != null && picked != fechaverControler) {
                  setState(() { fechaverControler = picked; });
                }
              }, child: Text('Fecha de verificación : ${DateFormat.yMd().format(fechaverControler)}'),),
              TextField(controller: recursosControler, decoration: const InputDecoration( labelText: 'Recursos'),),
              TextField(controller: verificoControler, decoration: const InputDecoration( labelText: '¿Quién verificó?'),),
              ElevatedButton(onPressed: () async{
                await insertarBitacora(widget.vehiculoId ?? '', {
                  "evento": eventoControler.text,
                  "fecha": fechaControler,
                  "fechaverificacion": fechaverControler,
                  "recursos": recursosControler.text,
                  "verifico": verificoControler.text,
                }).then((_) {
                });
                await addBitacora(widget.vehiculoId ?? '', {
                  "evento": eventoControler.text,
                  "fecha": fechaControler,
                  "fechaverificacion": fechaverControler,
                  "recursos": recursosControler.text,
                  "verifico": verificoControler.text,
                }).then((_) {
                  Navigator.pop(context);
                });
              }, child: const Text("Guardar"))
            ],
          ),
        ),
      ),
    );
  }
}
