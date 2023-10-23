class Languages {
  int? id;
  String? flag;
  String? name;
  String? languagCode;
  Languages(this.id, this.flag, this.name, this.languagCode);
  static List<Languages> listLanguages() {
    return [
      Languages(1, '🇺🇸', 'English', 'en'),
      Languages(1, '🇪🇬', 'العربية', 'ar'),
    ];
  }
}
