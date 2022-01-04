

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Failure extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ServerFailure extends Failure{}
class CacheFailure extends Failure{}