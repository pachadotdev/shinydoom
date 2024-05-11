# Doom in Shiny

## About

I wrote a [blog post](https://pacha.dev/blog/2024/05/10) explaining the details and I even included a video.

Here is how the game looks once it runs on Shiny:

![image](https://github.com/pachadotdev/shinydoom/assets/10091065/e47ba7d6-a9af-4744-8713-e0b42d4d386e)

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

## Run locally

Source `app.R` from RStudio or VSCode.

## Run on shinyapps.io

Move the following files:

```bash
mkdir doom-compiled
mv doom-wasm/src/index.html doom-compiled/index.html
mv doom-wasm/src/doom1.wad doom-compiled/doom1.wad
mv doom-wasm/src/default.cfg doom-compiled/default.cfg
mv doom-wasm/src/websockets-doom.js doom-compiled/websockets-doom.js
mv doom-wasm/src/websockets-doom.html doom-compiled/websockets-doom.html
mv doom-wasm/src/websockets-doom.wasm doom-compiled/websockets-doom.wasm
mv doom-wasm/src/websockets-doom.wasm.map doom-compiled/websockets-doom.wasm.map
```

Then change the path in `app.R` to `doom-compiled` and deploy.

## Controls

* F: full screen
* Space: fire
* T: open door
* up/down/left/right: move
* 1-4: change weapon
* Esc: release mouse/go to menu

You can also use the mouse to move around.

*If you like what I do as a content creator, you can donate on [Buy Me a Coffee](https://buymeacoffee.com/pacha).*
