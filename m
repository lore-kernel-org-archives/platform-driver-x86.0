From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [RFC][PATCH] New ACPI-WMI driver for shuttle machines
Date: Wed, 1 Dec 2010 21:05:14 +0100
Message-ID: <AANLkTimrY4vRicgifjd5hHm6rzsNFv+bfrj59jbg=fKe@mail.gmail.com>
References: <20101130152719.6f4f64b2@gotham.conectiva>
	<AANLkTikQAQZGv20kWREvVKARpvCQN7aP5tcshpcMh+M2@mail.gmail.com>
	<20101201141422.19da09e9@gotham.conectiva>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:41789 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755947Ab0LAUFQ convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Dec 2010 15:05:16 -0500
Received: by eye27 with SMTP id 27so3795350eye.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Dec 2010 12:05:14 -0800 (PST)
In-Reply-To: <20101201141422.19da09e9@gotham.conectiva>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Herton Ronaldo Krzesinski <herton@mandriva.com.br>
Cc: platform-driver-x86@vger.kernel.org

On Wed, Dec 1, 2010 at 5:14 PM, Herton Ronaldo Krzesinski
<herton@mandriva.com.br> wrote:
> Hi,
>
> I cut the message just to the comments, here we go:
>
> On Wed, 1 Dec 2010 00:22:03 +0100
> Corentin Chary <corentin.chary@gmail.com> wrote:
>> On Tue, Nov 30, 2010 at 6:27 PM, Herton Ronaldo Krzesinski
>> <herton@mandriva.com.br> wrote:
>> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shu=
ttle_wmi/brightness_up
>> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
>> > +KernelVersion: 2.6.37
>> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton=
@mandriva.com.br>
>> > +Description:
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write=
 only option (accepts any single value, eg.
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > brigh=
tness_up") that is equivalent of pressing
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn+<brightness =
up> function on notebooks. This option exists
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 because of shut=
tle machines that are notebooks in desktop form
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 factor, and whi=
ch don't have the notebook keyboard, thus no
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 way to use fn+<=
brightness up>.
>>
>> Why such files ? Can't we do the same using the backlight device ?
>
> I use the backlight device, but also added this sysfs attribute. The =
reason
> for it was testing, and also because the acpi video interface on Shut=
tle
> DA18IE has a bug, if you try to set the brightness it writes the valu=
e but
> brightness isn't updated on the screen. That's why also I had to made=
 the
> following workaround on backlight support without acpi video on the d=
river:
>
> =C2=A0=C2=A0 =C2=A0 =C2=A0 /* change brightness by steps, this is a q=
uirk for shuttle
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0* machines which don't accept direct=
 write to ec for this */
> =C2=A0=C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER0=
, &val))
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> =C2=A0=C2=A0 =C2=A0 =C2=A0 val &=3D 0x7;
> =C2=A0=C2=A0 =C2=A0 =C2=A0 steps =3D bd->props.brightness - val;
> =C2=A0=C2=A0 =C2=A0 =C2=A0 while (steps > 0) {
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wmi_ec_cmd(CMD=
_SCMD, 0, 0, 0x0c, NULL);
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 steps--;
> =C2=A0=C2=A0 =C2=A0 =C2=A0 }
> =C2=A0=C2=A0 =C2=A0 =C2=A0 while (steps < 0) {
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wmi_ec_cmd(CMD=
_SCMD, 0, 0, 0x0b, NULL);
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 steps++;
> =C2=A0=C2=A0 =C2=A0 =C2=A0 }
>
> That is, on shuttle DA18IE, the brightness will only be effectively s=
et if
> you send the command with same code as fn+<brightness>, it doesn't wo=
rk
> writing to address 0x79 directly in EC as the firmware and my backlig=
ht
> code does for the other machines. So, if you load the module with acp=
i
> video support on, you can't change the brightness without this. If th=
ere is
> an way that for Shuttle DA18IE I could disable acpi video support and=
 always
> only use the backlight class, then I can remove the sysfs attribute.

If I understand, acpi_backlight=3Dvendor works, but acpi_backlight=3Dvi=
deo
doesn't, right ?

If there is no way to make the video module work, then you can
probably blacklist
the shuttles in drivers/acpi/video_detect.c:acpi_video_get_capabilities=
=2E

How does it work on windows ?

> Shuttle DA18IE is weird because it has an hack on hardware: the LCD o=
f the
> machine is connected on the same VGA output of the machine, that is, =
instead
> of using the LVDS port, they connect the VGA port, and because this y=
ou can't
> have proper display switch on it, it works like a VGA splitter, very =
ugly.
> This hardware may change, so may be we will not have to care any more=
 about
> this and remove both sysfs attribute and quirk, and one reason I don'=
t send
> the driver yet as final version.
>
>>
>> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shu=
ttle_wmi/cut_lvds
>> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
>> > +KernelVersion: 2.6.37
>> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton=
@mandriva.com.br>
>> > +Description:
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write=
 only option. Writing any single non-zero value
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to it enables m=
ain screen output, 0 to disable.
>>
>> Same, could be handled by the backlight device.
>
> I'll remove and see to move to backlight.

See asus-laptop, it have some blank/unblank support for the backlight d=
evice.

>> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shu=
ttle_wmi/lbar_brightness_down
>> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
>> > +KernelVersion: 2.6.37
>> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton=
@mandriva.com.br>
>> > +Description:
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write=
 only option (accepts any single value, eg.
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > lbar_=
brightness_down"). Decreases one step of lightbar
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brightness.
>> > +
>> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shu=
ttle_wmi/lbar_brightness_up
>> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
>> > +KernelVersion: 2.6.37
>> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton=
@mandriva.com.br>
>> > +Description:
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write=
 only option (accepts any single value, eg.
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > lbar_=
brightness_up"). Increases one step of lightbar
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brightness.
>>
>> What is the lightbar exactly ? Some kind of led ? Can't you use the
>> led class instead ?
>
> None of shuttle machines I have here have this lightbar, but it shoul=
d be a
> cosmetic light in the front of the machine at bottom. I don't know if=
 it's
> useful treat is as led, check this pdf:
> http://www.shuttle.eu/fileadmin/resources/download/docs/spec/complete=
_systems/X5020XA_e.pdf
>
> At page 6, there is a picture with the light bar, it's the item 8.
>
> I don't know if the light bar should be handled by any kernel subsyst=
em, or
> keep as is (just sysfs attributes).

Looking at the pdf, this should definitly be handled as a led !

>> Also the driver seems to reference keyboard brightness, if available=
,
>> this should be
>> implemented as a led named shuttle::kbd_backlight.
>
> I don't know what's the brightness of keyboard too, that is on shuttl=
e
> documentation without specific explanation, hardware I have doesn't h=
ave
> this.
>
>> > +
>> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shu=
ttle_wmi/volume_down
>> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
>> > +KernelVersion: 2.6.37
>> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton=
@mandriva.com.br>
>> > +Description:
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write=
 only option (accepts any single value, eg.
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > volum=
e_down") that is equivalent of pressing
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn+<volume down=
> function on notebooks.
>> > +
>> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shu=
ttle_wmi/volume_up
>> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
>> > +KernelVersion: 2.6.37
>> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton=
@mandriva.com.br>
>> > +Description:
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write=
 only option (accepts any single value, eg.
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > volum=
e_up") that is equivalent of pressing
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn+<volume up> =
function on notebooks.
>>
>> Are volume_down and volume_up really needed ? can't alsamixer do the=
 same ?
>
> Yes, I just kept for testing, I will remove it.

You can put it in debugfs if you want to keep it for debug purpose.

>>
>> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shu=
ttle_wmi/webcam
>> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
>> > +KernelVersion: 2.6.37
>> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton=
@mandriva.com.br>
>> > +Description:
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Control webcam =
state. 1 means on, 0 means off.
>> > +
>> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shu=
ttle_wmi/white_balance
>> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
>> > +KernelVersion: 2.6.37
>> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton=
@mandriva.com.br>
>> > +Description:
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write=
 only option (accepts any single value, eg.
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > white=
_balance"). Probably triggers an automatic
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 white balance a=
djustment for lcd, function not explained in
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shuttle wmi doc=
umentation.
>>
>>
>> Here, I don't really understand why you reference "fn+<keys>". We
>> don't really care about the keys right ? What we want is make the fe=
ature
>> available for the user.
>
> I use fn+<code> because that's what the firmware/wmi interface unders=
tands.
> The 0xEC000200000000<byte command number> command sent by wmi (CMD_SC=
MD) in
> fact in most cases is the same as sending fn+<byte command number> us=
ing the
> keyboard.
>
> So if the notebook keyboard has webcam switch at fn+f9, the command w=
e are
> sending to the bios is:
> 0xEC00020000000009
> to turn on or off the webcam. The state (on or off) is read using CMD=
_READEC
> from some address, when it saves state somewhere.
>
> If the sound mute is fn+f4, then the command is 0xEC00020000000004, a=
nd so
> on...
>
> The hardware is a notebook without notebook keyboard (it should have =
the same
> keyboard bios as similar notebook models). There is a button on the s=
ide of
> the machine, that sends a key code when pressed (in the driver I tran=
slate
> it to KEY_PROG1). This button should load an OSD application on the s=
creen,
> with buttons similar to the function buttons on notebook keyboard. Wh=
en you
> click the button on application, it must write a value
> to /sys/devices/platform/shuttle_wmi/<attribute>, which will call the=
 driver
> that send the command as if it was the keyboard. That's why that many=
 sysfs
> attributes, but some of them like volume aren't needed indeed, mixer =
can
> be called directly for example, etc. so no problem in removing them.

Ok, now I understand, It's like the existing Win 7 OSD. And I also unde=
rstand
why the driver looks like this. You should really try to use generic
classes/stuff as
much as possible (backlight, led, rfkill, alsa), and add new sysfs
files when there
is no other choices.

This way, it will work with the OSD, but it will also work out the box
on a standard
distribution :).

>>
>> Some of the files likes volume_up/volume_down seems to be here for
>> debug purpose. Maybe you could add a simple debugfs interface
>> to send custom commands to the wmi device.
>
> Yes, I'll see here and I'll move the testing attributes I used to deb=
ugfs,
> or just a generic fn+number.
>
>>
>> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/K=
config
>> > index faec777..ef84a4d 100644
>> > --- a/drivers/platform/x86/Kconfig
>> > +++ b/drivers/platform/x86/Kconfig
>> > @@ -639,4 +639,20 @@ config XO1_RFKILL
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Support for enabling/disabling t=
he WLAN interface on the OLPC XO-1
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0laptop.
>> >
>> > +config SHUTTLE_WMI
>> > + =C2=A0 =C2=A0 =C2=A0 tristate "Shuttle WMI Extras"
>> > + =C2=A0 =C2=A0 =C2=A0 depends on ACPI
>> > + =C2=A0 =C2=A0 =C2=A0 depends on BACKLIGHT_CLASS_DEVICE
>> > + =C2=A0 =C2=A0 =C2=A0 depends on RFKILL
>> > + =C2=A0 =C2=A0 =C2=A0 depends on INPUT
>> > + =C2=A0 =C2=A0 =C2=A0 select ACPI_WMI
>> > + =C2=A0 =C2=A0 =C2=A0 select INPUT_SPARSEKMAP
>> > + =C2=A0 =C2=A0 =C2=A0 ---help---
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a driver for Shuttle machine=
s (mainly for laptops in desktop
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 form factor). It adds controls for w=
ireless, bluetooth, and 3g control
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 radios, webcam switch, backlight con=
trols, among others.
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 If you have an Shuttle machine with =
ACPI-WMI interface say Y or M
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 here.
>> > +
>>
>> Add some DA18IE/DA18IM/MA ref here ?
>>
>> > =C2=A0endif # X86_PLATFORM_DEVICES
>> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/=
Makefile
>> > index 9950ccc..6a8fa82 100644
>> > --- a/drivers/platform/x86/Makefile
>> > +++ b/drivers/platform/x86/Makefile
>> > @@ -33,3 +33,4 @@ obj-$(CONFIG_INTEL_IPS) =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 +=3D intel_ips.o
>> > =C2=A0obj-$(CONFIG_GPIO_INTEL_PMIC) =C2=A0+=3D intel_pmic_gpio.o
>> > =C2=A0obj-$(CONFIG_XO1_RFKILL) =C2=A0 =C2=A0 =C2=A0 +=3D xo1-rfkil=
l.o
>> > =C2=A0obj-$(CONFIG_IBM_RTL) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D=
 ibm_rtl.o
>> > +obj-$(CONFIG_SHUTTLE_WMI) =C2=A0 =C2=A0 =C2=A0+=3D shuttle-wmi.o
>> > diff --git a/drivers/platform/x86/shuttle-wmi.c b/drivers/platform=
/x86/shuttle-wmi.c
>> > new file mode 100644
>> > index 0000000..389a16d
>> > --- /dev/null
>> > +++ b/drivers/platform/x86/shuttle-wmi.c
>> > @@ -0,0 +1,843 @@
>> > +/*
>> > + * ACPI-WMI driver for Shuttle DA18IE/DA18IM/MA
>> > + *
>> > + * Copyright (c) 2009 Herton Ronaldo Krzesinski <herton@mandriva.=
com.br>
>>
>> 2010 ?
>>
>
> Ops, going to fix these.
>
>> > +static acpi_status wmi_setget_mtd(struct shuttle_cmd *scmd, u32 *=
*res)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 acpi_status status;
>> > + =C2=A0 =C2=A0 =C2=A0 union acpi_object *obj;
>> > + =C2=A0 =C2=A0 =C2=A0 struct acpi_buffer input;
>> > + =C2=A0 =C2=A0 =C2=A0 static DEFINE_MUTEX(mtd_lock);
>> > + =C2=A0 =C2=A0 =C2=A0 struct acpi_buffer output =3D { ACPI_ALLOCA=
TE_BUFFER, NULL };
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 input.length =3D sizeof(struct shuttle_cmd)=
;
>> > + =C2=A0 =C2=A0 =C2=A0 scmd->hdr =3D 0xec00;
>> > + =C2=A0 =C2=A0 =C2=A0 input.pointer =3D (u8 *) scmd;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 mutex_lock(&mtd_lock);
>> > + =C2=A0 =C2=A0 =C2=A0 status =3D wmi_evaluate_method(SHUTTLE_WMI_=
SETGET_GUID, 0, 2,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&input, &out=
put);
>> > + =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&mtd_lock);
>>
>> I'm not sure why you need a mutex here ?
>
> I need mutex because of the way the vendor implemented things in its =
wmi
> interface. If I don't serialize the access to it, when sending comman=
ds
> in parallel some of them will fail, for example:
>
> # echo 1 > webcam & rfkill unblock <idx> & echo 1 > touchpad
>
> some of the echos or rfkill will fail. This happens because the vendo=
r used a
> common buffer/variable to store parameters in AML code, from the DSDT=
:
>
> Name (AC00, Buffer (0x28)
> ...
> CreateDWordField (AC00, Zero, SAC0)
> CreateDWordField (AC00, 0x04, SAC1)
> ...
> CreateByteField (AC00, Zero, SA00)
> CreateByteField (AC00, One, SA01)
> CreateByteField (AC00, 0x02, SA02)
> CreateByteField (AC00, 0x03, SA03)
> CreateByteField (AC00, 0x04, SA04)
> ...
> Method (WMBC, 3, NotSerialized)
> {
> =C2=A0 =C2=A0If (LEqual (Arg1, One))
> =C2=A0 =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Return (GETC (Arg0))
> =C2=A0 =C2=A0}
>
> =C2=A0 =C2=A0If (LEqual (Arg1, 0x02))
> =C2=A0 =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Return (SETC (Arg0, Arg2))
> =C2=A0 =C2=A0}
> ...
> Method (SETC, 2, NotSerialized)
> {
> =C2=A0 =C2=A0If (LEqual (Arg0, Zero))
> =C2=A0 =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Store (Arg1, AC00)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 OEMF (AC00)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Return (SAC0)
> =C2=A0 =C2=A0}
> ...
> Method (OEMF, 1, NotSerialized)
> {
> =C2=A0 =C2=A0If (LEqual (SAC1, 0xEC000300))
> =C2=A0 =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Store (0x73, DBG8)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Store ("LS", SAC0)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Return (SAC0)
> =C2=A0 =C2=A0}
>
> =C2=A0 =C2=A0If (LEqual (SAC1, 0xEC000000))
> =C2=A0 =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 WKBC (SA00, SA01, SA02, SA03)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Return (SAC0)
> =C2=A0 =C2=A0}
> ...
>
>
> Note that it uses only buffer AC00 to store and read the
> parameters, so parallel calls will overwrite the value in AC00
> (referenced as SAC?? and SA?? in some places) and some commands
> will fail or have unpredicted behaviour.
>
> Placing the lock prevents the parallel echo/rfkill command I placed
> above as example to fail, all writes/commands are sent successfuly.
>
> I'm attaching here DSDT of both machines I have for you to see the
> entire code.

Hum ok, if I understand AML correctly, I think the mutex should be in d=
irectly
in the DSDT but now that it's done...

Maybe you should add a comment for the mutex, so nobody will try to rem=
ove
it someday.

>>
>> > + =C2=A0 =C2=A0 =C2=A0 if (ACPI_FAILURE(status))
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return status;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 obj =3D output.pointer;
>> > + =C2=A0 =C2=A0 =C2=A0 if (obj) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (obj->type =3D=
=3D ACPI_TYPE_INTEGER) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (*res)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 **res =3D obj->integer.value;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pr_err("Unsupported object returned (%s)", __func__);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(obj);
>> > + =C2=A0 =C2=A0 =C2=A0 } else {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*res) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pr_warning("No result from WMI method (%s)", __func__);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *res =3D NULL;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> > + =C2=A0 =C2=A0 =C2=A0 }
>> > + =C2=A0 =C2=A0 =C2=A0 return AE_OK;
>> > +}
>> >
>>
>> wmi_setget_mtd would probably be simpler like that:
>>
>> static int wmi_setget_mtd(struct shuttle_cmd *scmd, u32 *res).
>> You don't really need to return the acpi_status, you just want to
>> return -1, 0, 1 for wmi_ec_cmd.
>
> Good point, will simplify it.
>
>>
>> > +static int wmi_ec_cmd(unsigned char cmd, unsigned char arg,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 unsigned short param1, unsigned short param2,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 u32 *res)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 struct shuttle_cmd scmd =3D {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .cmd =3D cmd,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arg =3D arg,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .param1 =3D par=
am1,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .param2 =3D par=
am2
>> > + =C2=A0 =C2=A0 =C2=A0 };
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 if (ACPI_FAILURE(wmi_setget_mtd(&scmd, &res=
)))
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
>> > + =C2=A0 =C2=A0 =C2=A0 return (res) ? 0 : 1;
>> > +}
>> > +
>> > +struct shuttle_rfkill {
>> > + =C2=A0 =C2=A0 =C2=A0 char *name;
>> > + =C2=A0 =C2=A0 =C2=A0 struct rfkill *rfk;
>> > + =C2=A0 =C2=A0 =C2=A0 enum rfkill_type type;
>> > + =C2=A0 =C2=A0 =C2=A0 unsigned short fn;
>> > + =C2=A0 =C2=A0 =C2=A0 u32 mask;
>> > + =C2=A0 =C2=A0 =C2=A0 u32 list_on[3];
>> > + =C2=A0 =C2=A0 =C2=A0 u32 list_off[3];
>> > +};
>> > +
>> > +static struct shuttle_rfkill shuttle_rfk_list[] =3D {
>> > + =C2=A0 =C2=A0 =C2=A0 { "shuttle_wlan", NULL, RFKILL_TYPE_WLAN,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04, 0x80, { 0x08 }, { 0x09 } },
>> > + =C2=A0 =C2=A0 =C2=A0 { "shuttle_bluetooth", NULL, RFKILL_TYPE_BL=
UETOOTH,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0d, 0x20, { 0x0c, 0x29 }, { 0x0d, =
0x2a } },
>> > + =C2=A0 =C2=A0 =C2=A0 { "shuttle_3g", NULL, RFKILL_TYPE_WWAN,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x05, 0x40, { 0x10, 0x29 }, { 0x11, =
0x2a } },
>> > +};
>>
>> I would rather use simple if/else constructs instead of list_on/list=
_off,
>> it would probably be more easy to read.
>
> I don't know, I like the array approach as that it's easier to add ne=
w
> rfkill types, less hand written code, and more flexible as number of
> notification codes are variable, current we have:
>
> fn+f4 =3D send command byte =3D=3D 0x04 =3D=3D wireless switch
> wmi notification codes:
> - wireless on =3D 0x08
> - wireless off =3D 0x09
>
> fn+f13? =3D send command byte =3D=3D 0xd =3D=3D bluetooth switch
> wmi notification codes:
> - bluetooth on =3D 0x0c
> - bluetooth off =3D 0x0d
> - 3g/bluetooth on =3D 0x29
> - 3g/bluetooth off =3D 0x2a
>
> fn+f5 =3D send command byte =3D=3D 0x5 =3D=3D 3g switch
> wmi notification codes:
> - 3g on =3D 0x10
> - 3g off =3D 0x11
> - 3g/bluetooth on =3D 0x29
> - 3g/bluetooth off =3D 0x2a

Then, keep it like this, if nobody else compalins about it, it's probab=
ly ok.

>>
>> > +static int rfkill_common_set_block(void *data, bool blocked)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 u32 val;
>> > + =C2=A0 =C2=A0 =C2=A0 bool sw;
>> > + =C2=A0 =C2=A0 =C2=A0 struct shuttle_rfkill *srfk =3D data;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER1,=
 &val))
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
>> > + =C2=A0 =C2=A0 =C2=A0 sw =3D val & srfk->mask;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 if ((blocked && sw) || (!blocked && !sw))
>>
>> Maybe
>> sw =3D !!(val & =C2=A0srfk->mask);
>> if (blocked =3D=3D sw)
>> ?
>
> True, will change it.
>
>>
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wmi_ec_cmd(CMD_=
SCMD, 0, 0, srfk->fn, NULL);
>> > + =C2=A0 =C2=A0 =C2=A0 else
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER1,=
 &val))
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
>> > + =C2=A0 =C2=A0 =C2=A0 return ((val & srfk->mask) !=3D blocked) ? =
0 : -EIO;
>> > +}
>> > +
>> > +static const struct rfkill_ops rfkill_common_ops =3D {
>> > + =C2=A0 =C2=A0 =C2=A0 .set_block =3D rfkill_common_set_block,
>> > +};
>> > +
>> > +static int common_rfkill_init(struct shuttle_rfkill *srfk, struct=
 device *dev,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 init_val)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 int rc;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 srfk->rfk =3D rfkill_alloc(srfk->name, dev,=
 srfk->type,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&rfkill_common_ops, srfk);
>> > + =C2=A0 =C2=A0 =C2=A0 if (!srfk->rfk)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 rfkill_init_sw_state(srfk->rfk, !(init_val =
& srfk->mask));
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 rc =3D rfkill_register(srfk->rfk);
>> > + =C2=A0 =C2=A0 =C2=A0 if (rc) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rfkill_destroy(=
srfk->rfk);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srfk->rfk =3D N=
ULL;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rc;
>> > + =C2=A0 =C2=A0 =C2=A0 }
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 return 0;
>> > +}
>> > +
>> > +static int shuttle_rfkill_init(struct platform_device *pdev)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 int rc, i;
>> > + =C2=A0 =C2=A0 =C2=A0 u32 val;
>> > + =C2=A0 =C2=A0 =C2=A0 struct shuttle_rfkill *srfk;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER1,=
 &val))
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(shuttle_rfk_li=
st); i++) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srfk =3D &shutt=
le_rfk_list[i];
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* check that h=
ardware is available (when missing we can't
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* unblock=
 it), to avoid having rfkill switch when not needed;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* after c=
heck, reset to initial setting */
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rfkill_comm=
on_set_block(srfk, false))
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(val & srf=
k->mask))
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rfkill_common_set_block(srfk, true);
>>
>> There is no other solution =C2=A0to guess if the hardware is present=
 ? Because
>> I don't think it's a good idea to toggle every devices on load (may =
take time,
>> etc...)
>
> Unfortunately there is no other way, there is nothing that I know cur=
rently
> which can be used to see if hardware is available or not.

If I understand correctly the AML code (but it's a mess, so I probably
don't), when
fetching the status for a missing device, is will returns you
something full of ones (0xFFFFFF..)

>>
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D common_r=
fkill_init(srfk, &pdev->dev, val);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto err_rfk_init;
>> > + =C2=A0 =C2=A0 =C2=A0 }
>> > + =C2=A0 =C2=A0 =C2=A0 return 0;
>> > +
>> > +err_rfk_init:
>> > + =C2=A0 =C2=A0 =C2=A0 for (i--; i >=3D 0; i--) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srfk =3D &shutt=
le_rfk_list[i];
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (srfk->rfk) =
{
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rfkill_unregister(srfk->rfk);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rfkill_destroy(srfk->rfk);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 srfk->rfk =3D NULL;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> > + =C2=A0 =C2=A0 =C2=A0 }
>>
>> Just call shuttfle_rfkill_remove, the if(srfk->rfk) should
>> make it work without any issue.
>
> indeed.
>
>>
>> > + =C2=A0 =C2=A0 =C2=A0 return rc;
>> > +}
>> > +
>> > +static void shuttle_rfkill_remove(void)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 int i;
>> > + =C2=A0 =C2=A0 =C2=A0 struct shuttle_rfkill *srfk;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(shuttle_rfk_li=
st); i++) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srfk =3D &shutt=
le_rfk_list[i];
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (srfk->rfk) =
{
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rfkill_unregister(srfk->rfk);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rfkill_destroy(srfk->rfk);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 srfk->rfk =3D NULL;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> > + =C2=A0 =C2=A0 =C2=A0 }
>> > +}
>> > +
>> > +static bool set_rfkill_sw(u32 *list, u32 code, struct rfkill *rfk=
, bool blocked)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 while (*list) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*list =3D=3D=
 code) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rfkill_set_sw_state(rfk, blocked);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return true;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list++;
>> > + =C2=A0 =C2=A0 =C2=A0 }
>> > + =C2=A0 =C2=A0 =C2=A0 return false;
>> > +}
>> > +
>> > +static bool notify_switch_rfkill(u32 code)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 int i;
>> > + =C2=A0 =C2=A0 =C2=A0 struct rfkill *rfk;
>> > + =C2=A0 =C2=A0 =C2=A0 u32 *rfk_evnt;
>> > + =C2=A0 =C2=A0 =C2=A0 bool res =3D false;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(shuttle_rfk_li=
st); i++) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rfk =3D shuttle=
_rfk_list[i].rfk;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!rfk)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rfk_evnt =3D sh=
uttle_rfk_list[i].list_on;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (set_rfkill_=
sw(rfk_evnt, code, rfk, false)) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 res =3D true;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rfk_evnt =3D sh=
uttle_rfk_list[i].list_off;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (set_rfkill_=
sw(rfk_evnt, code, rfk, true))
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 res =3D true;
>> > + =C2=A0 =C2=A0 =C2=A0 }
>> > + =C2=A0 =C2=A0 =C2=A0 return res;
>> > +}
>>
>> See my previous comment, but I believe that the code would be
>> more obvious with basic if/else (or at least a command explaining
>> what is does).
>
> I'll add some extra comments.
>
>>
>> > +static int __devexit shuttle_wmi_remove(struct platform_device *p=
dev)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 struct shuttle_wmi_priv *priv =3D platform_=
get_drvdata(pdev);
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 shuttle_wmi_backlight_exit(priv);
>> > + =C2=A0 =C2=A0 =C2=A0 wmi_remove_notify_handler(SHUTTLE_WMI_EVENT=
_GUID);
>> > + =C2=A0 =C2=A0 =C2=A0 shuttle_wmi_input_remove(priv);
>> > + =C2=A0 =C2=A0 =C2=A0 shuttle_rfkill_remove();
>> > + =C2=A0 =C2=A0 =C2=A0 kfree(priv);
>> > + =C2=A0 =C2=A0 =C2=A0 return 0;
>> > +}
>> > +
>> > +#ifdef CONFIG_PM
>>
>> WMI depends on ACPI
>> ACPI depends on PM
>>
>> So it's not really needed.
>
> ok.
>
>>
>> > +static int shuttle_wmi_resume(struct device *dev)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 u32 val;
>> > + =C2=A0 =C2=A0 =C2=A0 int i;
>> > + =C2=A0 =C2=A0 =C2=A0 struct shuttle_rfkill *srfk;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER1,=
 &val))
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(shuttle_rfk_li=
st); i++) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srfk =3D &shutt=
le_rfk_list[i];
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (srfk->rfk)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rfkill_set_sw_state(srfk->rfk, !(val & srfk->mask));
>> > + =C2=A0 =C2=A0 =C2=A0 }
>> > + =C2=A0 =C2=A0 =C2=A0 return 0;
>> > +}
>>
>> You're code would probably be cleaner with a rfkill helper to get th=
e current
>> state of a given deivce, to avoid playing with masks everytime.
>
> I'll check this.
>
>>
>> > +
>> > +static const struct dev_pm_ops shuttle_wmi_pm_ops =3D {
>> > + =C2=A0 =C2=A0 =C2=A0 .restore =3D shuttle_wmi_resume,
>> > + =C2=A0 =C2=A0 =C2=A0 .resume =3D shuttle_wmi_resume,
>> > +};
>> > +#endif
>> > +
>> > +static struct platform_driver shuttle_wmi_driver =3D {
>> > + =C2=A0 =C2=A0 =C2=A0 .driver =3D {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D KBUIL=
D_MODNAME,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =3D THIS=
_MODULE,
>> > +#ifdef CONFIG_PM
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pm =3D &shuttl=
e_wmi_pm_ops,
>> > +#endif
>> > + =C2=A0 =C2=A0 =C2=A0 },
>> > + =C2=A0 =C2=A0 =C2=A0 .probe =3D shuttle_wmi_probe,
>> > + =C2=A0 =C2=A0 =C2=A0 .remove =3D __devexit_p(shuttle_wmi_remove)=
,
>> > +};
>> > +
>> > +static struct platform_device *shuttle_wmi_device;
>> > +
>> > +static ssize_t show_state_common(char *buf, unsigned short ecram,=
 u32 mask)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 u32 val;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ecram, &va=
l))
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
>> > + =C2=A0 =C2=A0 =C2=A0 return sprintf(buf, "%d\n", (val & mask) ? =
1 : 0);
>> > +}
>> > +
>> > +static ssize_t store_state_common(const char *buf, size_t count,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned short ecram, u32=
 mask,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned short fn)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 int enable;
>> > + =C2=A0 =C2=A0 =C2=A0 int rc;
>> > + =C2=A0 =C2=A0 =C2=A0 u32 val;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 if (sscanf(buf, "%i", &enable) !=3D 1)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ecram, &va=
l))
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
>> > + =C2=A0 =C2=A0 =C2=A0 val &=3D mask;
>>
>> Here again, having to use a mask makes the code harder to read.
>> Can't you use !!(val & mask) instead of val & mask ? Maybe a wrapper
>> around CMD_READEC to do that ? int wmi_ec_read_state(ecram, mask) ?
>
> I'll see if I can make it better.
>
>>
>> > + =C2=A0 =C2=A0 =C2=A0 if ((val && !enable) ||
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (!val && enable)) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wmi_ec_cmd(CMD_=
SCMD, 0, 0, fn, NULL);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D wmi_ec_c=
md(CMD_READEC, 0, 0, ecram, &val);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val &=3D mask;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc || (!val=
 && enable) ||
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (=
val && !enable))
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -EIO;
>> > + =C2=A0 =C2=A0 =C2=A0 }
>> > + =C2=A0 =C2=A0 =C2=A0 return count;
>> > +}
>
> --
> []'s
> Herton
>

Good luck :).

--=20
Corentin Chary
http://xf.iksaif.net
