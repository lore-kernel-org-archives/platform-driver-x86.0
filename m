From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] Add WMI driver for some Megaware notebook models.
Date: Fri, 10 Dec 2010 08:12:53 +0100
Message-ID: <AANLkTimZYnWds0zc2faTKyKCr2+2Nf=DrQrGF8Q7X8rE@mail.gmail.com>
References: <1291928034-29199-1-git-send-email-cascardo@holoscopio.com>
	<AANLkTik9gkpnc9p0j3L20XhxRcME01=G8CNydW1FJqQ5@mail.gmail.com>
	<20101210000859.GB14810@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f171.google.com ([209.85.215.171]:45030 "EHLO
	mail-ey0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752338Ab0LJHMz convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 10 Dec 2010 02:12:55 -0500
Received: by eyg5 with SMTP id 5so2512794eyg.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Dec 2010 23:12:53 -0800 (PST)
In-Reply-To: <20101210000859.GB14810@core.coreip.homeip.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, platform-driver-x86@vger.kernel.org, ceolin@ulevel.com

On Fri, Dec 10, 2010 at 1:08 AM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Thu, Dec 09, 2010 at 10:15:28PM +0100, Corentin Chary wrote:
>> Hi,
>>
>> On Thu, Dec 9, 2010 at 9:53 PM, Thadeu Lima de Souza Cascardo
>> <cascardo@holoscopio.com> wrote:
>> > This driver supports some keys for Megaware notebook models. This =
particular
>> > driver was sponsored by Ulevel <http://ulevel.com>.
>> >
>> > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.=
com>
>> > ---
>> >
>> > Perhaps, some function names are a little odd or some of the funct=
ions
>> > should be open-coded instead. Comments, please?
>> >
>> > Note that it depends on both the last fix for WMI and the recent t=
ouchpad keys
>> > in input.h.
>> >
>> > Thanks,
>> > Cascardo.
>> >
>> > ---
>> > =C2=A0drivers/platform/x86/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A08 ++
>> > =C2=A0drivers/platform/x86/Makefile =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A01 +
>> > =C2=A0drivers/platform/x86/megaware-wmi.c | =C2=A0226 ++++++++++++=
+++++++++++++++++++++++
>> > =C2=A03 files changed, 235 insertions(+), 0 deletions(-)
>> > =C2=A0create mode 100644 drivers/platform/x86/megaware-wmi.c
>> >
>> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/K=
config
>> > index 4c7f8b9..9e20ee0 100644
>> > --- a/drivers/platform/x86/Kconfig
>> > +++ b/drivers/platform/x86/Kconfig
>> > @@ -651,4 +651,12 @@ config XO1_RFKILL
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Support for enabling/disabling t=
he WLAN interface on the OLPC XO-1
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0laptop.
>> >
>> > +config MEGAWARE_WMI
>> > + =C2=A0 =C2=A0 =C2=A0 tristate "Megaware WMI input keys"
>> > + =C2=A0 =C2=A0 =C2=A0 depends on ACPI_WMI
>> > + =C2=A0 =C2=A0 =C2=A0 select INPUT
>>
>> depends on INPUT, only use select for small stuff.
>>
>> > + =C2=A0 =C2=A0 =C2=A0 select INPUT_SPARSEKMAP
>> > + =C2=A0 =C2=A0 =C2=A0 ---help---
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 This adds support for the keys in so=
me Megaware notebook models.
>> > +
>> > =C2=A0endif # X86_PLATFORM_DEVICES
>> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/=
Makefile
>> > index 4ec4ff8..e7942f8 100644
>> > --- a/drivers/platform/x86/Makefile
>> > +++ b/drivers/platform/x86/Makefile
>> > @@ -34,3 +34,4 @@ obj-$(CONFIG_INTEL_IPS) =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 +=3D intel_ips.o
>> > =C2=A0obj-$(CONFIG_GPIO_INTEL_PMIC) =C2=A0+=3D intel_pmic_gpio.o
>> > =C2=A0obj-$(CONFIG_XO1_RFKILL) =C2=A0 =C2=A0 =C2=A0 +=3D xo1-rfkil=
l.o
>> > =C2=A0obj-$(CONFIG_IBM_RTL) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D=
 ibm_rtl.o
>> > +obj-$(CONFIG_MEGAWARE_WMI) =C2=A0 =C2=A0 +=3D megaware-wmi.o
>> > diff --git a/drivers/platform/x86/megaware-wmi.c b/drivers/platfor=
m/x86/megaware-wmi.c
>> > new file mode 100644
>> > index 0000000..0ea0dac
>> > --- /dev/null
>> > +++ b/drivers/platform/x86/megaware-wmi.c
>> > @@ -0,0 +1,226 @@
>> > +/*
>> > + * =C2=A0Copyright (C) 2010 =C2=A0Thadeu Lima de Souza Cascardo <=
cascardo@holoscopio.com>
>> > + *
>> > + * =C2=A0This program is free software; you can redistribute it a=
nd/or modify
>> > + * =C2=A0it under the terms of the GNU General Public License as =
published by
>> > + * =C2=A0the Free Software Foundation; either version 2 of the Li=
cense, or
>> > + * =C2=A0(at your option) any later version.
>> > + *
>> > + * =C2=A0This program is distributed in the hope that it will be =
useful,
>> > + * =C2=A0but WITHOUT ANY WARRANTY; without even the implied warra=
nty of
>> > + * =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=
=A0See the
>> > + * =C2=A0GNU General Public License for more details.
>> > + *
>> > + * =C2=A0You should have received a copy of the GNU General Publi=
c License along
>> > + * =C2=A0with this program; if not, write to the Free Software Fo=
undation, Inc.,
>> > + * =C2=A051 Franklin Street, Fifth Floor, Boston, MA 02110-1301 U=
SA.
>> > + */
>> > +
>> > +#include <linux/kernel.h>
>> > +#include <linux/module.h>
>> > +#include <linux/slab.h>
>> > +#include <linux/input.h>
>> > +#include <linux/input/sparse-keymap.h>
>> > +#include <linux/platform_device.h>
>> > +#include <linux/acpi.h>
>> > +
>> > +MODULE_LICENSE("GPL");
>> > +MODULE_AUTHOR("Thadeu Lima de Souza Cascardo <cascardo@holoscopio=
=2Ecom>");
>> > +
>> > +#define MEGAWARE_DRIVER_NAME "megaware"
>> > +
>> > +#define MEGAWARE_GUID_CODE "39142400-C6A3-40FA-BADB-8A2652834100"
>> > +#define MEGAWARE_GUID_EVENT "59142400-C6A3-40FA-BADB-8A2652834100=
"
>> > +#define MEGAWARE_GUID_INIT "79142400-C6A3-40FA-BADB-8A2652834100"
>> > +
>> > +MODULE_ALIAS("wmi:"MEGAWARE_GUID_INIT);
>> > +
>> > +struct megaware_device {
>> > + =C2=A0 =C2=A0 =C2=A0 struct input_dev *idev;
>> > +};
>> > +
>> > +static acpi_status megaware_call_wq00(acpi_handle handle,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long long *ret)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 struct acpi_buffer output;
>> > + =C2=A0 =C2=A0 =C2=A0 union acpi_object *obj;
>> > + =C2=A0 =C2=A0 =C2=A0 acpi_status status;
>>
>> add an empty line between variable declaration and code ?
>> I don't know if it's in the coding style, but I find it more readabl=
e.
>> Apply this comment to all functions.
>
> Yes, separating declarations and code is preferred style. In general,
> judicious use of empty lines to group related statements is very
> welcome.
>
>>
>> > + =C2=A0 =C2=A0 =C2=A0 output.length =3D ACPI_ALLOCATE_BUFFER;
>> > + =C2=A0 =C2=A0 =C2=A0 output.pointer =3D NULL;
>> > + =C2=A0 =C2=A0 =C2=A0 status =3D wmi_query_block(MEGAWARE_GUID_CO=
DE, 1, &output);
>> > + =C2=A0 =C2=A0 =C2=A0 if (status)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return status;
>> > + =C2=A0 =C2=A0 =C2=A0 obj =3D output.pointer;
>> > + =C2=A0 =C2=A0 =C2=A0 if (obj && obj->type =3D=3D ACPI_TYPE_INTEG=
ER)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret =3D obj->i=
nteger.value;
>> > + =C2=A0 =C2=A0 =C2=A0 else
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D AE_T=
YPE;
>> > + =C2=A0 =C2=A0 =C2=A0 kfree(obj);
>> > + =C2=A0 =C2=A0 =C2=A0 return status;
>> > +}
>> > +
>> > +static acpi_status megaware_call_init(struct megaware_device *meg=
aware)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 struct acpi_buffer input;
>> > + =C2=A0 =C2=A0 =C2=A0 unsigned long long value =3D 0;
>> > + =C2=A0 =C2=A0 =C2=A0 acpi_status status;
>> > + =C2=A0 =C2=A0 =C2=A0 input.length =3D sizeof(value);
>> > + =C2=A0 =C2=A0 =C2=A0 input.pointer =3D &value;
>> > + =C2=A0 =C2=A0 =C2=A0 status =3D wmi_evaluate_method(MEGAWARE_GUI=
D_INIT, 1, 0, &input, NULL);
>> > + =C2=A0 =C2=A0 =C2=A0 return status;
>
>
> Could probably be written as:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long long value =3D 0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct acpi_buffer input =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.length =C2=A0=
=3D sizeof(value),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pointer =3D &=
value,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0};
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return wmi_evaluate_method(MEGAWARE_GUID_I=
NIT, 1, 0, &input, NULL);
>
>> > +}
>> > +
>> > +static const struct key_entry megaware_keys[] =3D {
>> > + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x100, { KEY_WLAN } },
>> > + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x101, { KEY_BLUETOOTH } },
>> > + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x102, { KEY_PROG1 } },
>>
>> Maybe you could add a comment to describe the PROG1 key ?
>>
>> > + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x107, { KEY_SWITCHVIDEOMODE } },
>> > + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x108, { KEY_TOUCHPAD_TOGGLE } },
>> > + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x109, { KEY_MUTE } },
>> > + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x10A, { KEY_VOLUMEUP } },
>> > + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x10B, { KEY_VOLUMEDOWN } },
>> > + =C2=A0 =C2=A0 =C2=A0 { KE_END, }
>> > +};
>> > +
>> > +static int megaware_add(struct platform_device *dev)
>
> Can also be __devinit. And why don't you use struct megaware_device *=
 as
> the argument instead of platform device? And call it
> megaware_input_init()?
>
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 struct megaware_device *megaware =3D dev_ge=
t_drvdata(&dev->dev);
>> > + =C2=A0 =C2=A0 =C2=A0 struct input_dev *inputdev;
>> > + =C2=A0 =C2=A0 =C2=A0 int error;
>> > + =C2=A0 =C2=A0 =C2=A0 acpi_status status;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 status =3D megaware_call_init(megaware);
>> > + =C2=A0 =C2=A0 =C2=A0 if (!ACPI_SUCCESS(status))
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 inputdev =3D input_allocate_device();
>> > + =C2=A0 =C2=A0 =C2=A0 if (!inputdev)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;
>> > + =C2=A0 =C2=A0 =C2=A0 inputdev->name =3D MEGAWARE_DRIVER_NAME "_k=
eys";
>> > + =C2=A0 =C2=A0 =C2=A0 inputdev->dev.parent =3D &dev->dev;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 error =3D sparse_keymap_setup(inputdev, meg=
aware_keys, NULL);
>> > + =C2=A0 =C2=A0 =C2=A0 if (error)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_alloc;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 error =3D input_register_device(inputdev);
>> > + =C2=A0 =C2=A0 =C2=A0 if (error)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_keymap=
;
>> > + =C2=A0 =C2=A0 =C2=A0 megaware->idev =3D inputdev;
>> > + =C2=A0 =C2=A0 =C2=A0 return 0;
>> > +
>> > +err_keymap:
>> > + =C2=A0 =C2=A0 =C2=A0 sparse_keymap_free(inputdev);
>> > +err_alloc:
>> > + =C2=A0 =C2=A0 =C2=A0 input_free_device(inputdev);
>> > + =C2=A0 =C2=A0 =C2=A0 return error;
>> > +}
>> > +
>> > +static int megaware_del(struct platform_device *dev)
>> > +{
>
> Same here, struct megaware_device * as an argument would make more
> sense.
>
>> > + =C2=A0 =C2=A0 =C2=A0 struct megaware_device *megaware =3D dev_ge=
t_drvdata(&dev->dev);
>> > + =C2=A0 =C2=A0 =C2=A0 struct input_dev *inputdev =3D megaware->id=
ev;
>> > + =C2=A0 =C2=A0 =C2=A0 sparse_keymap_free(inputdev);
>> > + =C2=A0 =C2=A0 =C2=A0 input_unregister_device(inputdev);
>> > + =C2=A0 =C2=A0 =C2=A0 return 0;
>> > +}
>> > +
>> > +static void megaware_notify(u32 event, void *data)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 struct megaware_device *megaware =3D data;
>> > + =C2=A0 =C2=A0 =C2=A0 struct input_dev *inputdev =3D megaware->id=
ev;
>> > + =C2=A0 =C2=A0 =C2=A0 acpi_status status;
>> > + =C2=A0 =C2=A0 =C2=A0 unsigned long long value =3D 0;
>> > + =C2=A0 =C2=A0 =C2=A0 if (event !=3D 0x80)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>> > + =C2=A0 =C2=A0 =C2=A0 status =3D megaware_call_wq00(megaware, &va=
lue);
>> > + =C2=A0 =C2=A0 =C2=A0 if (!ACPI_SUCCESS(status))
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>> > + =C2=A0 =C2=A0 =C2=A0 sparse_keymap_report_event(inputdev, value,=
 1, true);
>>
>> Add a trace for non-mapped keys ? Will help to support new models.
>>
>> > +}
>> > +
>> > +static __devinit int megaware_probe(struct platform_device *dev)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 struct megaware_device *megaware =3D dev_ge=
t_drvdata(&dev->dev);
>> > + =C2=A0 =C2=A0 =C2=A0 int ret;
>> > + =C2=A0 =C2=A0 =C2=A0 acpi_status status;
>> > + =C2=A0 =C2=A0 =C2=A0 ret =3D megaware_add(dev);
>> > + =C2=A0 =C2=A0 =C2=A0 if (ret)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;
>> > + =C2=A0 =C2=A0 =C2=A0 status =3D wmi_install_notify_handler(MEGAW=
ARE_GUID_EVENT,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 megaware_notify, megaware);
>> > + =C2=A0 =C2=A0 =C2=A0 if (ACPI_FAILURE(status)) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 megaware_del(de=
v);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EIO;
>> > + =C2=A0 =C2=A0 =C2=A0 }
>> > + =C2=A0 =C2=A0 =C2=A0 return ret;
>> > +}
>> > +
>> > +static __devexit int megaware_remove(struct platform_device *dev)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 int ret;
>> > + =C2=A0 =C2=A0 =C2=A0 wmi_remove_notify_handler(MEGAWARE_GUID_EVE=
NT);
>> > + =C2=A0 =C2=A0 =C2=A0 ret =3D megaware_del(dev);
>> > + =C2=A0 =C2=A0 =C2=A0 return ret;
>> > +}
>> > +
>> > +static struct platform_driver megaware_driver =3D {
>> > + =C2=A0 =C2=A0 =C2=A0 .driver =3D {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =3D THIS=
_MODULE,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D MEGAW=
ARE_DRIVER_NAME,
>> > + =C2=A0 =C2=A0 =C2=A0 },
>>
>> I'd suggest that you don't use .probe / .remove, because if probe fa=
il you
>> won't know about it and the module will still be loaded.
>
> .remove is still needed but I guess Corentin refers to using
> platform_driver_probe() instead of platform_driver_register() so the
> megaware_probe can be marked __init and discarded after driver
> initialization has been completed.

Also, register won't return any error code if the probe function failed=
,
and the driver will be left in a strange state.

Calling directly platform_driver_probe() will return an error code.

But since it's a singleton device, and since the real "probe" code
is already in the module_init function (wmi_has_guid()) call, using
the probe callback to initialize data structures doesn't seems to make
sense.

>>
>> I recently sent a patch for eeepc-wmi (it's in linux-next) to fix th=
e
>> same issue, calling
>> the megaware_add like function directly in the module init function.
>>
>> Another way to go is to use platform_driver_probe/platform_create_bu=
ndle.
>>
>> > + =C2=A0 =C2=A0 =C2=A0 .probe =3D megaware_probe,
>> > + =C2=A0 =C2=A0 =C2=A0 .remove =3D __devexit_p(megaware_remove),
>> > +};
>> > +
>> > +static struct platform_device *megaware_device;
>> > +
>> > +static __init int megaware_init(void)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 struct megaware_device *megaware;
>> > + =C2=A0 =C2=A0 =C2=A0 int ret;
>> > + =C2=A0 =C2=A0 =C2=A0 if (!wmi_has_guid(MEGAWARE_GUID_INIT)) {
>>
>> Maybe you could also check MEGAWARE_GUID_CODE here ?
>> Or even the three GUID ? (but the event guid should already be check=
ed
>> when installing the notify handler).
>>
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_WAR=
NING "Could not find megaware WMI device.\n");
>>
>> Use pr_* functions instead of printk ? This way it will add a prefix
>> automatically.
>>
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENODEV=
;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_guid;
>> > + =C2=A0 =C2=A0 =C2=A0 }
>> > + =C2=A0 =C2=A0 =C2=A0 megaware =3D kzalloc(sizeof(*megaware), GFP=
_KERNEL);
>> > + =C2=A0 =C2=A0 =C2=A0 if (!megaware) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENOMEM=
;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_alloc;
>> > + =C2=A0 =C2=A0 =C2=A0 }
>
> I do not really see the point in dynamically allocating megaware
> structure since there can only be one instance of it.
>
>> > + =C2=A0 =C2=A0 =C2=A0 megaware_device =3D platform_device_alloc(M=
EGAWARE_DRIVER_NAME, 0);
>> > + =C2=A0 =C2=A0 =C2=A0 if (!megaware_device) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENOMEM=
;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_devall=
oc;
>> > + =C2=A0 =C2=A0 =C2=A0 }
>> > + =C2=A0 =C2=A0 =C2=A0 ret =3D platform_device_add(megaware_device=
);
>> > + =C2=A0 =C2=A0 =C2=A0 if (ret)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_devadd=
;
>> > + =C2=A0 =C2=A0 =C2=A0 dev_set_drvdata(&megaware_device->dev, mega=
ware);
>> > + =C2=A0 =C2=A0 =C2=A0 ret =3D platform_driver_register(&megaware_=
driver);
>> > + =C2=A0 =C2=A0 =C2=A0 if (ret)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_driver=
;
>> > + =C2=A0 =C2=A0 =C2=A0 return 0;
>> > +out_driver:
>> > + =C2=A0 =C2=A0 =C2=A0 platform_device_del(megaware_device);
>> > +out_devadd:
>> > + =C2=A0 =C2=A0 =C2=A0 platform_device_put(megaware_device);
>> > +out_devalloc:
>> > + =C2=A0 =C2=A0 =C2=A0 kfree(megaware);
>> > +out_alloc:
>> > +out_guid:
>> > + =C2=A0 =C2=A0 =C2=A0 return ret;
>> > +}
>> > +
>> > +static __exit void megaware_exit(void)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 struct megaware_device *megaware;
>> > + =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&megaware_driver=
);
>> > + =C2=A0 =C2=A0 =C2=A0 megaware =3D dev_get_drvdata(&megaware_devi=
ce->dev);
>> > + =C2=A0 =C2=A0 =C2=A0 platform_device_unregister(megaware_device)=
;
>> > + =C2=A0 =C2=A0 =C2=A0 kfree(megaware);
>> > +}
>> > +
>> > +module_init(megaware_init);
>> > +module_exit(megaware_exit);
>> > --
>> > 1.7.2.3
>>
>> Otherwise, this looks like a clean wmi driver :)
>>
>> Thanks.
>>
>>
>> --
>> Corentin Chary
>> http://xf.iksaif.net
>> --
>> To unsubscribe from this list: send the line "unsubscribe platform-d=
river-x86" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.h=
tml
>
> --
> Dmitry
>



--=20
Corentin Chary
http://xf.iksaif.net
