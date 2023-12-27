
## Backup Checklist

- Did you commit and push any changes/branches to your git repositories?
- Did you copy your .env files to a safe place if they are not casual?
- Did you copy your IDE settings? (e.g. PhpStorm)
- Did you backup local databases you need?
- Did you remember to save all important documents from non-cloud directories?
- Did you save all of your work from apps which aren't synced through cloud?
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`?
- Create "Brave Sync" QR Code (Settings / Sync)

## Installation

1. `Update macOS` to the latest version with the App Store
2. `Clone dotfiles` to ~/.dotfiles (you will be asked to download command line tools)
    ```zsh
    git clone https://github.com/lithium-diffuser/dotfiles.git ~/.dotfiles
    ```
3. `Run Installation` script
    ```zsh
    ~/.dotfiles/install.sh
    ```
4. `Sync Mackup` Folder (from Dropbox)
5. `Restore Mac settings" After mackup is synced with your cloud storage, by running `mackup restore`
6. `Restart your computer` to finalize the process
