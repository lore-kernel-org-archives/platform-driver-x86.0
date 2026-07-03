Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3CF3D3481;
	Fri,  3 Jul 2026 12:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783083247; cv=none; b=QIsmCGQEW1tswU3erVUcokJvyAGvK8ArEs4FY3GiyIQ5GTN/Itt620A0mSm90+WEY7Df8XbIcjgiqtPjNr3HuVwYqjRWmgOc71DNurZtdxPm7jdIP0YrzYIuYUNNyMCLeHhiAldhu2rEzu84LEvnxzsPx+MPVD6wdg3K8tiO+S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783083247; c=relaxed/simple;
	bh=jG4P2AJyd6udfLRl050FmB2+tJLR/4XV+veWdSTujF0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CC4Etdqha8VOoqGYpLbiH/qixKoWykZaMxT8G7lcjW7ecDA5CuBVxfPAIRCg/0P4go9rbGqh/mw0nOEZFLdv7Nth8CqzrX/LoiiQIPCKN1UM7atxCkEzQh5CHNrz50owz3F+9An+z8SaxZPSwTif4Pxi/e9Ihv/ZaG9nHIcMh2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LlBYHkAt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlBYHkAt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783083243; x=1814619243;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jG4P2AJyd6udfLRl050FmB2+tJLR/4XV+veWdSTujF0=;
  b=LlBYHkAtQPHgM9PpxjeRmA3GJLZrw6qrH8e3EVZlGNdZcGWPg7fV9L+r
   a8g5P7cmliOALjVbeiSHWuP27PMy36rHQ5yr0SIsgdXkMID9xnaSLWp1S
   WAaO5upT7s5MfqGOEg7RJ1OosFyPN3JQtdtClbWwku8csg7pVgs0MWnDP
   wiHKJSFK7JiNfXHkAYZmAa8T5z02qGsdIulc0Vyt70em1NXu7DaFJWKhL
   dWAN8oDLloygx/VPh3/glAnZ3YPX8HeIQYDpX27yMG9ehEsPLNFk/qzwe
   KKG6MJIWeNrwa6x6nSckdqhHIXSgZuAxTi9a0dAYs6XV/MxdYqgpcBKrH
   g==;
X-CSE-ConnectionGUID: rbTcZPnET2yXX6PlRJoUNQ==
X-CSE-MsgGUID: /BvQZ7ZTSGOQSzWXXGL0ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101380585"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="101380585"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 05:54:02 -0700
X-CSE-ConnectionGUID: sF0hWv0dQcmv9mP6P3s7+A==
X-CSE-MsgGUID: tco6HQHTRTezbfAgVgEVFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="246743141"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 05:53:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 3 Jul 2026 15:53:54 +0300 (EEST)
To: "Lin, Leo" <Leo.Lin@amd.com>
cc: Hans de Goede <hansg@kernel.org>, 
    "Mario Limonciello (AMD)" <superm1@kernel.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, 
    Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v7] platform/x86/amd: Introduce Halo Box RGB LED driver
In-Reply-To: <DS0PR12MB84794FC17FDBFB548FCB33B3FEF42@DS0PR12MB8479.namprd12.prod.outlook.com>
Message-ID: <087ed829-356a-b50b-cc34-a02b1ec92f9a@linux.intel.com>
References: <20260611-halo-leds-v2-plus-v7-1-8aad73fccb6b@amd.com> <DS0PR12MB84794FC17FDBFB548FCB33B3FEF42@DS0PR12MB8479.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-814159312-1783083234=:36693"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-814159312-1783083234=:36693
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 3 Jul 2026, Lin, Leo wrote:
> >=20
> > ________________________________________
> > From: Lin, Leo <Leo.Lin@amd.com>
> > Sent: Thursday, June 11, 2026 4:30 PM
> > To: Hans de Goede; Ilpo J=E4rvinen; Mario Limonciello (AMD); Lin, Leo
> > Cc: linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; =
S-k, Shyam-sundar; Armin Wolf
> > Subject: [PATCH v7] platform/x86/amd: Introduce Halo Box RGB LED driver
> >=20
> > The Halo Box features an RGB LED light bar that can be controlled
> > through WMI methods to display any color combination.
> >=20
> > The driver exposes the LED through the LED multicolor subsystem,
> > allowing userspace to control RGB values via sysfs:
> >   /sys/class/leds/amd_halo:multicolor:status/multi_intensity
> >   /sys/class/leds/amd_halo:multicolor:status/brightness
> >=20
> > Hardware interface:
> > - Three separate RGB channels (Red, Green, Blue)
> > - All 3 channels are configured at once with a single WMI method call
> > - Value range: 0-100 (matching hardware range directly)
> >=20
> > Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> > Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> > Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> > Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> > ---
> > Send this patch revision because we now have better BIOS behavior which
> > allows us to remove of some hard-coded logic in the driver.
> >=20
> > There used be a BIOS behavior where WMI values don't correctly reflect
> > LED colors after S5. Setting known default values to LEDs on probe is
> > a compromise for that.
> >=20
> > That has been fixed in our new BIOS, so we no longer need to hard-code
> > the default colors in the driver.
> >=20
> > v6 -> v7
> > - Introduce a amd_halo_wmi_get_rgb() to get WMI values of colors, and
> >   read them on probe.
> > - Remove hard-coded RGB values.
> > - Link to v6: https://lore.kernel.org/r/20260529-halo-leds-v2-plus-v6-1=
-b7bf7b904a16@amd.com
>=20
> I tested v7 after rebasing it onto the latest platform-drivers-x86 tree=
=20
> (HEAD at dc59e4fea9d8), and it still functions as expected. It's a clean=
=20
> rebase, so this patch should still apply cleanly on top of your tree.=20
> Can you help review this when you have time? Thanks.=20

Hi,

I did a very quick pass on it now and didn't find anything. I probably did=
=20
a pass earlier based on a few telltale signs (but I didn't go back to=20
check).

I'll get back to this once I'm ready look carefully through and apply=20
bigger patches having first cleared fixes branch stuff and trivial=20
patches from the queue, instructed newcomers, etc. Please be patient.

--
 i.

> > v5 -> v6
> > - Add missing includes and sort/group them accordingly
> > - In __amd_halo_wmi_call, remove some unnecessary intermedaite variable=
 assignments
> > - In __amd_halo_wmi_call, move declaration of pointer managed by scope-=
based cleanup
> >   helpers closer to where it is used
> > - Add trailing comma to designated initializers
> > - Link to v5: https://lore.kernel.org/r/20260523-halo-leds-v2-plus-v5-1=
-497dc9719a18@amd.com
> >=20
> > v4 -> v5
> > No code chang. Only email etiquette fixes
> > - Fix the "From: " in the mail from leo.lin@amd.com to Leo.Lin@amd.com,
> >   so that it matches s-o-b
> > - Pull the Reviewed-by trailer from previous threads.
> > - Link to v4: https://lore.kernel.org/r/20260521-halo-leds-v2-plus-v4-1=
-b498bbab36a2@amd.com
> >=20
> > v3 -> v4
> > There's a new WMI method we introduced in BIOS for color setting, to
> > replace the original ones, so in this version:
> > - Introduce a new "AMD_HALO_WMI_RGB" method ID. This WMI method takes 1
> >   command argument (GET/SET) and 3 RGB values. This method is capable o=
f
> >   turning on and setting all RGB channels at once in a single call, red=
ucing
> >   some undesirable visual effects when setting them separately.
> > - Replace color setting code with this new "AMD_HALO_WMI_RGB" method.
> > - Remove implementations of unused WMI methods.
> >=20
> > This version also fixes things pointed out in the previous version:
> > - Explicltly specify the endianess of WMI arguments as __le32, and use
> >   endian-conversion helpers accordingly.
> > - Use scope-based cleanup helper for WMI buffer.
> > - Remove cleanup for channel setting WMI in probe.
> > - Explicitly include headers for kfree and le16_to_cpu
> > - Fix white spaces
> > - Fix designated initializor style
> > - Link to v3: https://lore.kernel.org/r/20260508-halo-leds-v2-plus-v3-1=
-91df458966ea@amd.com
> >=20
> > (Didn't pull Shyam's Reviewed-by because this is a relatively bigger ch=
ange.)
> >=20
> > v2 -> v3:
> > - Re-introduce OF/OFF method: implement them with wmidev_invoke_method
> > - Explicitly call the ON method on brightness_set callback for
> >   brightness !=3D 0; call the OFF method when brightness =3D=3D 0
> > - Turn off light bar if TURN_ON/SET_LIGHTBAR can't function normally
> > - Replace get_unaligned_le64 with casting and le16_to_cpu()
> > - Add an inline function (wmi_status_to_err) to convert WMI return
> >   values to errno
> > - Use amd_halo_wmi_set_channel in probe to set default color
> > - Use devm_mutex_init() instead
> > - Remove unused includes
> > - Link to v2: https://lore.kernel.org/r/20260504-halo-leds-v2-plus-v2-1=
-af027727605b@amd.com
> >=20
> > v1 -> v2:
> > - Fix Kconfig dependencies
> > - Remove amd_halo_wmi_turn_off(). Handle the case where brightness=3D0 =
with the
> >   same logic where brightness !=3D 0
> > - Remove the brightness_get callback, because currently there isn't a
> >   well-defined global bightness in hardware. Note that the sysfs bright=
ness
> >   stil works. It just caches the value last set.
> > - Convert to wmidev_invoke_method()
> > - Convert to ARRAY_SIZE()
> > - Convert some macros to enum
> > - Convert to devm_led_classdev_multicolor_register_ext()
> > - Rename sysfs path to amd_halo:multicolor:status
> > - Fold default LED colors setting in probe, before registration
> > - Add no_singleton option
> > - Make default RGB values into macros and adjust their values
> > ---
> >  MAINTAINERS                             |   7 +
> >  drivers/platform/x86/amd/Kconfig        |  11 ++
> >  drivers/platform/x86/amd/Makefile       |   1 +
> >  drivers/platform/x86/amd/amd_halo_led.c | 322 ++++++++++++++++++++++++=
++++++++
> >  4 files changed, 341 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b539be153f6a..6450962b003e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1130,6 +1130,13 @@ F:       drivers/char/hw_random/geode-rng.c
> >  F:     drivers/crypto/geode*
> >  F:     drivers/video/fbdev/geode/
> >=20
> > +AMD HALO BOX RGB LED DRIVER
> > +M:     Mario Limonciello (AMD) <superm1@kernel.org>
> > +R:     Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> > +L:     platform-driver-x86@vger.kernel.org
> > +S:     Supported
> > +F:     drivers/platform/x86/amd/amd_halo_led.c
> > +
> >  AMD HSMP DRIVER
> >  M:     Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> >  R:     Carlos Bilbao <carlos.bilbao@kernel.org>
> > diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/am=
d/Kconfig
> > index b813f9265368..a1a74ef6c859 100644
> > --- a/drivers/platform/x86/amd/Kconfig
> > +++ b/drivers/platform/x86/amd/Kconfig
> > @@ -34,6 +34,17 @@ config AMD_WBRF
> >           This mechanism will only be activated on platforms that adver=
tise a
> >           need for it.
> >=20
> > +config AMD_HALO_LED
> > +       tristate "AMD Halo Box RGB LED Driver"
> > +       depends on ACPI_WMI && LEDS_CLASS_MULTICOLOR
> > +       help
> > +         This driver provides RGB LED control for AMD Halo Box devices
> > +         through the LED multicolor subsystem. The Halo Box light bar =
can
> > +         be controlled via sysfs to display any RGB color combination.
> > +
> > +         To compile this driver as a module, choose M here: the module
> > +         will be called amd_halo_led.
> > +
> >  config AMD_ISP_PLATFORM
> >         tristate "AMD ISP4 platform driver"
> >         depends on I2C && X86_64 && ACPI
> > diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/a=
md/Makefile
> > index f6ff0c837f34..2f467dbbfc8a 100644
> > --- a/drivers/platform/x86/amd/Makefile
> > +++ b/drivers/platform/x86/amd/Makefile
> > @@ -10,5 +10,6 @@ obj-$(CONFIG_AMD_PMC)         +=3D pmc/
> >  obj-$(CONFIG_AMD_HSMP)         +=3D hsmp/
> >  obj-$(CONFIG_AMD_PMF)          +=3D pmf/
> >  obj-$(CONFIG_AMD_WBRF)         +=3D wbrf.o
> > +obj-$(CONFIG_AMD_HALO_LED)     +=3D amd_halo_led.o
> >  obj-$(CONFIG_AMD_ISP_PLATFORM) +=3D amd_isp4.o
> >  obj-$(CONFIG_AMD_HFI)          +=3D hfi/
> > diff --git a/drivers/platform/x86/amd/amd_halo_led.c b/drivers/platform=
/x86/amd/amd_halo_led.c
> > new file mode 100644
> > index 000000000000..824d3f7d680b
> > --- /dev/null
> > +++ b/drivers/platform/x86/amd/amd_halo_led.c
> > @@ -0,0 +1,322 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * AMD Halo Box RGB LED Driver
> > + *
> > + * Copyright (C) 2026 Advanced Micro Devices, Inc.
> > + *
> > + * This driver provides RGB LED control for AMD Halo Box devices throu=
gh
> > + * the LED multicolor subsystem. The Halo Box light bar can be control=
led
> > + * via sysfs to display any RGB color combination.
> > + */
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/compiler_attributes.h>
> > +#include <linux/container_of.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/device.h>
> > +#include <linux/device/devres.h>
> > +#include <linux/led-class-multicolor.h>
> > +#include <linux/leds.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/slab.h>
> > +#include <linux/types.h>
> > +#include <linux/wmi.h>
> > +
> > +#include <linux/byteorder/generic.h>
> > +
> > +#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"
> > +
> > +/* WMI method IDs from MOF */
> > +enum {
> > +       AMD_HALO_WMI_TURN_OFF =3D 0x04,
> > +       AMD_HALO_WMI_RGB =3D 0x07
> > +};
> > +
> > +/* Arg0 of the AMD_HALO_WMI_RGB Method */
> > +enum {
> > +       AMD_HALO_RGB_CMD_GET,
> > +       AMD_HALO_RGB_CMD_SET
> > +};
> > +
> > +/* Status codes from spec */
> > +#define AMD_HALO_STATUS_SUCCESS                0x0000
> > +#define AMD_HALO_STATUS_INVALID_PARAM  0xFFFD
> > +
> > +/* Brightness uses 0-100 range */
> > +#define AMD_HALO_MAX_HW_BRIGHTNESS     100
> > +
> > +/**
> > + * struct amd_halo_led_data - Driver private data
> > + * @wdev: WMI device pointer
> > + * @led_mc: LED multicolor class device
> > + * @subled_info: RGB channel information
> > + * @lock: Mutex to protect WMI calls
> > + */
> > +struct amd_halo_led_data {
> > +       struct wmi_device *wdev;
> > +       struct led_classdev_mc led_mc;
> > +       struct mc_subled subled_info[3];
> > +       struct mutex lock;      /* Protects WMI method calls */
> > +};
> > +
> > +struct amd_halo_wmi_args {
> > +       __le32 arg0;
> > +       __le32 arg1;
> > +};
> > +
> > +struct amd_halo_wmi_args_rgb {
> > +       __le32 cmd;
> > +       __le32 red;
> > +       __le32 green;
> > +       __le32 blue;
> > +};
> > +
> > +struct amd_halo_wmi_output_rgb {
> > +       __le16 status;
> > +       u8 red;
> > +       u8 green;
> > +       u8 blue;
> > +} __packed;
> > +
> > +static inline int wmi_status_to_err(u16 status)
> > +{
> > +       switch (status) {
> > +       case AMD_HALO_STATUS_SUCCESS:
> > +               return 0;
> > +       case AMD_HALO_STATUS_INVALID_PARAM:
> > +               return -EINVAL;
> > +       default:
> > +               return -EIO;
> > +       }
> > +}
> > +
> > +static int __amd_halo_wmi_call(struct wmi_device *wdev,
> > +                              u32 method_id, void *data, size_t length=
)
> > +{
> > +       struct wmi_buffer input =3D {
> > +               .length =3D length,
> > +               .data =3D data,
> > +       };
> > +       struct wmi_buffer output =3D {};
> > +       int ret;
> > +
> > +       /* Return buffer per spec: Bytes[0:1] =3D Status (little-endian=
) */
> > +       ret =3D wmidev_invoke_method(wdev, 0, method_id,
> > +                                  &input, &output, sizeof(__le16));
> > +       if (ret)
> > +               return ret;
> > +
> > +       __le16 *result_status __free(kfree) =3D output.data;
> > +
> > +       return wmi_status_to_err(le16_to_cpu(*result_status));
> > +}
> > +
> > +/**
> > + * amd_halo_wmi_turn_off - Turn off all LED channels
> > + * @wdev: WMI device pointer
> > + *
> > + * Return: 0 on success, negative error code on failure
> > + */
> > +static int amd_halo_wmi_turn_off(struct wmi_device *wdev)
> > +{
> > +       struct amd_halo_wmi_args args =3D { };
> > +
> > +       return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_TURN_OFF, &args, =
sizeof(args));
> > +}
> > +
> > +/**
> > + * amd_halo_wmi_set_rgb - Set all RGB channels atomically
> > + * @wdev: WMI device pointer
> > + * @r: brightness for red channel (0 - 100)
> > + * @g: brightness for green channel (0 - 100)
> > + * @b: brightness for blue channel (0 - 100)
> > + *
> > + * Return: 0 on success, negative error code on failure
> > + */
> > +static int amd_halo_wmi_set_rgb(struct wmi_device *wdev, u32 r, u32 g,=
 u32 b)
> > +{
> > +       if (r > AMD_HALO_MAX_HW_BRIGHTNESS ||
> > +           g > AMD_HALO_MAX_HW_BRIGHTNESS ||
> > +           b > AMD_HALO_MAX_HW_BRIGHTNESS) {
> > +               return -EINVAL;
> > +       }
> > +
> > +       struct amd_halo_wmi_args_rgb args =3D {
> > +               .cmd =3D cpu_to_le32(AMD_HALO_RGB_CMD_SET),
> > +               .red =3D cpu_to_le32(r),
> > +               .green =3D cpu_to_le32(g),
> > +               .blue =3D cpu_to_le32(b),
> > +       };
> > +
> > +       return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_RGB, &args, sizeo=
f(args));
> > +}
> > +
> > +/**
> > + * amd_halo_wmi_get_rgb - Get RGB values
> > + * @wdev: WMI device pointer
> > + * @r: output buffer for red value
> > + * @g: output buffer for green value
> > + * @b: output buffer for blue value
> > + *
> > + * Return: 0 on success, negative error code on failure
> > + */
> > +static int amd_halo_wmi_get_rgb(struct wmi_device *wdev, u8 *r, u8 *g,=
 u8 *b)
> > +{
> > +       struct amd_halo_wmi_args_rgb args =3D {
> > +               .cmd =3D cpu_to_le32(AMD_HALO_RGB_CMD_GET),
> > +       };
> > +       struct wmi_buffer input =3D {
> > +               .length =3D sizeof(args),
> > +               .data =3D &args,
> > +       };
> > +       struct wmi_buffer output =3D {};
> > +       int ret;
> > +
> > +       ret =3D wmidev_invoke_method(wdev, 0, AMD_HALO_WMI_RGB,
> > +                                  &input, &output, sizeof(struct amd_h=
alo_wmi_output_rgb));
> > +       if (ret)
> > +               return ret;
> > +
> > +       struct amd_halo_wmi_output_rgb *data __free(kfree) =3D output.d=
ata;
> > +
> > +       ret =3D wmi_status_to_err(le16_to_cpu(data->status));
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (data->red > AMD_HALO_MAX_HW_BRIGHTNESS ||
> > +           data->green > AMD_HALO_MAX_HW_BRIGHTNESS ||
> > +           data->blue > AMD_HALO_MAX_HW_BRIGHTNESS) {
> > +               return -EPROTO;
> > +       }
> > +
> > +       *r =3D data->red;
> > +       *g =3D data->green;
> > +       *b =3D data->blue;
> > +
> > +       return 0;
> > +}
> > +
> > +/**
> > + * amd_halo_brightness_set - Set LED brightness and color
> > + * @cdev: LED class device
> > + * @brightness: Brightness value
> > + *
> > + * Return: 0 on success, negative error code on failure
> > + */
> > +static int amd_halo_brightness_set(struct led_classdev *cdev,
> > +                                  enum led_brightness brightness)
> > +{
> > +       struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(cdev);
> > +       struct amd_halo_led_data *data =3D container_of(mc_cdev,
> > +                                                     struct amd_halo_l=
ed_data,
> > +                                                     led_mc);
> > +       u32 red_hw, green_hw, blue_hw;
> > +       int ret;
> > +
> > +       guard(mutex)(&data->lock);
> > +
> > +       led_mc_calc_color_components(mc_cdev, brightness);
> > +
> > +       if (brightness =3D=3D 0)
> > +               return amd_halo_wmi_turn_off(data->wdev);
> > +
> > +       red_hw =3D mc_cdev->subled_info[0].brightness;
> > +       green_hw =3D mc_cdev->subled_info[1].brightness;
> > +       blue_hw =3D mc_cdev->subled_info[2].brightness;
> > +
> > +       ret =3D amd_halo_wmi_set_rgb(data->wdev, red_hw, green_hw, blue=
_hw);
> > +       if (ret)
> > +               goto out;
> > +
> > +       return 0;
> > +
> > +out:
> > +       /*
> > +        * Consider the light bar non-functional if AMD_HALO_WMI_RGB fa=
iled.
> > +        * Attempt to turn the LED off completely as clean-up.
> > +        */
> > +       if (amd_halo_wmi_turn_off(data->wdev))
> > +               dev_warn_ratelimited(&data->wdev->dev, "Failed to turn =
LED off on cleanup\n");
> > +
> > +       return ret;
> > +}
> > +
> > +/**
> > + * amd_halo_probe - Driver probe function
> > + * @wdev: WMI device
> > + * @context: Context data (unused)
> > + *
> > + * Return: 0 on success, negative error code on failure
> > + */
> > +static int amd_halo_probe(struct wmi_device *wdev, const void *context=
)
> > +{
> > +       struct led_init_data led_init_data =3D {
> > +               .devicename =3D "amd_halo",
> > +               .default_label =3D "multicolor:" LED_FUNCTION_STATUS,
> > +               .devname_mandatory =3D true,
> > +       };
> > +       struct amd_halo_led_data *data;
> > +       u8 r, g, b;
> > +       int ret;
> > +
> > +       data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> > +       if (!data)
> > +               return -ENOMEM;
> > +
> > +       ret =3D devm_mutex_init(&wdev->dev, &data->lock);
> > +       if (ret)
> > +               return ret;
> > +
> > +       data->wdev =3D wdev;
> > +       dev_set_drvdata(&wdev->dev, data);
> > +
> > +       data->subled_info[0].color_index =3D LED_COLOR_ID_RED;
> > +       data->subled_info[1].color_index =3D LED_COLOR_ID_GREEN;
> > +       data->subled_info[2].color_index =3D LED_COLOR_ID_BLUE;
> > +
> > +       data->led_mc.led_cdev.brightness =3D AMD_HALO_MAX_HW_BRIGHTNESS=
;
> > +       data->led_mc.led_cdev.max_brightness =3D AMD_HALO_MAX_HW_BRIGHT=
NESS;
> > +       data->led_mc.led_cdev.brightness_set_blocking =3D amd_halo_brig=
htness_set;
> > +       data->led_mc.led_cdev.flags =3D LED_CORE_SUSPENDRESUME | LED_RE=
TAIN_AT_SHUTDOWN;
> > +       data->led_mc.num_colors =3D ARRAY_SIZE(data->subled_info);
> > +       data->led_mc.subled_info =3D data->subled_info;
> > +
> > +       ret =3D amd_halo_wmi_get_rgb(wdev, &r, &g, &b);
> > +       if (ret)
> > +               return ret;
> > +
> > +       data->subled_info[0].intensity =3D r;
> > +       data->subled_info[1].intensity =3D g;
> > +       data->subled_info[2].intensity =3D b;
> > +
> > +       ret =3D devm_led_classdev_multicolor_register_ext(&wdev->dev, &=
data->led_mc,
> > +                                                       &led_init_data)=
;
> > +       if (ret)
> > +               return dev_err_probe(&wdev->dev, ret,
> > +                                    "Failed to register multicolor LED=
\n");
> > +       return 0;
> > +}
> > +
> > +static const struct wmi_device_id amd_halo_id_table[] =3D {
> > +       { .guid_string =3D AMD_HALO_GUID },
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(wmi, amd_halo_id_table);
> > +
> > +static struct wmi_driver amd_halo_driver =3D {
> > +       .driver =3D {
> > +               .name =3D "amd_halo_led",
> > +       },
> > +       .id_table =3D amd_halo_id_table,
> > +       .probe =3D amd_halo_probe,
> > +       .no_singleton =3D true,
> > +};
> > +
> > +module_wmi_driver(amd_halo_driver);
> > +
> > +MODULE_AUTHOR("Mario Limonciello (AMD) <superm1@kernel.org>");
> > +MODULE_AUTHOR("Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>");
> > +MODULE_DESCRIPTION("AMD Halo Box RGB LED Control Driver");
> > +MODULE_LICENSE("GPL");
> >=20
> > ---
> > base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
> > change-id: 20260429-halo-leds-v2-plus-722c8083afe8
> >=20
> > Best regards,
> > --
> > Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> >=20
> >=20

--=20
 i.

--8323328-814159312-1783083234=:36693--
