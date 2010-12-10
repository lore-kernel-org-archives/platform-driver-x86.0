From: Herton Ronaldo Krzesinski <herton@mandriva.com.br>
Subject: Re: [RFC][PATCH] New ACPI-WMI driver for shuttle machines
Date: Thu, 9 Dec 2010 22:12:46 -0200
Message-ID: <20101209221246.41ddf31a@mandriva.com.br>
References: <20101130152719.6f4f64b2@gotham.conectiva>
	<AANLkTikQAQZGv20kWREvVKARpvCQN7aP5tcshpcMh+M2@mail.gmail.com>
	<20101201141422.19da09e9@gotham.conectiva>
	<AANLkTimrY4vRicgifjd5hHm6rzsNFv+bfrj59jbg=fKe@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from perninha.conectiva.com.br ([187.115.55.249]:35849 "EHLO
	perninha.conectiva.com.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754288Ab0LJAMz convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 9 Dec 2010 19:12:55 -0500
In-Reply-To: <AANLkTimrY4vRicgifjd5hHm6rzsNFv+bfrj59jbg=fKe@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

Em Wed, 1 Dec 2010 21:05:14 +0100
Corentin Chary <corentin.chary@gmail.com> escreveu:
> On Wed, Dec 1, 2010 at 5:14 PM, Herton Ronaldo Krzesinski
> <herton@mandriva.com.br> wrote:
> > Hi,
> >
> > I cut the message just to the comments, here we go:
> >
> > On Wed, 1 Dec 2010 00:22:03 +0100
> > Corentin Chary <corentin.chary@gmail.com> wrote:
> >> On Tue, Nov 30, 2010 at 6:27 PM, Herton Ronaldo Krzesinski
> >> <herton@mandriva.com.br> wrote:
> >> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/s=
huttle_wmi/brightness_up
> >> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> >> > +KernelVersion: 2.6.37
> >> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski"
> >> > <herton@mandriva.com.br> +Description:
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a wri=
te only option (accepts any single
> >> > value, eg.
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > bri=
ghtness_up") that is equivalent of
> >> > pressing
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn+<brightnes=
s up> function on notebooks. This
> >> > option exists
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 because of sh=
uttle machines that are notebooks
> >> > in desktop form
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 factor, and w=
hich don't have the notebook
> >> > keyboard, thus no
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 way to use fn=
+<brightness up>.
> >>
> >> Why such files ? Can't we do the same using the backlight device ?
> >
> > I use the backlight device, but also added this sysfs attribute.
> > The reason for it was testing, and also because the acpi video
> > interface on Shuttle DA18IE has a bug, if you try to set the
> > brightness it writes the value but brightness isn't updated on the
> > screen. That's why also I had to made the following workaround on
> > backlight support without acpi video on the driver:
> >
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 /* change brightness by steps, this is a=
 quirk for shuttle
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0* machines which don't accept dire=
ct write to ec for this */
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_E=
R0, &val))
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 val &=3D 0x7;
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 steps =3D bd->props.brightness - val;
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 while (steps > 0) {
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wmi_ec_cmd(C=
MD_SCMD, 0, 0, 0x0c, NULL);
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 steps--;
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 }
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 while (steps < 0) {
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wmi_ec_cmd(C=
MD_SCMD, 0, 0, 0x0b, NULL);
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 steps++;
> > =C2=A0=C2=A0 =C2=A0 =C2=A0 }
> >
> > That is, on shuttle DA18IE, the brightness will only be effectively
> > set if you send the command with same code as fn+<brightness>, it
> > doesn't work writing to address 0x79 directly in EC as the firmware
> > and my backlight code does for the other machines. So, if you load
> > the module with acpi video support on, you can't change the
> > brightness without this. If there is an way that for Shuttle DA18IE
> > I could disable acpi video support and always only use the
> > backlight class, then I can remove the sysfs attribute.
>=20
> If I understand, acpi_backlight=3Dvendor works, but acpi_backlight=3D=
video
> doesn't, right ?
>=20
> If there is no way to make the video module work, then you can
> probably blacklist
> the shuttles in
> drivers/acpi/video_detect.c:acpi_video_get_capabilities.
>=20
> How does it work on windows ?

Sorry late response...

=46rom what I remember, Windows has same bug (when using the Windows 7
brightness slider it doesn't update brightness on screen), only the
shuttle application which does the brightness down/up stuff works. It's
an implementation bug in bios (in their acpi video part). I expect it'l=
l
be fixed for the production hardware, but if not perhaps this machine
will have the first entry in video_detect.c, and I'll have to keep the
workaround in backlight implementation.

>=20
> > Shuttle DA18IE is weird because it has an hack on hardware: the LCD
> > of the machine is connected on the same VGA output of the machine,
> > that is, instead of using the LVDS port, they connect the VGA port,
> > and because this you can't have proper display switch on it, it
> > works like a VGA splitter, very ugly. This hardware may change, so
> > may be we will not have to care any more about this and remove both
> > sysfs attribute and quirk, and one reason I don't send the driver
> > yet as final version.
> >
> >>
> >> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/s=
huttle_wmi/cut_lvds
> >> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> >> > +KernelVersion: 2.6.37
> >> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski"
> >> > <herton@mandriva.com.br> +Description:
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a wri=
te only option. Writing any single
> >> > non-zero value
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to it enables=
 main screen output, 0 to disable.
> >>
> >> Same, could be handled by the backlight device.
> >
> > I'll remove and see to move to backlight.
>=20
> See asus-laptop, it have some blank/unblank support for the backlight
> device.
>=20
> >> > +What:
> >> > =C2=A0/sys/devices/platform/shuttle_wmi/lbar_brightness_down +Da=
te:
> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010 +KernelVersion: 2.6.37
> >> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski"
> >> > <herton@mandriva.com.br> +Description:
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a wri=
te only option (accepts any single
> >> > value, eg.
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > lba=
r_brightness_down"). Decreases one
> >> > step of lightbar
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brightness.
> >> > +
> >> > +What:
> >> > =C2=A0/sys/devices/platform/shuttle_wmi/lbar_brightness_up +Date=
:
> >> > =C2=A0 =C2=A0 =C2=A0November 2010 +KernelVersion: 2.6.37
> >> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski"
> >> > <herton@mandriva.com.br> +Description:
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a wri=
te only option (accepts any single
> >> > value, eg.
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > lba=
r_brightness_up"). Increases one
> >> > step of lightbar
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brightness.
> >>
> >> What is the lightbar exactly ? Some kind of led ? Can't you use th=
e
> >> led class instead ?
> >
> > None of shuttle machines I have here have this lightbar, but it
> > should be a cosmetic light in the front of the machine at bottom. I
> > don't know if it's useful treat is as led, check this pdf:
> > http://www.shuttle.eu/fileadmin/resources/download/docs/spec/comple=
te_systems/X5020XA_e.pdf
> >
> > At page 6, there is a picture with the light bar, it's the item 8.
> >
> > I don't know if the light bar should be handled by any kernel
> > subsystem, or keep as is (just sysfs attributes).
>=20
> Looking at the pdf, this should definitly be handled as a led !

I went to implement it as a led, but I have a problem, I don't know
where it saves the brightness values (current brightness value), and
also don't know what's the maximum brightness.

I wrote a script and a debugfs file to read all memory positions from
EC by wmi with "CMD_READEC", to make a diff and see if after writing
the lightbar up/down commands where values change. But may be
without hardware with this lightbar I can't confirm the change, and
may be without it values will not change/function will not work.
Well, if I can't come up with something, I plan to keep it only at
debugfs.

>=20
> >> Also the driver seems to reference keyboard brightness, if
> >> available, this should be
> >> implemented as a led named shuttle::kbd_backlight.
> >
> > I don't know what's the brightness of keyboard too, that is on
> > shuttle documentation without specific explanation, hardware I have
> > doesn't have this.
> >
> >> > +
> >> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/s=
huttle_wmi/volume_down
> >> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> >> > +KernelVersion: 2.6.37
> >> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski"
> >> > <herton@mandriva.com.br> +Description:
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a wri=
te only option (accepts any single
> >> > value, eg.
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > vol=
ume_down") that is equivalent of
> >> > pressing
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn+<volume do=
wn> function on notebooks.
> >> > +
> >> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/s=
huttle_wmi/volume_up
> >> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> >> > +KernelVersion: 2.6.37
> >> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski"
> >> > <herton@mandriva.com.br> +Description:
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a wri=
te only option (accepts any single
> >> > value, eg.
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > vol=
ume_up") that is equivalent of
> >> > pressing
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn+<volume up=
> function on notebooks.
> >>
> >> Are volume_down and volume_up really needed ? can't alsamixer do
> >> the same ?
> >
> > Yes, I just kept for testing, I will remove it.
>=20
> You can put it in debugfs if you want to keep it for debug purpose.
>=20
> >>
> >> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/s=
huttle_wmi/webcam
> >> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> >> > +KernelVersion: 2.6.37
> >> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski"
> >> > <herton@mandriva.com.br> +Description:
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Control webca=
m state. 1 means on, 0 means off.
> >> > +
> >> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/s=
huttle_wmi/white_balance
> >> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> >> > +KernelVersion: 2.6.37
> >> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski"
> >> > <herton@mandriva.com.br> +Description:
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a wri=
te only option (accepts any single
> >> > value, eg.
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > whi=
te_balance"). Probably triggers an
> >> > automatic
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 white balance=
 adjustment for lcd, function not
> >> > explained in
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shuttle wmi d=
ocumentation.
> >>
> >>
> >> Here, I don't really understand why you reference "fn+<keys>". We
> >> don't really care about the keys right ? What we want is make the
> >> feature available for the user.
> >
> > I use fn+<code> because that's what the firmware/wmi interface
> > understands. The 0xEC000200000000<byte command number> command sent
> > by wmi (CMD_SCMD) in fact in most cases is the same as sending
> > fn+<byte command number> using the keyboard.
> >
> > So if the notebook keyboard has webcam switch at fn+f9, the command
> > we are sending to the bios is:
> > 0xEC00020000000009
> > to turn on or off the webcam. The state (on or off) is read using
> > CMD_READEC from some address, when it saves state somewhere.
> >
> > If the sound mute is fn+f4, then the command is 0xEC00020000000004,
> > and so on...
> >
> > The hardware is a notebook without notebook keyboard (it should
> > have the same keyboard bios as similar notebook models). There is a
> > button on the side of the machine, that sends a key code when
> > pressed (in the driver I translate it to KEY_PROG1). This button
> > should load an OSD application on the screen, with buttons similar
> > to the function buttons on notebook keyboard. When you click the
> > button on application, it must write a value
> > to /sys/devices/platform/shuttle_wmi/<attribute>, which will call
> > the driver that send the command as if it was the keyboard. That's
> > why that many sysfs attributes, but some of them like volume aren't
> > needed indeed, mixer can be called directly for example, etc. so no
> > problem in removing them.
>=20
> Ok, now I understand, It's like the existing Win 7 OSD. And I also
> understand why the driver looks like this. You should really try to
> use generic classes/stuff as
> much as possible (backlight, led, rfkill, alsa), and add new sysfs
> files when there
> is no other choices.
>=20
> This way, it will work with the OSD, but it will also work out the bo=
x
> on a standard
> distribution :).

Yes, in new version I plan to post soon, in ended moving all
irrelevant/testing attributes to debugfs.

>=20
> >>
> >> Some of the files likes volume_up/volume_down seems to be here for
> >> debug purpose. Maybe you could add a simple debugfs interface
> >> to send custom commands to the wmi device.
> >
> > Yes, I'll see here and I'll move the testing attributes I used to
> > debugfs, or just a generic fn+number.
> >
> >>
> >> > diff --git a/drivers/platform/x86/Kconfig
> >> > b/drivers/platform/x86/Kconfig index faec777..ef84a4d 100644
> >> > --- a/drivers/platform/x86/Kconfig
> >> > +++ b/drivers/platform/x86/Kconfig
> >> > @@ -639,4 +639,20 @@ config XO1_RFKILL
> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Support for enabling/disabling=
 the WLAN interface on
> >> > the OLPC XO-1 laptop.
> >> >
> >> > +config SHUTTLE_WMI
> >> > + =C2=A0 =C2=A0 =C2=A0 tristate "Shuttle WMI Extras"
> >> > + =C2=A0 =C2=A0 =C2=A0 depends on ACPI
> >> > + =C2=A0 =C2=A0 =C2=A0 depends on BACKLIGHT_CLASS_DEVICE
> >> > + =C2=A0 =C2=A0 =C2=A0 depends on RFKILL
> >> > + =C2=A0 =C2=A0 =C2=A0 depends on INPUT
> >> > + =C2=A0 =C2=A0 =C2=A0 select ACPI_WMI
> >> > + =C2=A0 =C2=A0 =C2=A0 select INPUT_SPARSEKMAP
> >> > + =C2=A0 =C2=A0 =C2=A0 ---help---
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a driver for Shuttle machi=
nes (mainly for
> >> > laptops in desktop
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 form factor). It adds controls for=
 wireless,
> >> > bluetooth, and 3g control
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 radios, webcam switch, backlight c=
ontrols, among
> >> > others. +
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 If you have an Shuttle machine wit=
h ACPI-WMI interface
> >> > say Y or M
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 here.
> >> > +
> >>
> >> Add some DA18IE/DA18IM/MA ref here ?
> >>
> >> > =C2=A0endif # X86_PLATFORM_DEVICES
> >> > diff --git a/drivers/platform/x86/Makefile
> >> > b/drivers/platform/x86/Makefile index 9950ccc..6a8fa82 100644
> >> > --- a/drivers/platform/x86/Makefile
> >> > +++ b/drivers/platform/x86/Makefile
> >> > @@ -33,3 +33,4 @@ obj-$(CONFIG_INTEL_IPS) =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 +=3D
> >> > intel_ips.o obj-$(CONFIG_GPIO_INTEL_PMIC) =C2=A0+=3D intel_pmic_=
gpio.o
> >> > =C2=A0obj-$(CONFIG_XO1_RFKILL) =C2=A0 =C2=A0 =C2=A0 +=3D xo1-rfk=
ill.o
> >> > =C2=A0obj-$(CONFIG_IBM_RTL) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D=
 ibm_rtl.o
> >> > +obj-$(CONFIG_SHUTTLE_WMI) =C2=A0 =C2=A0 =C2=A0+=3D shuttle-wmi.=
o
> >> > diff --git a/drivers/platform/x86/shuttle-wmi.c
> >> > b/drivers/platform/x86/shuttle-wmi.c new file mode 100644
> >> > index 0000000..389a16d
> >> > --- /dev/null
> >> > +++ b/drivers/platform/x86/shuttle-wmi.c
> >> > @@ -0,0 +1,843 @@
> >> > +/*
> >> > + * ACPI-WMI driver for Shuttle DA18IE/DA18IM/MA
> >> > + *
> >> > + * Copyright (c) 2009 Herton Ronaldo Krzesinski
> >> > <herton@mandriva.com.br>
> >>
> >> 2010 ?
> >>
> >
> > Ops, going to fix these.
> >
> >> > +static acpi_status wmi_setget_mtd(struct shuttle_cmd *scmd, u32
> >> > **res) +{
> >> > + =C2=A0 =C2=A0 =C2=A0 acpi_status status;
> >> > + =C2=A0 =C2=A0 =C2=A0 union acpi_object *obj;
> >> > + =C2=A0 =C2=A0 =C2=A0 struct acpi_buffer input;
> >> > + =C2=A0 =C2=A0 =C2=A0 static DEFINE_MUTEX(mtd_lock);
> >> > + =C2=A0 =C2=A0 =C2=A0 struct acpi_buffer output =3D { ACPI_ALLO=
CATE_BUFFER,
> >> > NULL }; +
> >> > + =C2=A0 =C2=A0 =C2=A0 input.length =3D sizeof(struct shuttle_cm=
d);
> >> > + =C2=A0 =C2=A0 =C2=A0 scmd->hdr =3D 0xec00;
> >> > + =C2=A0 =C2=A0 =C2=A0 input.pointer =3D (u8 *) scmd;
> >> > +
> >> > + =C2=A0 =C2=A0 =C2=A0 mutex_lock(&mtd_lock);
> >> > + =C2=A0 =C2=A0 =C2=A0 status =3D wmi_evaluate_method(SHUTTLE_WM=
I_SETGET_GUID, 0,
> >> > 2,
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&input, =
&output);
> >> > + =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&mtd_lock);
> >>
> >> I'm not sure why you need a mutex here ?
> >
> > I need mutex because of the way the vendor implemented things in
> > its wmi interface. If I don't serialize the access to it, when
> > sending commands in parallel some of them will fail, for example:
> >
> > # echo 1 > webcam & rfkill unblock <idx> & echo 1 > touchpad
> >
> > some of the echos or rfkill will fail. This happens because the
> > vendor used a common buffer/variable to store parameters in AML
> > code, from the DSDT:
> >
> > Name (AC00, Buffer (0x28)
> > ...
> > CreateDWordField (AC00, Zero, SAC0)
> > CreateDWordField (AC00, 0x04, SAC1)
> > ...
> > CreateByteField (AC00, Zero, SA00)
> > CreateByteField (AC00, One, SA01)
> > CreateByteField (AC00, 0x02, SA02)
> > CreateByteField (AC00, 0x03, SA03)
> > CreateByteField (AC00, 0x04, SA04)
> > ...
> > Method (WMBC, 3, NotSerialized)
> > {
> > =C2=A0 =C2=A0If (LEqual (Arg1, One))
> > =C2=A0 =C2=A0{
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 Return (GETC (Arg0))
> > =C2=A0 =C2=A0}
> >
> > =C2=A0 =C2=A0If (LEqual (Arg1, 0x02))
> > =C2=A0 =C2=A0{
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 Return (SETC (Arg0, Arg2))
> > =C2=A0 =C2=A0}
> > ...
> > Method (SETC, 2, NotSerialized)
> > {
> > =C2=A0 =C2=A0If (LEqual (Arg0, Zero))
> > =C2=A0 =C2=A0{
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 Store (Arg1, AC00)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 OEMF (AC00)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 Return (SAC0)
> > =C2=A0 =C2=A0}
> > ...
> > Method (OEMF, 1, NotSerialized)
> > {
> > =C2=A0 =C2=A0If (LEqual (SAC1, 0xEC000300))
> > =C2=A0 =C2=A0{
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 Store (0x73, DBG8)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 Store ("LS", SAC0)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 Return (SAC0)
> > =C2=A0 =C2=A0}
> >
> > =C2=A0 =C2=A0If (LEqual (SAC1, 0xEC000000))
> > =C2=A0 =C2=A0{
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 WKBC (SA00, SA01, SA02, SA03)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 Return (SAC0)
> > =C2=A0 =C2=A0}
> > ...
> >
> >
> > Note that it uses only buffer AC00 to store and read the
> > parameters, so parallel calls will overwrite the value in AC00
> > (referenced as SAC?? and SA?? in some places) and some commands
> > will fail or have unpredicted behaviour.
> >
> > Placing the lock prevents the parallel echo/rfkill command I placed
> > above as example to fail, all writes/commands are sent successfuly.
> >
> > I'm attaching here DSDT of both machines I have for you to see the
> > entire code.
>=20
> Hum ok, if I understand AML correctly, I think the mutex should be in
> directly in the DSDT but now that it's done...
>=20
> Maybe you should add a comment for the mutex, so nobody will try to
> remove it someday.
>=20
> >>
> >> > + =C2=A0 =C2=A0 =C2=A0 if (ACPI_FAILURE(status))
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return status=
;
> >> > +
> >> > + =C2=A0 =C2=A0 =C2=A0 obj =3D output.pointer;
> >> > + =C2=A0 =C2=A0 =C2=A0 if (obj) {
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (obj->type=
 =3D=3D ACPI_TYPE_INTEGER) {
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if (*res)
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 **res =3D obj->integer.value=
;
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 pr_err("Unsupported object returned
> >> > (%s)", __func__);
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(obj);
> >> > + =C2=A0 =C2=A0 =C2=A0 } else {
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*res) {
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 pr_warning("No result from WMI method
> >> > (%s)", __func__);
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 *res =3D NULL;
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> >> > + =C2=A0 =C2=A0 =C2=A0 }
> >> > + =C2=A0 =C2=A0 =C2=A0 return AE_OK;
> >> > +}
> >> >
> >>
> >> wmi_setget_mtd would probably be simpler like that:
> >>
> >> static int wmi_setget_mtd(struct shuttle_cmd *scmd, u32 *res).
> >> You don't really need to return the acpi_status, you just want to
> >> return -1, 0, 1 for wmi_ec_cmd.
> >
> > Good point, will simplify it.
> >
> >>
> >> > +static int wmi_ec_cmd(unsigned char cmd, unsigned char arg,
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 unsigned short param1, unsigned short
> >> > param2,
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 u32 *res)
> >> > +{
> >> > + =C2=A0 =C2=A0 =C2=A0 struct shuttle_cmd scmd =3D {
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .cmd =3D cmd,
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arg =3D arg,
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .param1 =3D p=
aram1,
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .param2 =3D p=
aram2
> >> > + =C2=A0 =C2=A0 =C2=A0 };
> >> > +
> >> > + =C2=A0 =C2=A0 =C2=A0 if (ACPI_FAILURE(wmi_setget_mtd(&scmd, &r=
es)))
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
> >> > + =C2=A0 =C2=A0 =C2=A0 return (res) ? 0 : 1;
> >> > +}
> >> > +
> >> > +struct shuttle_rfkill {
> >> > + =C2=A0 =C2=A0 =C2=A0 char *name;
> >> > + =C2=A0 =C2=A0 =C2=A0 struct rfkill *rfk;
> >> > + =C2=A0 =C2=A0 =C2=A0 enum rfkill_type type;
> >> > + =C2=A0 =C2=A0 =C2=A0 unsigned short fn;
> >> > + =C2=A0 =C2=A0 =C2=A0 u32 mask;
> >> > + =C2=A0 =C2=A0 =C2=A0 u32 list_on[3];
> >> > + =C2=A0 =C2=A0 =C2=A0 u32 list_off[3];
> >> > +};
> >> > +
> >> > +static struct shuttle_rfkill shuttle_rfk_list[] =3D {
> >> > + =C2=A0 =C2=A0 =C2=A0 { "shuttle_wlan", NULL, RFKILL_TYPE_WLAN,
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04, 0x80, { 0x08 }, { 0x09 } },
> >> > + =C2=A0 =C2=A0 =C2=A0 { "shuttle_bluetooth", NULL, RFKILL_TYPE_=
BLUETOOTH,
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0d, 0x20, { 0x0c, 0x29 }, { 0x0d=
, 0x2a } },
> >> > + =C2=A0 =C2=A0 =C2=A0 { "shuttle_3g", NULL, RFKILL_TYPE_WWAN,
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x05, 0x40, { 0x10, 0x29 }, { 0x11=
, 0x2a } },
> >> > +};
> >>
> >> I would rather use simple if/else constructs instead of
> >> list_on/list_off, it would probably be more easy to read.
> >
> > I don't know, I like the array approach as that it's easier to add
> > new rfkill types, less hand written code, and more flexible as
> > number of notification codes are variable, current we have:
> >
> > fn+f4 =3D send command byte =3D=3D 0x04 =3D=3D wireless switch
> > wmi notification codes:
> > - wireless on =3D 0x08
> > - wireless off =3D 0x09
> >
> > fn+f13? =3D send command byte =3D=3D 0xd =3D=3D bluetooth switch
> > wmi notification codes:
> > - bluetooth on =3D 0x0c
> > - bluetooth off =3D 0x0d
> > - 3g/bluetooth on =3D 0x29
> > - 3g/bluetooth off =3D 0x2a
> >
> > fn+f5 =3D send command byte =3D=3D 0x5 =3D=3D 3g switch
> > wmi notification codes:
> > - 3g on =3D 0x10
> > - 3g off =3D 0x11
> > - 3g/bluetooth on =3D 0x29
> > - 3g/bluetooth off =3D 0x2a
>=20
> Then, keep it like this, if nobody else compalins about it, it's
> probably ok.

I rewrote part of the driver, new version I hope is easier to
read/better, this is different now. Soon I hope to post the new version
(almost finished, just have to check lightbar/hardware presence stuff
and other tests I want to do, other things you pointed I fixed, thanks
for the review).

> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wmi_ec_cmd(CM=
D_SCMD, 0, 0, srfk->fn, NULL);
> >> > + =C2=A0 =C2=A0 =C2=A0 else
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
> >> > +
> >> > + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER=
1, &val))
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> >> > + =C2=A0 =C2=A0 =C2=A0 return ((val & srfk->mask) !=3D blocked) =
? 0 : -EIO;
> >> > +}
> >> > +
> >> > +static const struct rfkill_ops rfkill_common_ops =3D {
> >> > + =C2=A0 =C2=A0 =C2=A0 .set_block =3D rfkill_common_set_block,
> >> > +};
> >> > +
> >> > +static int common_rfkill_init(struct shuttle_rfkill *srfk,
> >> > struct device *dev,
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 init_val)
> >> > +{
> >> > + =C2=A0 =C2=A0 =C2=A0 int rc;
> >> > +
> >> > + =C2=A0 =C2=A0 =C2=A0 srfk->rfk =3D rfkill_alloc(srfk->name, de=
v, srfk->type,
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&rfkill_common_ops, sr=
fk);
> >> > + =C2=A0 =C2=A0 =C2=A0 if (!srfk->rfk)
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOME=
M;
> >> > +
> >> > + =C2=A0 =C2=A0 =C2=A0 rfkill_init_sw_state(srfk->rfk, !(init_va=
l &
> >> > srfk->mask)); +
> >> > + =C2=A0 =C2=A0 =C2=A0 rc =3D rfkill_register(srfk->rfk);
> >> > + =C2=A0 =C2=A0 =C2=A0 if (rc) {
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rfkill_destro=
y(srfk->rfk);
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srfk->rfk =3D=
 NULL;
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rc;
> >> > + =C2=A0 =C2=A0 =C2=A0 }
> >> > +
> >> > + =C2=A0 =C2=A0 =C2=A0 return 0;
> >> > +}
> >> > +
> >> > +static int shuttle_rfkill_init(struct platform_device *pdev)
> >> > +{
> >> > + =C2=A0 =C2=A0 =C2=A0 int rc, i;
> >> > + =C2=A0 =C2=A0 =C2=A0 u32 val;
> >> > + =C2=A0 =C2=A0 =C2=A0 struct shuttle_rfkill *srfk;
> >> > +
> >> > + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER=
1, &val))
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> >> > +
> >> > + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(shuttle_rfk_=
list); i++) {
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srfk =3D &shu=
ttle_rfk_list[i];
> >> > +
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* check that=
 hardware is available (when
> >> > missing we can't
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* unblo=
ck it), to avoid having rfkill switch
> >> > when not needed;
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* after=
 check, reset to initial setting */
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rfkill_co=
mmon_set_block(srfk, false))
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 continue;
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(val & s=
rfk->mask))
> >> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 rfkill_common_set_block(srfk, true);
> >>
> >> There is no other solution =C2=A0to guess if the hardware is prese=
nt ?
> >> Because I don't think it's a good idea to toggle every devices on
> >> load (may take time, etc...)
> >
> > Unfortunately there is no other way, there is nothing that I know
> > currently which can be used to see if hardware is available or not.
>=20
> If I understand correctly the AML code (but it's a mess, so I probabl=
y
> don't), when
> fetching the status for a missing device, is will returns you
> something full of ones (0xFFFFFF..)

Nope, it returns 0xFFFFFF... when you call the wmi method with invalid
command/parameter.

What I'll try to do is making an ec memory dump I'm making as for the
lightbar case, and do a diff with or without the hardware attached to
see if I can get something (dump is slow, takes some time). On the
shuttle wmi documentation, it has the "Device no function" event, which
happens when you try to enable a non-existent hardware, which is the
same as trying to enable/turn on it and it fails, so I don't know if
I'll find a bit in memory which has the state of hardware present or
not.

--
[]'s
Herton
