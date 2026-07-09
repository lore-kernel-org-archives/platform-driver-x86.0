Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B563FBB69;
	Thu,  9 Jul 2026 10:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592751; cv=none; b=jZcGaFp8aLu6+WttfrG2j5WtsHvknjtFXo5bjV1oijy2Htq4NOQVU7osqdA58N6IoeczKbPKY2TpBjxgPBVuHiGJJ4hU5T0gj5ycwdHLCbqVfAVDDGzx9LKfIzMmqq8YVkOkqZUNAwzJCm6G4BQfdxJ6cFMZ/W0j6NkcJBV1W9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592751; c=relaxed/simple;
	bh=MIFUmtK6EwnZ85WaFY+cRPqa9+Vd1kHaUW8b8QequPg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IjHPEOYVsa+T1eoZlCbJG8y1/8Ewtm6+rCk28rreKtOXlPXOGfsUnlMysnX7P5VN3ou9qo8U6Adt64ygekXosiBJHUaQLsyfcI0et1Wga81RN+8G1dk6QkyBz0KSU+4iuBoitJQJaPTHEFFlWXF3ZleBrfT4XNb05sFEQ+MvFPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSHSAML6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSHSAML6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783592749; x=1815128749;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=MIFUmtK6EwnZ85WaFY+cRPqa9+Vd1kHaUW8b8QequPg=;
  b=mSHSAML6sdWdFCoWZ1BAxW23LNZwi9+MklAj2akzWr4mWy54H/81lsYs
   5m1nx33+KcumtZCg3HCu2V2Wo47OLVbhuE4mmOxeNTQljZl/ecV6Zl+Re
   Mkl+iF4XzQksyGO4XG8jr/nYcyjZh6W+h/wPk/9MZHBvSJ+8+qGUyTKPx
   K74z5rEP3635GgEd49e/jpmf4CGbe7fKjtKzDs5fm2Iq4G3phlRhZxZYz
   jQLZvJgBw4S7bHGmW/D2+S2ruNucorC96NQz4iTsQsMPZ+bQcWc2X2GqX
   q2V4GQCd2r6jRbqfiVjN9qT0MCMbm9Voh2mH4jOvH/JlmF6cLHD/IV+nu
   w==;
X-CSE-ConnectionGUID: aAeGpmR5SO2UwyypPzY53Q==
X-CSE-MsgGUID: zD39RM1gT/6js47Rp3wWRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94622502"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94622502"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:25:48 -0700
X-CSE-ConnectionGUID: chpV5krfSS22wVSgU/eEtQ==
X-CSE-MsgGUID: a5aa2lZuQMudJGpmy9uqlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252797284"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:25:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 9 Jul 2026 13:25:42 +0300 (EEST)
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
cc: Hans de Goede <hansg@kernel.org>, 
    "Mario Limonciello (AMD)" <superm1@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v8] platform/x86/amd: Introduce Halo Box RGB LED driver
In-Reply-To: <20260709-halo-leds-v2-plus-v8-1-b34c64277193@amd.com>
Message-ID: <399d5a32-2af4-9cc3-8372-cd39a86952aa@linux.intel.com>
References: <20260709-halo-leds-v2-plus-v8-1-b34c64277193@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-682161429-1783592742=:1261"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-682161429-1783592742=:1261
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 9 Jul 2026, Yo-Jung Leo Lin (AMD) wrote:

> The Halo Box features an RGB LED light bar that can be controlled
> through WMI methods to display any color combination.
>=20
> The driver exposes the LED through the LED multicolor subsystem,
> allowing userspace to control RGB values via sysfs:
>   /sys/class/leds/amd_halo:multicolor:status/multi_intensity
>   /sys/class/leds/amd_halo:multicolor:status/brightness
>=20
> Hardware interface:
> - Three separate RGB channels (Red, Green, Blue)
> - All 3 channels are configured at once with a single WMI method call
> - Value range: 0-100 (matching hardware range directly)
>=20
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> ---
> To: Hans de Goede <hansg@kernel.org>
> To: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> To: Mario Limonciello (AMD) <superm1@kernel.org>
> To: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: platform-driver-x86@vger.kernel.org
>=20
> v7 -> v8
> - Move local variables to the beginnign of function. (Ilpo)
> - Add trailing commas to enum declaratiion. (Ilpo)
> - Fix more white spaces
> - Remove redundant comments
> - Link to v7: https://lore.kernel.org/r/20260611-halo-leds-v2-plus-v7-1-8=
aad73fccb6b@amd.com
>=20
> v6 -> v7
> - Introduce a amd_halo_wmi_get_rgb() to get WMI values of colors, and
>   read them on probe.
> - Remove hard-coded RGB values.
> - Link to v6: https://lore.kernel.org/r/20260529-halo-leds-v2-plus-v6-1-b=
7bf7b904a16@amd.com
>=20
> v5 -> v6
> - Add missing includes and sort/group them accordingly
> - In __amd_halo_wmi_call, remove some unnecessary intermedaite variable a=
ssignments
> - In __amd_halo_wmi_call, move declaration of pointer managed by scope-ba=
sed cleanup
>   helpers closer to where it is used
> - Add trailing comma to designated initializers
> - Link to v5: https://lore.kernel.org/r/20260523-halo-leds-v2-plus-v5-1-4=
97dc9719a18@amd.com
> ---
>  MAINTAINERS                             |   7 +
>  drivers/platform/x86/amd/Kconfig        |  11 ++
>  drivers/platform/x86/amd/Makefile       |   1 +
>  drivers/platform/x86/amd/amd_halo_led.c | 315 ++++++++++++++++++++++++++=
++++++
>  4 files changed, 334 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 15011f5752a99..3b774bc8889c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1138,6 +1138,13 @@ F:=09drivers/char/hw_random/geode-rng.c
>  F:=09drivers/crypto/geode*
>  F:=09drivers/video/fbdev/geode/
> =20
> +AMD HALO BOX RGB LED DRIVER
> +M:=09Mario Limonciello (AMD) <superm1@kernel.org>
> +R:=09Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> +L:=09platform-driver-x86@vger.kernel.org
> +S:=09Supported
> +F:=09drivers/platform/x86/amd/amd_halo_led.c
> +
>  AMD HSMP DRIVER
>  M:=09Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>  R:=09Carlos Bilbao <carlos.bilbao@kernel.org>
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/=
Kconfig
> index b813f92653686..a1a74ef6c8593 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -34,6 +34,17 @@ config AMD_WBRF
>  =09  This mechanism will only be activated on platforms that advertise a
>  =09  need for it.
> =20
> +config AMD_HALO_LED
> +=09tristate "AMD Halo Box RGB LED Driver"
> +=09depends on ACPI_WMI && LEDS_CLASS_MULTICOLOR
> +=09help
> +=09  This driver provides RGB LED control for AMD Halo Box devices
> +=09  through the LED multicolor subsystem. The Halo Box light bar can
> +=09  be controlled via sysfs to display any RGB color combination.
> +
> +=09  To compile this driver as a module, choose M here: the module
> +=09  will be called amd_halo_led.
> +
>  config AMD_ISP_PLATFORM
>  =09tristate "AMD ISP4 platform driver"
>  =09depends on I2C && X86_64 && ACPI
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd=
/Makefile
> index f6ff0c837f345..2f467dbbfc8a3 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -10,5 +10,6 @@ obj-$(CONFIG_AMD_PMC)=09=09+=3D pmc/
>  obj-$(CONFIG_AMD_HSMP)=09=09+=3D hsmp/
>  obj-$(CONFIG_AMD_PMF)=09=09+=3D pmf/
>  obj-$(CONFIG_AMD_WBRF)=09=09+=3D wbrf.o
> +obj-$(CONFIG_AMD_HALO_LED)=09+=3D amd_halo_led.o
>  obj-$(CONFIG_AMD_ISP_PLATFORM)=09+=3D amd_isp4.o
>  obj-$(CONFIG_AMD_HFI)=09=09+=3D hfi/
> diff --git a/drivers/platform/x86/amd/amd_halo_led.c b/drivers/platform/x=
86/amd/amd_halo_led.c
> new file mode 100644
> index 0000000000000..b21d956c7d96c
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_halo_led.c
> @@ -0,0 +1,315 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD Halo Box RGB LED Driver
> + *
> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
> + *
> + * This driver provides RGB LED control for AMD Halo Box devices through
> + * the LED multicolor subsystem. The Halo Box light bar can be controlle=
d
> + * via sysfs to display any RGB color combination.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/cleanup.h>
> +#include <linux/compiler_attributes.h>
> +#include <linux/container_of.h>
> +#include <linux/dev_printk.h>
> +#include <linux/device.h>
> +#include <linux/device/devres.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +#include <linux/byteorder/generic.h>
> +
> +#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"
> +
> +/* WMI method IDs from MOF */
> +enum {
> +=09AMD_HALO_WMI_TURN_OFF=09=3D 0x04,
> +=09AMD_HALO_WMI_RGB=09=3D 0x07,
> +};
> +
> +/* Arg0 of the AMD_HALO_WMI_RGB Method */
> +enum {
> +=09AMD_HALO_RGB_CMD_GET=09=3D 0x0,
> +=09AMD_HALO_RGB_CMD_SET=09=3D 0x1,
> +};
> +
> +/* Status codes from spec */
> +#define AMD_HALO_STATUS_SUCCESS=09=090x0000
> +#define AMD_HALO_STATUS_INVALID_PARAM=090xFFFD
> +
> +/* Brightness uses 0-100 range */
> +#define AMD_HALO_MAX_HW_BRIGHTNESS=09100
> +
> +/**
> + * struct amd_halo_led_data - Driver private data
> + * @wdev: WMI device pointer
> + * @led_mc: LED multicolor class device
> + * @subled_info: RGB channel information
> + * @lock: Mutex to protect WMI calls
> + */
> +struct amd_halo_led_data {
> +=09struct wmi_device *wdev;
> +=09struct led_classdev_mc led_mc;
> +=09struct mc_subled subled_info[3];
> +=09struct mutex lock;

Please put the comment back to explain what this lock protects.

--=20
 i.

> +};
> +
> +struct amd_halo_wmi_args {
> +=09__le32 arg0;
> +=09__le32 arg1;
> +};
> +
> +struct amd_halo_wmi_args_rgb {
> +=09__le32 cmd;
> +=09__le32 red;
> +=09__le32 green;
> +=09__le32 blue;
> +};
> +
> +struct amd_halo_wmi_output_rgb {
> +=09__le16 status;
> +=09u8 red;
> +=09u8 green;
> +=09u8 blue;
> +} __packed;
> +
> +static inline int wmi_status_to_err(u16 status)
> +{
> +=09switch (status) {
> +=09case AMD_HALO_STATUS_SUCCESS:
> +=09=09return 0;
> +=09case AMD_HALO_STATUS_INVALID_PARAM:
> +=09=09return -EINVAL;
> +=09default:
> +=09=09return -EIO;
> +=09}
> +}
> +
> +static int __amd_halo_wmi_call(struct wmi_device *wdev,
> +=09=09=09       u32 method_id, void *data, size_t length)
> +{
> +=09struct wmi_buffer input =3D {
> +=09=09.length =3D length,
> +=09=09.data =3D data,
> +=09};
> +=09struct wmi_buffer output =3D { };
> +=09int ret;
> +
> +=09/* Return buffer per spec: Bytes[0:1] =3D Status (little-endian) */
> +=09ret =3D wmidev_invoke_method(wdev, 0, method_id,
> +=09=09=09=09   &input, &output, sizeof(__le16));
> +=09if (ret)
> +=09=09return ret;
> +
> +=09__le16 *result_status __free(kfree) =3D output.data;
> +
> +=09return wmi_status_to_err(le16_to_cpu(*result_status));
> +}
> +
> +/**
> + * amd_halo_wmi_turn_off - Turn off all LED channels
> + * @wdev: WMI device pointer
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_wmi_turn_off(struct wmi_device *wdev)
> +{
> +=09struct amd_halo_wmi_args args =3D { };
> +
> +=09return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_TURN_OFF, &args, sizeof=
(args));
> +}
> +
> +/**
> + * amd_halo_wmi_set_rgb - Set all RGB channels atomically
> + * @wdev: WMI device pointer
> + * @r: brightness for red channel (0 - 100)
> + * @g: brightness for green channel (0 - 100)
> + * @b: brightness for blue channel (0 - 100)
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_wmi_set_rgb(struct wmi_device *wdev, u32 r, u32 g, u=
32 b)
> +{
> +=09struct amd_halo_wmi_args_rgb args =3D {
> +=09=09.cmd =3D cpu_to_le32(AMD_HALO_RGB_CMD_SET),
> +=09=09.red =3D cpu_to_le32(r),
> +=09=09.green =3D cpu_to_le32(g),
> +=09=09.blue =3D cpu_to_le32(b),
> +=09};
> +
> +=09if (r > AMD_HALO_MAX_HW_BRIGHTNESS ||
> +=09    g > AMD_HALO_MAX_HW_BRIGHTNESS ||
> +=09    b > AMD_HALO_MAX_HW_BRIGHTNESS) {
> +=09=09return -EINVAL;
> +=09}
> +
> +=09return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_RGB, &args, sizeof(args=
));
> +}
> +
> +/**
> + * amd_halo_wmi_get_rgb - Get RGB values
> + * @wdev: WMI device pointer
> + * @r: output buffer for red value
> + * @g: output buffer for green value
> + * @b: output buffer for blue value
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_wmi_get_rgb(struct wmi_device *wdev, u8 *r, u8 *g, u=
8 *b)
> +{
> +=09struct amd_halo_wmi_args_rgb args =3D {
> +=09=09.cmd =3D cpu_to_le32(AMD_HALO_RGB_CMD_GET),
> +=09};
> +=09struct wmi_buffer input =3D {
> +=09=09.length =3D sizeof(args),
> +=09=09.data =3D &args,
> +=09};
> +=09struct wmi_buffer output =3D { };
> +=09int ret;
> +
> +=09ret =3D wmidev_invoke_method(wdev, 0, AMD_HALO_WMI_RGB,
> +=09=09=09=09   &input, &output, sizeof(struct amd_halo_wmi_output_rgb));
> +=09if (ret)
> +=09=09return ret;
> +
> +=09struct amd_halo_wmi_output_rgb *data __free(kfree) =3D output.data;
> +
> +=09ret =3D wmi_status_to_err(le16_to_cpu(data->status));
> +=09if (ret)
> +=09=09return ret;
> +
> +=09if (data->red > AMD_HALO_MAX_HW_BRIGHTNESS ||
> +=09    data->green > AMD_HALO_MAX_HW_BRIGHTNESS ||
> +=09    data->blue > AMD_HALO_MAX_HW_BRIGHTNESS) {
> +=09=09return -EPROTO;
> +=09}
> +
> +=09*r =3D data->red;
> +=09*g =3D data->green;
> +=09*b =3D data->blue;
> +
> +=09return 0;
> +}
> +
> +/**
> + * amd_halo_brightness_set - Set LED brightness
> + * @cdev: LED class device
> + * @brightness: Brightness value
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_brightness_set(struct led_classdev *cdev,
> +=09=09=09=09   enum led_brightness brightness)
> +{
> +=09struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(cdev);
> +=09struct amd_halo_led_data *data =3D container_of(mc_cdev,
> +=09=09=09=09=09=09      struct amd_halo_led_data,
> +=09=09=09=09=09=09      led_mc);
> +=09u32 red_hw, green_hw, blue_hw;
> +=09int ret;
> +
> +=09guard(mutex)(&data->lock);
> +
> +=09led_mc_calc_color_components(mc_cdev, brightness);
> +
> +=09if (brightness =3D=3D 0)
> +=09=09return amd_halo_wmi_turn_off(data->wdev);
> +
> +=09red_hw =3D mc_cdev->subled_info[0].brightness;
> +=09green_hw =3D mc_cdev->subled_info[1].brightness;
> +=09blue_hw =3D mc_cdev->subled_info[2].brightness;
> +
> +=09ret =3D amd_halo_wmi_set_rgb(data->wdev, red_hw, green_hw, blue_hw);
> +=09if (ret)
> +=09=09goto out;
> +
> +=09return 0;
> +
> +out:
> +=09/*
> +=09 * Consider the light bar non-functional if AMD_HALO_WMI_RGB failed.
> +=09 * Attempt to turn the LED off completely as clean-up.
> +=09 */
> +=09if (amd_halo_wmi_turn_off(data->wdev))
> +=09=09dev_warn_ratelimited(&data->wdev->dev, "Failed to turn LED off on =
cleanup\n");
> +
> +=09return ret;
> +}
> +
> +static int amd_halo_probe(struct wmi_device *wdev, const void *context)
> +{
> +=09struct led_init_data led_init_data =3D {
> +=09=09.devicename =3D "amd_halo",
> +=09=09.default_label =3D "multicolor:" LED_FUNCTION_STATUS,
> +=09=09.devname_mandatory =3D true,
> +=09};
> +=09struct amd_halo_led_data *data;
> +=09u8 r, g, b;
> +=09int ret;
> +
> +=09data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +=09if (!data)
> +=09=09return -ENOMEM;
> +
> +=09ret =3D devm_mutex_init(&wdev->dev, &data->lock);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09data->wdev =3D wdev;
> +=09dev_set_drvdata(&wdev->dev, data);
> +
> +=09data->subled_info[0].color_index =3D LED_COLOR_ID_RED;
> +=09data->subled_info[1].color_index =3D LED_COLOR_ID_GREEN;
> +=09data->subled_info[2].color_index =3D LED_COLOR_ID_BLUE;
> +
> +=09data->led_mc.led_cdev.brightness =3D AMD_HALO_MAX_HW_BRIGHTNESS;
> +=09data->led_mc.led_cdev.max_brightness =3D AMD_HALO_MAX_HW_BRIGHTNESS;
> +=09data->led_mc.led_cdev.brightness_set_blocking =3D amd_halo_brightness=
_set;
> +=09data->led_mc.led_cdev.flags =3D LED_CORE_SUSPENDRESUME | LED_RETAIN_A=
T_SHUTDOWN;
> +=09data->led_mc.num_colors =3D ARRAY_SIZE(data->subled_info);
> +=09data->led_mc.subled_info =3D data->subled_info;
> +
> +=09ret =3D amd_halo_wmi_get_rgb(wdev, &r, &g, &b);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09data->subled_info[0].intensity =3D r;
> +=09data->subled_info[1].intensity =3D g;
> +=09data->subled_info[2].intensity =3D b;
> +
> +=09ret =3D devm_led_classdev_multicolor_register_ext(&wdev->dev, &data->=
led_mc,
> +=09=09=09=09=09=09=09&led_init_data);
> +=09if (ret)
> +=09=09return dev_err_probe(&wdev->dev, ret,
> +=09=09=09=09     "Failed to register multicolor LED\n");
> +=09return 0;
> +}
> +
> +static const struct wmi_device_id amd_halo_id_table[] =3D {
> +=09{ .guid_string =3D AMD_HALO_GUID },
> +=09{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, amd_halo_id_table);
> +
> +static struct wmi_driver amd_halo_driver =3D {
> +=09.driver =3D {
> +=09=09.name =3D "amd_halo_led",
> +=09},
> +=09.id_table =3D amd_halo_id_table,
> +=09.probe =3D amd_halo_probe,
> +=09.no_singleton =3D true,
> +};
> +
> +module_wmi_driver(amd_halo_driver);
> +
> +MODULE_AUTHOR("Mario Limonciello (AMD) <superm1@kernel.org>");
> +MODULE_AUTHOR("Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>");
> +MODULE_DESCRIPTION("AMD Halo Box RGB LED Control Driver");
> +MODULE_LICENSE("GPL");
>=20
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260429-halo-leds-v2-plus-722c8083afe8
>=20
> Best regards,
>=20
--8323328-682161429-1783592742=:1261--
