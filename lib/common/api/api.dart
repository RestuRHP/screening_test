class Api {
  Api({this.baseUrl});

  String? baseUrl;
}

mixin ApiType {
  static Api get development => Api(baseUrl: 'https://reqres.in/api');

  // static Api get production => Api(baseUrl: 'https://reqres.in/api');
}
