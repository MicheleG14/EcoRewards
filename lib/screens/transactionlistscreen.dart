import 'package:ecorewards/widgets/ecorewardslogo.dart';
import 'package:ecorewards/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import '../widgets/transaction_card.dart';

class TransactionListScreen extends StatefulWidget {
  const TransactionListScreen({super.key});

  @override
  State<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  List<TransactionCard> cards = [];

  @override
  void initState() {
    cards.add(const TransactionCard(
        station: 'Ecocompattatore n.2352',
        address: 'Via Principessa Sichelgaita 2',
        city: '84125 Salerno (SA)',
        date: '04/05/2023 16:42:28',
        objects: '1',
        coins: '5'));

    cards.add(const TransactionCard(
        station: 'Ecocompattatore n.2345',
        address: 'Via Giovanni Cuomo 9',
        city: '84122 Salerno (SA)',
        date: '01/05/2023 12:22:18',
        objects: '3',
        coins: '15'));

    cards.add(const TransactionCard(
        station: 'Ecocompattatore n.2372',
        address: 'Via S. Benedetto 28',
        city: '84122 Salerno (SA)',
        date: '28/04/2023 18:52:24',
        objects: '15',
        coins: '75'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const EcoRewardsLogo(),
        const Text(
          'LISTA TRANSAZIONI',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: cards.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return Padding(
                padding: index == 0
                    ? const EdgeInsets.only(bottom: 8, left: 16, right: 16)
                    : const EdgeInsets.only(
                    bottom: 8, top: 8, left: 16, right: 16),
                child: cards[index],
              );
            },
          ),
        )
      ],
    ));
  }
}
