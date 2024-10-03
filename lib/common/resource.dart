class Resource<T> {
  final T? data;
  final String? message;
  final ResourceState state;

  Resource._(this.data, this.message, this.state);

  factory Resource.success(T data) {
    return Resource._(data, null, ResourceState.success);
  }

  factory Resource.error(String message) {
    return Resource._(null, message, ResourceState.error);
  }

  factory Resource.loading() {
    return Resource._(null, null, ResourceState.loading);
  }
}

enum ResourceState { success, error, loading }