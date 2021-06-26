import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tank_mates/data/models/tank.dart';

part 'tank_state.dart';

class TankCubit extends Cubit<TankState> {
  TankCubit() : super(TankInitial());

  // TODO: Get tank
  void getTank() {
    emit(state);
  }

  // TODO: Get number of fish added

  // TODO: Get added fish consolidated list

  // TODO: Get added fish names

  // TODO: Add fish

  // TODO: remove fish

  // TODO: updateTankValues

  // TODO: Set tank name

  // TODO: Set tank gallons

  // TODO: Set available fish

  // TODO: reset tank

  // TODO: incrementTankGallons

  // TODO: decrementTankGallons

  // TODO: loadSavedTank

}
