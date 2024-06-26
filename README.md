# rpm2sysext

This is a simple bash script that converts a RPM package into a systemd-sysext image.

It simply works by extracting the RPM package contents into a directory, writing metadata for it and then creating a squashfs image out of that directory.

## Usage

```bash
./rpm2sysext.sh <rpm-package>
```

You can also set a custom name for the systemd-sysext image by setting the `SYSEXT_NAME` environment variable.

```bash
SYSEXT_NAME=my-extension ./rpm2sysext.sh <rpm-package>
```

This will create a `.raw` file in the current directory. The file name should be printed to the console after the script finishes running.
Simply copy this file to /var/lib/extensions and run `systemd-sysext merge` to load the extension.

## Limitations

- The script only supports loading a single RPM package at the moment, Functionality to load multiple packages is not implemented yet. This will be added in the future.
- The script is hardcoded to output files in the current directory, it does not support custom output paths.
- The metadata is hardcoded to use the current system's `/etc/os-release` variables for now. This will be made configurable in the future.
- RPM pre/post-install scripts are not executed, so the package may not work correctly if it relies on these scripts to set up the environment.
- The script only adds the files from the RPM package to the image, it does not modify the internal RPM database, so the package will not be recognized as installed by the system.

## Dependencies

- `rpm2cpio` (from `rpm` package)
- `cpio`
- `mksquashfs` (from `squashfs-tools` package)
- `systemd-sysext` (from `systemd` package)

