abstract class Db {
  Init(String uri);
  Query();
  Exec();
}

class MySQL implements Db {
  late String uri;

  @override
  Init(String uri) {
    this.uri = uri;
  }

  @override
  Exec() {
    print("exec");
  }

  @override
  Query() {
    print("query");
  }

}