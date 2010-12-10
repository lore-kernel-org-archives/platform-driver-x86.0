From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Add WMI driver for some Megaware notebook models.
Date: Thu, 9 Dec 2010 16:08:59 -0800
Message-ID: <20101210000859.GB14810@core.coreip.homeip.net>
References: <1291928034-29199-1-git-send-email-cascardo@holoscopio.com>
 <AANLkTik9gkpnc9p0j3L20XhxRcME01=G8CNydW1FJqQ5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gy0-f194.google.com ([209.85.160.194]:38386 "EHLO
	mail-gy0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753408Ab0LJAJH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 9 Dec 2010 19:09:07 -0500
Received: by gyf1 with SMTP id 1so975046gyf.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Dec 2010 16:09:06 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <AANLkTik9gkpnc9p0j3L20XhxRcME01=G8CNydW1FJqQ5@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, platform-driver-x86@vger.kernel.org, ceolin@ulevel.com

On Thu, Dec 09, 2010 at 10:15:28PM +0100, Corentin Chary wrote:
> Hi,
>=20
> On Thu, Dec 9, 2010 at 9:53 PM, Thadeu Lima de Souza Cascardo
> <cascardo@holoscopio.com> wrote:
> > This driver supports some keys for Megaware notebook models. This p=
articular
> > driver was sponsored by Ulevel <http://ulevel.com>.
> >
> > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.c=
om>
> > ---
> >
> > Perhaps, some function names are a little odd or some of the functi=
ons
> > should be open-coded instead. Comments, please?
> >
> > Note that it depends on both the last fix for WMI and the recent to=
uchpad keys
> > in input.h.
> >
> > Thanks,
> > Cascardo.
> >
> > ---
> > =A0drivers/platform/x86/Kconfig =A0 =A0 =A0 =A0| =A0 =A08 ++
> > =A0drivers/platform/x86/Makefile =A0 =A0 =A0 | =A0 =A01 +
> > =A0drivers/platform/x86/megaware-wmi.c | =A0226 +++++++++++++++++++=
++++++++++++++++
> > =A03 files changed, 235 insertions(+), 0 deletions(-)
> > =A0create mode 100644 drivers/platform/x86/megaware-wmi.c
> >
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kc=
onfig
> > index 4c7f8b9..9e20ee0 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -651,4 +651,12 @@ config XO1_RFKILL
> > =A0 =A0 =A0 =A0 =A0Support for enabling/disabling the WLAN interfac=
e on the OLPC XO-1
> > =A0 =A0 =A0 =A0 =A0laptop.
> >
> > +config MEGAWARE_WMI
> > + =A0 =A0 =A0 tristate "Megaware WMI input keys"
> > + =A0 =A0 =A0 depends on ACPI_WMI
> > + =A0 =A0 =A0 select INPUT
>=20
> depends on INPUT, only use select for small stuff.
>=20
> > + =A0 =A0 =A0 select INPUT_SPARSEKMAP
> > + =A0 =A0 =A0 ---help---
> > + =A0 =A0 =A0 =A0 This adds support for the keys in some Megaware n=
otebook models.
> > +
> > =A0endif # X86_PLATFORM_DEVICES
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/M=
akefile
> > index 4ec4ff8..e7942f8 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -34,3 +34,4 @@ obj-$(CONFIG_INTEL_IPS) =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 +=3D intel_ips.o
> > =A0obj-$(CONFIG_GPIO_INTEL_PMIC) =A0+=3D intel_pmic_gpio.o
> > =A0obj-$(CONFIG_XO1_RFKILL) =A0 =A0 =A0 +=3D xo1-rfkill.o
> > =A0obj-$(CONFIG_IBM_RTL) =A0 =A0 =A0 =A0 =A0+=3D ibm_rtl.o
> > +obj-$(CONFIG_MEGAWARE_WMI) =A0 =A0 +=3D megaware-wmi.o
> > diff --git a/drivers/platform/x86/megaware-wmi.c b/drivers/platform=
/x86/megaware-wmi.c
> > new file mode 100644
> > index 0000000..0ea0dac
> > --- /dev/null
> > +++ b/drivers/platform/x86/megaware-wmi.c
> > @@ -0,0 +1,226 @@
> > +/*
> > + * =A0Copyright (C) 2010 =A0Thadeu Lima de Souza Cascardo <cascard=
o@holoscopio.com>
> > + *
> > + * =A0This program is free software; you can redistribute it and/o=
r modify
> > + * =A0it under the terms of the GNU General Public License as publ=
ished by
> > + * =A0the Free Software Foundation; either version 2 of the Licens=
e, or
> > + * =A0(at your option) any later version.
> > + *
> > + * =A0This program is distributed in the hope that it will be usef=
ul,
> > + * =A0but WITHOUT ANY WARRANTY; without even the implied warranty =
of
> > + * =A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See =
the
> > + * =A0GNU General Public License for more details.
> > + *
> > + * =A0You should have received a copy of the GNU General Public Li=
cense along
> > + * =A0with this program; if not, write to the Free Software Founda=
tion, Inc.,
> > + * =A051 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +#include <linux/input.h>
> > +#include <linux/input/sparse-keymap.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/acpi.h>
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Thadeu Lima de Souza Cascardo <cascardo@holoscopio.=
com>");
> > +
> > +#define MEGAWARE_DRIVER_NAME "megaware"
> > +
> > +#define MEGAWARE_GUID_CODE "39142400-C6A3-40FA-BADB-8A2652834100"
> > +#define MEGAWARE_GUID_EVENT "59142400-C6A3-40FA-BADB-8A2652834100"
> > +#define MEGAWARE_GUID_INIT "79142400-C6A3-40FA-BADB-8A2652834100"
> > +
> > +MODULE_ALIAS("wmi:"MEGAWARE_GUID_INIT);
> > +
> > +struct megaware_device {
> > + =A0 =A0 =A0 struct input_dev *idev;
> > +};
> > +
> > +static acpi_status megaware_call_wq00(acpi_handle handle,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsig=
ned long long *ret)
> > +{
> > + =A0 =A0 =A0 struct acpi_buffer output;
> > + =A0 =A0 =A0 union acpi_object *obj;
> > + =A0 =A0 =A0 acpi_status status;
>=20
> add an empty line between variable declaration and code ?
> I don't know if it's in the coding style, but I find it more readable=
=2E
> Apply this comment to all functions.

Yes, separating declarations and code is preferred style. In general,
judicious use of empty lines to group related statements is very
welcome.

>=20
> > + =A0 =A0 =A0 output.length =3D ACPI_ALLOCATE_BUFFER;
> > + =A0 =A0 =A0 output.pointer =3D NULL;
> > + =A0 =A0 =A0 status =3D wmi_query_block(MEGAWARE_GUID_CODE, 1, &ou=
tput);
> > + =A0 =A0 =A0 if (status)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return status;
> > + =A0 =A0 =A0 obj =3D output.pointer;
> > + =A0 =A0 =A0 if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *ret =3D obj->integer.value;
> > + =A0 =A0 =A0 else
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D AE_TYPE;
> > + =A0 =A0 =A0 kfree(obj);
> > + =A0 =A0 =A0 return status;
> > +}
> > +
> > +static acpi_status megaware_call_init(struct megaware_device *mega=
ware)
> > +{
> > + =A0 =A0 =A0 struct acpi_buffer input;
> > + =A0 =A0 =A0 unsigned long long value =3D 0;
> > + =A0 =A0 =A0 acpi_status status;
> > + =A0 =A0 =A0 input.length =3D sizeof(value);
> > + =A0 =A0 =A0 input.pointer =3D &value;
> > + =A0 =A0 =A0 status =3D wmi_evaluate_method(MEGAWARE_GUID_INIT, 1,=
 0, &input, NULL);
> > + =A0 =A0 =A0 return status;


Could probably be written as:

	unsigned long long value =3D 0;
	struct acpi_buffer input =3D {
		.length	 =3D sizeof(value),
		.pointer =3D &value,
	};

	return wmi_evaluate_method(MEGAWARE_GUID_INIT, 1, 0, &input, NULL);

> > +}
> > +
> > +static const struct key_entry megaware_keys[] =3D {
> > + =A0 =A0 =A0 { KE_KEY, 0x100, { KEY_WLAN } },
> > + =A0 =A0 =A0 { KE_KEY, 0x101, { KEY_BLUETOOTH } },
> > + =A0 =A0 =A0 { KE_KEY, 0x102, { KEY_PROG1 } },
>=20
> Maybe you could add a comment to describe the PROG1 key ?
>=20
> > + =A0 =A0 =A0 { KE_KEY, 0x107, { KEY_SWITCHVIDEOMODE } },
> > + =A0 =A0 =A0 { KE_KEY, 0x108, { KEY_TOUCHPAD_TOGGLE } },
> > + =A0 =A0 =A0 { KE_KEY, 0x109, { KEY_MUTE } },
> > + =A0 =A0 =A0 { KE_KEY, 0x10A, { KEY_VOLUMEUP } },
> > + =A0 =A0 =A0 { KE_KEY, 0x10B, { KEY_VOLUMEDOWN } },
> > + =A0 =A0 =A0 { KE_END, }
> > +};
> > +
> > +static int megaware_add(struct platform_device *dev)

Can also be __devinit. And why don't you use struct megaware_device * a=
s
the argument instead of platform device? And call it
megaware_input_init()?

> > +{
> > + =A0 =A0 =A0 struct megaware_device *megaware =3D dev_get_drvdata(=
&dev->dev);
> > + =A0 =A0 =A0 struct input_dev *inputdev;
> > + =A0 =A0 =A0 int error;
> > + =A0 =A0 =A0 acpi_status status;
> > +
> > + =A0 =A0 =A0 status =3D megaware_call_init(megaware);
> > + =A0 =A0 =A0 if (!ACPI_SUCCESS(status))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EIO;
> > +
> > + =A0 =A0 =A0 inputdev =3D input_allocate_device();
> > + =A0 =A0 =A0 if (!inputdev)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> > + =A0 =A0 =A0 inputdev->name =3D MEGAWARE_DRIVER_NAME "_keys";
> > + =A0 =A0 =A0 inputdev->dev.parent =3D &dev->dev;
> > +
> > + =A0 =A0 =A0 error =3D sparse_keymap_setup(inputdev, megaware_keys=
, NULL);
> > + =A0 =A0 =A0 if (error)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_alloc;
> > +
> > + =A0 =A0 =A0 error =3D input_register_device(inputdev);
> > + =A0 =A0 =A0 if (error)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_keymap;
> > + =A0 =A0 =A0 megaware->idev =3D inputdev;
> > + =A0 =A0 =A0 return 0;
> > +
> > +err_keymap:
> > + =A0 =A0 =A0 sparse_keymap_free(inputdev);
> > +err_alloc:
> > + =A0 =A0 =A0 input_free_device(inputdev);
> > + =A0 =A0 =A0 return error;
> > +}
> > +
> > +static int megaware_del(struct platform_device *dev)
> > +{

Same here, struct megaware_device * as an argument would make more
sense.

> > + =A0 =A0 =A0 struct megaware_device *megaware =3D dev_get_drvdata(=
&dev->dev);
> > + =A0 =A0 =A0 struct input_dev *inputdev =3D megaware->idev;
> > + =A0 =A0 =A0 sparse_keymap_free(inputdev);
> > + =A0 =A0 =A0 input_unregister_device(inputdev);
> > + =A0 =A0 =A0 return 0;
> > +}
> > +
> > +static void megaware_notify(u32 event, void *data)
> > +{
> > + =A0 =A0 =A0 struct megaware_device *megaware =3D data;
> > + =A0 =A0 =A0 struct input_dev *inputdev =3D megaware->idev;
> > + =A0 =A0 =A0 acpi_status status;
> > + =A0 =A0 =A0 unsigned long long value =3D 0;
> > + =A0 =A0 =A0 if (event !=3D 0x80)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> > + =A0 =A0 =A0 status =3D megaware_call_wq00(megaware, &value);
> > + =A0 =A0 =A0 if (!ACPI_SUCCESS(status))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> > + =A0 =A0 =A0 sparse_keymap_report_event(inputdev, value, 1, true);
>=20
> Add a trace for non-mapped keys ? Will help to support new models.
>=20
> > +}
> > +
> > +static __devinit int megaware_probe(struct platform_device *dev)
> > +{
> > + =A0 =A0 =A0 struct megaware_device *megaware =3D dev_get_drvdata(=
&dev->dev);
> > + =A0 =A0 =A0 int ret;
> > + =A0 =A0 =A0 acpi_status status;
> > + =A0 =A0 =A0 ret =3D megaware_add(dev);
> > + =A0 =A0 =A0 if (ret)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> > + =A0 =A0 =A0 status =3D wmi_install_notify_handler(MEGAWARE_GUID_E=
VENT,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 megaware_notify, mega=
ware);
> > + =A0 =A0 =A0 if (ACPI_FAILURE(status)) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 megaware_del(dev);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EIO;
> > + =A0 =A0 =A0 }
> > + =A0 =A0 =A0 return ret;
> > +}
> > +
> > +static __devexit int megaware_remove(struct platform_device *dev)
> > +{
> > + =A0 =A0 =A0 int ret;
> > + =A0 =A0 =A0 wmi_remove_notify_handler(MEGAWARE_GUID_EVENT);
> > + =A0 =A0 =A0 ret =3D megaware_del(dev);
> > + =A0 =A0 =A0 return ret;
> > +}
> > +
> > +static struct platform_driver megaware_driver =3D {
> > + =A0 =A0 =A0 .driver =3D {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .owner =3D THIS_MODULE,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =3D MEGAWARE_DRIVER_NAME,
> > + =A0 =A0 =A0 },
>=20
> I'd suggest that you don't use .probe / .remove, because if probe fai=
l you
> won't know about it and the module will still be loaded.

=2Eremove is still needed but I guess Corentin refers to using
platform_driver_probe() instead of platform_driver_register() so the
megaware_probe can be marked __init and discarded after driver
initialization has been completed.

>=20
> I recently sent a patch for eeepc-wmi (it's in linux-next) to fix the
> same issue, calling
> the megaware_add like function directly in the module init function.
>=20
> Another way to go is to use platform_driver_probe/platform_create_bun=
dle.
>=20
> > + =A0 =A0 =A0 .probe =3D megaware_probe,
> > + =A0 =A0 =A0 .remove =3D __devexit_p(megaware_remove),
> > +};
> > +
> > +static struct platform_device *megaware_device;
> > +
> > +static __init int megaware_init(void)
> > +{
> > + =A0 =A0 =A0 struct megaware_device *megaware;
> > + =A0 =A0 =A0 int ret;
> > + =A0 =A0 =A0 if (!wmi_has_guid(MEGAWARE_GUID_INIT)) {
>=20
> Maybe you could also check MEGAWARE_GUID_CODE here ?
> Or even the three GUID ? (but the event guid should already be checke=
d
> when installing the notify handler).
>=20
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "Could not find m=
egaware WMI device.\n");
>=20
> Use pr_* functions instead of printk ? This way it will add a prefix
> automatically.
>=20
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENODEV;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_guid;
> > + =A0 =A0 =A0 }
> > + =A0 =A0 =A0 megaware =3D kzalloc(sizeof(*megaware), GFP_KERNEL);
> > + =A0 =A0 =A0 if (!megaware) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_alloc;
> > + =A0 =A0 =A0 }

I do not really see the point in dynamically allocating megaware
structure since there can only be one instance of it.

> > + =A0 =A0 =A0 megaware_device =3D platform_device_alloc(MEGAWARE_DR=
IVER_NAME, 0);
> > + =A0 =A0 =A0 if (!megaware_device) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_devalloc;
> > + =A0 =A0 =A0 }
> > + =A0 =A0 =A0 ret =3D platform_device_add(megaware_device);
> > + =A0 =A0 =A0 if (ret)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_devadd;
> > + =A0 =A0 =A0 dev_set_drvdata(&megaware_device->dev, megaware);
> > + =A0 =A0 =A0 ret =3D platform_driver_register(&megaware_driver);
> > + =A0 =A0 =A0 if (ret)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_driver;
> > + =A0 =A0 =A0 return 0;
> > +out_driver:
> > + =A0 =A0 =A0 platform_device_del(megaware_device);
> > +out_devadd:
> > + =A0 =A0 =A0 platform_device_put(megaware_device);
> > +out_devalloc:
> > + =A0 =A0 =A0 kfree(megaware);
> > +out_alloc:
> > +out_guid:
> > + =A0 =A0 =A0 return ret;
> > +}
> > +
> > +static __exit void megaware_exit(void)
> > +{
> > + =A0 =A0 =A0 struct megaware_device *megaware;
> > + =A0 =A0 =A0 platform_driver_unregister(&megaware_driver);
> > + =A0 =A0 =A0 megaware =3D dev_get_drvdata(&megaware_device->dev);
> > + =A0 =A0 =A0 platform_device_unregister(megaware_device);
> > + =A0 =A0 =A0 kfree(megaware);
> > +}
> > +
> > +module_init(megaware_init);
> > +module_exit(megaware_exit);
> > --
> > 1.7.2.3
>=20
> Otherwise, this looks like a clean wmi driver :)
>=20
> Thanks.
>=20
>=20
> --=20
> Corentin Chary
> http://xf.iksaif.net
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
Dmitry
