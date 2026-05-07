import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int number1 = 0;
  int number2 = 0;
  double result = 0;

  void reset() {
    setState(() {
      number1 = 0;
      number2 = 0;
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  "Calculator",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                /// number1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (number1 > 0) {
                          setState(() => number1--);
                        }
                      },
                      icon: const Icon(Icons.remove),
                      color: Colors.white,
                    ),
                    Text(
                      "$number1",
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() => number1++);
                      },
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// number2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (number2 > 0) {
                          setState(() => number2--);
                        }
                      },
                      icon: const Icon(Icons.remove),
                      color: Colors.white,
                    ),
                    Text(
                      "$number2",
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() => number2++);
                      },
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// العمليات
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () =>
                              result = number1.toDouble() + number2.toDouble(),
                        );
                      },
                      child: const Text("+ add"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () =>
                              result = number1.toDouble() - number2.toDouble(),
                        );
                      },
                      child: const Text("- subtract"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () =>
                              result = number1.toDouble() * number2.toDouble(),
                        );
                      },
                      child: const Text("* multiply"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () => result = number2 != 0
                              ? number1.toDouble() / number2.toDouble()
                              : 0,
                        );
                      },
                      child: const Text("/ divide"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () =>
                              result = number1.toDouble() % number2.toDouble(),
                        );
                      },
                      child: const Text("% modulus"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () => result =
                              (number1.toDouble() + number2.toDouble()) / 2,
                        );
                      },
                      child: const Text("Average"),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Result = $result",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 28),
                  ),
                ),

                const SizedBox(height: 20),

                /// زرار Reset
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                  ),
                  onPressed: reset,
                  child: const Text("Reset"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
