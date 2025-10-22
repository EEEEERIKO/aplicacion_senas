# Aplicación Señas (Flutter)

Proyecto base para una aplicación gamificada de aprendizaje de señas (Android/iOS) creada con Flutter.

Estructura inicial:
- `lib/main.dart` - punto de entrada que inicializa Riverpod y carga `App`.
- `lib/src/app.dart` - configuración de rutas con `go_router`.
- `lib/src/ui/screens` - pantallas iniciales (`onboarding`, `home`).

Dependencias recomendadas añadidas en `pubspec.yaml`:
- `go_router` - navegación declarativa.
- `flutter_riverpod` - gestión de estado.
- `hive` / `hive_flutter` - persistencia local para progreso/monedas.
- `path_provider` - utilidades para almacenamiento.

Siguientes pasos sugeridos:
1. Ejecutar `flutter pub get` en la carpeta `aplicacion_senas`.
2. Implementar módulos: `domain`, `data`, `features/lessons`, `services/camera`.
3. Añadir detección de manos (MediaPipe / tflite) y lógica de scoring.
4. Diseñar el sistema de gamificación (XP, monedas, logros) y persistencia con Hive.

"Try it":
1. Abrir terminal en `aplicacion_senas`.
2. Ejecutar `flutter run` para lanzar la app en un emulador o dispositivo.
# aplicacion_senas

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
