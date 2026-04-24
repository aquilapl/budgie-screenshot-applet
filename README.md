# budgie-screenshot-applet (Wayland/labwc)

Prosty aplet dla Budgie Desktop, będący wrapperem dla
`org.buddiesofbudgie.BudgieScreenshot` (Budgie 10.10+).

## Sterowanie

| Akcja           | Skrót                  |
|-----------------|------------------------|
| Lewy klik       | Tryb interaktywny (`-i`) |
| Środkowy klik   | Zaznacz obszar (`-a`)  |
| Prawy klik      | Menu kontekstowe       |

## Zależności

```
budgie-desktop-dev  (lub budgie-1.0 pkgconfig)
libpeas-dev
libgtk-3-dev
valac
meson
ninja-build
org.buddiesofbudgie.BudgieScreenshot  (z budgie 10.10)
```
### Solus
```bash
sudo eopkg it vala meson ninja \
    budgie-desktop-devel libpeas-2-devel libgtk-3-devel \
    libgtk-layer-shell-devel
```

### Debian/Ubuntu:
```bash
sudo apt install valac meson ninja-build \
    libbudgie-plugin-dev libpeas-dev libgtk-3-dev
```

### Fedora:
```bash
sudo dnf install vala meson ninja-build \
    budgie-desktop-devel libpeas-devel gtk3-devel
```

## Budowanie i instalacja

```bash
meson setup build
ninja -C build
sudo ninja -C build install
```

Po instalacji uruchom ponownie panel Budgie:
```bash
budgie-panel --replace &
```

Następnie dodaj aplet „Screenshot" przez Budgie Desktop Settings → Panel → Applets.
