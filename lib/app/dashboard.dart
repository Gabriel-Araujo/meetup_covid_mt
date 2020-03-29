import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:meetup_covid_mt/app/brazil_cases.dart';
import 'package:meetup_covid_mt/app/data_repository.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Doc> _casesData;

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    var result = await DataRepository().fetchCovidCases();
    setState(() => _casesData = result);
  }

  List<Widget> _buildCasesList() => _casesData.map((cc) => ListTile(
      leading: CircleAvatar(
        child: Text(cc.count.toString()),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      title: Text(cc.cityName),
      subtitle: Text(cc.date),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        //
      },
      
      ),
    ).toList();

  List<charts.Series<Doc, String>> _createChartData(){
    return [
      new charts.Series<Doc, String>(
        id: 'Cases',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (Doc d, _) => d.date,
        measureFn: (Doc d, _) => d.count,
        data: _casesData,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coronavirus MT Tracker'),
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: 
          (null == _casesData)
          ? const CircularProgressIndicator()
          : ListView(
            children: 
              <Widget>[
                Container(
                  height: 182, 
                  child: 
                    charts.BarChart(_createChartData(), animate: true)
                ,)]..addAll(_buildCasesList()),
          ),
      )
    );
  }
  
}