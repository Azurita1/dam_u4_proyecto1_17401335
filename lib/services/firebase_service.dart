import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List>getVehiculo() async {
  List vehiculo = [];
  // Referencia a la colección de la base de datos
  //CollectionReference collectionReferenceVehiculo = db.collection('vehiculo');
  QuerySnapshot queryVehiculo = await db.collection('vehiculo').get();
  for(var doc in queryVehiculo.docs){
      final Map<String,dynamic> data = doc.data() as Map<String,dynamic>;
      final vehi = {
        "uid":doc.id,
        "combustible":data['combustible'],
        "depto":data['depto'],
        "numeroserie":data['numeroserie'],
        "placa":data['placa'],
        "resguardadopor":data['resguardadopor'],
        "tanque":data['tanque'],
        "tipo":data['tipo'],
        "trabajador":data['trabajador'],
      };
    vehiculo.add(vehi);
  }
  return vehiculo;
}
Future<List> getBitacoras(String vehiculoId) async {
  List bitacora = [];
  QuerySnapshot queryBitacora = await db.collection('vehiculo').doc(vehiculoId).collection('bitacora').get();
  for(var doc in queryBitacora.docs){
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final bitacoraDoc = {
      "evento":data['evento'],
      "fecha": data['fecha'],
      "fechaverificacion":data['fechaverificacion'],
      "recursos":data['recursos'],
      "verifico":data['verifico'],
      "uid":doc.id,
    };
    bitacora.add(bitacoraDoc);
  }
  return bitacora;
}

// Insertar
Future<void>addVehiculo(String c,d,n,p,r,int tan,tip,tra)async{
  await db.collection('vehiculo').add({
    "combustible":c,
    "depto":d,
    "numeroserie":n,
    "placa":p,
    "resguardadopor":r,
    "tanque":tan,
    "tipo":tip,
    "trabajador":tra});
}

// Actualizar
Future <void> updateVehiculo(String uid,c,d,n,p,r,int tan,tip,tra)async{
  await db.collection('vehiculo').doc(uid).set({"combustible":c,
    "depto":d,
    "numeroserie":n,
    "placa":p,
    "resguardadopor":r,
    "tanque":tan,
    "tipo":tip,
    "trabajador":tra});
}

// Eliminar

Future<void>deleteVehiculo(String uid)async{
  await db.collection('vehiculo').doc(uid).delete();
}

Future<void> insertarBitacora(String vehiculoId, Map<String, dynamic> bitacoraData) async{
  await db.collection('vehiculo').doc(vehiculoId).collection('bitacora').add(bitacoraData);
}

Future<void> addBitacora(String vehiculoId, Map<String, dynamic> bitacoraData) async{
  await db.collection('vehiculo').doc(vehiculoId).collection('bitacora').add(bitacoraData);
}

Future<void> actualizarBitacora(String vehiculoId, String bitacoraId, String verifico, DateTime fechaverificacion) async {
  await db.collection('vehiculo').doc(vehiculoId).collection('bitacora').doc(bitacoraId).update({
    'verifico': verifico,
    'fechaverificacion': fechaverificacion,
  });
}