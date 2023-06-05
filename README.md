## Installation
1. Install chezmoi [somehow](https://www.chezmoi.io/install/)
2. `chezmoi init dzerus3`
3. `chezmoi cd`
4. Look through `.chezmoidata.toml` to check default settings. Then edit `~/.config/chezmoi/chezmoi.toml`. Add a `[data]` section at the bottom and override any settings you do not want. **Do not skip this step; the defaults probably don't make sense for you.**
5. `chezmoi apply`

### Installation over SSH

https://github.com/twpayne/chezmoi/issues/1410#issuecomment-934973882

`ssh -t user@remote.machine 'sh <(curl -fsSL git.io/chezmoi) -- init --one-shot reponame'
