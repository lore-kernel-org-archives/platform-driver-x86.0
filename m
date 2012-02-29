From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v2] platform/x86: Add driver for Apple gmux device
Date: Wed, 29 Feb 2012 11:46:39 -0600
Message-ID: <CACxGe6sAcubJvc6LaVRxt+XzBz0jKpxSAPLdOvXkQz=NkXG5vQ@mail.gmail.com>
References: <1329424465-1211-1-git-send-email-seth.forshee@canonical.com> <1329921457-26887-1-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1329921457-26887-1-git-send-email-seth.forshee@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Feb 22, 2012 at 8:37 AM, Seth Forshee
<seth.forshee@canonical.com> wrote:
> Apple laptops with hybrid graphics have a device named gmux that
> controls the muxing of the LVDS panel between the GPUs as well as scr=
een
> brightness. This driver adds support for the gmux device. Only backli=
ght
> control is supported initially.
>
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>

Works for me.

Tested-by: Grant Likely <grant.likely@secretlab.ca>

Now I just need to figure out how to get the desktop backlight widget
to use gmux_backlight instead of acpi_video0...

g.

> ---
>
> This contains some minor updates to the previous submission. Changes =
in
> v2:
>
> =A0- Removed unused max_brightness field from struct apple_gmux_data
> =A0- Removed unused gmux_write32() function
> =A0- Mask off unused bits when reading brightness
> =A0- Use gmux_get_brightness() when initializing backlight device
> =A0 brightness field
> =A0- Fix some bad grammar in one of the comments.
>
> =A0drivers/platform/x86/Kconfig =A0 =A0 =A0| =A0 10 ++
> =A0drivers/platform/x86/Makefile =A0 =A0 | =A0 =A01 +
> =A0drivers/platform/x86/apple-gmux.c | =A0228 +++++++++++++++++++++++=
++++++++++++++
> =A03 files changed, 239 insertions(+), 0 deletions(-)
> =A0create mode 100644 drivers/platform/x86/apple-gmux.c
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
> index f995e6e..a2a9ede 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -779,4 +779,14 @@ config SAMSUNG_Q10
> =A0 =A0 =A0 =A0 =A0This driver provides support for backlight control=
 on Samsung Q10
> =A0 =A0 =A0 =A0 =A0and related laptops, including Dell Latitude X200.
>
> +config APPLE_GMUX
> + =A0 =A0 =A0 tristate "Apple Gmux Driver"
> + =A0 =A0 =A0 depends on PNP
> + =A0 =A0 =A0 select BACKLIGHT_CLASS_DEVICE
> + =A0 =A0 =A0 ---help---
> + =A0 =A0 =A0 =A0 This driver provides support for the gmux device fo=
und on many
> + =A0 =A0 =A0 =A0 Apple laptops, which controls the display mux for t=
he hybrid
> + =A0 =A0 =A0 =A0 graphics as well as the backlight. Currently only b=
acklight
> + =A0 =A0 =A0 =A0 control is supported by the driver.
> +
> =A0endif # X86_PLATFORM_DEVICES
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Mak=
efile
> index 293a320..a49c891 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -45,3 +45,4 @@ obj-$(CONFIG_MXM_WMI) =A0 =A0 =A0 =A0 +=3D mxm-wmi.=
o
> =A0obj-$(CONFIG_INTEL_MID_POWER_BUTTON) =A0 +=3D intel_mid_powerbtn.o
> =A0obj-$(CONFIG_INTEL_OAKTRAIL) =A0 +=3D intel_oaktrail.o
> =A0obj-$(CONFIG_SAMSUNG_Q10) =A0 =A0 =A0+=3D samsung-q10.o
> +obj-$(CONFIG_APPLE_GMUX) =A0 =A0 =A0 +=3D apple-gmux.o
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86=
/apple-gmux.c
> new file mode 100644
> index 0000000..efc1fa9
> --- /dev/null
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -0,0 +1,228 @@
> +/*
> + * =A0Gmux driver for Apple laptops
> + *
> + * =A0Copyright (C) Canonical Ltd. <seth.forshee@canonical.com>
> + *
> + * =A0This program is free software; you can redistribute it and/or =
modify
> + * =A0it under the terms of the GNU General Public License version 2=
 as
> + * =A0published by the Free Software Foundation.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/backlight.h>
> +#include <linux/acpi.h>
> +#include <linux/pnp.h>
> +
> +struct apple_gmux_data {
> + =A0 =A0 =A0 unsigned long iostart;
> + =A0 =A0 =A0 unsigned long iolen;
> +
> + =A0 =A0 =A0 struct backlight_device *bdev;
> +};
> +
> +/*
> + * gmux port offsets. Many of these are not yet used, but may be in =
the
> + * future, and it's useful to have them documented here anyhow.
> + */
> +#define GMUX_PORT_VERSION_MAJOR =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x04
> +#define GMUX_PORT_VERSION_MINOR =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x05
> +#define GMUX_PORT_VERSION_RELEASE =A0 =A0 =A00x06
> +#define GMUX_PORT_SWITCH_DISPLAY =A0 =A0 =A0 0x10
> +#define GMUX_PORT_SWITCH_GET_DISPLAY =A0 0x11
> +#define GMUX_PORT_INTERRUPT_ENABLE =A0 =A0 0x14
> +#define GMUX_PORT_INTERRUPT_STATUS =A0 =A0 0x16
> +#define GMUX_PORT_SWITCH_DDC =A0 =A0 =A0 =A0 =A0 0x28
> +#define GMUX_PORT_SWITCH_EXTERNAL =A0 =A0 =A00x40
> +#define GMUX_PORT_SWITCH_GET_EXTERNAL =A00x41
> +#define GMUX_PORT_DISCRETE_POWER =A0 =A0 =A0 0x50
> +#define GMUX_PORT_MAX_BRIGHTNESS =A0 =A0 =A0 0x70
> +#define GMUX_PORT_BRIGHTNESS =A0 =A0 =A0 =A0 =A0 0x74
> +
> +#define GMUX_MIN_IO_LEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(GMUX_PORT_BRIGHTNESS + 4)
> +
> +#define GMUX_INTERRUPT_ENABLE =A0 =A0 =A0 =A0 =A00xff
> +#define GMUX_INTERRUPT_DISABLE =A0 =A0 =A0 =A0 0x00
> +
> +#define GMUX_INTERRUPT_STATUS_ACTIVE =A0 0
> +#define GMUX_INTERRUPT_STATUS_DISPLAY =A0(1 << 0)
> +#define GMUX_INTERRUPT_STATUS_POWER =A0 =A0(1 << 2)
> +#define GMUX_INTERRUPT_STATUS_HOTPLUG =A0(1 << 3)
> +
> +#define GMUX_BRIGHTNESS_MASK =A0 =A0 =A0 =A0 =A0 0x00ffffff
> +#define GMUX_MAX_BRIGHTNESS =A0 =A0 =A0 =A0 =A0 =A0GMUX_BRIGHTNESS_M=
ASK
> +
> +static inline u8 gmux_read8(struct apple_gmux_data *gmux_data, int p=
ort)
> +{
> + =A0 =A0 =A0 return inb(gmux_data->iostart + port);
> +}
> +
> +static inline void gmux_write8(struct apple_gmux_data *gmux_data, in=
t port,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0u8 val)
> +{
> + =A0 =A0 =A0 outb(val, gmux_data->iostart + port);
> +}
> +
> +static inline u32 gmux_read32(struct apple_gmux_data *gmux_data, int=
 port)
> +{
> + =A0 =A0 =A0 return inl(gmux_data->iostart + port);
> +}
> +
> +static int gmux_get_brightness(struct backlight_device *bd)
> +{
> + =A0 =A0 =A0 struct apple_gmux_data *gmux_data =3D bl_get_data(bd);
> + =A0 =A0 =A0 return gmux_read32(gmux_data, GMUX_PORT_BRIGHTNESS) &
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0GMUX_BRIGHTNESS_MASK;
> +}
> +
> +static int gmux_update_status(struct backlight_device *bd)
> +{
> + =A0 =A0 =A0 struct apple_gmux_data *gmux_data =3D bl_get_data(bd);
> + =A0 =A0 =A0 u32 brightness =3D bd->props.brightness;
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Older gmux versions require writing out lower byte=
s first then
> + =A0 =A0 =A0 =A0* setting the upper byte to 0 to flush the values. N=
ewer versions
> + =A0 =A0 =A0 =A0* accept a single u32 write, but the old method also=
 works, so we
> + =A0 =A0 =A0 =A0* just use the old method for all gmux versions.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 gmux_write8(gmux_data, GMUX_PORT_BRIGHTNESS, brightness=
);
> + =A0 =A0 =A0 gmux_write8(gmux_data, GMUX_PORT_BRIGHTNESS + 1, bright=
ness >> 8);
> + =A0 =A0 =A0 gmux_write8(gmux_data, GMUX_PORT_BRIGHTNESS + 2, bright=
ness >> 16);
> + =A0 =A0 =A0 gmux_write8(gmux_data, GMUX_PORT_BRIGHTNESS + 3, 0);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static const struct backlight_ops gmux_bl_ops =3D {
> + =A0 =A0 =A0 .get_brightness =3D gmux_get_brightness,
> + =A0 =A0 =A0 .update_status =3D gmux_update_status,
> +};
> +
> +static int __devinit gmux_probe(struct pnp_dev *pnp,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const s=
truct pnp_device_id *id)
> +{
> + =A0 =A0 =A0 struct apple_gmux_data *gmux_data;
> + =A0 =A0 =A0 struct resource *res;
> + =A0 =A0 =A0 struct backlight_properties props;
> + =A0 =A0 =A0 struct backlight_device *bdev;
> + =A0 =A0 =A0 u8 ver_major, ver_minor, ver_release;
> + =A0 =A0 =A0 int ret =3D -ENXIO;
> +
> + =A0 =A0 =A0 gmux_data =3D kzalloc(sizeof(*gmux_data), GFP_KERNEL);
> + =A0 =A0 =A0 if (!gmux_data)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> + =A0 =A0 =A0 pnp_set_drvdata(pnp, gmux_data);
> +
> + =A0 =A0 =A0 res =3D pnp_get_resource(pnp, IORESOURCE_IO, 0);
> + =A0 =A0 =A0 if (!res) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("Failed to find gmux I/O resourc=
e\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_free;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 gmux_data->iostart =3D res->start;
> + =A0 =A0 =A0 gmux_data->iolen =3D res->end - res->start;
> +
> + =A0 =A0 =A0 if (gmux_data->iolen < GMUX_MIN_IO_LEN) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("gmux I/O region too small (%lu =
< %u)\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gmux_data->iolen, GMUX_M=
IN_IO_LEN);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_free;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (!request_region(gmux_data->iostart, gmux_data->iole=
n,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Apple gmux")) =
{
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("gmux I/O already in use\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_free;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* On some machines the gmux is in ACPI even thought =
the machine
> + =A0 =A0 =A0 =A0* doesn't really have a gmux. Check for invalid vers=
ion information
> + =A0 =A0 =A0 =A0* to detect this.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 ver_major =3D gmux_read8(gmux_data, GMUX_PORT_VERSION_M=
AJOR);
> + =A0 =A0 =A0 ver_minor =3D gmux_read8(gmux_data, GMUX_PORT_VERSION_M=
INOR);
> + =A0 =A0 =A0 ver_release =3D gmux_read8(gmux_data, GMUX_PORT_VERSION=
_RELEASE);
> + =A0 =A0 =A0 if (ver_major =3D=3D 0xff && ver_minor =3D=3D 0xff && v=
er_release =3D=3D 0xff) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_info("gmux device not present\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENODEV;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_release;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 pr_info("Found gmux version %d.%d.%d\n", ver_major, ver=
_minor,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ver_release);
> +
> + =A0 =A0 =A0 memset(&props, 0, sizeof(props));
> + =A0 =A0 =A0 props.type =3D BACKLIGHT_PLATFORM;
> + =A0 =A0 =A0 props.max_brightness =3D gmux_read32(gmux_data, GMUX_PO=
RT_MAX_BRIGHTNESS);
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Currently it's assumed that the maximum brightness=
 is less than
> + =A0 =A0 =A0 =A0* 2^24 for compatibility with old gmux versions. Cap=
 the max
> + =A0 =A0 =A0 =A0* brightness at this value, but print a warning if t=
he hardware
> + =A0 =A0 =A0 =A0* reports something higher so that it can be fixed.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (WARN_ON(props.max_brightness > GMUX_MAX_BRIGHTNESS)=
)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 props.max_brightness =3D GMUX_MAX_BRIGH=
TNESS;
> +
> + =A0 =A0 =A0 bdev =3D backlight_device_register("gmux_backlight", &p=
np->dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0gmux_data, &gmux_bl_ops, &props);
> + =A0 =A0 =A0 if (IS_ERR(bdev)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(bdev);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_release;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 gmux_data->bdev =3D bdev;
> + =A0 =A0 =A0 bdev->props.brightness =3D gmux_get_brightness(bdev);
> + =A0 =A0 =A0 backlight_update_status(bdev);
> +
> + =A0 =A0 =A0 return 0;
> +
> +err_release:
> + =A0 =A0 =A0 release_region(gmux_data->iostart, gmux_data->iolen);
> +err_free:
> + =A0 =A0 =A0 kfree(gmux_data);
> + =A0 =A0 =A0 return ret;
> +}
> +
> +static void __devexit gmux_remove(struct pnp_dev *pnp)
> +{
> + =A0 =A0 =A0 struct apple_gmux_data *gmux_data =3D pnp_get_drvdata(p=
np);
> +
> + =A0 =A0 =A0 backlight_device_unregister(gmux_data->bdev);
> + =A0 =A0 =A0 release_region(gmux_data->iostart, gmux_data->iolen);
> + =A0 =A0 =A0 kfree(gmux_data);
> +}
> +
> +static const struct pnp_device_id gmux_device_ids[] =3D {
> + =A0 =A0 =A0 {"APP000B", 0},
> + =A0 =A0 =A0 {"", 0}
> +};
> +
> +static struct pnp_driver gmux_pnp_driver =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "apple-gmux",
> + =A0 =A0 =A0 .probe =A0 =A0 =A0 =A0 =A0=3D gmux_probe,
> + =A0 =A0 =A0 .remove =A0 =A0 =A0 =A0 =3D __devexit_p(gmux_remove),
> + =A0 =A0 =A0 .id_table =A0 =A0 =A0 =3D gmux_device_ids,
> +};
> +
> +static int __init apple_gmux_init(void)
> +{
> + =A0 =A0 =A0 return pnp_register_driver(&gmux_pnp_driver);
> +}
> +
> +static void __exit apple_gmux_exit(void)
> +{
> + =A0 =A0 =A0 pnp_unregister_driver(&gmux_pnp_driver);
> +}
> +
> +module_init(apple_gmux_init);
> +module_exit(apple_gmux_exit);
> +
> +MODULE_AUTHOR("Seth Forshee <seth.forshee@canonical.com>");
> +MODULE_DESCRIPTION("Apple Gmux Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_DEVICE_TABLE(pnp, gmux_device_ids);
> --
> 1.7.9
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
