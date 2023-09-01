import 'package:github_repositories/api_repositury/data_models/all_users_model.dart';
import 'package:github_repositories/api_repositury/data_models/repository_model.dart';
import 'package:github_repositories/api_repositury/data_models/user_models.dart';
import 'package:github_repositories/consts/strings.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<UserModel> getUser(String name) async {

    Map<String, String> headers = <String, String>{};
    headers['Content-Type'] = 'application/json';
    headers['Access-Control-Allow-Headers'] = 'Access-Control-Allow-Origin, Accept';

    Uri url = Uri.parse('${Strings.baseUrl}/$name');
    Response response;
    try {
      response = await http.get(url, headers: headers);
    } on Exception catch (e) {
      return UserModel(error: Strings.unknownError);
    } catch (e) {
      return UserModel(error: Strings.unknownError);
    }
    if ((200 <= response.statusCode && response.statusCode < 300) || response.statusCode == 404) {
      return userModelFromJson(response.body);
    }
    return UserModel(error: Strings.unknownError);
  }


  Future<List<RepositoryModel>?> getRepos(String name) async {

    Map<String, String> headers = <String, String>{};
    headers['Content-Type'] = 'application/json';
    headers['Access-Control-Allow-Headers'] = 'Access-Control-Allow-Origin, Accept';

    Uri url = Uri.parse('${Strings.baseUrl}/$name/repos');
    Response response;
    try {
      response = await http.get(url, headers: headers);
    } on Exception catch (e) {
      return null;
    } catch (e) {
      return null;
    }
    if (200 <= response.statusCode && response.statusCode < 300) {
      return repositoryModelFromJson(response.body);
    }
    return null;
  }

  Future<List<AllUsersModel>?> getAllUsers() async {

    Map<String, String> headers = <String, String>{};
    headers['Content-Type'] = 'application/json';
    headers['Access-Control-Allow-Headers'] = 'Access-Control-Allow-Origin, Accept';

    Uri url = Uri.parse(Strings.baseUrl);
    Response response;
    try {
      response = await http.get(url, headers: headers);
    } on Exception catch (e) {
      return null;
    } catch (e) {
      return null;
    }
    if (200 <= response.statusCode && response.statusCode < 300) {
      return allUsersModelFromJson(response.body);
    }
    return null;
  }
}