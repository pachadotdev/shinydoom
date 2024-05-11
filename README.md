# Doom in Shiny

## Build

```bash
apt-get install build-essential libsdl2-dev libsdl2-mixer-dev

git clone --depth 1 git@github.com:emscripten-core/emsdk.git
cd emsdk
./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh
cd ..

git clone --depth 1 git@github.com:cloudflare/doom-wasm.git
cd doom-wasm && ./scripts/clean.sh && ./scripts/build.sh && cd ..

wget https://distro.ibiblio.org/slitaz/sources/packages/d/doom1.wad -O doom-wasm/src/doom1.wad
```

## Run

Source `app.R` from RStudio or VSCode.

## Controls

* F: full screen
* Space: fire
* T: open door
* up/down/left/right: move
* 1-4: change weapon
* Esc: release mouse/go to menu

You can also use the mouse to move around.
