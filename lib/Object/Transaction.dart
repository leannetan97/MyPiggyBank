import 'package:my_piggy_bank/calender.dart';

class Transaction{
  String _icon, _categoryName, _nameOweMeMoney,_nameThatIOweMoney;
  double _amount;
  bool _isOweBySomeone, _isOwningSomeone;
  Calender date;

  Transaction(this._icon, this._categoryName, this._amount,this._isOweBySomeone,this._nameOweMeMoney,this._isOwningSomeone,this._nameThatIOweMoney);

  // Getter
  get isOwningSomeone => _isOwningSomeone;

  bool get isOweBySomeone => _isOweBySomeone;

  double get amount => _amount;

  get nameThatIOweMoney => _nameThatIOweMoney;

  get nameOweMeMoney => _nameOweMeMoney;

  get categoryName => _categoryName;

  String get icon => _icon;
  // TODO: Add Date and Day

}