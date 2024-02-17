import 'package:flutter/material.dart';
import 'package:pokemon_app/view_model/counter_view_model.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  CounterViewModel counterViewModel = CounterViewModel();

  @override
  Widget build(BuildContext context) {
    int counter = counterViewModel.counter;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter View'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () {
                counterViewModel.reset();
                setState(() {});
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$counter',
                style:
                    const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
              ),
              Text(
                (counter != 1) ? 'Clicks' : 'Click',
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomFloatingActionButton(
                icon: Icons.refresh_rounded,
                onPressed: () {
                  counterViewModel.reset();
                  setState(() {});
                }),
            const SizedBox(height: 15),
            CustomFloatingActionButton(
                icon: Icons.plus_one,
                onPressed: () {
                  counterViewModel.increment();
                  setState(() {});
                }),
            const SizedBox(height: 15),
            CustomFloatingActionButton(
                icon: Icons.exposure_minus_1_outlined,
                onPressed: () {
                  counterViewModel.decrement();
                  setState(() {});
                })
          ],
        ));
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomFloatingActionButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      elevation: 5,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
