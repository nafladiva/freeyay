import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freeyay/domain/entities/entities.dart';
import 'package:freeyay/injection.dart';
import 'package:freeyay/presentation/bloc/bloc.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    required this.game,
    super.key,
  });

  final Game game;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late FavoriteBloc favoriteBloc;
  late DetailGameBloc detailGameBloc;

  @override
  void initState() {
    super.initState();
    detailGameBloc = locator<DetailGameBloc>();
    detailGameBloc.add(OnCheckFavoriteStatus(widget.game));
    favoriteBloc = context.read<FavoriteBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: detailGameBloc,
      child: BlocListener<FavoriteBloc, FavoriteState>(
        bloc: favoriteBloc,
        listener: (context, state) {
          if (state is FavoriteSuccess) {
            Fluttertoast.showToast(msg: state.message ?? '');
          }
        },
        child: BlocBuilder<DetailGameBloc, DetailGameState>(
          bloc: detailGameBloc,
          builder: (context, state) {
            if (state is FavoriteStatusSuccess) {
              final isFavorite = state.isFavorite;

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    if (isFavorite) {
                      favoriteBloc.add(OnRemoveFavorite(widget.game));
                    } else {
                      favoriteBloc.add(OnAddFavorite(widget.game));
                    }

                    detailGameBloc.add(OnCheckFavoriteStatus(widget.game));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
