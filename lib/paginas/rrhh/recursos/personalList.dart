import 'package:flutter/material.dart';
import 'package:erp/paginas/rrhh/model/PersonalModel.dart';
import 'package:erp/paginas/rrhh/personal.dart';

class PersonalList extends StatelessWidget {
  final List<PersonalModel> _personas;

  PersonalList(this._personas);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildPersonalList(),
    );
  }
}
