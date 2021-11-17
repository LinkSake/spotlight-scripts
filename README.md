# Spotlight Scripts

A collection of scripts that can be executed via Spotlight.

## Usage

### Permitions

All the scripts need permitions to be executable by the user, this can be done by running `chmod -R u+x .` on the root directory of the project.

> All new scripts should be given permition after creation.

Then set the Terminal to automatically close the window upon completion, in the Terminal app go to `Preferences` > `Profiles` > (Select a Profile) > `Shell`; on `When the shell exits` choose `Close the window`.

The project can be anywhere on the system, just make sure Spotlight indexes the parent folder.

### Spotlight

Use the keybinding to open Spotlight (`cmd` + `space` by default) and type the name of the script (e.g.: sleep.sh.command) and hit enter to execute it; after sometime of using the scripts Spotlight will autocomplete them, then only typing the first part of the name will be enough (e.g.: sleep).

## Scripts

```zsh
├── spotify
│   ├── next.sh.command # Skips to next track on the queue
│   ├── pause.sh.command # Pauses current track
│   ├── play.sh.command # Plays current track
│   └── prev.sh.command # Rollback to previous track
└── system
    ├── screensaver.sh.command # Sets the screensaver on all screens
    ├── shutdown.sh.command # Shuts down the system after prompting the password
    └── sleep.sh.command # Sleeps the system
```

## Next up

Scripts that would be nice to make:

- Empty trash.
- Close specific app (like on Alfred).
- Close all apps.
- Play a song on Spotify by name.

## Acknowledgements

Partially based on projects by [brendonjohn](https://github.com/brendonjohn/spotlight-scripts) and [gtumbaga](https://github.com/gtumbaga/Spotlight-Commands).
