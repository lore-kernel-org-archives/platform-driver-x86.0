Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3902235B138;
	Mon, 20 Apr 2026 14:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693795; cv=none; b=V2LspLRA7dEzGn7s8USLyIsujF7hp+xj5+fs/Pt3VSXfomO/0W3ePckXEWHG0Np9GvWAyXUrTcDISy/Bedk25QQQnJPusqj4UY/cixIigg40R6k/mHIj4n4sVamam1BD3wfyS3XfTbITyKYTiVp6eHcV0CFDENOf3hmXW4OXuf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693795; c=relaxed/simple;
	bh=iLU6N2l2jgd4++DK662JYK8rj+h/DJ1uPLEdbKxpw5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xs7CczbiHNSLapRyUoYDqCG9xoWmlio+6/1VFVh8MzawMQv+kOlFXw3gquc2jLGKMkgLtGmluA3eTCBdmRERCeOixcQCKJHtS6/Bi98mgiowkLXy+3MR+Sfl761ECHTMh2FB14g4XrTrLjxMDHdxwYi1GUHonh2S1Q0QgOSqxe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oy/DQR2e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oy/DQR2e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4744EC2BCB4;
	Mon, 20 Apr 2026 14:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776693794;
	bh=iLU6N2l2jgd4++DK662JYK8rj+h/DJ1uPLEdbKxpw5k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oy/DQR2eGcF1Xm7ivYNsn6Afig/B1HtEoJRgttnjk5E09vB+/EONN1LyO3PEbehdc
	 x0+rYINU2rBuPzw9ufo4O7NEw2erIsvBgv/zLHacLFXbqOl/97KJn5zu0NM0v+D8uq
	 08tA46P4EiGTNyZb3FaPCohqjO0vHcNZYtoi4Pw21QWMbvZIvNVZMzhlFFiaIUnPxW
	 sllzf9cyybeTLl03q+Y2vLlHi9wSeNIT9U37KHgEyYz8QDhhAzi6Cqlff4sbugDPbZ
	 p96FSJA+58xNwb0kN/0UkyIpl+AbHQWjQRxy8CrP1wE4u7zN7/DLFUemuKKnVPdDy5
	 di75GLz1biRww==
Message-ID: <a2828a8c-bf46-4018-a8e2-ef9b7808ba90@kernel.org>
Date: Mon, 20 Apr 2026 09:03:12 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: dell-dw5826e: Add reset driver for
 DW5826e
Content-Language: en-US
To: Jack Wu <wojackbb@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420060029.1754854-1-jackbb_wu@compal.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260420060029.1754854-1-jackbb_wu@compal.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/20/26 01:00, Jack Wu wrote:
> If the DW5826e is in a frozen state and unable to receive USB commands,
> this driver provides a method for the user to reset the DW5826e via ACPI.
> 
> E.g: echo 1 > /sys/bus/platform/devices/PALC0001\:00/wwan_reset
> 
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
> v4:
>    - Fix version of the ABI documentation to 7.2
>    - Add include linux/types.h
> v3:
>    - Rename sysfs attribute from "pldr" to "wwan_reset" for clarity
>    - Add ABI documentation for the wwan_reset sysfs interface
>    - Validate _DSM method availability in probe using acpi_check_dsm()
> v2:
>    - Remove extra empty line
>    - Add missing includes and Remove unnecessary includes, sort includes alphabetically
>    - Remove noisy dev_info()
>    - Handle obj->type != ACPI_TYPE_BUFFER as error with proper return code
>    - Replace miscdevice/file_operations with sysfs attribute (DEVICE_ATTR_WO) to reduce boilerplate
>    - Propagate trigger_palc_pldr() return code to userspace
>    - Convert from acpi_driver to platform_driver
> ---
> ---
>   .../testing/sysfs-driver-dell-dw5826e-reset   |  9 ++
>   drivers/platform/x86/dell/Kconfig             |  6 ++
>   drivers/platform/x86/dell/Makefile            |  2 +
>   .../platform/x86/dell/dell-dw5826e-reset.c    | 90 +++++++++++++++++++
>   4 files changed, 107 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
>   create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
> new file mode 100644
> index 000000000000..a665e265633f
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
> @@ -0,0 +1,9 @@
> +What:		/sys/bus/platform/devices/<PALC0001 device>/wwan_reset
> +Date:		April 2026
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
>   	  To compile this driver as a module, choose M here: the module will
>   	  be called dell-wmi-sysman.
>   
> +config DELL_DW5826E_RESET
> +	tristate "Dell DW5826e PLDR reset support"
> +	default m
> +	depends on ACPI
> +	help
> +	  This adds support for the Dell DW5826e PLDR reset via ACPI
>   endif # X86_PLATFORM_DRIVERS_DELL
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
> index c7501c25e627..8150283cfd1d 100644
> --- a/drivers/platform/x86/dell/Makefile
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -28,3 +28,5 @@ obj-$(CONFIG_DELL_WMI_DESCRIPTOR)		+= dell-wmi-descriptor.o
>   obj-$(CONFIG_DELL_WMI_DDV)			+= dell-wmi-ddv.o
>   obj-$(CONFIG_DELL_WMI_LED)			+= dell-wmi-led.o
>   obj-$(CONFIG_DELL_WMI_SYSMAN)			+= dell-wmi-sysman/
> +obj-$(CONFIG_DELL_DW5826E_RESET)		+= dell-dw5826e-reset.o
> +
> diff --git a/drivers/platform/x86/dell/dell-dw5826e-reset.c b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> new file mode 100644
> index 000000000000..4e0d64535abb
> --- /dev/null
> +++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  dell-dw5826e-reset.c - Dell DW5826e reset driver
> + *
> + *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/uuid.h>
> +
> +static guid_t palc_dsm_guid =
> +	GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd8, 0xfd, 0xfe, 0x59);
> +
> +static int trigger_palc_pldr(struct device *dev, acpi_handle handle)
> +{
> +	union acpi_object *obj;
> +	int ret = 0;
> +
> +	obj = acpi_evaluate_dsm(handle, &palc_dsm_guid, 1, 1, NULL);
> +	if (!obj) {
> +		dev_err(dev, "Failed to evaluate _DSM\n");
> +		return -EIO;
> +	}
> +
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		dev_err(dev, "Unexpected _DSM return type: %d\n", obj->type);
> +		ret = -EINVAL;
> +	}
> +
> +	ACPI_FREE(obj);
> +	return ret;
> +}
> +
> +static ssize_t wwan_reset_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	acpi_handle handle = ACPI_HANDLE(dev);
> +	int ret;
> +
> +	ret = trigger_palc_pldr(dev, handle);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_WO(wwan_reset);
> +
> +static struct attribute *palc_attrs[] = {
> +	&dev_attr_wwan_reset.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(palc);
> +
> +static int palc_probe(struct platform_device *pdev)
> +{
> +	acpi_handle handle;
> +
> +	handle = ACPI_HANDLE(&pdev->dev);
> +	if (!handle)
> +		return -ENODEV;
> +
> +	if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, BIT(1)))
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static const struct acpi_device_id palc_acpi_ids[] = {
> +	{ "PALC0001", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, palc_acpi_ids);
> +
> +static struct platform_driver palc_driver = {
> +	.driver = {
> +		.name = "dell-dw5826e-reset",
> +		.acpi_match_table = palc_acpi_ids,
> +		.dev_groups = palc_groups,
> +	},
> +	.probe  = palc_probe,
> +};
> +module_platform_driver(palc_driver);
> +
> +MODULE_DESCRIPTION("Dell DW5826e reset driver");
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("JackBB Wu");

