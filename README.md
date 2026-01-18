# Poor Man's Slideshow Install
Raspberry Pi Desktop is required for this install.

## Step 1
Install tools.
```
sudo apt update
sudo apt install git feh x11-xserver-utils unclutter samba -y
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
Clone the repository.
```
git clone https://github.com/beans-are-gross/poor-mans-slideshow.git
cd poor-mans-slideshow
```

## Step 4
Edit the 'start_slideshow.sh' file and add update the 'loopDir' variable to match the directory of your images. You can also edit the 'loopTime' variable to change how long it stays on a picture before moving on.
```
sudo nano start_slideshow.sh
```

Then, move the 'start_slideshow.sh' file into your home directory and add execute permissions.
```
mv start_slideshow.sh ~/start_slideshow.sh
chmod +x ~/start_slideshow.sh
```

## Step 5
Edit the 'slideshow.desktop' file and update the 'Exec' line to match the directory of where the 'start_slideshow.sh' file is located.

If you used the command above and need to know where the file was placed, run:
```
cd ~ && pwd
```

Put the results of that command into to the 'Exec' line where it says '<your home directory>'.
```
sudo nano slideshow.desktop
```

Create the autostart folder and put the 'slideshow.desktop' file into ~/.config/autostart

```
mkdir -p ~/.config/autostart
mv slideshow.desktop ~/.config/autostart
```

## Step 6
Change your display to X11 instead of Wayland.

Open a terminal and enter:
```
sudo raspi-config
```

Go to 'Advanced Options > Wayland' and select 'X11'.

## Step 7
Reboot your Pi and enjoy the Poor Man's Slideshow.

## Notes
### Exiting the Slideshow
If you ever need to exit the slideshow and go to the desktop, press the escape key. To start the slideshow again, reboot your pi, or run:
```
~/start_slideshow.sh
```

### File Sorting
The program sorts files character by character. Below is an example of the sorting:
* 1-slide.png
* 10-slide.png
* 2-slide.png

To work around this, name your files like this:
* <ins>**0**</ins>1-slide.png
* <ins>**0**</ins>2-slide.png
* 10-slide.png

>[!NOTE]
>To use random sorting instead: edit the 'start_slideshow.sh' file and add '-z' to the feh command.

### Credits
Developed with the assistance of Gemini, an AI from Google.
