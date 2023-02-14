import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeyay/domain/entities/entities.dart';
import 'package:freeyay/presentation/bloc/bloc.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    required this.game,
    required this.isFavorite,
    required this.callback,
    super.key,
  });

  final Game game;
  final bool isFavorite;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    final favoriteBloc = context.read<FavoriteBloc>();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          if (isFavorite) {
            favoriteBloc.add(OnRemoveFavorite(game));
          } else {
            favoriteBloc.add(OnAddFavorite(game));
          }

          callback.call();
        },
        child: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
