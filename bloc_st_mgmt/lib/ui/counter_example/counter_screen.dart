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
  late CounterBloc _counterBloc;
  @override
  void initState() {
    _counterBloc = CounterBloc();
    super.initState();
  }

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("BUILD");
    return BlocProvider(
      create: (context) => _counterBloc,
      child: Scaffold(
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
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (previous, current) => false,
                  builder: (context, state) {
                    debugPrint('build');
                    return TextButton(
                      onPressed: () {
                        // debugPrint('build');
                        context.read<CounterBloc>().add(IncrementCounter());
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.blueAccent[100])),
                      child: const Text("Increment"),
                    );
                  },
                ),
                const SizedBox(
                  width: 50,
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (previous, current) => false,
                  builder: (context, state) {
                    debugPrint('build2');
                    return TextButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(DecrementConuter());
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.blueAccent[100])),
                      child: const Text("Decrement"),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
