


import 'dart:async';

import 'package:form_validation/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';


class LoginBloc with Validators {
  

  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();


  //Recuperar los datos del Stream
   Stream<String> get emailStream    => _emailController.stream.transform( validarEmail );
   Stream<String> get passwordString => _passwordController.stream.transform( validarPassword );


  Stream<bool> get fromValidStream => Rx.combineLatest2(emailStream, passwordString, (e, p) => true);
  
  //Insertar valores al Strem
Function(String) get changeEmail    => _emailController.sink.add;
Function(String) get changePassword => _passwordController.sink.add;

//Obtener el ultimo bvalor ingesado a los streams
String get email    => _emailController.value;
String get password => _passwordController.value;



dispose(){
  _emailController.close();
  _passwordController.close();
}


}