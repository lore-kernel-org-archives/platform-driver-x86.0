From: Andrzej Prochyra <andrzej@prochyra.name>
Subject: Re: [PATCH] Platform: samsung-laptop: add DMI information for Samsung N150 Plus
Date: Sat, 24 Dec 2011 14:12:57 +0000
Message-ID: <87ty4qdpna.fsf@prochyra.name>
References: <87ty4ss0z4.fsf@prochyra.name>
	<CAHR064h7a=RQq=p1J+gKpC5_6ow8ChUFFkC39HwtmerHaMksjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:43755 "EHLO
	relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754887Ab1LXONG convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 24 Dec 2011 09:13:06 -0500
In-Reply-To: <CAHR064h7a=RQq=p1J+gKpC5_6ow8ChUFFkC39HwtmerHaMksjw@mail.gmail.com>
	(Corentin Chary's message of "Fri, 23 Dec 2011 15:15:23 +0100")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Corentin Chary <corentin.chary@gmail.com> writes:

> On Thu, Dec 22, 2011 at 11:19 PM, Andrzej Prochyra
> <andrzej@prochyra.name> wrote:
>> From: Andrzej Prochyra <andrzej@prochyra.name>
>>
>> Adds DMI information for Samsung N150 Plus which identifies itself a=
s
>> "N150P" so that the driver loads and the 'acpi_backlight=3Dvendor'
>> parameter does not need to be used in order for backlight control to
>> work.
>>
>> Signed-off-by: Andrzej Prochyra <andrzej@prochyra.name>
>> ---
>> =C2=A0drivers/platform/x86/samsung-laptop.c | =C2=A0 10 ++++++++++
>> =C2=A01 files changed, 10 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platfor=
m/x86/samsung-laptop.c
>> index 09e26bf..e3a496a 100644
>> --- a/drivers/platform/x86/samsung-laptop.c
>> +++ b/drivers/platform/x86/samsung-laptop.c
>> @@ -780,6 +780,16 @@ static struct dmi_system_id __initdata samsung_=
dmi_table[] =3D {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.callback =3D=
 dmi_check_cb,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
>> + =C2=A0 =C2=A0 =C2=A0 {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ident =3D "N150P=
",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .matches =3D {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 DMI_MATCH(DMI_SYS_VENDOR,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "SAM=
SUNG ELECTRONICS CO., LTD."),
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 DMI_MATCH(DMI_PRODUCT_NAME, "N150P"),
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 DMI_MATCH(DMI_BOARD_NAME, "N150P"),
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .callback =3D dmi=
_check_cb,
>> + =C2=A0 =C2=A0 =C2=A0 },
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ },
>> =C2=A0};
>> =C2=A0MODULE_DEVICE_TABLE(dmi, samsung_dmi_table);
>> --
>> 1.7.4.1
>
> Hi,
> On top of what is based this patch ?

The patch is against the mainline kernel from
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

(The MAINTAINERS file gives the git tree
git://git.kernel.org/pub/scm/linux/kernel/git/mjg59/platform-drivers-x8=
6.git
in the X86 PLATFORM DRIVERS section but this does not seem to exist.)

>=20
> Could you try
> https://github.com/iksaif/platform-drivers-x86/tree/samsung-laptop or
> https://github.com/iksaif/samsung-laptop-dkms ?  Are both ACPI and VG=
A
> backlight non-fonctional ? What's in /sys/class/backlight/ ?  Thanks

I have tried:

* The mainline kernel
* The mainline kernel with my patch applied
* https://github.com/iksaif/platform-drivers-x86/tree/samsung-laptop

Here are my results:

MAINLINE KERNEL
---------------

'samsung-laptop' module not loaded.

    $ ls /sys/class/backlight
    acpi_video0 intel_backlight

'acpi_video0' not functional.  Brightness can be controlled through
intel_backlight interface.  There are 21 brightness levels and the
backlight can be turned off.


WITH MY PATCH APPLIED
---------------------

'samsung-laptop' module now loaded.

    $ ls /sys/class/backlight
    acpi_video0 intel_backlight samsung

Backlight can be controlled through intel_backlight and samsung
interfaces.  The samsung interface has only 9 brightness levels and 0
does not turn the backlight off.


SAMSUNG-LAPTOP BRANCH
---------------------

'samsung-laptop' module loaded.

    $ ls /sys/class/backlight
    acpi_video0 intel_backlight

Brightness can be controlled through intel_backlight.

With 'acpi_backlight=3Dvendor':

    $ ls /sys/class/backlight
    intel_backlight samsung

Brightness can be controlled as with my patch.


CONCLUSION
----------

=46or kernel versions where 'intel_backlight' is available, samsung-lap=
top
is not needed for backlight control on this machine? =20
--=20
Andrzej Prochyra
<andrzej@prochyra.name>
