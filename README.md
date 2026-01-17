# Poor Man's Slideshow Install
Raspberry Pi Desktop is required for this install.

## Step 1
Install tools.
```
sudo apt update
sudo apt install feh x11-xserver-utils unclutter samba -y
```

## Step 2
Setup Samba.

> [!NOTE]
> This step is optional, but useful for adding the files to the loop from a different computer.

Add the contents below to /etc/samba/smb.conf:
```
[loop]
  path = <your folder>
  browseable = yes
  read only = no
  guest ok = no
```

Then, add a user to connect to samba with:
```
sudo smbpasswd -a <username>
```
> [!IMPORTANT]
> The username you enter must already exist on the OS.

Finally, fix the folder permissions:
```
sudo chmod 775 <your folder>
```

## Step 3
Edit the 'start_slideshow.sh' file and add update the 'loopDir' variable to match the directory of your images.
```
sudo nano start_slideshow.sh
```

Then, move the 'start_slideshow.sh' file into your home directory and add execute permissions.
```
mv start_slideshow.sh ~/start_slideshow.sh
chmod +x ~/start_slideshow.sh
```

## Step 4
Create the autostart folder and put the 'slideshow.desktop' file into ~/.config/autostart

```
mkdir -p ~/.config/autostart
mv slideshow.desktop ~/.config/autostart
```

## Step 5
Change your display to X11 instead of Wayland.

Open a terminal and enter:
```
sudo raspi-config
```

Go to 'Advanced Options > Wayland' and select 'X11'.

## Step 6
Reboot your Pi and enjoy the Poor Man's Slideshow.

**Credits**: Developed with the assistance of Gemini, an AI from Google.
