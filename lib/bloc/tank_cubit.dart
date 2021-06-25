import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tank_mates/models/tank.dart';

part 'tank_state.dart';

class TankCubit extends Cubit<TankState> {
  TankCubit() : super(TankInitial());
}
