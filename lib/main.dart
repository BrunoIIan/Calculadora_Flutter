import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String numero = '0';

  double primeiroNumero = 0.0;

  String operacao = '';

  double parseNumero(String valor) {
    return double.parse(valor.replaceAll(',', '.'));
  }

  void calcular(String tecla) {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
        setState(() {
          numero += tecla;

          numero = numero.replaceAll(',', '.');

          if (numero.contains('.')) {
            // double numeroDouble = double.parse(numero);
            // numero = numeroDouble.toString();
          } else {
            int numeroInt = int.parse(numero);
            numero = numeroInt.toString();
          }

          numero = numero.replaceAll('.', ',');

          // if (numero == '0') {
          //   numero = tecla;
          // } else {
          //   numero += tecla;
          // }
        });
        break;

      case 'AC':
        setState(() {
          numero = '0';
          operacao = '';
          primeiroNumero = 0;
        });
        break;

      case '+':
      case '-':
      case 'x':
      case '%':
        setState(() {
          operacao = tecla;
          numero = numero.replaceAll(',', '.');
          primeiroNumero = double.parse(numero);
          numero = numero.replaceAll('.', ',');
          numero = '0';
        });
        break;

      case '=':
        double segundoNumero = parseNumero(numero);

        double resultado = 0;

        if (operacao == '%') {
          if (double.parse(numero) * 1 == 0) {
            print('Erro: divisão');
            return;
          }
        }

        if (operacao == '+') {
          resultado = primeiroNumero + segundoNumero;
        } else if (operacao == '-') {
          resultado = primeiroNumero - segundoNumero;
        } else if (operacao == 'x') {
          resultado = primeiroNumero * segundoNumero;
        } else if (operacao == '%') {
          resultado = primeiroNumero / segundoNumero;
        }

        String resultadoString = resultado.toString();

        List<String> resultadoPartes = resultadoString.split('.');

        if (int.parse(resultadoPartes[1]) * 1 == 0) {
          setState(() {
            numero = int.parse(resultadoPartes[0]).toString();
          });
        } else {
          setState(() {
            numero = resultado.toString();
          });
        }

        setState(() {
          operacao =
              '$primeiroNumero $operacao $segundoNumero'
              '=';
        });

      case '<=':
        setState(() {
          if (numero.isNotEmpty) {
            numero = numero.substring(0, numero.length - 1);
          } else {
            numero = '0';
          }
        });
        break;

      default:
        numero += tecla;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Calculadora'),
          leading: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print('Botão esquerdo clicado');
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(''),
                Text(''),
                Text(''),
                Text(operacao, style: TextStyle(fontSize: 30)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(''),
                Text(''),
                Text(''),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Text(numero, style: TextStyle(fontSize: 68)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => {calcular('AC')},
                  child: Text('AC', style: TextStyle(fontSize: 48)),
                ),
                Text(''),
                Text(''),
                GestureDetector(
                  onTap: () => {calcular('<=')},
                  child: Image.asset(
                    'assets/images/seta-para-a-esquerda.png',
                    width: 100,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calcular('7'),
                  child: Image.asset('assets/images/7.png', width: 80),
                ),
                GestureDetector(
                  onTap: () => {calcular('8')},
                  child: Image.asset('assets/images/8.png', width: 80),
                ),
                GestureDetector(
                  onTap: () => {calcular('9')},
                  child: Image.asset('assets/images/9.png', width: 80),
                ),
                GestureDetector(
                  onTap: () => {calcular('%')},
                  child: Image.asset('assets/images/divisao.png', width: 80),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => {calcular('4')},
                  child: Image.asset('assets/images/4.png', width: 80),
                ),
                GestureDetector(
                  onTap: () => {calcular('5')},
                  child: Image.asset('assets/images/5.png', width: 80),
                ),
                GestureDetector(
                  onTap: () => {calcular('6')},
                  child: Image.asset('assets/images/6.png', width: 80),
                ),
                GestureDetector(
                  onTap: () => {calcular('x')},
                  child: Image.asset(
                    'assets/images/multiplicacao.png',
                    width: 80,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => {calcular('1')},
                  child: Image.asset('assets/images/1.png', width: 80),
                ),
                GestureDetector(
                  onTap: () => {calcular('2')},
                  child: Image.asset('assets/images/2.png', width: 80),
                ),
                GestureDetector(
                  onTap: () => {calcular('3')},
                  child: Image.asset('assets/images/3.png', width: 80),
                ),
                GestureDetector(
                  onTap: () => {calcular('-')},
                  child: Image.asset('assets/images/subtracao.png', width: 80),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => {calcular('0')},
                  child: Image.asset('assets/images/0.png', width: 80),
                ),
                GestureDetector(
                  onTap: () => {calcular(',')},
                  child: Image.asset('assets/images/virgula.png', width: 80),
                ),
                GestureDetector(
                  onTap: () => {calcular('=')},
                  child: Image.asset('assets/images/igual.png', width: 85),
                ),
                GestureDetector(
                  onTap: () => {calcular('+')},
                  child: Image.asset('assets/images/adicao.png', width: 85),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
