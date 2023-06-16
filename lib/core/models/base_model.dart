import 'package:equatable/equatable.dart';

///TODO: Review the scenario especially created at

abstract class BaseModel extends Equatable {
  //class constructors
  const BaseModel();

  //class fromMap constructor and function
  const BaseModel.fromMap(Map<String, dynamic> map);

  fromMap(Map<String, dynamic> map);

  ///TODO: use copyWithDataFromMap to use previous model with the new data comes from map if needed
  // copyWithDataFromMap(Map<String, dynamic> map);

  //class toMap
  Map<String, dynamic> toMap();

  //from List
  List<BaseModel> fromList(List<dynamic> items);

  //Equatable props for equality
  @override
  List<Object?> get props => [];

  //hashCode
  @override
  int get hashCode;

  //operator ==
  @override
  bool operator ==(other);

  //to string
  @override
  String toString();
}
