import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/music_provider.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final musicProvider = context.watch<MusicProvider>();
    final track = musicProvider.currentTrack;

    if (track == null) {
      return const SizedBox.shrink();
    }

    return Dismissible(
      // Clave única basada en el id de la canción actual
      key: ValueKey('miniplayer-${track.id}'),
      // Solo permitir deslizar hacia abajo
      direction: DismissDirection.down,
      // Indicador visual mientras se desliza: fondo rojo con ícono de stop
      background: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.red[900],
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.stop_circle_outlined, color: Colors.white, size: 32),
      ),
      // Al completar el desliz, detener la música
      onDismissed: (_) => musicProvider.stop(),
      // Umbral: el usuario debe deslizar al menos el 40% para confirmar
      dismissThresholds: const {DismissDirection.down: 0.4},
      // Animación de salida: se desvanece mientras cae
      movementDuration: const Duration(milliseconds: 300),
      resizeDuration: const Duration(milliseconds: 200),
      child: Container(
        height: 80,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.deepPurple[900],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [const BoxShadow(color: Colors.black54, blurRadius: 8)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Indicador visual de "arrastra para cerrar"
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    track.image,
                    width: 46,
                    height: 46,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  track.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(track.artist, maxLines: 1),
                trailing: IconButton(
                  icon: Icon(
                    musicProvider.isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  onPressed: () => musicProvider.playTrack(track),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}