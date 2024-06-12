// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_generator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardingGeneratorStore on _OnboardingGeneratorStore, Store {
  Computed<bool>? _$hasOnboardingStepsComputed;

  @override
  bool get hasOnboardingSteps => (_$hasOnboardingStepsComputed ??=
          Computed<bool>(() => super.hasOnboardingSteps,
              name: '_OnboardingGeneratorStore.hasOnboardingSteps'))
      .value;

  late final _$requirementsListAtom = Atom(
      name: '_OnboardingGeneratorStore.requirementsList', context: context);

  @override
  List<String> get requirementsList {
    _$requirementsListAtom.reportRead();
    return super.requirementsList;
  }

  @override
  set requirementsList(List<String> value) {
    _$requirementsListAtom.reportWrite(value, super.requirementsList, () {
      super.requirementsList = value;
    });
  }

  late final _$companyResourcesListAtom = Atom(
      name: '_OnboardingGeneratorStore.companyResourcesList', context: context);

  @override
  List<String> get companyResourcesList {
    _$companyResourcesListAtom.reportRead();
    return super.companyResourcesList;
  }

  @override
  set companyResourcesList(List<String> value) {
    _$companyResourcesListAtom.reportWrite(value, super.companyResourcesList,
        () {
      super.companyResourcesList = value;
    });
  }

  late final _$employeeResourcesListAtom = Atom(
      name: '_OnboardingGeneratorStore.employeeResourcesList',
      context: context);

  @override
  List<String> get employeeResourcesList {
    _$employeeResourcesListAtom.reportRead();
    return super.employeeResourcesList;
  }

  @override
  set employeeResourcesList(List<String> value) {
    _$employeeResourcesListAtom.reportWrite(value, super.employeeResourcesList,
        () {
      super.employeeResourcesList = value;
    });
  }

  late final _$onboardingStepsAtom =
      Atom(name: '_OnboardingGeneratorStore.onboardingSteps', context: context);

  @override
  List<OnboardingStep>? get onboardingSteps {
    _$onboardingStepsAtom.reportRead();
    return super.onboardingSteps;
  }

  @override
  set onboardingSteps(List<OnboardingStep>? value) {
    _$onboardingStepsAtom.reportWrite(value, super.onboardingSteps, () {
      super.onboardingSteps = value;
    });
  }

  late final _$fetchOnboardingStepsFutureAtom = Atom(
      name: '_OnboardingGeneratorStore.fetchOnboardingStepsFuture',
      context: context);

  @override
  ObservableFuture<List<OnboardingStep>?> get fetchOnboardingStepsFuture {
    _$fetchOnboardingStepsFutureAtom.reportRead();
    return super.fetchOnboardingStepsFuture;
  }

  @override
  set fetchOnboardingStepsFuture(
      ObservableFuture<List<OnboardingStep>?> value) {
    _$fetchOnboardingStepsFutureAtom
        .reportWrite(value, super.fetchOnboardingStepsFuture, () {
      super.fetchOnboardingStepsFuture = value;
    });
  }

  late final _$getOnboardingStepsAsyncAction = AsyncAction(
      '_OnboardingGeneratorStore.getOnboardingSteps',
      context: context);

  @override
  Future<List<OnboardingStep>?> getOnboardingSteps(
      {required List<String> requirements,
      required List<String> employeeResources,
      required List<String> companyResources}) {
    return _$getOnboardingStepsAsyncAction.run(() => super.getOnboardingSteps(
        requirements: requirements,
        employeeResources: employeeResources,
        companyResources: companyResources));
  }

  late final _$_OnboardingGeneratorStoreActionController =
      ActionController(name: '_OnboardingGeneratorStore', context: context);

  @override
  void addRequirement(String item) {
    final _$actionInfo = _$_OnboardingGeneratorStoreActionController
        .startAction(name: '_OnboardingGeneratorStore.addRequirement');
    try {
      return super.addRequirement(item);
    } finally {
      _$_OnboardingGeneratorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editRequirement(int index, String item) {
    final _$actionInfo = _$_OnboardingGeneratorStoreActionController
        .startAction(name: '_OnboardingGeneratorStore.editRequirement');
    try {
      return super.editRequirement(index, item);
    } finally {
      _$_OnboardingGeneratorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteRequirement(int index) {
    final _$actionInfo = _$_OnboardingGeneratorStoreActionController
        .startAction(name: '_OnboardingGeneratorStore.deleteRequirement');
    try {
      return super.deleteRequirement(index);
    } finally {
      _$_OnboardingGeneratorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addEmployeeResource(String item) {
    final _$actionInfo = _$_OnboardingGeneratorStoreActionController
        .startAction(name: '_OnboardingGeneratorStore.addEmployeeResource');
    try {
      return super.addEmployeeResource(item);
    } finally {
      _$_OnboardingGeneratorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editEmployeeResource(int index, String item) {
    final _$actionInfo = _$_OnboardingGeneratorStoreActionController
        .startAction(name: '_OnboardingGeneratorStore.editEmployeeResource');
    try {
      return super.editEmployeeResource(index, item);
    } finally {
      _$_OnboardingGeneratorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteEmployeeResource(int index) {
    final _$actionInfo = _$_OnboardingGeneratorStoreActionController
        .startAction(name: '_OnboardingGeneratorStore.deleteEmployeeResource');
    try {
      return super.deleteEmployeeResource(index);
    } finally {
      _$_OnboardingGeneratorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCompanyResource(String item) {
    final _$actionInfo = _$_OnboardingGeneratorStoreActionController
        .startAction(name: '_OnboardingGeneratorStore.addCompanyResource');
    try {
      return super.addCompanyResource(item);
    } finally {
      _$_OnboardingGeneratorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editCompanyResource(int index, String item) {
    final _$actionInfo = _$_OnboardingGeneratorStoreActionController
        .startAction(name: '_OnboardingGeneratorStore.editCompanyResource');
    try {
      return super.editCompanyResource(index, item);
    } finally {
      _$_OnboardingGeneratorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteCompanyResource(int index) {
    final _$actionInfo = _$_OnboardingGeneratorStoreActionController
        .startAction(name: '_OnboardingGeneratorStore.deleteCompanyResource');
    try {
      return super.deleteCompanyResource(index);
    } finally {
      _$_OnboardingGeneratorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requirementsList: ${requirementsList},
companyResourcesList: ${companyResourcesList},
employeeResourcesList: ${employeeResourcesList},
onboardingSteps: ${onboardingSteps},
fetchOnboardingStepsFuture: ${fetchOnboardingStepsFuture},
hasOnboardingSteps: ${hasOnboardingSteps}
    ''';
  }
}
