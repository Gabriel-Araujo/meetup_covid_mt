import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meetup_covid_mt/app/brazil_cases.dart';

const String BRAZIL_CASES_URL = 'https://especiais.g1.globo.com/bemestar/coronavirus/mapa-coronavirus/data/brazil-cases.json';

class DataRepository {

  Future<String> _fetchData(String url) async {
    http.Response response;
    try{
      response = await http.get(url);
      if(response.statusCode == 200){
        return utf8.decode(response.bodyBytes);
      }
    } on Exception catch(ex) {
      print(ex);
      return '';
    }
  }

  Future<List<Doc>> fetchCovidCases() async =>
    _fetchData(BRAZIL_CASES_URL).then(readData);

  List<Doc> readData(String jsonRaw) {
    final brazilCases = BrazilCases.fromJson(jsonRaw);
    return brazilCases.docs.where((d) => d.cityCod == 5103403).toList();
  }


}