From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] Lenovo IdeaPAD ACPI driver
Date: Wed, 11 Aug 2010 14:59:06 +0200
Message-ID: <AANLkTin=Dwbe3gPDGd89Oc25mfOVVvc2_goP77sSVNeo@mail.gmail.com>
References: <1281480758.5887.33.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:50194 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751257Ab0HKM7J convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Aug 2010 08:59:09 -0400
Received: by fxm13 with SMTP id 13so59351fxm.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Aug 2010 05:59:07 -0700 (PDT)
In-Reply-To: <1281480758.5887.33.camel@localhost>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

On Wed, Aug 11, 2010 at 12:52 AM, David Woodhouse <dwmw2@infradead.org>=
 wrote:
>
> Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
> ---
> =A0drivers/platform/x86/Kconfig =A0 =A0 =A0 =A0| =A0 =A07 +
> =A0drivers/platform/x86/Makefile =A0 =A0 =A0 | =A0 =A01 +
> =A0drivers/platform/x86/ideapad_acpi.c | =A0284 +++++++++++++++++++++=
++++++++++++++
> =A03 files changed, 292 insertions(+), 0 deletions(-)
> =A0create mode 100644 drivers/platform/x86/ideapad_acpi.c
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
> index 79baa63..044f430 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -219,6 +219,13 @@ config SONYPI_COMPAT
> =A0 =A0 =A0 =A0 =A0---help---
> =A0 =A0 =A0 =A0 =A0Build the sonypi driver compatibility code into th=
e sony-laptop driver.
>
> +config IDEAPAD_ACPI
> + =A0 =A0 =A0 tristate "Lenovo IdeaPad ACPI Laptop Extras"
> + =A0 =A0 =A0 depends on ACPI
> + =A0 =A0 =A0 depends on RFKILL
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 This is a driver for the rfkill switches on Lenovo =
IdeaPad netbooks.
> +

I'd suggest to name it ideapad-laptop (IDEAPAD_LAPTOP). We try to use
that name for laptop related drivers.
But ... new WMI drivers are named with the *-wmi suffix. So I'm not
really sure. Anyway, it's not really important.

> =A0config THINKPAD_ACPI
> =A0 =A0 =A0 =A0tristate "ThinkPad ACPI Laptop Extras"
> =A0 =A0 =A0 =A0depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Mak=
efile
> index 4744c77..85fb2b84 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_ACERHDF) =A0 =A0 =A0 =A0 +=3D acerhdf.=
o
> =A0obj-$(CONFIG_HP_WMI) =A0 =A0 =A0 =A0 =A0 +=3D hp-wmi.o
> =A0obj-$(CONFIG_TC1100_WMI) =A0 =A0 =A0 +=3D tc1100-wmi.o
> =A0obj-$(CONFIG_SONY_LAPTOP) =A0 =A0 =A0+=3D sony-laptop.o
> +obj-$(CONFIG_IDEAPAD_ACPI) =A0 =A0 +=3D ideapad_acpi.o
> =A0obj-$(CONFIG_THINKPAD_ACPI) =A0 =A0+=3D thinkpad_acpi.o
> =A0obj-$(CONFIG_FUJITSU_LAPTOP) =A0 +=3D fujitsu-laptop.o
> =A0obj-$(CONFIG_PANASONIC_LAPTOP) +=3D panasonic-laptop.o
> diff --git a/drivers/platform/x86/ideapad_acpi.c b/drivers/platform/x=
86/ideapad_acpi.c
> new file mode 100644
> index 0000000..26a29d4
> --- /dev/null
> +++ b/drivers/platform/x86/ideapad_acpi.c
> @@ -0,0 +1,284 @@
> +/*
> + * =A0ideapad_acpi.c - Lenovo IdeaPad ACPI Extras
> + *
> + * =A0Copyright =A9 2010 Intel Corporation
> + * =A0Copyright =A9 2010 David Woodhouse <dwmw2@infradead.org>
> + *
> + * =A0This program is free software; you can redistribute it and/or =
modify
> + * =A0it under the terms of the GNU General Public License as publis=
hed by
> + * =A0the Free Software Foundation; either version 2 of the License,=
 or
> + * =A0(at your option) any later version.
> + *
> + * =A0This program is distributed in the hope that it will be useful=
,
> + * =A0but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * =A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See th=
e
> + * =A0GNU General Public License for more details.
> + *
> + * =A0You should have received a copy of the GNU General Public Lice=
nse
> + * =A0along with this program; if not, write to the Free Software
> + * =A0Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> + * =A002110-1301, USA.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/types.h>
> +#include <acpi/acpi_bus.h>
> +#include <acpi/acpi_drivers.h>
> +#include <linux/rfkill.h>
> +
> +#define IDEAPAD_DEV_CAMERA =A0 =A0 0
> +#define IDEAPAD_DEV_WLAN =A0 =A0 =A0 1
> +#define IDEAPAD_DEV_BLUETOOTH =A02
> +#define IDEAPAD_DEV_3G =A0 =A0 =A0 =A0 3
> +#define IDEAPAD_DEV_KILLSW =A0 =A0 4

What's DEV_KILLSW ? a global kill switch ?

> +static struct rfkill *ideapad_rfkill[5];
> +
> +static const char *ideapad_rfk_names[] =3D {
> + =A0 =A0 =A0 "ideapad_camera", "ideapad_wlan", "ideapad_bluetooth", =
"ideapad_3g", "ideapad_rfkill"
> +};

Hum, ideapad_camera inside rfkill stuff ?

> +static const int ideapad_rfk_types[] =3D {
> + =A0 =A0 =A0 0, RFKILL_TYPE_WLAN, RFKILL_TYPE_BLUETOOTH, RFKILL_TYPE=
_WWAN, RFKILL_TYPE_WLAN
> +};
> +
> +static int ideapad_dev_exists(int device)
> +{
> + =A0 =A0 =A0 acpi_status status;
> + =A0 =A0 =A0 union acpi_object in_param;
> + =A0 =A0 =A0 struct acpi_object_list input =3D { 1, &in_param };
> + =A0 =A0 =A0 struct acpi_buffer output;
> + =A0 =A0 =A0 union acpi_object out_obj;
> +
> + =A0 =A0 =A0 output.length =3D sizeof(out_obj);
> + =A0 =A0 =A0 output.pointer =3D &out_obj;
> +
> + =A0 =A0 =A0 in_param.type =3D ACPI_TYPE_INTEGER;
> + =A0 =A0 =A0 in_param.integer.value =3D device + 1;
> +
> + =A0 =A0 =A0 status =3D acpi_evaluate_object(NULL, "\\_SB_.DECN", &i=
nput, &output);
> + =A0 =A0 =A0 if (ACPI_FAILURE(status)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "IdeaPAD \\_SB_.DEC=
N method failed %d. Is this an IdeaPAD?\n", status);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 if (out_obj.type !=3D ACPI_TYPE_INTEGER) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "IdeaPAD \\_SB_.DEC=
N method returned unexpected type\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 return out_obj.integer.value;
> +}
> +
> +static int ideapad_dev_get_state(int device)
> +{
> + =A0 =A0 =A0 acpi_status status;
> + =A0 =A0 =A0 union acpi_object in_param;
> + =A0 =A0 =A0 struct acpi_object_list input =3D { 1, &in_param };
> + =A0 =A0 =A0 struct acpi_buffer output;
> + =A0 =A0 =A0 union acpi_object out_obj;
> +
> + =A0 =A0 =A0 output.length =3D sizeof(out_obj);
> + =A0 =A0 =A0 output.pointer =3D &out_obj;
> +
> + =A0 =A0 =A0 in_param.type =3D ACPI_TYPE_INTEGER;
> + =A0 =A0 =A0 in_param.integer.value =3D device + 1;
> +
> + =A0 =A0 =A0 status =3D acpi_evaluate_object(NULL, "\\_SB_.GECN", &i=
nput, &output);
> + =A0 =A0 =A0 if (ACPI_FAILURE(status)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "IdeaPAD \\_SB_.GEC=
N method failed %d\n", status);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 if (out_obj.type !=3D ACPI_TYPE_INTEGER) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "IdeaPAD \\_SB_.GEC=
N method returned unexpected type\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 return out_obj.integer.value;
> +}
> +
> +static int ideapad_dev_set_state(int device, int state)
> +{
> + =A0 =A0 =A0 acpi_status status;
> + =A0 =A0 =A0 union acpi_object in_params[2];
> + =A0 =A0 =A0 struct acpi_object_list input =3D { 2, in_params };
> +
> + =A0 =A0 =A0 in_params[0].type =3D ACPI_TYPE_INTEGER;
> + =A0 =A0 =A0 in_params[0].integer.value =3D device + 1;
> + =A0 =A0 =A0 in_params[1].type =3D ACPI_TYPE_INTEGER;
> + =A0 =A0 =A0 in_params[1].integer.value =3D state;
> +
> + =A0 =A0 =A0 status =3D acpi_evaluate_object(NULL, "\\_SB_.SECN", &i=
nput, NULL);
> + =A0 =A0 =A0 if (ACPI_FAILURE(status)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "IdeaPAD \\_SB_.SEC=
N method failed %d\n", status);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 return 0;
> +}
> +static ssize_t show_ideapad_cam(struct device *dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
device_attribute *attr,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 char *b=
uf)
> +{
> + =A0 =A0 =A0 int state =3D ideapad_dev_get_state(IDEAPAD_DEV_CAMERA)=
;
> + =A0 =A0 =A0 if (state < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return state;
> +
> + =A0 =A0 =A0 return sprintf(buf, "%d\n", state);
> +}
> +
> +static ssize_t store_ideapad_cam(struct device *dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0stru=
ct device_attribute *attr,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cons=
t char *buf, size_t count)
> +{
> + =A0 =A0 =A0 int ret, state;
> +
> + =A0 =A0 =A0 if (!count)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 if (sscanf(buf, "%i", &state) !=3D 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 ret =3D ideapad_dev_set_state(IDEAPAD_DEV_CAMERA, state=
);

What does it do with values other than 1 and 0 ? maybe you could send
!!state instead

> + =A0 =A0 =A0 if (ret < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 return count;
> +}
> +
> +static DEVICE_ATTR(camera_power, 0644, show_ideapad_cam, store_ideap=
ad_cam);
> +
> +static int ideapad_rfk_set(void *data, bool blocked)
> +{
> + =A0 =A0 =A0 int device =3D (unsigned long)data;
> +
> + =A0 =A0 =A0 if (device =3D=3D IDEAPAD_DEV_KILLSW)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 return ideapad_dev_set_state(device, !blocked);
> +}
> +
> +static struct rfkill_ops ideapad_rfk_ops =3D {
> + =A0 =A0 =A0 .set_block =3D ideapad_rfk_set,
> +};
> +
> +static void ideapad_sync_rfk_state(void)
> +{
> + =A0 =A0 =A0 int hw_blocked =3D !ideapad_dev_get_state(IDEAPAD_DEV_K=
ILLSW);
> + =A0 =A0 =A0 int i;
> +
> + =A0 =A0 =A0 rfkill_set_hw_state(ideapad_rfkill[IDEAPAD_DEV_KILLSW],=
 hw_blocked);
> + =A0 =A0 =A0 for (i =3D IDEAPAD_DEV_WLAN; i < IDEAPAD_DEV_KILLSW; i+=
+)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ideapad_rfkill[i])
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rfkill_set_hw_state(ide=
apad_rfkill[i], hw_blocked);
> + =A0 =A0 =A0 if (hw_blocked)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 for (i =3D IDEAPAD_DEV_WLAN; i < IDEAPAD_DEV_KILLSW; i+=
+)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ideapad_rfkill[i])
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rfkill_set_sw_state(ide=
apad_rfkill[i], !ideapad_dev_get_state(i));
> +}
> +
> +static int __init ideapad_register_rfkill(struct acpi_device *device=
, int dev)
> +{
> + =A0 =A0 =A0 int ret;
> +
> + =A0 =A0 =A0 ideapad_rfkill[dev] =3D rfkill_alloc(ideapad_rfk_names[=
dev], &device->dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0ideapad_rfk_types[dev], &ideapad_rfk_ops,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0(void *)(long)dev);
> + =A0 =A0 =A0 if (!ideapad_rfkill[dev])
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> +
> + =A0 =A0 =A0 ret =3D rfkill_register(ideapad_rfkill[dev]);
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rfkill_destroy(ideapad_rfkill[dev]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static void __exit ideapad_unregister_rfkill(int dev)
> +{
> + =A0 =A0 =A0 if (!ideapad_rfkill[dev])
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 rfkill_unregister(ideapad_rfkill[dev]);
> + =A0 =A0 =A0 rfkill_destroy(ideapad_rfkill[dev]);
> +}
> +
> +static const struct acpi_device_id ideapad_device_ids[] =3D {
> + =A0 =A0 =A0 =A0{ "VPC2004", 0},
> + =A0 =A0 =A0 =A0{ "", 0},
> +};
> +MODULE_DEVICE_TABLE(acpi, ideapad_device_ids);
> +
> +static int ideapad_acpi_add(struct acpi_device *device)
> +{
> + =A0 =A0 =A0 int i;
> + =A0 =A0 =A0 int devs_present[5];
> +
> + =A0 =A0 =A0 for (i =3D IDEAPAD_DEV_CAMERA; i < IDEAPAD_DEV_KILLSW; =
i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 devs_present[i] =3D ideapad_dev_exists(=
i);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (devs_present[i] < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return devs_present[i];
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* The hardware switch is always present */
> + =A0 =A0 =A0 devs_present[IDEAPAD_DEV_KILLSW] =3D 1;
> +
> + =A0 =A0 =A0 if (devs_present[IDEAPAD_DEV_CAMERA]) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int ret =3D device_create_file(&device-=
>dev, &dev_attr_camera_power);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 for (i =3D IDEAPAD_DEV_WLAN; i <=3D IDEAPAD_DEV_KILLSW;=
 i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!devs_present[i])
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ideapad_register_rfkill(device, i);
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 ideapad_sync_rfk_state();
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int ideapad_acpi_remove(struct acpi_device *device, int type)
> +{
> + =A0 =A0 =A0 int i;
> + =A0 =A0 =A0 device_remove_file(&device->dev, &dev_attr_camera_power=
);
> + =A0 =A0 =A0 for (i =3D 0; i < 5; i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ideapad_unregister_rfkill(i);
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static void ideapad_acpi_notify(struct acpi_device *device, u32 even=
t)
> +{
> + =A0 =A0 =A0 ideapad_sync_rfk_state();
> +}
> +
> +static struct acpi_driver ideapad_acpi_driver =3D {
> + =A0 =A0 =A0 .name =3D "ideapad_acpi",
> + =A0 =A0 =A0 .class =3D "IdeaPad",
> + =A0 =A0 =A0 .ids =3D ideapad_device_ids,
> + =A0 =A0 =A0 .ops.add =3D ideapad_acpi_add,
> + =A0 =A0 =A0 .ops.remove =3D ideapad_acpi_remove,
> + =A0 =A0 =A0 .ops.notify =3D ideapad_acpi_notify,
> + =A0 =A0 =A0 .owner =3D THIS_MODULE,
> +};
> +
> +
> +static int __init ideapad_acpi_module_init(void)
> +{
> + =A0 =A0 =A0 acpi_bus_register_driver(&ideapad_acpi_driver);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +
> +static void ideapad_acpi_module_exit(void)
> +{
> + =A0 =A0 =A0 acpi_bus_unregister_driver(&ideapad_acpi_driver);
> +
> +}
> +/* Support only the S10-3 for now, until we verify other models */
> +MODULE_ALIAS("dmi:bvnLENOVO*:pnS10-3:*");
> +
> +MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
> +MODULE_DESCRIPTION("IdeaPad ACPI Extras");
> +MODULE_LICENSE("GPL");
> +
> +module_init(ideapad_acpi_module_init);
> +module_exit(ideapad_acpi_module_exit);
> --
> 1.7.2.1
>

Also, it would be great not to use the "there will only be one of
these device" anti-pattern.
Of course, it will work, but I think it's better to get a clean,
fully-reentrant driver.

--=20
Corentin Chary
http://xf.iksaif.net
