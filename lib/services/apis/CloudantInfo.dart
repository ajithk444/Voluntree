import '../Client.dart';

class CloudantInfo {
  static const cloudantAccount = "9eb750a3-a6b6-4950-8493-56aa7409860c-bluemix";
  static const cloudantPass = "380013eaf2e7bc7086f686af352382bae8a9c4a80b46f45296c0c6e8f4104cf0";

  static Client getCloudantClient() => Client(url: "$cloudantAccount:$cloudantPass@$cloudantAccount.cloudant.com");
  static Client getCloudantAccountClient() => Client(url: "$cloudantAccount.cloudant.com");
}