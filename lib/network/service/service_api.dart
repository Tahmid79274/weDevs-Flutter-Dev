class ServiceApi {
  //Base Url
  static String baseUrl = "http://apptest.dokandemo.com/wp-json/";

  //Params
  static String languageParam = "lang=";
  static String idParam = "&id=";

  //End Urls:
  static String registrationEndPoint = '${baseUrl}wp/v2/users/register';
  static String loginEndPoint = '${baseUrl}jwt-auth/v1/token';

}
