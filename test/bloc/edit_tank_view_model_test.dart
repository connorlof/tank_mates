import 'package:flutter_test/flutter_test.dart';
import 'package:tank_mates/bloc/edit_tank_view_model.dart';
import 'package:tank_mates/data/model/species.dart';
import 'package:tank_mates/data/model/tank.dart';
import 'package:tank_mates/data/persistence/hive/hive_constants.dart';

final Species exampleFish = Species(
    "Tetraodon abei",
    "Abei Puffer",
    "Tetraodon abei",
    "puffer",
    Aggressiveness.aggressive,
    6.0,
    7.8,
    73,
    81,
    3,
    15,
    CareLevel.moderate,
    4,
    Diet.carnivore,
    20);

void main() {
  testAddFish();
  testRemoveFish();
  testSetTankName();
  testSetTankGallons();
  testSetAvailableSpecies();
  testIncrementTankGallons();
  testDecrementTankGallons();
  testLoadSavedTank();
  testResetTank();
}

void testAddFish() {
  final EditTankViewModel viewModel = EditTankViewModel();

  test('Adding fish updates state', () {
    expect(viewModel.addedFish.length, 0);
    expect(viewModel.tankState.aggressiveness, Aggressiveness.peaceful);

    //add fish
    viewModel.addFish(exampleFish);

    expect(viewModel.addedFish.length, 1);
    expect(viewModel.tankState.aggressiveness, Aggressiveness.aggressive);
    expect(viewModel.tankState.speciesAdded, [exampleFish]);
  });
}

void testRemoveFish() {
  final EditTankViewModel viewModel = EditTankViewModel();

  test('Removing fish updates state', () {
    expect(viewModel.addedFish.length, 0);

    // Add species
    viewModel.addFish(exampleFish);
    expect(viewModel.addedFish.length, 1);

    // Remove species
    viewModel.removeFish(exampleFish);
    expect(viewModel.addedFish.length, 0);
  });
}

void testSetTankName() {
  final EditTankViewModel viewModel = EditTankViewModel();

  test('Set name updates state', () {
    viewModel.setTankName('Name 1');
    expect(viewModel.tankState.tankName, 'Name 1');

    viewModel.setTankName('Name 2');
    expect(viewModel.tankState.tankName, 'Name 2');
  });
}

void testSetTankGallons() {
  final EditTankViewModel viewModel = EditTankViewModel();

  test('Set gallons updates state', () {
    viewModel.setTankGallons(50);
    expect(viewModel.tankState.gallons, 50);

    viewModel.setTankGallons(100);
    expect(viewModel.tankState.gallons, 100);
  });
}

void testSetAvailableSpecies() {
  final EditTankViewModel viewModel = EditTankViewModel();

  test('Set available species updates state', () {
    viewModel.setAvailableSpecies([exampleFish]);
    expect(viewModel.availableSpecies.length, 1);

    viewModel.setAvailableSpecies([]);
    expect(viewModel.availableSpecies.length, 0);
  });
}

void testIncrementTankGallons() {
  final EditTankViewModel viewModel = EditTankViewModel();

  test('incrementTankGallons updates state', () {
    viewModel.setTankGallons(0);
    viewModel.incrementTankGallons();
    expect(viewModel.tankState.gallons, 1);

    viewModel.incrementTankGallons();
    expect(viewModel.tankState.gallons, 2);
  });
}

void testDecrementTankGallons() {
  final EditTankViewModel viewModel = EditTankViewModel();

  test('decrementTankGallons updates state', () {
    viewModel.setTankGallons(5);
    viewModel.decrementTankGallons();
    expect(viewModel.tankState.gallons, 4);

    viewModel.decrementTankGallons();
    expect(viewModel.tankState.gallons, 3);
  });
}

void testLoadSavedTank() {
  final EditTankViewModel viewModel = EditTankViewModel();

  test('loadSavedTank reflects correct ID', () {
    expect(viewModel.tankState.id, kDefaultTankId);

    viewModel.loadSavedTank(Tank(123, '', 0, []));
    expect(viewModel.tankState.id, 123);
  });
}

void testResetTank() {
  final EditTankViewModel viewModel = EditTankViewModel();

  test('resetTank reflects correct ID', () {
    expect(viewModel.tankState.id, kDefaultTankId);

    viewModel.loadSavedTank(Tank(123, '', 0, []));
    expect(viewModel.tankState.id, 123);

    viewModel.resetTank();
    expect(viewModel.tankState.id, kDefaultTankId);
  });
}
