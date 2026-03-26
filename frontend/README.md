# Flutter Frontend

Proyecto preparado para ejecutarse en Android.

## Qué se ha simplificado

- Se ha eliminado la plataforma web del frontend.
- Se ha quitado la configuración de Firebase del frontend porque no se estaba usando en el arranque actual de la app.
- La configuración de VS Code ya no depende de un emulador local concreto.
- `android/local.properties` no se versiona para que el proyecto sea portable entre equipos.

## Requisitos en el otro ordenador

- Flutter instalado y accesible en `PATH`
- Android Studio o Android SDK configurado
- Un emulador Android o un dispositivo físico por USB

## Arranque rápido

Desde `frontend/`:

```bash
flutter pub get
flutter run
```

Si quieres elegir un dispositivo concreto:

```bash
flutter devices
flutter run -d <deviceId>
```

## Notas

- La app usa peticiones HTTP y base de datos local con Floor/sqflite.
- No hace falta configurar Firebase para ejecutar el estado actual del frontend.
- Si en el futuro vuelves a integrar Firebase, tendrás que restaurar sus dependencias y la configuración Android correspondiente.

## Si cambias modelos anotados o servicios generados

```bash
dart run build_runner build --delete-conflicting-outputs
```
