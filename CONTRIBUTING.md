# Contributing

Gracias por querer contribuir a este proyecto! A continuación hay una guía rápida para colaborar.

1. Fork & clone
   - Haz un fork del repositorio y clona tu fork localmente.
2. Branches
   - Usa ramas descriptivas: `feature/my-feature`, `fix/issue-123`.
   - Flujo recomendado:
     - `develop` para trabajo diario
     - `test` para ejecutar CI y validar integraciones
     - `main` sólo para releases estables
3. Tests y calidad
   - Añade tests unitarios/widget cuando sea posible.
   - Ejecuta `flutter analyze` y `flutter test` antes de abrir PR.
4. Pull Requests
   - Dirige el PR hacia `test` (nuestra rama de validación). CI ejecutará las pruebas.
   - Incluye una descripción y capturas si aplica.
5. Código de conducta
   - Respeta el `CODE_OF_CONDUCT.md`.

Si necesitas ayuda, abre un issue y te guiaremos.
# How to push this project to GitHub

1. Crea un repositorio vacío en GitHub (sin README ni .gitignore).
2. En tu máquina, desde la carpeta del proyecto ejecuta:

```bash
git remote add origin git@github.com:<tu-usuario>/<tu-repo>.git
git branch -M main
git push -u origin main
```

Si prefieres HTTPS:

```bash
git remote add origin https://github.com/<tu-usuario>/<tu-repo>.git
git branch -M main
git push -u origin main
```
