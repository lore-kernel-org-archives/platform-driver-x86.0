Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B52F34CFD6;
	Mon, 25 May 2026 10:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779704662; cv=none; b=ctBxMeJmHWfEXNZ+tXIQuLl0MfV3yNEhdtM6gMuIlJ+K0nX79gqge6Y1IZYqKfySMlilaTJXRwUtbcMo7jt7zxy+DXQn2wFYouXAPV/HTPgGl0Wz8e72CmOoLL9Kt9JWy1uXkUjyNg8/aq0II5r/uotALo1+y/fqA+pF7xBT6rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779704662; c=relaxed/simple;
	bh=YyzScbFJdspmxKlg0KsEo/IGySi8KxjXh5u1aBZvz3c=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PXPto+BVuYhL347rMs6u/kqJ0xTxFgCNq+T1XskILwQOMpQCqBDnxyOMB8yC5a3tNQrlMNBk+NgdKyQ4DAq7M+AAZgaZaZjogltv2Gs0f5AdYOjeyL4ZEeZuvHNEqIiHIoQYBKf/oY4AlJSOfKRyCan420bB8Z+rJw/Zh6PmraM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=boTfGngj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="boTfGngj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779704660; x=1811240660;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YyzScbFJdspmxKlg0KsEo/IGySi8KxjXh5u1aBZvz3c=;
  b=boTfGngjLRamn49J1/NI+WwfW7hYa4zRSuusM/b4sgwyiRM2dQwTqSVo
   AcBiiYBbynUDtn+7W3QheHd2QsJZ1jqI73B3TbO27Dy85vtRmYpTMwSiV
   D8F2iAvwecV96Gu9ZD3ilga7YBZGF58rIo+3bIDQNYaLWvG59Nmgdsa+M
   lPTuP9FFKW+iR5LbZkXWKPCSgZf5V1vgVWc3nUGMBVORNOi3F0tgUi4sS
   XuqdvA+jIQU1U9YmRGlJtnw6ptK7Z4nNvoVU3QcsLE6qaTcwl34IGehyB
   ceOvnoRX5B16Qs31wTrU6Qr0mhp5F5tS3dr+45XPcJQswzSEz3uq24fph
   w==;
X-CSE-ConnectionGUID: kR7MnAtmSe6XNyquH1+5/g==
X-CSE-MsgGUID: SeSAS2sRRomu1prqCe1zCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="90824312"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="90824312"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 03:24:20 -0700
X-CSE-ConnectionGUID: V3o8uE0jSMi/e8xYzmQxPw==
X-CSE-MsgGUID: fD39JvjQQV2ytYws1A4qnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="279677255"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 03:24:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 25 May 2026 13:24:13 +0300 (EEST)
To: Jack Wu <jackbb_wu@compal.com>
cc: Hans de Goede <hansg@kernel.org>, Mario Limonciello <superm1@kernel.org>, 
    Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/2] platform/x86: dell-dw5826e: Add reset driver for
 DW5826e
In-Reply-To: <20260525065821.507535-1-jackbb_wu@compal.com>
Message-ID: <6d6eb440-92d4-c68f-4d71-654bdd00b504@linux.intel.com>
References: <20260525065821.507535-1-jackbb_wu@compal.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 May 2026, Jack Wu wrote:

> If the DW5826e is in a frozen state and unable to receive USB commands,
> this driver provides a method for the user to reset the DW5826e via ACPI.
> 
> E.g: echo 1 > /sys/bus/platform/devices/PALC0001\:00/wwan_reset
> 
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
> v7:
>   - Place BIT() into PALC_DSM_FN_TRIGGER_PLDR define

Hi,

The change looks otherwise okay now but unfortunately something has 
corrupted tabs to spaces so I cannot apply it (I think your previous 
submissions didn't have this problem).

Please send v8 with this problem fixed.

--
 i.

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
> +What:          /sys/bus/platform/devices/<PALC0001 device>/wwan_reset
> +Date:          April 2026
> +KernelVersion: 7.2
> +Contact:       Jackbb Wu <jackbb.wu@compal.com>
> +Description:
> +               Writing to this file triggers a Platform Level Device Reset
> +               (PLDR) of the Dell DW5826e WWAN module via an ACPI _DSM
> +               method. This can be used to recover the modem when it is in
> +               a frozen state and unable to respond to USB commands.
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> index 738c108c2163..c4540c837a88 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -276,4 +276,10 @@ config DELL_WMI_SYSMAN
>           To compile this driver as a module, choose M here: the module will
>           be called dell-wmi-sysman.
> 
> +config DELL_DW5826E_RESET
> +       tristate "Dell DW5826e PLDR reset support"
> +       default m
> +       depends on ACPI
> +       help
> +         This adds support for the Dell DW5826e PLDR reset via ACPI
>  endif # X86_PLATFORM_DRIVERS_DELL
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
> index c7501c25e627..8150283cfd1d 100644
> --- a/drivers/platform/x86/dell/Makefile
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -28,3 +28,5 @@ obj-$(CONFIG_DELL_WMI_DESCRIPTOR)             += dell-wmi-descriptor.o
>  obj-$(CONFIG_DELL_WMI_DDV)                     += dell-wmi-ddv.o
>  obj-$(CONFIG_DELL_WMI_LED)                     += dell-wmi-led.o
>  obj-$(CONFIG_DELL_WMI_SYSMAN)                  += dell-wmi-sysman/
> +obj-$(CONFIG_DELL_DW5826E_RESET)               += dell-dw5826e-reset.o
> +
> diff --git a/drivers/platform/x86/dell/dell-dw5826e-reset.c b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> new file mode 100644
> index 000000000000..1ca7c3421bb5
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
> +#define PALC_DSM_FN_TRIGGER_PLDR    BIT(1)
> +
> +static guid_t palc_dsm_guid =
> +       GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd8, 0xfd, 0xfe, 0x59);
> +
> +static int trigger_palc_pldr(struct device *dev, acpi_handle handle)
> +{
> +       union acpi_object *obj;
> +       int ret = 0;
> +
> +       obj = acpi_evaluate_dsm(handle, &palc_dsm_guid, 1, PALC_DSM_FN_TRIGGER_PLDR, NULL);
> +       if (!obj) {
> +               dev_err(dev, "Failed to evaluate _DSM\n");
> +               return -EIO;
> +       }
> +
> +       if (obj->type != ACPI_TYPE_BUFFER) {
> +               dev_err(dev, "Unexpected _DSM return type: %d\n", obj->type);
> +               ret = -EINVAL;
> +       }
> +
> +       ACPI_FREE(obj);
> +       return ret;
> +}
> +
> +static ssize_t wwan_reset_store(struct device *dev, struct device_attribute *attr,
> +                               const char *buf, size_t count)
> +{
> +       acpi_handle handle = ACPI_HANDLE(dev);
> +       int ret;
> +
> +       ret = trigger_palc_pldr(dev, handle);
> +       if (ret)
> +               return ret;
> +
> +       return count;
> +}
> +static DEVICE_ATTR_WO(wwan_reset);
> +
> +static struct attribute *palc_attrs[] = {
> +       &dev_attr_wwan_reset.attr,
> +       NULL
> +};
> +ATTRIBUTE_GROUPS(palc);
> +
> +static int palc_probe(struct platform_device *pdev)
> +{
> +       acpi_handle handle;
> +
> +       handle = ACPI_HANDLE(&pdev->dev);
> +       if (!handle)
> +               return -ENODEV;
> +
> +       if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, PALC_DSM_FN_TRIGGER_PLDR))
> +               return -ENODEV;
> +
> +       return 0;
> +}
> +
> +static const struct acpi_device_id palc_acpi_ids[] = {
> +       { "PALC0001", 0 },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(acpi, palc_acpi_ids);
> +
> +static struct platform_driver palc_driver = {
> +       .driver = {
> +               .name = "dell-dw5826e-reset",
> +               .acpi_match_table = palc_acpi_ids,
> +               .dev_groups = palc_groups,
> +       },
> +       .probe  = palc_probe,
> +};
> +module_platform_driver(palc_driver);
> +
> +MODULE_DESCRIPTION("Dell DW5826e reset driver");
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("JackBB Wu");
> --
> 2.34.1
