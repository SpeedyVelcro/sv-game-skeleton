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
- In Godot's **Project Settings**, as **Application > Config > Custom User Dir Name**
  to a unique string (probably the same as the game slug).
- Delete this section from `README.md` as it is no longer relevant.


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
