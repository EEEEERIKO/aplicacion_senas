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
