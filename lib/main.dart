import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_statemanagement/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => Counter(0),
        ),
      ],
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterBloc>(context, listen: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Bloc"),
          elevation: 0.0,
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${bloc.state}",
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ActionChip(
                    label: const Text("Increment"),
                    avatar: const Icon(Icons.add),
                    onPressed: () => bloc.increment(),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: FloatingActionButton(
                      child: const Icon(Icons.exposure_zero),
                      onPressed: () => bloc.neutral(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ActionChip(
                    label: const Text("Decrement"),
                    avatar: const Icon(Icons.remove),
                    onPressed: () => bloc.decrement(),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Text(
                "${context.watch<Counter>().state}",
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: FloatingActionButton(
                      child: const Icon(Icons.exposure_zero),
                      onPressed: () =>
                          context.watch<Counter>().add(CounterEvent.increment),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
