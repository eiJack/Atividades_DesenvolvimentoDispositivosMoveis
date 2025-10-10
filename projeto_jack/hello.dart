/*void main(){
  print("Hello Word");

  //1. declare duas notas com o tipo double
  double nota1 = 6.5;
  double nota2 = 8.8;

  //2. calcule a média
  double media = (nota1 + nota2)/2;

  //3. imprima o resultado usando interpolção de string
  print ('a media do aluno é: $media');

  
}*/
void main(){
  contaBancaria conta = new contaBancaria("Ana", 1000.00);
  conta.valorSaldo();
  conta.deposita(1000);
  conta.saque(2500);
  conta.valorSaldo();

}

class contaBancaria {
  String titular;
  double saldo;
  
  contaBancaria(this.titular, this.saldo);

  void deposita(double valor){
    if (valor<=0) {
      print('Não foi depositado nenhum valor');
    }else{
      saldo = saldo + valor;
      print('Foi depositado: $valor, alterando o saldo para: $saldo');
    }
  }

  void saque(double valor){
    if (valor<=0 || valor > saldo) {
      print("Nenhum valor pode ser sacado - valor 0 ou acima do saldo");
    }else{
      saldo = saldo - valor;
      print('Foi sacado: $valor, alterando o saldo para: $saldo');
    }
  }

  void valorSaldo(){
    print('O saldo é: $saldo');
  }

}