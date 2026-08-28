  import 'package:flutter/material.dart';

  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Minha Calculadora',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(title: 'Minha Calculadora'),
      );
    }
  }

  class MyHomePage extends StatefulWidget {
    const MyHomePage({super.key, required this.title});

    final String title;

    @override
    State<MyHomePage> createState() => _MyHomePageState();
  }

  class _MyHomePageState extends State<MyHomePage> {
    String display = '0';
    String operation = '';
    double? firstNumber;

    void addNumber(String number) {
      if (number == '.' && display.contains('.')) {
        return;
      }
      if (display == '0') {
        display = number;
      } else {
        display = display + number;
      }
    }

    void selectOperation(String op) {
      firstNumber = double.parse(display);
      operation = op;
      display = '0';
    }

    void reset() {
      display = '0';
      firstNumber = null;
      operation = '';
    }

    void calculate() {
      double secondNumber = double.parse(display);
      double value;

      if (operation == '+') {
        value = firstNumber! + secondNumber; //!firstNumber não é null
        display = value.toString();
      }

      if (operation == '-') {
        value = firstNumber! - secondNumber;
        display = value.toString();
      }

      if (operation == '×') {
        value = firstNumber! * secondNumber;
        display = value.toString();
      }

      if (operation == '÷') {
        value = firstNumber! / secondNumber;
        display = value.toString();
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(display, style: Theme.of(context).textTheme.headlineMedium),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        reset();
                      });
                    },
                    child: const Text('C'),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addNumber('7');
                      });
                    },
                    child: const Text('7'),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addNumber('8');
                      });
                    },
                    child: const Text('8'),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addNumber('9');
                      });
                    },
                    child: const Text('9'),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectOperation('+');
                      });
                    },
                    child: const Text('+'),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addNumber('4');
                      });
                    },
                    child: const Text('4'),
                  ),
                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addNumber('5');
                      });
                    },
                    child: const Text('5'),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addNumber('6');
                      });
                    },
                    child: const Text('6'),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectOperation('-');
                      });
                    },
                    child: const Text('-'),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addNumber('1');
                      });
                    },
                    child: const Text('1'),
                  ),
                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addNumber('2');
                      });
                    },
                    child: const Text('2'),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addNumber('3');
                      });
                    },
                    child: const Text('3'),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectOperation('×');
                      });
                    },
                    child: const Text('×'),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addNumber('0');
                      });
                    },
                    child: const Text('0'),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        addNumber('.');
                      });
                    },
                    child: const Text('.'),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        calculate();
                      });
                    },

                    child: const Text('='),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectOperation('÷');
                      });
                    },
                    child: const Text('÷'),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
