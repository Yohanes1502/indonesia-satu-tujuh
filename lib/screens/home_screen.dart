import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/number_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final numberBloc = NumberBloc();

    return Scaffold(
      appBar: AppBar(title: const Text('Indonesia Satu Tujuh')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Input N'),
              keyboardType: TextInputType.number,
              onSubmitted: (value) {
                final n = int.tryParse(value) ?? 0;
                if (n > 0) {
                  numberBloc.add(GenerateSequence(n, 1));
                }
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    numberBloc.add(GenerateSequence(5, 1));
                  },
                  child: const Text('1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    numberBloc.add(GenerateSequence(5, 2));
                  },
                  child: const Text('2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    numberBloc.add(GenerateSequence(5, 3));
                  },
                  child: const Text('3'),
                ),
                ElevatedButton(
                  onPressed: () {
                    numberBloc.add(GenerateSequence(5, 4));
                  },
                  child: const Text('4'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            BlocBuilder<NumberBloc, NumberState>(
              bloc: numberBloc,
              builder: (context, state) {
                if (state is NumberResult) {
                  return Text(
                    'Hasil: ${state.result}',
                    style: const TextStyle(fontSize: 16),
                  );
                }
                return const Text('Result');
              },
            ),
          ],
        ),
      ),
    );
  }
}
