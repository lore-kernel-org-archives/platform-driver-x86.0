Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4F93921DC;
	Tue, 19 May 2026 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186032; cv=none; b=X38HywSlRjp5lYXBtqog4orDUGmYTU2YeJgpUlU7FO9zBxOumPY2khxiLS3jGYUKxeEhj40TKTHjTWdZiYgO+Ql4qCJQBqBMlksunfTlEhfqvwQV5Q11zJvR3V+yf/5qaT66NVDAzNvfLEqCFhCTgT4Jj/1d3zjkMGd18v9a+TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186032; c=relaxed/simple;
	bh=veNxC4uSfxuPKQc/YCvh92tRvRrgrIwvNYtepbB892E=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eu/1m0JlATD74RjYgmr6Vqvrn2GSnNuB5CRAEktq8Xylt6zoddc/tG0PEAF9/5ZaicrtbmnuQYhvmf6PvBwszpgr7hbXC3pdzcuR7pcmZYxlEvAgzXijTjy/qBle7Eeeahr+GGp5/+73PrxaY+nsGx9f8/RtAME10OM2Ym9h/RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPNrF9Pj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPNrF9Pj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779186031; x=1810722031;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=veNxC4uSfxuPKQc/YCvh92tRvRrgrIwvNYtepbB892E=;
  b=WPNrF9PjcMfUBomPEIWcxQ6WBk4wer0u/5D0DxjibMldh7gvPwN7gQfz
   xiVR4biMdi/KP7svVqNkLqFBetKSqFA/oGMnOY6K2gCpnvAhdFbH8xmVj
   zBNCB+CEtccNDhg6E181DWncUnkh9HzmMimA004K7I59vnoQdWaO86ykT
   9l+QLKEkMZp2c2EyJrJHufQLjabn9nrGpZhyIQd7lHTgS42EQVvO2ZtTL
   pMf67ShLB1AVYDooPgMpkmTk2zL13UmjEauFTJrzt14LHRVrLrcR+1/ew
   +mqdUXgYYzpAxZ6qcUx3tBAmd9Fv/FHgjO9es+kgD4dSC19aK5STSpnfK
   Q==;
X-CSE-ConnectionGUID: Ou2OfAISQx2F2eGOzZ6Ufw==
X-CSE-MsgGUID: 9YaVmvLiRASNcZECCG5hjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79779681"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79779681"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:19:52 -0700
X-CSE-ConnectionGUID: CWvH8MTfSm6LI5UCJaiHfQ==
X-CSE-MsgGUID: sTjWrv5VTGaOnSBX5y4LXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="233348151"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:19:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 May 2026 13:19:44 +0300 (EEST)
To: Jack Wu <wojackbb@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, 
    =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Mario Limonciello <superm1@kernel.org>, Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v6 1/2] platform/x86: dell-dw5826e: Add reset driver for
 DW5826e
In-Reply-To: <20260504013243.2445940-1-jackbb_wu@compal.com>
Message-ID: <8269a3d8-abac-8837-e89d-11b9a14aaed1@linux.intel.com>
References: <20260504013243.2445940-1-jackbb_wu@compal.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 May 2026, Jack Wu wrote:

> If the DW5826e is in a frozen state and unable to receive USB commands,
> this driver provides a method for the user to reset the DW5826e via ACPI.
> 
> E.g: echo 1 > /sys/bus/platform/devices/PALC0001\:00/wwan_reset
> 
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
> v6:
>   - Use same define for the DSM check
> v5:
>   - Use BIT() for the DSM method
> v4:
>   - Fix version of the ABI documentation to 7.2
>   - Add include linux/types.h
> v3:
>   - Rename sysfs attribute from "pldr" to "wwan_reset" for clarity
>   - Add ABI documentation for the wwan_reset sysfs interface
>   - Validate _DSM method availability in probe using acpi_check_dsm()
> v2:
>   - Remove extra empty line
>   - Add missing includes and Remove unnecessary includes, sort includes alphabetically
>   - Remove noisy dev_info()
>   - Handle obj->type != ACPI_TYPE_BUFFER as error with proper return code
>   - Replace miscdevice/file_operations with sysfs attribute (DEVICE_ATTR_WO) to reduce boilerplate
>   - Propagate trigger_palc_pldr() return code to userspace
>   - Convert from acpi_driver to platform_driver
> ---
> ---
>  .../testing/sysfs-driver-dell-dw5826e-reset   |  9 ++
>  drivers/platform/x86/dell/Kconfig             |  6 ++
>  drivers/platform/x86/dell/Makefile            |  2 +
>  .../platform/x86/dell/dell-dw5826e-reset.c    | 93 +++++++++++++++++++
>  4 files changed, 110 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
>  create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
> new file mode 100644
> index 000000000000..a665e265633f
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
> @@ -0,0 +1,9 @@
> +What:		/sys/bus/platform/devices/<PALC0001 device>/wwan_reset
> +Date:		April 2026

It's already May, and 7.2 won't be out even in May.

> +KernelVersion:	7.2
> +Contact:	Jackbb Wu <jackbb.wu@compal.com>
> +Description:
> +		Writing to this file triggers a Platform Level Device Reset
> +		(PLDR) of the Dell DW5826e WWAN module via an ACPI _DSM
> +		method. This can be used to recover the modem when it is in
> +		a frozen state and unable to respond to USB commands.
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> index 738c108c2163..c4540c837a88 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -276,4 +276,10 @@ config DELL_WMI_SYSMAN
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called dell-wmi-sysman.
>  
> +config DELL_DW5826E_RESET
> +	tristate "Dell DW5826e PLDR reset support"
> +	default m
> +	depends on ACPI
> +	help
> +	  This adds support for the Dell DW5826e PLDR reset via ACPI
>  endif # X86_PLATFORM_DRIVERS_DELL
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
> index c7501c25e627..8150283cfd1d 100644
> --- a/drivers/platform/x86/dell/Makefile
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -28,3 +28,5 @@ obj-$(CONFIG_DELL_WMI_DESCRIPTOR)		+= dell-wmi-descriptor.o
>  obj-$(CONFIG_DELL_WMI_DDV)			+= dell-wmi-ddv.o
>  obj-$(CONFIG_DELL_WMI_LED)			+= dell-wmi-led.o
>  obj-$(CONFIG_DELL_WMI_SYSMAN)			+= dell-wmi-sysman/
> +obj-$(CONFIG_DELL_DW5826E_RESET)		+= dell-dw5826e-reset.o
> +
> diff --git a/drivers/platform/x86/dell/dell-dw5826e-reset.c b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> new file mode 100644
> index 000000000000..d37c6a66c4c3
> --- /dev/null
> +++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  dell-dw5826e-reset.c - Dell DW5826e reset driver
> + *
> + *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/uuid.h>
> +
> +#define PALC_DSM_FN_TRIGGER_PLDR    1

Place BIT() into the define instead (I think I mentioned this already 
earlier), it's used by all sites so there's no good reason to keep in 
inline with the code (AFAICT):

> +	obj = acpi_evaluate_dsm(handle, &palc_dsm_guid, 1, BIT(PALC_DSM_FN_TRIGGER_PLDR), NULL);

> +	if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, BIT(PALC_DSM_FN_TRIGGER_PLDR)))


-- 
 i.

