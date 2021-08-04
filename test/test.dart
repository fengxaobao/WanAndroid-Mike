import 'package:flutter/material.dart';
import 'dart:isolate';
void main() {
  // fun4();
  // testException();
  var person = Person();
  person._y= 1;
  person.x= 1;
  print('person=${person.x} ${person._y}');
  var receiver = new ReceivePort("namem");
 var sendport= receiver.sendPort;
 sendport.send(sendport);
 receiver.listen((message) {
   print('message=$message');
 });


}

typedef int F(int i, int j);

int fun1(int i, int j) {
  return i + j;
}

int fun2(void f1(int i, int j)) {
  f1(3, 4);
}

int fun3(F f) {
  return f(1, 2);
}

int fun4() {
  Function f = fun2;
  var f1 = f((int i, int j) {
    fun1(i, j);
  });
  print('f1=$f1');
  var f3 = fun3((i, j) {
    return i + j;
  });
}
void   testException(){
  try{
    var result = 100/1;
    print('result =$result');
    throw Exception("错误了");
  }on Exception catch(e,s){
    print('$e $s');
  }

}
class Person{
  int x ;
  int _y;
  factory Person.newInstance(){
    return new Person();
  }
  Person();
}
