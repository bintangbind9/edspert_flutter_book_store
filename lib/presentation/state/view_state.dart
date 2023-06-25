enum ViewState {
  initial,
  loading,
  success,
  error;

  bool get isLoading => this == loading;
}
