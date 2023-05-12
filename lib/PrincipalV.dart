import 'package:dam_u4_proyecto1_17401335/pages/PrincipalBit.dart';
import 'package:dam_u4_proyecto1_17401335/services/firebase_service.dart';
import 'package:flutter/material.dart';

class PrincipalV extends StatefulWidget {
  const PrincipalV({Key? key}) : super(key: key);

  @override
  State<PrincipalV> createState() => _PrincipalVState();
}

class _PrincipalVState extends State<PrincipalV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("VEHICULO"),),
      body: FutureBuilder(
          future: getVehiculo(),
          builder: (context,snapshot){
        if(snapshot.hasData){
            return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context,index){
              return ListTile(
                    title: Text(snapshot.data?[index]['trabajador']),
                    onTap: ((){
                      //String vehiculoId;
                      //await Navigator.pushNamed(context, '/Bitacora',arguments: {"uid":snapshot.data?[index]['uid']});

                      showDialog(context: context, builder: (builder){
                        return AlertDialog(
                          title: Text("ATENCIÓN"),
                          content: Text("¿Qué desea hacer con ${snapshot.data?[index]['trabajador']}?"),
                          actions: [
                            TextButton(onPressed: ()async{
                              await Navigator.pushNamed(context, '/editar',arguments: {
                                "combustible":snapshot.data?[index]['combustible'],
                                "depto":snapshot.data?[index]['depto'],
                                "numeroserie":snapshot.data?[index]['numeroserie'],
                                "placa":snapshot.data?[index]['placa'],
                                "resguardadopor":snapshot.data?[index]['resguardadopor'],
                                "tanque":snapshot.data?[index]['tanque']??'',
                                "tipo":snapshot.data?[index]['tipo'],
                                "trabajador":snapshot.data?[index]['trabajador'],
                                "uid":snapshot.data?[index]['uid'],
                              });
                              Navigator.pop(context);
                            }, child: Text("Actualizar")),
                            TextButton(onPressed: ()async{
                              await deleteVehiculo(snapshot.data?[index]['uid']);
                              Navigator.pop(context);
                            }, child: Text("Eliminar")),
                            TextButton(
                              child: Text('Ver bitacora'),
                              onPressed: () async{
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Bitacora(vehiculoId: snapshot.data?[index]['uid'] ?? ''),
                                  ),
                                );
                                setState(() {});
                              },
                            ),
                          ],
                        );
                      });
                      setState(() {

                      });
                    }),
                    subtitle: Row(
                      children: [
                        Text("   Tipo: "+snapshot.data?[index]['tipo']),
                        Text("   Placa: "+snapshot.data?[index]['placa']),
                      ],

                    )//,trailing: Text(snapshot.data?[index].id),
                  ); // Text(snapshot.data?[index]['placa']);
            },
            );
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }}),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await Navigator.pushNamed(context, '/insertar');
          setState(() {

          });
        },
        child: const Icon(Icons.add),
      )
    );
  }
}
