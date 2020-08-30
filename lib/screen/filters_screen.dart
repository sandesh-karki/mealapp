import 'package:flutter/material.dart ';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final  Map<String, bool> currentFilters; 

  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;
  @override
  void initState() { 
    super.initState();
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
  }

  Widget _buildSwitchTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters );
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTile(
                  'Gluten-Free',
                  'Only include gluten-free meals',
                  _glutenFree,
                  (newvalue) {
                    setState(
                      () {
                        _glutenFree = newvalue;
                      },
                    );
                  },
                ),
                _buildSwitchTile(
                  'Lactose-Free',
                  'Only include lactose-free meals',
                  _lactoseFree,
                  (newvalue) {
                    setState(
                      () {
                        _lactoseFree = newvalue;
                      },
                    );
                  },
                ),
                _buildSwitchTile(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  _vegetarian,
                  (newvalue) {
                    setState(
                      () {
                        _vegetarian = newvalue;
                      },
                    );
                  },
                ),
                _buildSwitchTile(
                  'Vegan',
                  'Only include vegan  meals',
                  _vegan,
                  (newvalue) {
                    setState(
                      () {
                        _vegan = newvalue;
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
