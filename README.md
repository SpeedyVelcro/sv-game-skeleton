# SV Game Skeleton
Template project used for my games.

## New Project Setup
- Set `GAME_SLUG` in `./Makefile`
- Find and replace `sv-game-skeleton` in `./export_presets.cfg` with the same
  slug.
- Set `GAME_SLUG` in the following files:
  ```
  ./.github/workflows/build-and-publish.yml
  ./.github/workflows/build-and-test.yml
  ./.github/workflows/game_jolt-build-and-publish.yml
  ./.github/workflows/on-version-tag-create.yml
  ```
- Open and close the project in Godot at least once to to properly import
  plugin scripts.
- In Godot's **Project Settings**:
  - set **Application > Config > Custom User Dir Name** to a unique string
    (probably the same as the game slug).
  - Set **Game Jolt > Config > Global > Game ID** to the game's ID on Game Jolt.
- In GitHub under **Settings > Secrets and Variables > Actions** set the
  following secrets:
  - `GAME_JOLT_PRIVATE_KEY` from the game's page on Game Jolt.
  - `NEWGROUNDS_APP_ID` from the API tools page on Newgrounds.
  - `NEWGROUNDS_AES_128_ENCRYPTION_KEY` from the API tools page on Newgrounds.
  - `PCK_ENCRYPTION_KEY`. Generate this using `openssl rand -hex 32`. (see
    [the docs](https://docs.godotengine.org/en/4.4/contributing/development/compiling/compiling_with_script_encryption_key.html#step-by-step))
- Modify `README.md` as appropriate for your project.

## Release Process
The pipeline will automatically create releases and tags when you push
a main version tag to the repository. A main version tag is a tag in
the form `vX.X.X`, with no extra information appended.

Creating a tag or a release using a tag `vX.X.X` will automatically
create tags and releases for Newgrounds and Game Jolt via the
pipelines. These releases will be tagged `vX.X.X-ng` and `vX.X.X-gj`
respectively.

While creating the tag directly and creating the release have the same
effects, creating the tag directly makes the pipelines look a little
nicer and less confusing. GitHub doesn't have a way to create tags
directly, so run the following commands:
```bash
git tag vX.X.X
git push origin tag v0.0.0
```

## License
Original work in this repository is dual-licensed under [MIT](LICENSES/MIT.txt)
and [Unlicense](LICENSES/Unlicense.txt). You may choose which terms under which
to use the original work in this repository.

The repo is licensed this way because - being a template where you are expected 
to modify files - I wanted to make it easy to integrate into your projects 
without causing a tangled mess of attribution. Hence, the unlicense. The MIT 
license is an alternative if you are not comfortable using the unlicense or need 
a more mainstream license for some reason.

Please note that this repository contains third-party components which may have
different license terms. Please see the accompanying `LICENSE` file in the
following directories:
```
addons/gamejolt
addons/newgrounds
addons/sv_about_menu
addons/sv_achievements
addons/sv_jukebox
addons/sv_options_menu
```
