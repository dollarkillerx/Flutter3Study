class _LoginViewState extends State<LoginView> {
  var userName = new TextEditingController();
  var password = new TextEditingController();
  var jc = new TextEditingController();

  /// 设置Sting的值
  static setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  /// 获取返回为String的内容
  getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    return value;
  }

  _load() async {
    var jcv = await getString("jc");
    if (jcv != null) {
      setState(() {
        jc.text = jcv!;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => setState(() {
      _load();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            controller: userName,
            decoration: InputDecoration(
              labelText: "UserName",
            ),
          ),
          Divider(),
          TextField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          Divider(),
          TextField(
            controller: jc,
            decoration: InputDecoration(
              labelText: "JC",
            ),
          ),
          ElevatedButton(onPressed: () {
            setState(() {
              jc.text = userName.text + password.text;
              setString("jc", jc.text);
            });
          }, child: Text("Login")),
        ],
      ),
    );
  }
}
