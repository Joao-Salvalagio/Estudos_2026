import 'package:flutter/material.dart';
import 'veiculo.dart';

class VeiculoListaScreen extends StatefulWidget {
  const VeiculoListaScreen({super.key});

  @override
  State<VeiculoListaScreen> createState() => _VeiculoListaScreenState();
}

class _VeiculoListaScreenState extends State<VeiculoListaScreen> {
  final List<Veiculo> veiculos = [
    Veiculo(fabricante: "Toyota", modelo: "Corolla", ano: 2020),
    Veiculo(fabricante: "Honda", modelo: "Civic", ano: 2019),
    Veiculo(fabricante: "Ford", modelo: "Focus", ano: 2018),
    Veiculo(fabricante: "Chevrolet", modelo: "Onix", ano: 2021),
    Veiculo(fabricante: "Volkswagen", modelo: "Golf", ano: 2017),
    Veiculo(fabricante: "Hyundai", modelo: "HB20", ano: 2022),
    Veiculo(fabricante: "Fiat", modelo: "Argo", ano: 2020),
    Veiculo(fabricante: "Renault", modelo: "Kwid", ano: 2021),
    Veiculo(fabricante: "Nissan", modelo: "Versa", ano: 2019),
    Veiculo(fabricante: "Peugeot", modelo: "208", ano: 2022),
  ];

  List<Veiculo> veiculosExibidos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
      floatingActionButton: getFAB(),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      title: const Center(child: Text("Listagem de Veículos")),
      backgroundColor: Colors.greenAccent[200],
      foregroundColor: Colors.black,
    );
  }

  Widget getBody() {
    return ListView.builder(
      itemCount: veiculosExibidos.length,
      itemBuilder: (context, index) {
        return getListItem(veiculosExibidos[index], index);
      },
    );
  }

  Widget getListItem(Veiculo veiculo, int index) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black87),
      ),
      child: Row(
        children: [
          const Expanded(
            flex: 3,
            child: Placeholder(),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fabricante: ${veiculo.fabricante}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Modelo: ${veiculo.modelo}"),
                  Text("Ano: ${veiculo.ano}"),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => removerVeiculo(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget getFAB() {
    return FloatingActionButton(
      onPressed: carregarLista,
      backgroundColor: Colors.greenAccent[200],
      child: const Icon(Icons.refresh, color: Colors.black),
    );
  }

  void carregarLista() {
    setState(() {
      veiculosExibidos = List.from(veiculos);
    });
  }

  void removerVeiculo(int index) {
    setState(() {
      veiculosExibidos.removeAt(index);
    });
  }
}