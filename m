From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH V2] platform-driver-x86: ACPI EC Extra driver for Oaktrail
Date: Fri, 7 Jan 2011 09:56:11 +0100
Message-ID: <AANLkTik=x-OTWGzRB2BgB1u748EDM=B3nsGpWbR8D-C5@mail.gmail.com>
References: <20110106025949.GJ9496@kai-debian>
	<20110107074115.GH30215@kai-debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:58327 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753025Ab1AGI4N convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 7 Jan 2011 03:56:13 -0500
In-Reply-To: <20110107074115.GH30215@kai-debian>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Yin Kangkai <kangkai.yin@linux.intel.com>
Cc: platform-driver-x86 <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org, "Wang, Yong Y" <yong.y.wang@intel.com>, "Liu, Bing Wei" <bing.wei.liu@intel.com>, Matthew Garrett <mjg@redhat.com>

On Fri, Jan 7, 2011 at 8:41 AM, Yin Kangkai <kangkai.yin@linux.intel.co=
m> wrote:
> Patch V2
> Changes from V1:
> =C2=A0- remove wifi, bt, gps, wwan from /sys/devices/platform.
> =C2=A0- add some helper function for rfkill alloc and rfkill cleanup.
> =C2=A0- add MODULE_ALIAS.
> =C2=A0- add Documentation/ABI/testing/sysfs-platform-intel-oaktrail
> =C2=A0- various other minor changes.
> =C2=A0- bump driver version from 0.1 to 0.2
>
> Thanks Corentin Chary and Joey Lee for the review.
>
> From ab28d41e89b40e0ab1d73489b7d1a9f6e745c14a Mon Sep 17 00:00:00 200=
1
> From: Yin Kangkai <kangkai.yin@intel.com>
> Date: Wed, 22 Dec 2010 10:53:36 +0800
> Subject: [PATCH] platform-driver-x86: ACPI EC Extra driver for Oaktra=
il
>
> This driver implements an Extra ACPI EC driver for products based on =
Intel
> Oaktrail platform. =C2=A0It is programming the EC space, through exis=
ting ACPI EC
> driver, to provide user space layer the sysfs and rfkill interfaces t=
o
> enable/disable the Camera, Bluetooth, GPS, WiFi, 3G, and to show the =
status of
> Touchscreen.
>
> Signed-off-by: Yin Kangkai <kangkai.yin@intel.com>
> ---
> =C2=A0.../ABI/testing/sysfs-platform-intel-oaktrail =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 13 +
> =C2=A0drivers/platform/x86/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A09 +
> =C2=A0drivers/platform/x86/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
> =C2=A0drivers/platform/x86/intel_oaktrail.c =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0347 ++++++++++++++++++++
> =C2=A04 files changed, 370 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 Documentation/ABI/testing/sysfs-platform-int=
el-oaktrail
> =C2=A0create mode 100644 drivers/platform/x86/intel_oaktrail.c
>
> diff --git a/Documentation/ABI/testing/sysfs-platform-intel-oaktrail =
b/Documentation/ABI/testing/sysfs-platform-intel-oaktrail
> new file mode 100644
> index 0000000..0512235
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-intel-oaktrail
> @@ -0,0 +1,13 @@
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/intel_=
oaktrail/camera
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Jan 2011
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Yin Kangkai" <kangkai.yin@intel.com>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Control the camera=
=2E 1 means on, 0 means off.
> +
> +What: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/sys/devices/platform/intel_=
oaktrail/touchscreen
> +Date: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Jan 2011
> +KernelVersion: 2.6.37
> +Contact: =C2=A0 =C2=A0 =C2=A0 "Yin Kangkai" <kangkai.yin@intel.com>
> +Description:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Show the status of=
 the touch screen. 1 means on, 0 means off.
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
> index 2b4038a..d1f6981 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -655,4 +655,13 @@ config XO1_RFKILL
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Support for enabling/disabling the =
WLAN interface on the OLPC XO-1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0laptop.
>
> +config INTEL_OAKTRAIL
> + =C2=A0 =C2=A0 =C2=A0 tristate "Intel Oaktrail Platform Extras"
> + =C2=A0 =C2=A0 =C2=A0 depends on ACPI
> + =C2=A0 =C2=A0 =C2=A0 depends on RFKILL
> + =C2=A0 =C2=A0 =C2=A0 ---help---
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Intel Oaktrail platform need this drive=
r to provide interfaces to
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable/disable the Camera, WiFi, BT etc=
=2E devices. If in doubt, say Y
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 here; it will only load on supported pl=
atforms.
> +
> =C2=A0endif # X86_PLATFORM_DEVICES
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Mak=
efile
> index 7ff60e6..add8ab7 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -35,3 +35,4 @@ obj-$(CONFIG_INTEL_IPS) =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 +=3D intel_ips.o
> =C2=A0obj-$(CONFIG_GPIO_INTEL_PMIC) =C2=A0+=3D intel_pmic_gpio.o
> =C2=A0obj-$(CONFIG_XO1_RFKILL) =C2=A0 =C2=A0 =C2=A0 +=3D xo1-rfkill.o
> =C2=A0obj-$(CONFIG_IBM_RTL) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D ib=
m_rtl.o
> +obj-$(CONFIG_INTEL_OAKTRAIL) =C2=A0 +=3D intel_oaktrail.o
> diff --git a/drivers/platform/x86/intel_oaktrail.c b/drivers/platform=
/x86/intel_oaktrail.c
> new file mode 100644
> index 0000000..9ec71c5
> --- /dev/null
> +++ b/drivers/platform/x86/intel_oaktrail.c
> @@ -0,0 +1,347 @@
> +/*
> + =C2=A0Copyright (C) 2010 Intel Corporation
> + =C2=A0Author: Yin Kangkai (kangkai.yin@intel.com)
> +
> + =C2=A0based on Compal driver
> +
> + =C2=A0Copyright (C) 2008 Cezary Jackiewicz <cezary.jackiewicz (at) =
gmail.com>
> +
> + =C2=A0based on MSI driver
> +
> + =C2=A0Copyright (C) 2006 Lennart Poettering <mzxreary (at) 0pointer=
 (dot) de>
> +
> + =C2=A0This program is free software; you can redistribute it and/or=
 modify
> + =C2=A0it under the terms of the GNU General Public License as publi=
shed by
> + =C2=A0the Free Software Foundation; either version 2 of the License=
, or
> + =C2=A0(at your option) any later version.
> +
> + =C2=A0This program is distributed in the hope that it will be usefu=
l, but
> + =C2=A0WITHOUT ANY WARRANTY; without even the implied warranty of
> + =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the =
GNU
> + =C2=A0General Public License for more details.
> +
> + =C2=A0You should have received a copy of the GNU General Public Lic=
ense
> + =C2=A0along with this program; if not, write to the Free Software
> + =C2=A0Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> + =C2=A002110-1301, USA.
> + */
> +
> +/*
> + * intel_oaktrail.c - Intel OakTrail Platform support.
> + *
> + * This driver exports a few files in /sys/devices/platform/intel_oa=
ktrail/:
> + *
> + * camera - Camera subsystem enabled: contains either 0 or 1. (rw)
> + * touchscreen - Touchscreen subsystem enabled: contains either 0 or=
 1. (ro)
> + *
> + * In addition to these platform device attributes, the driver regis=
ters itself
> + * in the Linux rfkill subsystem for these components:
> + *
> + * wifi
> + * bluetooth
> + * wwan (3g)
> + * gps
> + *
> + * and is available to userspace under /sys/class/rfkill/rfkillX/
> + *
> + * This driver might work on other products based on Oaktrail. If yo=
u
> + * want to try it you can pass force=3D1 as argument to the module w=
hich
> + * will force it to load even when the DMI data doesn't identify the
> + * product as compatible.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/acpi.h>
> +#include <linux/platform_device.h>
> +#include <linux/dmi.h>
> +#include <linux/rfkill.h>
> +
> +#define DRIVER_NAME =C2=A0 =C2=A0"intel_oaktrail"
> +#define DRIVER_VERSION "0.2"
> +
> +/*
> + * This is the devices status address in EC space, and the control b=
its
> + * definition:
> + *
> + * (1 << 0): =C2=A0 Camera enable/disable, RW.
> + * (1 << 1): =C2=A0 Bluetooth enable/disable, RW.
> + * (1 << 2): =C2=A0 GPS enable/disable, RW.
> + * (1 << 3): =C2=A0 WiFi enable/disable, RW.
> + * (1 << 4): =C2=A0 WWAN (3G) enable/disalbe, RW.
> + * (1 << 5): =C2=A0 Touchscreen enable/disable, Read Only.
> + */
> +#define OT_EC_DEVICE_STATE_ADDRESS =C2=A0 =C2=A0 0xD6
> +
> +#define OT_EC_CAMERA_MASK =C2=A0 =C2=A0 =C2=A0(1 << 0)
> +#define OT_EC_BT_MASK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 << 1)
> +#define OT_EC_GPS_MASK =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 << 2)
> +#define OT_EC_WIFI_MASK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(1 << 3)
> +#define OT_EC_WWAN_MASK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(1 << 4)
> +#define OT_EC_TS_MASK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 << 5)
> +
> +static int force;
> +module_param(force, bool, 0);
> +MODULE_PARM_DESC(force, "Force driver load, ignore DMI data");
> +
> +static struct platform_device *oaktrail_device;
> +static struct rfkill *bt_rfkill;
> +static struct rfkill *gps_rfkill;
> +static struct rfkill *wifi_rfkill;
> +static struct rfkill *wwan_rfkill;
> +
> +#define SIMPLE_MASKED_STORE_SHOW(NAME, MASK) =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> +static ssize_t NAME##_show(struct device *dev, =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr, char *buf) =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
\
> +{ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 u8 value; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 ec_read(OT_EC_DEVICE_STATE_ADDRESS, &value); =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 return sprintf(buf, "%d\n", ((value & MASK) !=3D=
 0)); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> +} =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> +static ssize_t NAME##_store(struct device *dev, =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr, const char *buf=
, size_t count) =C2=A0 \
> +{ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 int state; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 u8 old_val; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \
> + =C2=A0 =C2=A0 =C2=A0 ec_read(OT_EC_DEVICE_STATE_ADDRESS, &old_val);=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 if (sscanf(buf, "%d", &state) !=3D 1 || (state=
 < 0 || state > 1)) \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 ec_write(OT_EC_DEVICE_STATE_ADDRESS, state ? =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(old_val | M=
ASK) : (old_val & ~MASK)); =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 return count; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> +}
> +
> +SIMPLE_MASKED_STORE_SHOW(camera, OT_EC_CAMERA_MASK)
> +SIMPLE_MASKED_STORE_SHOW(touchscreen, OT_EC_TS_MASK)
> +
> +static DEVICE_ATTR(camera, 0644, camera_show, camera_store);
> +static DEVICE_ATTR(touchscreen, 0444, touchscreen_show, NULL);
> +
> +static struct attribute *oaktrail_attributes[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_camera.attr,
> + =C2=A0 =C2=A0 =C2=A0 &dev_attr_touchscreen.attr,
> + =C2=A0 =C2=A0 =C2=A0 NULL
> +};
> +
> +static struct attribute_group oaktrail_attribute_group =3D {
> + =C2=A0 =C2=A0 =C2=A0 .attrs =3D oaktrail_attributes
> +};
> +
> +static int oaktrail_rfkill_set(void *data, bool blocked)
> +{
> + =C2=A0 =C2=A0 =C2=A0 u8 value;
> + =C2=A0 =C2=A0 =C2=A0 u8 result;
> + =C2=A0 =C2=A0 =C2=A0 unsigned long radio =3D (unsigned long) data;
> +
> + =C2=A0 =C2=A0 =C2=A0 ec_read(OT_EC_DEVICE_STATE_ADDRESS, &result);
> +
> + =C2=A0 =C2=A0 =C2=A0 if (!blocked)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D (u8) (re=
sult | radio);
> + =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D (u8) (re=
sult & ~radio);
> +
> + =C2=A0 =C2=A0 =C2=A0 ec_write(OT_EC_DEVICE_STATE_ADDRESS, value);
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static const struct rfkill_ops oaktrail_rfkill_ops =3D {
> + =C2=A0 =C2=A0 =C2=A0 .set_block =3D oaktrail_rfkill_set,
> +};
> +
> +static struct rfkill *oaktrail_rfkill_new(char *name, enum rfkill_ty=
pe type,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
unsigned long mask)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int err;
> + =C2=A0 =C2=A0 =C2=A0 struct rfkill *rfkill_dev;
> +
> + =C2=A0 =C2=A0 =C2=A0 rfkill_dev =3D rfkill_alloc(name, &oaktrail_de=
vice->dev, type,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &oaktrail_rfkill_ops, (void =
*)mask);
> + =C2=A0 =C2=A0 =C2=A0 if (!rfkill_dev)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ERR_PTR(-EN=
OMEM);
> +
> + =C2=A0 =C2=A0 =C2=A0 err =3D rfkill_register(rfkill_dev);

Maybe you should add a rfkill_init_sw_state() call here, to be sure
that the rfkill initial state is right.

> + =C2=A0 =C2=A0 =C2=A0 if (err) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rfkill_destroy(rfk=
ill_dev);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ERR_PTR(err=
);
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 return rfkill_dev;
> +}
> +
> +static inline void _oaktrail_rfkill_cleanup(struct rfkill *rf)

I don't know if the coding style allow _ function prefix, I used to
believe it did
not, but I checked Documentation/CodingStyle, and I found nothing about=
 that,
so it's probably ok.

> +{
> + =C2=A0 =C2=A0 =C2=A0 if (rf) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rfkill_unregister(=
rf);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rfkill_destroy(rf)=
;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 return;

We don't need that return

> +}
> +
> +static void oaktrail_rfkill_cleanup(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 _oaktrail_rfkill_cleanup(wifi_rfkill);
> + =C2=A0 =C2=A0 =C2=A0 _oaktrail_rfkill_cleanup(bt_rfkill);
> + =C2=A0 =C2=A0 =C2=A0 _oaktrail_rfkill_cleanup(gps_rfkill);
> + =C2=A0 =C2=A0 =C2=A0 _oaktrail_rfkill_cleanup(wwan_rfkill);
> +
> + =C2=A0 =C2=A0 =C2=A0 return;

And that one

> +}
> +
> +static int oaktrail_rfkill_init(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int ret;
> +
> + =C2=A0 =C2=A0 =C2=A0 wifi_rfkill =3D oaktrail_rfkill_new("oaktrail-=
wifi",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
RFKILL_TYPE_WLAN,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
OT_EC_WIFI_MASK);
> + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(wifi_rfkill)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D PTR_ERR(wi=
fi_rfkill);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wifi_rfkill =3D NU=
LL;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 bt_rfkill =3D oaktrail_rfkill_new("oaktrail-bl=
uetooth",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RFKILL_=
TYPE_BLUETOOTH,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OT_EC_B=
T_MASK);
> + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(bt_rfkill)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D PTR_ERR(bt=
_rfkill);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bt_rfkill =3D NULL=
;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 gps_rfkill =3D oaktrail_rfkill_new("oaktrail-g=
ps",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0R=
=46KILL_TYPE_GPS,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O=
T_EC_GPS_MASK);
> + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(gps_rfkill)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D PTR_ERR(gp=
s_rfkill);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gps_rfkill =3D NUL=
L;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 wwan_rfkill =3D oaktrail_rfkill_new("oaktrail-=
wwan",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
RFKILL_TYPE_WWAN,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
OT_EC_WWAN_MASK);
> + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(wwan_rfkill)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D PTR_ERR(ww=
an_rfkill);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wwan_rfkill =3D NU=
LL;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +
> +cleanup:
> + =C2=A0 =C2=A0 =C2=A0 oaktrail_rfkill_cleanup();
> + =C2=A0 =C2=A0 =C2=A0 return ret;
> +}
> +
> +static int __devinit oaktrail_probe(struct platform_device *pdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return sysfs_create_group(&pdev->dev.kobj, &oa=
ktrail_attribute_group);
> +}
> +
> +static int __devexit oaktrail_remove(struct platform_device *pdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 sysfs_remove_group(&pdev->dev.kobj, &oaktrail_=
attribute_group);
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static struct platform_driver oaktrail_driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 .driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D DRIVER_N=
AME,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =3D THIS_MO=
DULE,
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 .probe =C2=A0=3D oaktrail_probe,
> + =C2=A0 =C2=A0 =C2=A0 .remove =3D __devexit_p(oaktrail_remove)
> +};
> +
> +static int dmi_check_cb(const struct dmi_system_id *id)
> +{
> + =C2=A0 =C2=A0 =C2=A0 pr_info("Identified model '%s'\n", id->ident);
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static struct dmi_system_id __initdata oaktrail_dmi_table[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ident =3D "OakTra=
il platform",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .matches =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 DMI_MATCH(DMI_PRODUCT_NAME, "OakTrail platform"),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .callback =3D dmi_=
check_cb
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 { }
> +};
> +
> +static int __init oaktrail_init(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int ret;
> +
> + =C2=A0 =C2=A0 =C2=A0 if (acpi_disabled) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("ACPI needs=
 to be enabled for this driver to work!\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 if (!force && !dmi_check_system(oaktrail_dmi_t=
able)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("Platform n=
ot recognized (You could try the module's force-parameter)");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 ret =3D platform_driver_register(&oaktrail_dri=
ver);
> + =C2=A0 =C2=A0 =C2=A0 if (ret) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_warning("Unable=
 to register platform driver\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_driver_re=
g;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 oaktrail_device =3D platform_device_alloc(DRIV=
ER_NAME, -1);
> + =C2=A0 =C2=A0 =C2=A0 if (!oaktrail_device) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_warning("Unable=
 to allocate platform device\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENOMEM;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_device_al=
loc;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 ret =3D platform_device_add(oaktrail_device);
> + =C2=A0 =C2=A0 =C2=A0 if (ret) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_warning("Unable=
 to add platform device\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_device_ad=
d;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 ret =3D oaktrail_rfkill_init();
> + =C2=A0 =C2=A0 =C2=A0 if (ret) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_warning("Setup =
rfkill failed\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_rfkill;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 pr_info("Driver "DRIVER_VERSION" successfully =
loaded\n");
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +
> +err_rfkill:
> + =C2=A0 =C2=A0 =C2=A0 platform_device_del(oaktrail_device);
> +err_device_add:
> + =C2=A0 =C2=A0 =C2=A0 platform_device_put(oaktrail_device);
> +err_device_alloc:
> + =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&oaktrail_driver);
> +err_driver_reg:
> + =C2=A0 =C2=A0 =C2=A0 return ret;
> +}
> +
> +static void __exit oaktrail_cleanup(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 platform_device_unregister(oaktrail_device);
> + =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&oaktrail_driver);
> + =C2=A0 =C2=A0 =C2=A0 oaktrail_rfkill_cleanup();
> +
> + =C2=A0 =C2=A0 =C2=A0 pr_info("Driver unloaded\n");
> +}
> +
> +module_init(oaktrail_init);
> +module_exit(oaktrail_cleanup);
> +
> +MODULE_AUTHOR("Yin Kangkai (kangkai.yin@intel.com)");
> +MODULE_DESCRIPTION("Intel Oaktrail Platform ACPI Extras");
> +MODULE_VERSION(DRIVER_VERSION);
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("dmi:*:svnIntelCorporation:pnOakTrailplatform:*");
> --
> 1.6.5
>
>

--=20
Corentin Chary
http://xf.iksaif.net
