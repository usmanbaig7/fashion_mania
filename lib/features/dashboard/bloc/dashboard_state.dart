part of 'dashboard_cubit.dart';

class DashboardState {
  const DashboardState({this.tabIndex = 0});

  /// Index into [DashboardCubit.navItems].
  final int tabIndex;

  DashboardState copyWith({int? tabIndex}) {
    return DashboardState(tabIndex: tabIndex ?? this.tabIndex);
  }
}
