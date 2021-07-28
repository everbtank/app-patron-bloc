//logica
import 'dart:async';
import 'empleado.dart';

class EmpleadoBloc{
  List<Empleado>_empleadoList=[
    Empleado(1,"empleado 1",10000.0),
    Empleado(2,"empleado 2",10000.0),
    Empleado(3,"empleado 3",10000.0),
    Empleado(4,"empleado 4",10000.0),
    Empleado(5,"empleado 5",10000.0),
  ];
  final _empleadoListStreamController= StreamController<List<Empleado>>();

  final _empleadoSalarioIncrementStreamController= StreamController<Empleado>();
  final _empleadoSalarioDecrementStreamtController = StreamController<Empleado>();

  Stream <List<Empleado>> get empleadoListStream =>_empleadoListStreamController.stream;
  StreamSink <List<Empleado>> get empleadoListSink =>_empleadoListStreamController.sink;

  StreamSink <Empleado> get empleadoSalarioIncrement =>
 _empleadoSalarioIncrementStreamController.sink;

   StreamSink <Empleado> get empleadoSalarioDecrement =>
 _empleadoSalarioDecrementStreamtController.sink;

 EmpleadoBloc(){
   _empleadoListStreamController.add(_empleadoList);
   _empleadoSalarioIncrementStreamController.stream.listen(_incrementSalario);
   _empleadoSalarioDecrementStreamtController.stream.listen(_decrementSalario);
 }
  //funciones principales
  _incrementSalario(Empleado empleado){
    double  salarioActual = empleado.salario;
    double salarioIncrement = salarioActual *20/100;

    _empleadoList[empleado.id-1].salario=salarioActual + salarioIncrement;
    empleadoListSink.add(_empleadoList);
  }
  _decrementSalario(Empleado empleado){
    double  salarioActual = empleado.salario;
    double salarioIncrement = salarioActual *20/100;

    _empleadoList[empleado.id-1].salario=salarioActual - salarioIncrement;
    empleadoListSink.add(_empleadoList);
  }
  //dispose

  void dispose(){
    _empleadoSalarioIncrementStreamController.close();
    _empleadoSalarioDecrementStreamtController.close();
    _empleadoListStreamController.close();
  }
 }




    
  
