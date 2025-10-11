void main(){
  contaBancaria conta = new contaBancaria("Ana", 1000.00, false);
  conta.autenticar();
  conta.verificarSaldo();
  conta.depositar(1000);
  conta.sacar(1500);
  conta.verificarSaldo();

}

class contaBancaria {
  String Titular;
  double Saldo;
  bool Autenticado;
  
  contaBancaria(this.Titular, this.Saldo,this.Autenticado);

  void autenticar() {
    Autenticado = true;
    print("Bem-vindo $Titular! Você foi autenticado.");
  }

  void depositar(double valor){
    if (Autenticado == true) {
      if (valor<=0) {
        print('Não foi depositado nenhum valor');
      }else{
        Saldo = Saldo + valor;
        print('Foi depositado: $valor, alterando o saldo para: $Saldo');
      }
    }else{
      print('Usuario não autenticado, impossibilitado de depositar');
    }
  }

  void sacar(double valor){
    if (Autenticado == true) {
      if (valor<=0 || valor > Saldo) {
        print("Nenhum valor pode ser sacado - valor 0 ou acima do saldo");
      }else{
        Saldo = Saldo - valor;
        print('Foi sacado: $valor, alterando o saldo para: $Saldo');
      }
    }else{
      print('Usuario não autenticado, impossibilitado de sacar');
    }
  }

  void verificarSaldo(){
    if (Autenticado == true) {
      print('$Titular o seu saldo é: $Saldo');
    }else{
      print('Usuario não autenticado, impossibilitado de verificar saldo');
    }
  }
}

//atividade 2) criar uma cheque especial, que tem um saldo limite (voce tem 1000 para ficar negativo do seu saldo normal)
//quando deposita esse valor vai voltando ao 0 - pique cartão, você tem um dinheiro emprestado basicamente
//uso de @override
class chequeEspecial extends contaBancaria{
  double SaldoCheque = 10000.00;

  chequeEspecial(String Titular, double Saldo, bool Autenticado, this.SaldoCheque);

  @override
  void sacar(double valor){
    if (Autenticado == true) {
      if (Saldo==0 && SaldoCheque>0) {
        SaldoCheque = SaldoCheque - valor;
        print('Foi sacado do cheque: $valor, alterando o saldo para: $SaldoCheque');
      }else{
        print("Nenhum valor pode ser sacado - valor 0 ou acima do saldo");
      }
    }else{
      print('Usuario não autenticado, impossibilitado de sacar do cheque especial');
    }
  }

  @override
  void depositar(double valor){
    if (Autenticado == true) {
      if (SaldoCheque==10000.00) {
        print('Não foi depositado nenhum valor');
      }else{
        SaldoCheque = SaldoCheque + valor;
        print('Foi depositado: $valor, alterando o saldo do cheque para: $SaldoCheque');
      }
    }else{
      print('Usuario não autenticado, impossibilitado de depositar');
    }
  }
}
