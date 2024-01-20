import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Both Instances has same data but different hashcode
          Person p1 = Person(name: "jack", age: 18);
          Person p2 = Person(name: "jack", age: 18);

          print(p1.hashCode.toString()); //105401917
          print(p2.hashCode.toString()); //940035979

          print(p1 == p2); // false

          // To resolve this we have equatable package:
          Adam a1 = Adam(name: "Charles", age: 20);
          Adam a2 = Adam(name: "Charles", age: 20);

          print(a1.hashCode.toString()); //989608747
          print(a2.hashCode.toString()); //989608747

          print(a1 == a2); // true
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Without Equatable:
class Person {
  final String name;
  final int age;
  const Person({required this.name, required this.age});
}

// With Equatable:
class Adam extends Equatable {
  final String name;
  final int age;

  const Adam({required this.name, required this.age});

  @override
  List<Object?> get props => [name, age];
}
