Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7736E502B4
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 13:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713793025; cv=none; b=a2BIJhd67gcD6ToqgLlXNjidMzmp+GQdj3G3LQRwbMIU7pB3PTbEG8yHdW3ZgtGKERfo2GK5E3QtjnUMo0oT6+QsorzN614OkrOEOZq/AumdxGM+/qNOgSHN5gZdJ+48DXJxk6wHszs3hCAm6rzL5D+Hi2YK+56P29ZTQj/5LjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713793025; c=relaxed/simple;
	bh=jHmrLYZ9rlVTgF1b06oQ3ynQqEnosaRydI+onPY5kvM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ugzWkNE2KgE0MSso1XCB5UHDFuFFy2Oh6rTMALmUz02+S/eiHV0Wta/ENZrg5Oq96W4opfAZl0RJbnpBhPj1vGxFPTWM6ie9Ipbs/ouYJ7XMBkKLuLgTISWalg2Al4JJ8vmdvyFaFs+njpfxnVduv09fNkMlKo1xjNt4vHey3DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gL1h23fG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gL1h23fG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713793023; x=1745329023;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jHmrLYZ9rlVTgF1b06oQ3ynQqEnosaRydI+onPY5kvM=;
  b=gL1h23fG5hKhqbG1Vt7QuAc15zXKDjtw7kKpY0tRT0W2JXmLtGIJDDab
   FOFkEe8i5NlPMHvkyMBXLsL2pc4aAtxYShW+VQ3n+SJ9hXHHBwsk4o9U2
   ZelbsRSJhen4Lr33Wf7bTB2Y+WMdDroPEPSNwNeU71FQ9nt8Yw92ToxXl
   8dsS/Hm3qE5Bcdqg9i32/cQuzqYFsNn2SenIubgC5GkBEJlpBdYUC3OD/
   9L13+4+fybVHGl//kzguxOjOlAxKWdq4WBG82dDt7JY5Ma9CslOkhIle4
   LSsCPADvHczjcf6npDlD3PbvT2hD57ZbKe8Qp+emw+pf96YmsSqxtAWy/
   Q==;
X-CSE-ConnectionGUID: UwC5DVW8RhGHzVRg+8PAGw==
X-CSE-MsgGUID: TrUiD8rDT4utmsN5LIB2BA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9158656"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="9158656"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 06:37:03 -0700
X-CSE-ConnectionGUID: jaCctwm2RiuG9PSSPFfviw==
X-CSE-MsgGUID: XN8egspWRwiDUwD2LblIbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="54954305"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.39])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 06:37:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 22 Apr 2024 16:36:57 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: Add lenovo-yoga-tab2-pro-1380-fastcharger
 driver
In-Reply-To: <20240422131649.46002-1-hdegoede@redhat.com>
Message-ID: <f6260783-5ff9-2ab4-81bc-9d3ad8d363b2@linux.intel.com>
References: <20240422131649.46002-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-38787652-1713793017=:2288"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-38787652-1713793017=:2288
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 22 Apr 2024, Hans de Goede wrote:

> Add a new driver for the custom fast charging protocol found on Lenovo Yo=
ga
> Tablet 2 1380F / 1380L models.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2 (from review by Andy):
> - Add a couple of missing includes
> - Couple of small coding style fixes
> ---
>  drivers/platform/x86/Kconfig                  |  11 +
>  drivers/platform/x86/Makefile                 |   1 +
>  .../lenovo-yoga-tab2-pro-1380-fastcharger.c   | 337 ++++++++++++++++++
>  3 files changed, 349 insertions(+)
>  create mode 100644 drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastch=
arger.c
>=20
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index cd0ec10240b6..318f2f77c97a 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -133,6 +133,17 @@ config YOGABOOK
>  =09  To compile this driver as a module, choose M here: the module will
>  =09  be called lenovo-yogabook.
> =20
> +config YT2_1380
> +=09tristate "Lenovo Yoga Tablet 2 1380 fast charge driver"
> +=09depends on SERIAL_DEV_BUS
> +=09depends on ACPI
> +=09help
> +=09  Say Y here to enable support for the custom fast charging protocol
> +=09  found on the Lenovo Yoga Tablet 2 1380F / 1380L models.
> +
> +=09  To compile this driver as a module, choose M here: the module will
> +=09  be called lenovo-yogabook.
> +
>  config ACERHDF
>  =09tristate "Acer Aspire One temperature and fan driver"
>  =09depends on ACPI && THERMAL
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index 5521a87f0718..2640475a9f97 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -66,6 +66,7 @@ obj-$(CONFIG_SENSORS_HDAPS)=09+=3D hdaps.o
>  obj-$(CONFIG_THINKPAD_ACPI)=09+=3D thinkpad_acpi.o
>  obj-$(CONFIG_THINKPAD_LMI)=09+=3D think-lmi.o
>  obj-$(CONFIG_YOGABOOK)=09=09+=3D lenovo-yogabook.o
> +obj-$(CONFIG_YT2_1380)=09=09+=3D lenovo-yoga-tab2-pro-1380-fastcharger.o
>  obj-$(CONFIG_LENOVO_WMI_CAMERA)=09+=3D lenovo-wmi-camera.o
> =20
>  # Intel
> diff --git a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c=
 b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> new file mode 100644
> index 000000000000..035d8cc86079
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> @@ -0,0 +1,337 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Support for the custom fast charging protocol found on the Lenovo Yog=
a
> + * Tablet 2 1380F / 1380L models.
> + *
> + * Copyright (C) 2024 Hans de Goede <hansg@kernel.org>
> + */
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/extcon.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/pinctrl/machine.h>
> +#include <linux/platform_device.h>
> +#include <linux/serdev.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +#include "serdev_helpers.h"
> +
> +#define YT2_1380_FC_PDEV_NAME=09=09"lenovo-yoga-tab2-pro-1380-fastcharge=
r"
> +#define YT2_1380_FC_SERDEV_CTRL=09=09"serial0"
> +#define YT2_1380_FC_SERDEV_NAME=09=09"serial0-0"
> +#define YT2_1380_FC_EXTCON_NAME=09=09"i2c-lc824206xa"
> +
> +#define YT2_1380_FC_MAX_TRIES=09=095
> +#define YT2_1380_FC_PIN_SW_DELAY_US=09(10 * USEC_PER_MSEC)
> +#define YT2_1380_FC_UART_DRAIN_DELAY_US=09(50 * USEC_PER_MSEC)
> +#define YT2_1380_FC_VOLT_SW_DELAY_US=09(1000 * USEC_PER_MSEC)

Add include for *SEC_PER_*SEC.

Once that's taken care of,

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-38787652-1713793017=:2288--
