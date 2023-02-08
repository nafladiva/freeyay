enum Platform { pc, browser, all }

extension ToString on Platform {
  String get name => toString().split('.').last;
}
