class CategoryItem{
  String _iconCode;
  String _categoryName;
  bool _isCounted;

  CategoryItem(this._iconCode, this._categoryName,this._isCounted);

  // Getter
  String get categoryName => _categoryName;

  String get iconCode => _iconCode;

  bool get isCounted => _isCounted;
}