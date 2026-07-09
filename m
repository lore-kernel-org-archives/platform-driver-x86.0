Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEAF43440D;
	Thu,  9 Jul 2026 13:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604834; cv=none; b=YDE/b9Hg0SaI88Ac08bHg3dcRHLEvOVwyWFf94uP3pFnIgdDJLIWI9J+lK8fSft1SapcQc3mwO0pDAtHprtdyhIYB6AATKpnNAzRCtCchQGYCusRvMGAzAx++q5JXlszxbILujELIFCXPOZCGuNczDwcSZWRX4Bl+vSs2rEjOac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604834; c=relaxed/simple;
	bh=e94d1+ERNHgHkg1iqgW2EYAbvA/fWyomO/a8kFwojU4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GpTUbwg4HiKz3KXHR9b2noXrexp9b/G8nJ0yl1hThyH5v/HWr8pOqL2q4ZPYt14qrr71m96tEEzMnNrBcFFQWlcdTOpkDQaNonhsIs4dhHXRnf2r8Tz/QaPtKsWVVtM6DJtmR4hBLA6kqybR+EvwXZBk3F471S/g5Xd0dFFZDUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5E4ZuaL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5E4ZuaL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783604832; x=1815140832;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=e94d1+ERNHgHkg1iqgW2EYAbvA/fWyomO/a8kFwojU4=;
  b=i5E4ZuaLhaSRsFWBDrlP20QV6VUiqKsMYFQOk6bxKGvOonHtO37czL43
   8BDrPncXxnzMx24muGS3EBOEnKleA1fnjNfFcIMuZo5vrG1QQs744wod1
   9furNhzZ4WNBKNFTulYX7i+AzKPoeejBMDm0QH5uXBnz/Kde03LaZvMfW
   YFRrgi3GT39S50AyQ1itrDcn6vcyM4oRgkvTXV3OJ8L15IjP/P8dEEuwN
   RQaP1AAg4+PdnrhVdnZJKHBwIvghRIllG/ApZiF7R8K4VqcNRhm7UVtrJ
   O/J8ASTCPkB0NjZr1Gz+2elzQ+xgb1p0SXY5q6QD6H2hXZD2YVHPuq8Lc
   Q==;
X-CSE-ConnectionGUID: zOdneCgCQEep546H1/tQmQ==
X-CSE-MsgGUID: OsqOZZbjRhaM3cAIjQ0OZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84164597"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84164597"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:47:12 -0700
X-CSE-ConnectionGUID: upJHl+/BQ9uBPZ59ARmemA==
X-CSE-MsgGUID: +lO8JvFeS6yMo5OfgoZ9bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="248223434"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:47:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 9 Jul 2026 16:47:05 +0300 (EEST)
To: "Lin, Leo" <Leo.Lin@amd.com>
cc: Hans de Goede <hansg@kernel.org>, 
    "Mario Limonciello (AMD)" <superm1@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, 
    Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v8] platform/x86/amd: Introduce Halo Box RGB LED driver
In-Reply-To: <DS0PR12MB847916E03E6AEC3B6F91EAB0FEFE2@DS0PR12MB8479.namprd12.prod.outlook.com>
Message-ID: <01135df4-c181-65e8-8468-711fbdac6220@linux.intel.com>
References: <20260709-halo-leds-v2-plus-v8-1-b34c64277193@amd.com> <399d5a32-2af4-9cc3-8372-cd39a86952aa@linux.intel.com> <DS0PR12MB847916E03E6AEC3B6F91EAB0FEFE2@DS0PR12MB8479.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1166601778-1783604825=:1261"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1166601778-1783604825=:1261
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 9 Jul 2026, Lin, Leo wrote:

> >
> >
> >
> >________________________________________
> >From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> >Sent: Thursday, July 9, 2026 6:25 PM
> >To: Lin, Leo
> >Cc: Hans de Goede; Mario Limonciello (AMD); LKML; platform-driver-x86@vg=
er.kernel.org; S-k, Shyam-sundar; Armin Wolf
> >Subject: Re: [PATCH v8] platform/x86/amd: Introduce Halo Box RGB LED dri=
ver
> >
> >On Thu, 9 Jul 2026, Yo-Jung Leo Lin (AMD) wrote:
> >
> >> The Halo Box features an RGB LED light bar that can be controlled
> >> through WMI methods to display any color combination.
> >>
> >> The driver exposes the LED through the LED multicolor subsystem,
> >> allowing userspace to control RGB values via sysfs:
> >>   /sys/class/leds/amd_halo:multicolor:status/multi_intensity
> >>   /sys/class/leds/amd_halo:multicolor:status/brightness
> >>
> >> Hardware interface:
> >> - Three separate RGB channels (Red, Green, Blue)
> >> - All 3 channels are configured at once with a single WMI method call
> >> - Value range: 0-100 (matching hardware range directly)
> >>
> >> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> >> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> >> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> >> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> >> ---
> >> To: Hans de Goede <hansg@kernel.org>
> >> To: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> >> To: Mario Limonciello (AMD) <superm1@kernel.org>
> >> To: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> >> Cc: linux-kernel@vger.kernel.org
> >> Cc: platform-driver-x86@vger.kernel.org
> >>
> >> v7 -> v8
> >> - Move local variables to the beginnign of function. (Ilpo)
> >> - Add trailing commas to enum declaratiion. (Ilpo)
> >> - Fix more white spaces
> >> - Remove redundant comments
> >> - Link to v7: https://lore.kernel.org/r/20260611-halo-leds-v2-plus-v7-=
1-8aad73fccb6b@amd.com
> >>
> >> v6 -> v7
> >> - Introduce a amd_halo_wmi_get_rgb() to get WMI values of colors, and
> >>   read them on probe.
> >> - Remove hard-coded RGB values.
> >> - Link to v6: https://lore.kernel.org/r/20260529-halo-leds-v2-plus-v6-=
1-b7bf7b904a16@amd.com
> >>
> >> v5 -> v6
> >> - Add missing includes and sort/group them accordingly
> >> - In __amd_halo_wmi_call, remove some unnecessary intermedaite variabl=
e assignments
> >> - In __amd_halo_wmi_call, move declaration of pointer managed by scope=
-based cleanup
> >>   helpers closer to where it is used
> >> - Add trailing comma to designated initializers
> >> - Link to v5: https://lore.kernel.org/r/20260523-halo-leds-v2-plus-v5-=
1-497dc9719a18@amd.com
> >> ---
> >>  MAINTAINERS                             |   7 +
> >>  drivers/platform/x86/amd/Kconfig        |  11 ++
> >>  drivers/platform/x86/amd/Makefile       |   1 +
> >>  drivers/platform/x86/amd/amd_halo_led.c | 315 +++++++++++++++++++++++=
+++++++++
> >>  4 files changed, 334 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 15011f5752a99..3b774bc8889c5 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -1138,6 +1138,13 @@ F:     drivers/char/hw_random/geode-rng.c
> >>  F:   drivers/crypto/geode*
> >>  F:   drivers/video/fbdev/geode/
> >>
> >> +AMD HALO BOX RGB LED DRIVER
> >> +M:   Mario Limonciello (AMD) <superm1@kernel.org>
> >> +R:   Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> >> +L:   platform-driver-x86@vger.kernel.org
> >> +S:   Supported
> >> +F:   drivers/platform/x86/amd/amd_halo_led.c
> >> +
> >>  AMD HSMP DRIVER
> >>  M:   Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> >>  R:   Carlos Bilbao <carlos.bilbao@kernel.org>
> >> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/a=
md/Kconfig
> >> index b813f92653686..a1a74ef6c8593 100644
> >> --- a/drivers/platform/x86/amd/Kconfig
> >> +++ b/drivers/platform/x86/amd/Kconfig
> >> @@ -34,6 +34,17 @@ config AMD_WBRF
> >>         This mechanism will only be activated on platforms that advert=
ise a
> >>         need for it.
> >>
> >> +config AMD_HALO_LED
> >> +     tristate "AMD Halo Box RGB LED Driver"
> >> +     depends on ACPI_WMI && LEDS_CLASS_MULTICOLOR
> >> +     help
> >> +       This driver provides RGB LED control for AMD Halo Box devices
> >> +       through the LED multicolor subsystem. The Halo Box light bar c=
an
> >> +       be controlled via sysfs to display any RGB color combination.
> >> +
> >> +       To compile this driver as a module, choose M here: the module
> >> +       will be called amd_halo_led.
> >> +
> >>  config AMD_ISP_PLATFORM
> >>       tristate "AMD ISP4 platform driver"
> >>       depends on I2C && X86_64 && ACPI
> >> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/=
amd/Makefile
> >> index f6ff0c837f345..2f467dbbfc8a3 100644
> >> --- a/drivers/platform/x86/amd/Makefile
> >> +++ b/drivers/platform/x86/amd/Makefile
> >> @@ -10,5 +10,6 @@ obj-$(CONFIG_AMD_PMC)               +=3D pmc/
> >>  obj-$(CONFIG_AMD_HSMP)               +=3D hsmp/
> >>  obj-$(CONFIG_AMD_PMF)                +=3D pmf/
> >>  obj-$(CONFIG_AMD_WBRF)               +=3D wbrf.o
> >> +obj-$(CONFIG_AMD_HALO_LED)   +=3D amd_halo_led.o
> >>  obj-$(CONFIG_AMD_ISP_PLATFORM)       +=3D amd_isp4.o
> >>  obj-$(CONFIG_AMD_HFI)                +=3D hfi/
> >> diff --git a/drivers/platform/x86/amd/amd_halo_led.c b/drivers/platfor=
m/x86/amd/amd_halo_led.c
> >> new file mode 100644
> >> index 0000000000000..b21d956c7d96c
> >> --- /dev/null
> >> +++ b/drivers/platform/x86/amd/amd_halo_led.c
> >> @@ -0,0 +1,315 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * AMD Halo Box RGB LED Driver
> >> + *
> >> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
> >> + *
> >> + * This driver provides RGB LED control for AMD Halo Box devices thro=
ugh
> >> + * the LED multicolor subsystem. The Halo Box light bar can be contro=
lled
> >> + * via sysfs to display any RGB color combination.
> >> + */
> >> +
> >> +#include <linux/array_size.h>
> >> +#include <linux/cleanup.h>
> >> +#include <linux/compiler_attributes.h>
> >> +#include <linux/container_of.h>
> >> +#include <linux/dev_printk.h>
> >> +#include <linux/device.h>
> >> +#include <linux/device/devres.h>
> >> +#include <linux/led-class-multicolor.h>
> >> +#include <linux/leds.h>
> >> +#include <linux/module.h>
> >> +#include <linux/mutex.h>
> >> +#include <linux/slab.h>
> >> +#include <linux/types.h>
> >> +#include <linux/wmi.h>
> >> +
> >> +#include <linux/byteorder/generic.h>
> >> +
> >> +#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"
> >> +
> >> +/* WMI method IDs from MOF */
> >> +enum {
> >> +     AMD_HALO_WMI_TURN_OFF   =3D 0x04,
> >> +     AMD_HALO_WMI_RGB        =3D 0x07,
> >> +};
> >> +
> >> +/* Arg0 of the AMD_HALO_WMI_RGB Method */
> >> +enum {
> >> +     AMD_HALO_RGB_CMD_GET    =3D 0x0,
> >> +     AMD_HALO_RGB_CMD_SET    =3D 0x1,
> >> +};
> >> +
> >> +/* Status codes from spec */
> >> +#define AMD_HALO_STATUS_SUCCESS              0x0000
> >> +#define AMD_HALO_STATUS_INVALID_PARAM        0xFFFD
> >> +
> >> +/* Brightness uses 0-100 range */
> >> +#define AMD_HALO_MAX_HW_BRIGHTNESS   100
> >> +
>=20
> Hi Ilpo,
>=20
> >> +/**
> >> + * struct amd_halo_led_data - Driver private data
> >> + * @wdev: WMI device pointer
> >> + * @led_mc: LED multicolor class device
> >> + * @subled_info: RGB channel information
> >> + * @lock: Mutex to protect WMI calls
>=20
> Here's the comment for the lock, which basically means the same thing as =
the removed inline comment.
>=20
> >> + */
> >> +struct amd_halo_led_data {
> >> +     struct wmi_device *wdev;
> >> +     struct led_classdev_mc led_mc;
> >> +     struct mc_subled subled_info[3];
> >> +     struct mutex lock;
> >
> >Please put the comment back to explain what this lock protects.
>=20
> There's already kdoc comment in the beginning of this function that=20
> explains this, and that's why I removed the inline comment.=20

Ah. I was only looking at the between versions diff. I'm sorry about not=20
noticing the other comment.

--=20
 i.

--8323328-1166601778-1783604825=:1261--
