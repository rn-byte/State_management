import 'package:bloc_st_mgmt/bloc/counter/counter_bloc.dart';
import 'package:bloc_st_mgmt/bloc/counter/counter_events.dart';
import 'package:bloc_st_mgmt/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint("BUILD");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter Example'),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Center(
                child: Text(
                  state.counter.toString(),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // debugPrint('build');
                  context.read<CounterBloc>().add(IncrementCounter());
                },
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.blueAccent[100])),
                child: const Text("Increment"),
              ),
              const SizedBox(
                width: 50,
              ),
              TextButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementConuter());
                },
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.blueAccent[100])),
                child: const Text("Decrement"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
