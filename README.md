# Updater-Script

WSL script for auto-updating local install of 5eTools and launching the webserver.

It automatically installs all required packages (python3, xdg-utils, and p7zip).

## Software Requirements

Windows 10 build 16237 or later, [WSL](https://docs.microsoft.com/en-gb/windows/wsl/install-win10), [Ubunutu 20.04.1 LTS](https://www.microsoft.com/store/productId/9NBLGGH4MSV6)

## Configuration

Edit the `config.sh` file with the install path.

## Optional

Create a shortcut for `Run.cmd` on Desktop, rename it and change it's icon.

### Creating a shortcut

1. Navigate to the `Run.cmd` file and right-click on it.

![#1](https://i.imgur.com/wyfB4Gf.png)

2. Click on `Send to` the `Desktop (create shortcut)`.

![#2](https://i.imgur.com/56wBp3V.png)

3. You should see a shortcut on your Desktop.

![Desktop Shortcut Example](https://i.imgur.com/uWptNtY.png)

4. Rename it to `5eTools` by right-clicking on it and clicking Rename.

### Changing the icon

1. Download this icon from [here](https://raw.githubusercontent.com/waterlava/Updater-Script/main/5eTools.ico).

![5eTools.ico](https://raw.githubusercontent.com/waterlava/Updater-Script/main/5eTools.ico)

2. Go the shortcut you made and right-click on it. Click `Properties`.

![#3](https://i.imgur.com/7aLOm2F.png)

3. Click on `Change Icon...`

![#4](https://i.imgur.com/E5sjABy.png)

4. Click `OK` if you get a pop up.

![#5](https://i.imgur.com/wfIdvIq.png)

5. Click Browse and select the icon you downloaded.

## License

This is under the [Apache 2.0 license](LICENSE).

## Semantic Versioning

This software uses [Semantic Versioning](https://semver.org/).
