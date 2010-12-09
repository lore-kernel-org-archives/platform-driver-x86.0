From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] Add WMI driver for some Megaware notebook models.
Date: Thu, 9 Dec 2010 22:15:28 +0100
Message-ID: <AANLkTik9gkpnc9p0j3L20XhxRcME01=G8CNydW1FJqQ5@mail.gmail.com>
References: <1291928034-29199-1-git-send-email-cascardo@holoscopio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f171.google.com ([209.85.215.171]:64602 "EHLO
	mail-ey0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752883Ab0LIVPa convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 9 Dec 2010 16:15:30 -0500
Received: by eyg5 with SMTP id 5so2283320eyg.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Dec 2010 13:15:28 -0800 (PST)
In-Reply-To: <1291928034-29199-1-git-send-email-cascardo@holoscopio.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Cc: platform-driver-x86@vger.kernel.org, ceolin@ulevel.com

Hi,

On Thu, Dec 9, 2010 at 9:53 PM, Thadeu Lima de Souza Cascardo
<cascardo@holoscopio.com> wrote:
> This driver supports some keys for Megaware notebook models. This par=
ticular
> driver was sponsored by Ulevel <http://ulevel.com>.
>
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com=
>
> ---
>
> Perhaps, some function names are a little odd or some of the function=
s
> should be open-coded instead. Comments, please?
>
> Note that it depends on both the last fix for WMI and the recent touc=
hpad keys
> in input.h.
>
> Thanks,
> Cascardo.
>
> ---
> =C2=A0drivers/platform/x86/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 =C2=A08 ++
> =C2=A0drivers/platform/x86/Makefile =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A01 +
> =C2=A0drivers/platform/x86/megaware-wmi.c | =C2=A0226 +++++++++++++++=
++++++++++++++++++++
> =C2=A03 files changed, 235 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 drivers/platform/x86/megaware-wmi.c
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
> index 4c7f8b9..9e20ee0 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -651,4 +651,12 @@ config XO1_RFKILL
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Support for enabling/disabling the =
WLAN interface on the OLPC XO-1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0laptop.
>
> +config MEGAWARE_WMI
> + =C2=A0 =C2=A0 =C2=A0 tristate "Megaware WMI input keys"
> + =C2=A0 =C2=A0 =C2=A0 depends on ACPI_WMI
> + =C2=A0 =C2=A0 =C2=A0 select INPUT

depends on INPUT, only use select for small stuff.

> + =C2=A0 =C2=A0 =C2=A0 select INPUT_SPARSEKMAP
> + =C2=A0 =C2=A0 =C2=A0 ---help---
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 This adds support for the keys in some =
Megaware notebook models.
> +
> =C2=A0endif # X86_PLATFORM_DEVICES
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Mak=
efile
> index 4ec4ff8..e7942f8 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -34,3 +34,4 @@ obj-$(CONFIG_INTEL_IPS) =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 +=3D intel_ips.o
> =C2=A0obj-$(CONFIG_GPIO_INTEL_PMIC) =C2=A0+=3D intel_pmic_gpio.o
> =C2=A0obj-$(CONFIG_XO1_RFKILL) =C2=A0 =C2=A0 =C2=A0 +=3D xo1-rfkill.o
> =C2=A0obj-$(CONFIG_IBM_RTL) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D ib=
m_rtl.o
> +obj-$(CONFIG_MEGAWARE_WMI) =C2=A0 =C2=A0 +=3D megaware-wmi.o
> diff --git a/drivers/platform/x86/megaware-wmi.c b/drivers/platform/x=
86/megaware-wmi.c
> new file mode 100644
> index 0000000..0ea0dac
> --- /dev/null
> +++ b/drivers/platform/x86/megaware-wmi.c
> @@ -0,0 +1,226 @@
> +/*
> + * =C2=A0Copyright (C) 2010 =C2=A0Thadeu Lima de Souza Cascardo <cas=
cardo@holoscopio.com>
> + *
> + * =C2=A0This program is free software; you can redistribute it and/=
or modify
> + * =C2=A0it under the terms of the GNU General Public License as pub=
lished by
> + * =C2=A0the Free Software Foundation; either version 2 of the Licen=
se, or
> + * =C2=A0(at your option) any later version.
> + *
> + * =C2=A0This program is distributed in the hope that it will be use=
ful,
> + * =C2=A0but WITHOUT ANY WARRANTY; without even the implied warranty=
 of
> + * =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =C2=A0=
See the
> + * =C2=A0GNU General Public License for more details.
> + *
> + * =C2=A0You should have received a copy of the GNU General Public L=
icense along
> + * =C2=A0with this program; if not, write to the Free Software Found=
ation, Inc.,
> + * =C2=A051 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/platform_device.h>
> +#include <linux/acpi.h>
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Thadeu Lima de Souza Cascardo <cascardo@holoscopio.co=
m>");
> +
> +#define MEGAWARE_DRIVER_NAME "megaware"
> +
> +#define MEGAWARE_GUID_CODE "39142400-C6A3-40FA-BADB-8A2652834100"
> +#define MEGAWARE_GUID_EVENT "59142400-C6A3-40FA-BADB-8A2652834100"
> +#define MEGAWARE_GUID_INIT "79142400-C6A3-40FA-BADB-8A2652834100"
> +
> +MODULE_ALIAS("wmi:"MEGAWARE_GUID_INIT);
> +
> +struct megaware_device {
> + =C2=A0 =C2=A0 =C2=A0 struct input_dev *idev;
> +};
> +
> +static acpi_status megaware_call_wq00(acpi_handle handle,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long long *ret)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct acpi_buffer output;
> + =C2=A0 =C2=A0 =C2=A0 union acpi_object *obj;
> + =C2=A0 =C2=A0 =C2=A0 acpi_status status;

add an empty line between variable declaration and code ?
I don't know if it's in the coding style, but I find it more readable.
Apply this comment to all functions.

> + =C2=A0 =C2=A0 =C2=A0 output.length =3D ACPI_ALLOCATE_BUFFER;
> + =C2=A0 =C2=A0 =C2=A0 output.pointer =3D NULL;
> + =C2=A0 =C2=A0 =C2=A0 status =3D wmi_query_block(MEGAWARE_GUID_CODE,=
 1, &output);
> + =C2=A0 =C2=A0 =C2=A0 if (status)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return status;
> + =C2=A0 =C2=A0 =C2=A0 obj =3D output.pointer;
> + =C2=A0 =C2=A0 =C2=A0 if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ret =3D obj->inte=
ger.value;
> + =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D AE_TYPE=
;
> + =C2=A0 =C2=A0 =C2=A0 kfree(obj);
> + =C2=A0 =C2=A0 =C2=A0 return status;
> +}
> +
> +static acpi_status megaware_call_init(struct megaware_device *megawa=
re)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct acpi_buffer input;
> + =C2=A0 =C2=A0 =C2=A0 unsigned long long value =3D 0;
> + =C2=A0 =C2=A0 =C2=A0 acpi_status status;
> + =C2=A0 =C2=A0 =C2=A0 input.length =3D sizeof(value);
> + =C2=A0 =C2=A0 =C2=A0 input.pointer =3D &value;
> + =C2=A0 =C2=A0 =C2=A0 status =3D wmi_evaluate_method(MEGAWARE_GUID_I=
NIT, 1, 0, &input, NULL);
> + =C2=A0 =C2=A0 =C2=A0 return status;
> +}
> +
> +static const struct key_entry megaware_keys[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x100, { KEY_WLAN } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x101, { KEY_BLUETOOTH } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x102, { KEY_PROG1 } },

Maybe you could add a comment to describe the PROG1 key ?

> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x107, { KEY_SWITCHVIDEOMODE } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x108, { KEY_TOUCHPAD_TOGGLE } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x109, { KEY_MUTE } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x10A, { KEY_VOLUMEUP } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_KEY, 0x10B, { KEY_VOLUMEDOWN } },
> + =C2=A0 =C2=A0 =C2=A0 { KE_END, }
> +};
> +
> +static int megaware_add(struct platform_device *dev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct megaware_device *megaware =3D dev_get_d=
rvdata(&dev->dev);
> + =C2=A0 =C2=A0 =C2=A0 struct input_dev *inputdev;
> + =C2=A0 =C2=A0 =C2=A0 int error;
> + =C2=A0 =C2=A0 =C2=A0 acpi_status status;
> +
> + =C2=A0 =C2=A0 =C2=A0 status =3D megaware_call_init(megaware);
> + =C2=A0 =C2=A0 =C2=A0 if (!ACPI_SUCCESS(status))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> +
> + =C2=A0 =C2=A0 =C2=A0 inputdev =3D input_allocate_device();
> + =C2=A0 =C2=A0 =C2=A0 if (!inputdev)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;
> + =C2=A0 =C2=A0 =C2=A0 inputdev->name =3D MEGAWARE_DRIVER_NAME "_keys=
";
> + =C2=A0 =C2=A0 =C2=A0 inputdev->dev.parent =3D &dev->dev;
> +
> + =C2=A0 =C2=A0 =C2=A0 error =3D sparse_keymap_setup(inputdev, megawa=
re_keys, NULL);
> + =C2=A0 =C2=A0 =C2=A0 if (error)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_alloc;
> +
> + =C2=A0 =C2=A0 =C2=A0 error =3D input_register_device(inputdev);
> + =C2=A0 =C2=A0 =C2=A0 if (error)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_keymap;
> + =C2=A0 =C2=A0 =C2=A0 megaware->idev =3D inputdev;
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +
> +err_keymap:
> + =C2=A0 =C2=A0 =C2=A0 sparse_keymap_free(inputdev);
> +err_alloc:
> + =C2=A0 =C2=A0 =C2=A0 input_free_device(inputdev);
> + =C2=A0 =C2=A0 =C2=A0 return error;
> +}
> +
> +static int megaware_del(struct platform_device *dev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct megaware_device *megaware =3D dev_get_d=
rvdata(&dev->dev);
> + =C2=A0 =C2=A0 =C2=A0 struct input_dev *inputdev =3D megaware->idev;
> + =C2=A0 =C2=A0 =C2=A0 sparse_keymap_free(inputdev);
> + =C2=A0 =C2=A0 =C2=A0 input_unregister_device(inputdev);
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static void megaware_notify(u32 event, void *data)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct megaware_device *megaware =3D data;
> + =C2=A0 =C2=A0 =C2=A0 struct input_dev *inputdev =3D megaware->idev;
> + =C2=A0 =C2=A0 =C2=A0 acpi_status status;
> + =C2=A0 =C2=A0 =C2=A0 unsigned long long value =3D 0;
> + =C2=A0 =C2=A0 =C2=A0 if (event !=3D 0x80)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> + =C2=A0 =C2=A0 =C2=A0 status =3D megaware_call_wq00(megaware, &value=
);
> + =C2=A0 =C2=A0 =C2=A0 if (!ACPI_SUCCESS(status))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> + =C2=A0 =C2=A0 =C2=A0 sparse_keymap_report_event(inputdev, value, 1,=
 true);

Add a trace for non-mapped keys ? Will help to support new models.

> +}
> +
> +static __devinit int megaware_probe(struct platform_device *dev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct megaware_device *megaware =3D dev_get_d=
rvdata(&dev->dev);
> + =C2=A0 =C2=A0 =C2=A0 int ret;
> + =C2=A0 =C2=A0 =C2=A0 acpi_status status;
> + =C2=A0 =C2=A0 =C2=A0 ret =3D megaware_add(dev);
> + =C2=A0 =C2=A0 =C2=A0 if (ret)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;
> + =C2=A0 =C2=A0 =C2=A0 status =3D wmi_install_notify_handler(MEGAWARE=
_GUID_EVENT,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 megaware_notify, megaware);
> + =C2=A0 =C2=A0 =C2=A0 if (ACPI_FAILURE(status)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 megaware_del(dev);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EIO;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 return ret;
> +}
> +
> +static __devexit int megaware_remove(struct platform_device *dev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int ret;
> + =C2=A0 =C2=A0 =C2=A0 wmi_remove_notify_handler(MEGAWARE_GUID_EVENT)=
;
> + =C2=A0 =C2=A0 =C2=A0 ret =3D megaware_del(dev);
> + =C2=A0 =C2=A0 =C2=A0 return ret;
> +}
> +
> +static struct platform_driver megaware_driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 .driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =3D THIS_MO=
DULE,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D MEGAWARE=
_DRIVER_NAME,
> + =C2=A0 =C2=A0 =C2=A0 },

I'd suggest that you don't use .probe / .remove, because if probe fail =
you
won't know about it and the module will still be loaded.

I recently sent a patch for eeepc-wmi (it's in linux-next) to fix the
same issue, calling
the megaware_add like function directly in the module init function.

Another way to go is to use platform_driver_probe/platform_create_bundl=
e.

> + =C2=A0 =C2=A0 =C2=A0 .probe =3D megaware_probe,
> + =C2=A0 =C2=A0 =C2=A0 .remove =3D __devexit_p(megaware_remove),
> +};
> +
> +static struct platform_device *megaware_device;
> +
> +static __init int megaware_init(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct megaware_device *megaware;
> + =C2=A0 =C2=A0 =C2=A0 int ret;
> + =C2=A0 =C2=A0 =C2=A0 if (!wmi_has_guid(MEGAWARE_GUID_INIT)) {

Maybe you could also check MEGAWARE_GUID_CODE here ?
Or even the three GUID ? (but the event guid should already be checked
when installing the notify handler).

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_WARNIN=
G "Could not find megaware WMI device.\n");

Use pr_* functions instead of printk ? This way it will add a prefix
automatically.

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENODEV;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_guid;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 megaware =3D kzalloc(sizeof(*megaware), GFP_KE=
RNEL);
> + =C2=A0 =C2=A0 =C2=A0 if (!megaware) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENOMEM;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_alloc;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 megaware_device =3D platform_device_alloc(MEGA=
WARE_DRIVER_NAME, 0);
> + =C2=A0 =C2=A0 =C2=A0 if (!megaware_device) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENOMEM;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_devalloc;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 ret =3D platform_device_add(megaware_device);
> + =C2=A0 =C2=A0 =C2=A0 if (ret)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_devadd;
> + =C2=A0 =C2=A0 =C2=A0 dev_set_drvdata(&megaware_device->dev, megawar=
e);
> + =C2=A0 =C2=A0 =C2=A0 ret =3D platform_driver_register(&megaware_dri=
ver);
> + =C2=A0 =C2=A0 =C2=A0 if (ret)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_driver;
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +out_driver:
> + =C2=A0 =C2=A0 =C2=A0 platform_device_del(megaware_device);
> +out_devadd:
> + =C2=A0 =C2=A0 =C2=A0 platform_device_put(megaware_device);
> +out_devalloc:
> + =C2=A0 =C2=A0 =C2=A0 kfree(megaware);
> +out_alloc:
> +out_guid:
> + =C2=A0 =C2=A0 =C2=A0 return ret;
> +}
> +
> +static __exit void megaware_exit(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct megaware_device *megaware;
> + =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&megaware_driver);
> + =C2=A0 =C2=A0 =C2=A0 megaware =3D dev_get_drvdata(&megaware_device-=
>dev);
> + =C2=A0 =C2=A0 =C2=A0 platform_device_unregister(megaware_device);
> + =C2=A0 =C2=A0 =C2=A0 kfree(megaware);
> +}
> +
> +module_init(megaware_init);
> +module_exit(megaware_exit);
> --
> 1.7.2.3

Otherwise, this looks like a clean wmi driver :)

Thanks.


--=20
Corentin Chary
http://xf.iksaif.net
