import 'package:bloc_demo/model.dart';
import 'package:bloc_demo/provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<ModelData?> fetchCovidList() {
    return _provider.fetchApi();
  }
}

class NetworkError extends Error {}