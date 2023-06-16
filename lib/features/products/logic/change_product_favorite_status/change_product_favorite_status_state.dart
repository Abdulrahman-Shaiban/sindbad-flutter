abstract class ChangeProductFavoriteStatusState {
  const ChangeProductFavoriteStatusState();
}

class ChangeProductFavoriteStatusInitial
    extends ChangeProductFavoriteStatusState {
  const ChangeProductFavoriteStatusInitial();
}

class ChangeProductFavoriteStatusLoading
    extends ChangeProductFavoriteStatusState {
  final int? index;

  const ChangeProductFavoriteStatusLoading({
    this.index,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChangeProductFavoriteStatusLoading &&
          runtimeType == other.runtimeType &&
          index == other.index ;

  @override
  int get hashCode => index.hashCode ;
}

class ChangeProductFavoriteStatusLoaded
    extends ChangeProductFavoriteStatusState {
  final String message;
  final int? index;

  const ChangeProductFavoriteStatusLoaded({
    required this.message,
    this.index,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChangeProductFavoriteStatusLoaded &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          index == other.index;

  @override
  int get hashCode => message.hashCode ^ index.hashCode;
}

class DeleteProductFromFavoriteLoaded extends ChangeProductFavoriteStatusState {
  final String message;

  const DeleteProductFromFavoriteLoaded({
    required this.message,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeleteProductFromFavoriteLoaded &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}

class ChangeProductFavoriteStatusError
    extends ChangeProductFavoriteStatusState {
  final String error;

  const ChangeProductFavoriteStatusError({required this.error});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChangeProductFavoriteStatusError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
