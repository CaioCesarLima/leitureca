

class UserModel {
  final String id;
  final bool isAdmin;
  final String turma;
  int saldo;
  final String name;
  final String userName;

  UserModel({this.isAdmin, this.turma, this.saldo, this.name, this.userName, this.id,});

  factory UserModel.fromParse(response){
    return UserModel(
    isAdmin : response['isAdmin'],
    turma : response[ 'turma'],
    saldo : response['saldo'],
    name : response['name'],
    userName : response['userName'],
    id : response['objectId'],
    );
  }
}