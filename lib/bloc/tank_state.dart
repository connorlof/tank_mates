part of 'tank_cubit.dart';

@immutable
abstract class TankState {
  const TankState();
}

class TankInitial extends TankState {
  const TankInitial();
}

class TankLoading extends TankState {
  const TankLoading();
}

class TankError extends TankState {
  final String message;
  const TankError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TankError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class TankLoaded extends TankState {
  final Tank tank;
  const TankLoaded(this.tank);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TankLoaded && o.tank == tank;
  }

  @override
  int get hashCode => tank.hashCode;
}
