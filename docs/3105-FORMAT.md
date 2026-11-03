# 3105 format notes

3105 maps patch content to a stable app bundle identifier, not a device-specific container UUID.

A patch workspace has replacement paths under the target bundle directory, such as:
```
Patches/
  YouTubeAdResearch/
    com.google.ios.youtube/
      Library/
        Preferences/
```

A file placed at a destination path is a replacement/addition. This is not an executable-code injection mechanism. It cannot by itself add a tweak, hook Objective-C methods, alter in-memory ad decisions, or load a dylib into YouTube.

Official guide: https://github.com/YangJiiii/3105/blob/main/docs/PATCH_GUIDE.md

No .3105 binary is generated in this repository yet. A valid package requires a verified real configuration change and a package produced/exported by the 3105 app.
