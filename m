From: Herton Ronaldo Krzesinski <herton@mandriva.com.br>
Subject: Re: [RFC][PATCH] New ACPI-WMI driver for shuttle machines
Date: Wed, 1 Dec 2010 14:14:22 -0200
Message-ID: <20101201141422.19da09e9@gotham.conectiva>
References: <20101130152719.6f4f64b2@gotham.conectiva>
	<AANLkTikQAQZGv20kWREvVKARpvCQN7aP5tcshpcMh+M2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from perninha.conectiva.com.br ([187.115.55.249]:44372 "EHLO
	perninha.conectiva.com.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750925Ab0LAQOh convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Dec 2010 11:14:37 -0500
In-Reply-To: <AANLkTikQAQZGv20kWREvVKARpvCQN7aP5tcshpcMh+M2@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

Hi,

I cut the message just to the comments, here we go:

On Wed, 1 Dec 2010 00:22:03 +0100
Corentin Chary <corentin.chary@gmail.com> wrote:
> On Tue, Nov 30, 2010 at 6:27 PM, Herton Ronaldo Krzesinski
> <herton@mandriva.com.br> wrote:
> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shut=
tle_wmi/brightness_up
> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> > +KernelVersion: 2.6.37
> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@=
mandriva.com.br>
> > +Description:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write =
only option (accepts any single value, eg.
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > bright=
ness_up") that is equivalent of pressing
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn+<brightness u=
p> function on notebooks. This option exists
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 because of shutt=
le machines that are notebooks in desktop form
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 factor, and whic=
h don't have the notebook keyboard, thus no
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 way to use fn+<b=
rightness up>.
>=20
> Why such files ? Can't we do the same using the backlight device ?

I use the backlight device, but also added this sysfs attribute. The re=
ason
for it was testing, and also because the acpi video interface on Shuttl=
e
DA18IE has a bug, if you try to set the brightness it writes the value =
but
brightness isn't updated on the screen. That's why also I had to made t=
he
following workaround on backlight support without acpi video on the dri=
ver:

 =C2=A0 =C2=A0 =C2=A0 /* change brightness by steps, this is a quirk fo=
r shuttle
 =C2=A0 =C2=A0 =C2=A0 =C2=A0* machines which don't accept direct write =
to ec for this */
 =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER0, &val)=
)
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
 =C2=A0 =C2=A0 =C2=A0 val &=3D 0x7;
 =C2=A0 =C2=A0 =C2=A0 steps =3D bd->props.brightness - val;
 =C2=A0 =C2=A0 =C2=A0 while (steps > 0) {
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wmi_ec_cmd(CMD_SCMD, =
0, 0, 0x0c, NULL);
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 steps--;
 =C2=A0 =C2=A0 =C2=A0 }
 =C2=A0 =C2=A0 =C2=A0 while (steps < 0) {
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wmi_ec_cmd(CMD_SCMD, =
0, 0, 0x0b, NULL);
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 steps++;
 =C2=A0 =C2=A0 =C2=A0 }

That is, on shuttle DA18IE, the brightness will only be effectively set=
 if
you send the command with same code as fn+<brightness>, it doesn't work
writing to address 0x79 directly in EC as the firmware and my backlight
code does for the other machines. So, if you load the module with acpi
video support on, you can't change the brightness without this. If ther=
e is
an way that for Shuttle DA18IE I could disable acpi video support and a=
lways
only use the backlight class, then I can remove the sysfs attribute.

Shuttle DA18IE is weird because it has an hack on hardware: the LCD of =
the
machine is connected on the same VGA output of the machine, that is, in=
stead
of using the LVDS port, they connect the VGA port, and because this you=
 can't
have proper display switch on it, it works like a VGA splitter, very ug=
ly.
This hardware may change, so may be we will not have to care any more a=
bout
this and remove both sysfs attribute and quirk, and one reason I don't =
send
the driver yet as final version.

>=20
> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shut=
tle_wmi/cut_lvds
> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> > +KernelVersion: 2.6.37
> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@=
mandriva.com.br>
> > +Description:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write =
only option. Writing any single non-zero value
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to it enables ma=
in screen output, 0 to disable.
>=20
> Same, could be handled by the backlight device.

I'll remove and see to move to backlight.

> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shut=
tle_wmi/lbar_brightness_down
> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> > +KernelVersion: 2.6.37
> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@=
mandriva.com.br>
> > +Description:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write =
only option (accepts any single value, eg.
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > lbar_b=
rightness_down"). Decreases one step of lightbar
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brightness.
> > +
> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shut=
tle_wmi/lbar_brightness_up
> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> > +KernelVersion: 2.6.37
> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@=
mandriva.com.br>
> > +Description:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write =
only option (accepts any single value, eg.
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > lbar_b=
rightness_up"). Increases one step of lightbar
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brightness.
>=20
> What is the lightbar exactly ? Some kind of led ? Can't you use the
> led class instead ?

None of shuttle machines I have here have this lightbar, but it should =
be a
cosmetic light in the front of the machine at bottom. I don't know if i=
t's
useful treat is as led, check this pdf:
http://www.shuttle.eu/fileadmin/resources/download/docs/spec/complete_s=
ystems/X5020XA_e.pdf

At page 6, there is a picture with the light bar, it's the item 8.

I don't know if the light bar should be handled by any kernel subsystem=
, or
keep as is (just sysfs attributes).

> Also the driver seems to reference keyboard brightness, if available,
> this should be
> implemented as a led named shuttle::kbd_backlight.

I don't know what's the brightness of keyboard too, that is on shuttle
documentation without specific explanation, hardware I have doesn't hav=
e
this.

> > +
> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shut=
tle_wmi/volume_down
> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> > +KernelVersion: 2.6.37
> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@=
mandriva.com.br>
> > +Description:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write =
only option (accepts any single value, eg.
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > volume=
_down") that is equivalent of pressing
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn+<volume down>=
 function on notebooks.
> > +
> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shut=
tle_wmi/volume_up
> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> > +KernelVersion: 2.6.37
> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@=
mandriva.com.br>
> > +Description:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write =
only option (accepts any single value, eg.
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > volume=
_up") that is equivalent of pressing
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn+<volume up> f=
unction on notebooks.
>=20
> Are volume_down and volume_up really needed ? can't alsamixer do the =
same ?

Yes, I just kept for testing, I will remove it.

>=20
> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shut=
tle_wmi/webcam
> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> > +KernelVersion: 2.6.37
> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@=
mandriva.com.br>
> > +Description:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Control webcam s=
tate. 1 means on, 0 means off.
> > +
> > +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/shut=
tle_wmi/white_balance
> > +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0November 2010
> > +KernelVersion: 2.6.37
> > +Contact: =C2=A0 =C2=A0 =C2=A0 "Herton Ronaldo Krzesinski" <herton@=
mandriva.com.br>
> > +Description:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a write =
only option (accepts any single value, eg.
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "echo 1 > white_=
balance"). Probably triggers an automatic
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 white balance ad=
justment for lcd, function not explained in
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shuttle wmi docu=
mentation.
>=20
>=20
> Here, I don't really understand why you reference "fn+<keys>". We
> don't really care about the keys right ? What we want is make the fea=
ture
> available for the user.

I use fn+<code> because that's what the firmware/wmi interface understa=
nds.
The 0xEC000200000000<byte command number> command sent by wmi (CMD_SCMD=
) in
fact in most cases is the same as sending fn+<byte command number> usin=
g the
keyboard.

So if the notebook keyboard has webcam switch at fn+f9, the command we =
are
sending to the bios is:
0xEC00020000000009
to turn on or off the webcam. The state (on or off) is read using CMD_R=
EADEC
from some address, when it saves state somewhere.

If the sound mute is fn+f4, then the command is 0xEC00020000000004, and=
 so
on...

The hardware is a notebook without notebook keyboard (it should have th=
e same
keyboard bios as similar notebook models). There is a button on the sid=
e of
the machine, that sends a key code when pressed (in the driver I transl=
ate
it to KEY_PROG1). This button should load an OSD application on the scr=
een,
with buttons similar to the function buttons on notebook keyboard. When=
 you
click the button on application, it must write a value
to /sys/devices/platform/shuttle_wmi/<attribute>, which will call the d=
river
that send the command as if it was the keyboard. That's why that many s=
ysfs
attributes, but some of them like volume aren't needed indeed, mixer ca=
n
be called directly for example, etc. so no problem in removing them.

>=20
> Some of the files likes volume_up/volume_down seems to be here for
> debug purpose. Maybe you could add a simple debugfs interface
> to send custom commands to the wmi device.

Yes, I'll see here and I'll move the testing attributes I used to debug=
fs,
or just a generic fn+number.

>=20
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kc=
onfig
> > index faec777..ef84a4d 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -639,4 +639,20 @@ config XO1_RFKILL
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Support for enabling/disabling th=
e WLAN interface on the OLPC XO-1
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0laptop.
> >
> > +config SHUTTLE_WMI
> > + =C2=A0 =C2=A0 =C2=A0 tristate "Shuttle WMI Extras"
> > + =C2=A0 =C2=A0 =C2=A0 depends on ACPI
> > + =C2=A0 =C2=A0 =C2=A0 depends on BACKLIGHT_CLASS_DEVICE
> > + =C2=A0 =C2=A0 =C2=A0 depends on RFKILL
> > + =C2=A0 =C2=A0 =C2=A0 depends on INPUT
> > + =C2=A0 =C2=A0 =C2=A0 select ACPI_WMI
> > + =C2=A0 =C2=A0 =C2=A0 select INPUT_SPARSEKMAP
> > + =C2=A0 =C2=A0 =C2=A0 ---help---
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 This is a driver for Shuttle machines=
 (mainly for laptops in desktop
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 form factor). It adds controls for wi=
reless, bluetooth, and 3g control
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 radios, webcam switch, backlight cont=
rols, among others.
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 If you have an Shuttle machine with A=
CPI-WMI interface say Y or M
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 here.
> > +
>=20
> Add some DA18IE/DA18IM/MA ref here ?
>=20
> > =C2=A0endif # X86_PLATFORM_DEVICES
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/M=
akefile
> > index 9950ccc..6a8fa82 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -33,3 +33,4 @@ obj-$(CONFIG_INTEL_IPS) =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 +=3D intel_ips.o
> > =C2=A0obj-$(CONFIG_GPIO_INTEL_PMIC) =C2=A0+=3D intel_pmic_gpio.o
> > =C2=A0obj-$(CONFIG_XO1_RFKILL) =C2=A0 =C2=A0 =C2=A0 +=3D xo1-rfkill=
=2Eo
> > =C2=A0obj-$(CONFIG_IBM_RTL) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D =
ibm_rtl.o
> > +obj-$(CONFIG_SHUTTLE_WMI) =C2=A0 =C2=A0 =C2=A0+=3D shuttle-wmi.o
> > diff --git a/drivers/platform/x86/shuttle-wmi.c b/drivers/platform/=
x86/shuttle-wmi.c
> > new file mode 100644
> > index 0000000..389a16d
> > --- /dev/null
> > +++ b/drivers/platform/x86/shuttle-wmi.c
> > @@ -0,0 +1,843 @@
> > +/*
> > + * ACPI-WMI driver for Shuttle DA18IE/DA18IM/MA
> > + *
> > + * Copyright (c) 2009 Herton Ronaldo Krzesinski <herton@mandriva.c=
om.br>
>=20
> 2010 ?
>=20

Ops, going to fix these.

> > +static acpi_status wmi_setget_mtd(struct shuttle_cmd *scmd, u32 **=
res)
> > +{
> > + =C2=A0 =C2=A0 =C2=A0 acpi_status status;
> > + =C2=A0 =C2=A0 =C2=A0 union acpi_object *obj;
> > + =C2=A0 =C2=A0 =C2=A0 struct acpi_buffer input;
> > + =C2=A0 =C2=A0 =C2=A0 static DEFINE_MUTEX(mtd_lock);
> > + =C2=A0 =C2=A0 =C2=A0 struct acpi_buffer output =3D { ACPI_ALLOCAT=
E_BUFFER, NULL };
> > +
> > + =C2=A0 =C2=A0 =C2=A0 input.length =3D sizeof(struct shuttle_cmd);
> > + =C2=A0 =C2=A0 =C2=A0 scmd->hdr =3D 0xec00;
> > + =C2=A0 =C2=A0 =C2=A0 input.pointer =3D (u8 *) scmd;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 mutex_lock(&mtd_lock);
> > + =C2=A0 =C2=A0 =C2=A0 status =3D wmi_evaluate_method(SHUTTLE_WMI_S=
ETGET_GUID, 0, 2,
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&input, &out=
put);
> > + =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&mtd_lock);
>=20
> I'm not sure why you need a mutex here ?

I need mutex because of the way the vendor implemented things in its wm=
i
interface. If I don't serialize the access to it, when sending commands
in parallel some of them will fail, for example:

# echo 1 > webcam & rfkill unblock <idx> & echo 1 > touchpad

some of the echos or rfkill will fail. This happens because the vendor =
used a
common buffer/variable to store parameters in AML code, from the DSDT:

Name (AC00, Buffer (0x28)
=2E..
CreateDWordField (AC00, Zero, SAC0)
CreateDWordField (AC00, 0x04, SAC1)
=2E..
CreateByteField (AC00, Zero, SA00)
CreateByteField (AC00, One, SA01)
CreateByteField (AC00, 0x02, SA02)
CreateByteField (AC00, 0x03, SA03)
CreateByteField (AC00, 0x04, SA04)
=2E..
Method (WMBC, 3, NotSerialized)
{
    If (LEqual (Arg1, One))
    {
         Return (GETC (Arg0))
    }

    If (LEqual (Arg1, 0x02))
    {
         Return (SETC (Arg0, Arg2))
    }
=2E..
Method (SETC, 2, NotSerialized)
{
    If (LEqual (Arg0, Zero))
    {
         Store (Arg1, AC00)
         OEMF (AC00)
         Return (SAC0)
    }
=2E..
Method (OEMF, 1, NotSerialized)
{
    If (LEqual (SAC1, 0xEC000300))
    {
         Store (0x73, DBG8)
         Store ("LS", SAC0)
         Return (SAC0)
    }

    If (LEqual (SAC1, 0xEC000000))
    {
         WKBC (SA00, SA01, SA02, SA03)
         Return (SAC0)
    }
=2E..


Note that it uses only buffer AC00 to store and read the
parameters, so parallel calls will overwrite the value in AC00
(referenced as SAC?? and SA?? in some places) and some commands
will fail or have unpredicted behaviour.

Placing the lock prevents the parallel echo/rfkill command I placed
above as example to fail, all writes/commands are sent successfuly.

I'm attaching here DSDT of both machines I have for you to see the
entire code.

>=20
> > + =C2=A0 =C2=A0 =C2=A0 if (ACPI_FAILURE(status))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return status;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 obj =3D output.pointer;
> > + =C2=A0 =C2=A0 =C2=A0 if (obj) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (obj->type =3D=
=3D ACPI_TYPE_INTEGER) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (*res)
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 **res =3D obj->integer.value;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pr_err("Unsupported object returned (%s)", __func__);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(obj);
> > + =C2=A0 =C2=A0 =C2=A0 } else {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*res) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pr_warning("No result from WMI method (%s)", __func__);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *res =3D NULL;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> > + =C2=A0 =C2=A0 =C2=A0 }
> > + =C2=A0 =C2=A0 =C2=A0 return AE_OK;
> > +}
> >
>=20
> wmi_setget_mtd would probably be simpler like that:
>=20
> static int wmi_setget_mtd(struct shuttle_cmd *scmd, u32 *res).
> You don't really need to return the acpi_status, you just want to
> return -1, 0, 1 for wmi_ec_cmd.

Good point, will simplify it.

>=20
> > +static int wmi_ec_cmd(unsigned char cmd, unsigned char arg,
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 unsigned short param1, unsigned short param2,
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 u32 *res)
> > +{
> > + =C2=A0 =C2=A0 =C2=A0 struct shuttle_cmd scmd =3D {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .cmd =3D cmd,
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .arg =3D arg,
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .param1 =3D para=
m1,
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .param2 =3D para=
m2
> > + =C2=A0 =C2=A0 =C2=A0 };
> > +
> > + =C2=A0 =C2=A0 =C2=A0 if (ACPI_FAILURE(wmi_setget_mtd(&scmd, &res)=
))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
> > + =C2=A0 =C2=A0 =C2=A0 return (res) ? 0 : 1;
> > +}
> > +
> > +struct shuttle_rfkill {
> > + =C2=A0 =C2=A0 =C2=A0 char *name;
> > + =C2=A0 =C2=A0 =C2=A0 struct rfkill *rfk;
> > + =C2=A0 =C2=A0 =C2=A0 enum rfkill_type type;
> > + =C2=A0 =C2=A0 =C2=A0 unsigned short fn;
> > + =C2=A0 =C2=A0 =C2=A0 u32 mask;
> > + =C2=A0 =C2=A0 =C2=A0 u32 list_on[3];
> > + =C2=A0 =C2=A0 =C2=A0 u32 list_off[3];
> > +};
> > +
> > +static struct shuttle_rfkill shuttle_rfk_list[] =3D {
> > + =C2=A0 =C2=A0 =C2=A0 { "shuttle_wlan", NULL, RFKILL_TYPE_WLAN,
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04, 0x80, { 0x08 }, { 0x09 } },
> > + =C2=A0 =C2=A0 =C2=A0 { "shuttle_bluetooth", NULL, RFKILL_TYPE_BLU=
ETOOTH,
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0d, 0x20, { 0x0c, 0x29 }, { 0x0d, 0=
x2a } },
> > + =C2=A0 =C2=A0 =C2=A0 { "shuttle_3g", NULL, RFKILL_TYPE_WWAN,
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x05, 0x40, { 0x10, 0x29 }, { 0x11, 0=
x2a } },
> > +};
>=20
> I would rather use simple if/else constructs instead of list_on/list_=
off,
> it would probably be more easy to read.

I don't know, I like the array approach as that it's easier to add new
rfkill types, less hand written code, and more flexible as number of
notification codes are variable, current we have:

fn+f4 =3D send command byte =3D=3D 0x04 =3D=3D wireless switch
wmi notification codes:
- wireless on =3D 0x08
- wireless off =3D 0x09

fn+f13? =3D send command byte =3D=3D 0xd =3D=3D bluetooth switch
wmi notification codes:
- bluetooth on =3D 0x0c
- bluetooth off =3D 0x0d
- 3g/bluetooth on =3D 0x29
- 3g/bluetooth off =3D 0x2a

fn+f5 =3D send command byte =3D=3D 0x5 =3D=3D 3g switch
wmi notification codes:
- 3g on =3D 0x10
- 3g off =3D 0x11
- 3g/bluetooth on =3D 0x29
- 3g/bluetooth off =3D 0x2a

>=20
> > +static int rfkill_common_set_block(void *data, bool blocked)
> > +{
> > + =C2=A0 =C2=A0 =C2=A0 u32 val;
> > + =C2=A0 =C2=A0 =C2=A0 bool sw;
> > + =C2=A0 =C2=A0 =C2=A0 struct shuttle_rfkill *srfk =3D data;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER1, =
&val))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> > + =C2=A0 =C2=A0 =C2=A0 sw =3D val & srfk->mask;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 if ((blocked && sw) || (!blocked && !sw))
>=20
> Maybe
> sw =3D !!(val &  srfk->mask);
> if (blocked =3D=3D sw)
> ?

True, will change it.

>=20
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wmi_ec_cmd(CMD_S=
CMD, 0, 0, srfk->fn, NULL);
> > + =C2=A0 =C2=A0 =C2=A0 else
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER1, =
&val))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> > + =C2=A0 =C2=A0 =C2=A0 return ((val & srfk->mask) !=3D blocked) ? 0=
 : -EIO;
> > +}
> > +
> > +static const struct rfkill_ops rfkill_common_ops =3D {
> > + =C2=A0 =C2=A0 =C2=A0 .set_block =3D rfkill_common_set_block,
> > +};
> > +
> > +static int common_rfkill_init(struct shuttle_rfkill *srfk, struct =
device *dev,
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 init_val)
> > +{
> > + =C2=A0 =C2=A0 =C2=A0 int rc;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 srfk->rfk =3D rfkill_alloc(srfk->name, dev, =
srfk->type,
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&rfkill_common_ops, srfk);
> > + =C2=A0 =C2=A0 =C2=A0 if (!srfk->rfk)
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 rfkill_init_sw_state(srfk->rfk, !(init_val &=
 srfk->mask));
> > +
> > + =C2=A0 =C2=A0 =C2=A0 rc =3D rfkill_register(srfk->rfk);
> > + =C2=A0 =C2=A0 =C2=A0 if (rc) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rfkill_destroy(s=
rfk->rfk);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srfk->rfk =3D NU=
LL;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rc;
> > + =C2=A0 =C2=A0 =C2=A0 }
> > +
> > + =C2=A0 =C2=A0 =C2=A0 return 0;
> > +}
> > +
> > +static int shuttle_rfkill_init(struct platform_device *pdev)
> > +{
> > + =C2=A0 =C2=A0 =C2=A0 int rc, i;
> > + =C2=A0 =C2=A0 =C2=A0 u32 val;
> > + =C2=A0 =C2=A0 =C2=A0 struct shuttle_rfkill *srfk;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER1, =
&val))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(shuttle_rfk_lis=
t); i++) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srfk =3D &shuttl=
e_rfk_list[i];
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* check that ha=
rdware is available (when missing we can't
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* unblock =
it), to avoid having rfkill switch when not needed;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* after ch=
eck, reset to initial setting */
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rfkill_commo=
n_set_block(srfk, false))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(val & srfk=
->mask))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rfkill_common_set_block(srfk, true);
>=20
> There is no other solution  to guess if the hardware is present ? Bec=
ause
> I don't think it's a good idea to toggle every devices on load (may t=
ake time,
> etc...)

Unfortunately there is no other way, there is nothing that I know curre=
ntly
which can be used to see if hardware is available or not.

>=20
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D common_rf=
kill_init(srfk, &pdev->dev, val);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc)
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto err_rfk_init;
> > + =C2=A0 =C2=A0 =C2=A0 }
> > + =C2=A0 =C2=A0 =C2=A0 return 0;
> > +
> > +err_rfk_init:
> > + =C2=A0 =C2=A0 =C2=A0 for (i--; i >=3D 0; i--) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srfk =3D &shuttl=
e_rfk_list[i];
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (srfk->rfk) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rfkill_unregister(srfk->rfk);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rfkill_destroy(srfk->rfk);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 srfk->rfk =3D NULL;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> > + =C2=A0 =C2=A0 =C2=A0 }
>=20
> Just call shuttfle_rfkill_remove, the if(srfk->rfk) should
> make it work without any issue.

indeed.

>=20
> > + =C2=A0 =C2=A0 =C2=A0 return rc;
> > +}
> > +
> > +static void shuttle_rfkill_remove(void)
> > +{
> > + =C2=A0 =C2=A0 =C2=A0 int i;
> > + =C2=A0 =C2=A0 =C2=A0 struct shuttle_rfkill *srfk;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(shuttle_rfk_lis=
t); i++) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srfk =3D &shuttl=
e_rfk_list[i];
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (srfk->rfk) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rfkill_unregister(srfk->rfk);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rfkill_destroy(srfk->rfk);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 srfk->rfk =3D NULL;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> > + =C2=A0 =C2=A0 =C2=A0 }
> > +}
> > +
> > +static bool set_rfkill_sw(u32 *list, u32 code, struct rfkill *rfk,=
 bool blocked)
> > +{
> > + =C2=A0 =C2=A0 =C2=A0 while (*list) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*list =3D=3D=
 code) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rfkill_set_sw_state(rfk, blocked);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return true;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list++;
> > + =C2=A0 =C2=A0 =C2=A0 }
> > + =C2=A0 =C2=A0 =C2=A0 return false;
> > +}
> > +
> > +static bool notify_switch_rfkill(u32 code)
> > +{
> > + =C2=A0 =C2=A0 =C2=A0 int i;
> > + =C2=A0 =C2=A0 =C2=A0 struct rfkill *rfk;
> > + =C2=A0 =C2=A0 =C2=A0 u32 *rfk_evnt;
> > + =C2=A0 =C2=A0 =C2=A0 bool res =3D false;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(shuttle_rfk_lis=
t); i++) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rfk =3D shuttle_=
rfk_list[i].rfk;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!rfk)
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rfk_evnt =3D shu=
ttle_rfk_list[i].list_on;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (set_rfkill_s=
w(rfk_evnt, code, rfk, false)) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 res =3D true;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> > +
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rfk_evnt =3D shu=
ttle_rfk_list[i].list_off;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (set_rfkill_s=
w(rfk_evnt, code, rfk, true))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 res =3D true;
> > + =C2=A0 =C2=A0 =C2=A0 }
> > + =C2=A0 =C2=A0 =C2=A0 return res;
> > +}
>=20
> See my previous comment, but I believe that the code would be
> more obvious with basic if/else (or at least a command explaining
> what is does).

I'll add some extra comments.

>=20
> > +static int __devexit shuttle_wmi_remove(struct platform_device *pd=
ev)
> > +{
> > + =C2=A0 =C2=A0 =C2=A0 struct shuttle_wmi_priv *priv =3D platform_g=
et_drvdata(pdev);
> > +
> > + =C2=A0 =C2=A0 =C2=A0 shuttle_wmi_backlight_exit(priv);
> > + =C2=A0 =C2=A0 =C2=A0 wmi_remove_notify_handler(SHUTTLE_WMI_EVENT_=
GUID);
> > + =C2=A0 =C2=A0 =C2=A0 shuttle_wmi_input_remove(priv);
> > + =C2=A0 =C2=A0 =C2=A0 shuttle_rfkill_remove();
> > + =C2=A0 =C2=A0 =C2=A0 kfree(priv);
> > + =C2=A0 =C2=A0 =C2=A0 return 0;
> > +}
> > +
> > +#ifdef CONFIG_PM
>=20
> WMI depends on ACPI
> ACPI depends on PM
>=20
> So it's not really needed.

ok.

>=20
> > +static int shuttle_wmi_resume(struct device *dev)
> > +{
> > + =C2=A0 =C2=A0 =C2=A0 u32 val;
> > + =C2=A0 =C2=A0 =C2=A0 int i;
> > + =C2=A0 =C2=A0 =C2=A0 struct shuttle_rfkill *srfk;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ECRAM_ER1, =
&val))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(shuttle_rfk_lis=
t); i++) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srfk =3D &shuttl=
e_rfk_list[i];
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (srfk->rfk)
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rfkill_set_sw_state(srfk->rfk, !(val & srfk->mask));
> > + =C2=A0 =C2=A0 =C2=A0 }
> > + =C2=A0 =C2=A0 =C2=A0 return 0;
> > +}
>=20
> You're code would probably be cleaner with a rfkill helper to get the=
 current
> state of a given deivce, to avoid playing with masks everytime.

I'll check this.

>=20
> > +
> > +static const struct dev_pm_ops shuttle_wmi_pm_ops =3D {
> > + =C2=A0 =C2=A0 =C2=A0 .restore =3D shuttle_wmi_resume,
> > + =C2=A0 =C2=A0 =C2=A0 .resume =3D shuttle_wmi_resume,
> > +};
> > +#endif
> > +
> > +static struct platform_driver shuttle_wmi_driver =3D {
> > + =C2=A0 =C2=A0 =C2=A0 .driver =3D {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D KBUILD=
_MODNAME,
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =3D THIS_=
MODULE,
> > +#ifdef CONFIG_PM
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pm =3D &shuttle=
_wmi_pm_ops,
> > +#endif
> > + =C2=A0 =C2=A0 =C2=A0 },
> > + =C2=A0 =C2=A0 =C2=A0 .probe =3D shuttle_wmi_probe,
> > + =C2=A0 =C2=A0 =C2=A0 .remove =3D __devexit_p(shuttle_wmi_remove),
> > +};
> > +
> > +static struct platform_device *shuttle_wmi_device;
> > +
> > +static ssize_t show_state_common(char *buf, unsigned short ecram, =
u32 mask)
> > +{
> > + =C2=A0 =C2=A0 =C2=A0 u32 val;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ecram, &val=
))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> > + =C2=A0 =C2=A0 =C2=A0 return sprintf(buf, "%d\n", (val & mask) ? 1=
 : 0);
> > +}
> > +
> > +static ssize_t store_state_common(const char *buf, size_t count,
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned short ecram, u32=
 mask,
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned short fn)
> > +{
> > + =C2=A0 =C2=A0 =C2=A0 int enable;
> > + =C2=A0 =C2=A0 =C2=A0 int rc;
> > + =C2=A0 =C2=A0 =C2=A0 u32 val;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 if (sscanf(buf, "%i", &enable) !=3D 1)
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> > +
> > + =C2=A0 =C2=A0 =C2=A0 if (wmi_ec_cmd(CMD_READEC, 0, 0, ecram, &val=
))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> > + =C2=A0 =C2=A0 =C2=A0 val &=3D mask;
>=20
> Here again, having to use a mask makes the code harder to read.
> Can't you use !!(val & mask) instead of val & mask ? Maybe a wrapper
> around CMD_READEC to do that ? int wmi_ec_read_state(ecram, mask) ?

I'll see if I can make it better.

>=20
> > + =C2=A0 =C2=A0 =C2=A0 if ((val && !enable) ||
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (!val && enable)) {
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wmi_ec_cmd(CMD_S=
CMD, 0, 0, fn, NULL);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D wmi_ec_cm=
d(CMD_READEC, 0, 0, ecram, &val);
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val &=3D mask;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc || (!val =
&& enable) ||
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (v=
al && !enable))
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -EIO;
> > + =C2=A0 =C2=A0 =C2=A0 }
> > + =C2=A0 =C2=A0 =C2=A0 return count;
> > +}

--
[]'s
Herton
