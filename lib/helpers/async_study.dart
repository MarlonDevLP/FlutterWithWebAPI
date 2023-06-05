import 'dart:math';

asyncStudy(){
  //execucaoNormal();
  //assincrinismoBasico();
  //usandoFuncoesAssincronas();
  esperandoFuncoesAssincronas();
}

void execucaoNormal() {
  print('\nExecutando Normalmente');
  print('\n1');
  print('\n2');
  print('\n3');
  print('\n4');
}

void assincrinismoBasico(){
  print('\nAssincronismo Básico');
  print('\n1');
  print('\n2');
  Future.delayed (const Duration(seconds: 4), (){
    print('\n3');
  });
  print('\n4');


}

void usandoFuncoesAssincronas(){
  print('\nUsando funções assíncronas');
  print('A');
  print('B');
  getRandomInt(3).then((value){
    print(" O numúmero aleatório e $value.");
  });
  print("C");
  print("D");
}
void esperandoFuncoesAssincronas() async{
  print('A');
  print('B');
  int number = await getRandomInt(4);
  print("O outro npumero aleatório é $number");
  print('C');
  print('D');
}

Future<int> getRandomInt(int time) async{
  await Future.delayed(Duration(seconds: time));
  Random rng = Random();
  return rng.nextInt(10);
}
