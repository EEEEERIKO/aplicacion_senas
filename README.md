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

Explicación rápida: ¿por qué ejecutar `flutter test` en cada push/PR?

- `flutter test` ejecuta los tests unitarios y de widgets del proyecto automáticamente en CI. Esto ayuda a detectar roturas de funcionalidad antes de fusionar cambios (errores en lógica, regresiones en UI, dependencias rotas).
- Beneficios:
	- Detectar bugs tempranamente.
	- Mantener la calidad de código en PRs grandes o pequeños.
	- Automatizar verificación básica antes de deploy.

Arquitectura propuesta (carpetas principales)
- `lib/src/ui` - pantallas y widgets.
- `lib/src/features` - features concretas (ej. `lessons`, `profile`, `shop`).
- `lib/src/domain` - modelos y casos de uso.
- `lib/src/data` - repositorios, fuentes de datos locales/remotas.
- `lib/src/state` - providers y lógica de estado (Riverpod).
- `lib/src/services` - servicios platform (camera, ml, storage).
- `assets/` - imágenes, videos, modelos.

He creado skeletons iniciales para `domain`, `data`, `state`, `features/lessons` y un `assets/.gitkeep`.

Branching sugerido
- `main` - rama estable y deployable.
- `develo` - rama de desarrollo (merge PRs desde feature branches).
- `test` - rama para pruebas experimentales o integraciones antes de pasar a `develo`.

Si quieres, ahora creo las ramas `test` y `develo` en remoto (ya tengo acceso al repo). También puedo añadir un workflow de GitHub Actions básico que ejecute `flutter test` en pushes y PRs.

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
