Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299FE3B8D78;
	Wed,  8 Apr 2026 13:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775655432; cv=none; b=XZ1s1kxZwgJS3hIr7hCnQmvDYcYU19iTtTdwNzBO7fcNuL0lF/1ANTp33vm6/qLkzE/9HRd6n6W3Y9V4/l4N6MywBoc9ZxahDBc1OcC+JMFQkgZF29eoWjb2gHw8Kqv2A1bNBdryTjnmtat4kMV/9/yFbZ5I1CirRaKaUcbZ94A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775655432; c=relaxed/simple;
	bh=8sOwfLc+s7+aior3XAimJEjHolL23aIWrgA0NSkg6RE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XojC6qyiYCBaf6P4QUnQN+5sTPnJQOvsRYdWiU6kDZUid7PadJBeuKmDqG0ONU2HohbuyGPiw2Ur386jSclE6mQn7nvJULkk+Gp86hBLlgjpYjEIvbJv0/APuq6sWqAuKZcGqFhtmm2+zy0Nz//kuA0HM1uHIy9xiDY6hefrkzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JU95sYcR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JU95sYcR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775655430; x=1807191430;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8sOwfLc+s7+aior3XAimJEjHolL23aIWrgA0NSkg6RE=;
  b=JU95sYcRjH5zt21AIlrtXKFZ40fG/VYvFxr35IRZLeDwAL2jhA+8gtiF
   mrWyA5AQsT2WHULTrD7usK/kv7fwtqrAEy6Gc0+9gINRopuTRKBATpkQF
   nxbhfSRzn/vKTu2+qRxL2ftdJli+k4B4blwB6B7mBxzakr5Tf2o3pb6Ga
   aNSFifHN9QBIOemHHvI79bD5oAT0yHx2GsQpH4vMDAo8pYPPea9kJBT9E
   0iumAhdQGK/FWJW9M0gj9JKwiT9SJT7ciLxGx0RJAEPRXaLFiMUNq1w9s
   +ohC0P6T3kp8ryuakY8nUy1fcis90RS13IPmNxTor/OyEsp5Z16e3RG9X
   g==;
X-CSE-ConnectionGUID: dzkW9N2OQnGW4S7F7ZUh7Q==
X-CSE-MsgGUID: eHnnTxAYTpuBIVGpFqA4xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76709785"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="76709785"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 06:37:09 -0700
X-CSE-ConnectionGUID: ObbyhGmSSzKG6zFSvXm8sg==
X-CSE-MsgGUID: zS1XNmqtTOeS5HCRiQPjGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="232505673"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.45])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 06:37:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 8 Apr 2026 16:37:03 +0300 (EEST)
To: Jack Wu <wojackbb@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: dell-dw5826e: Add reset driver for
 DW5826e
In-Reply-To: <20260408111738.232040-1-jackbb_wu@compal.com>
Message-ID: <4c31d95e-6b38-506b-3b3d-adb1e4a96ecd@linux.intel.com>
References: <20260408111738.232040-1-jackbb_wu@compal.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Apr 2026, Jack Wu wrote:

> If the DW5826e is in a frozen state and unable to receive USB commands,
> this driver provides a method for the user to reset the DW5826e via ACPI.
> 
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
>  drivers/platform/x86/dell/Kconfig             |   6 +
>  drivers/platform/x86/dell/Makefile            |   2 +
>  .../platform/x86/dell/dell-dw5826e-reset.c    | 120 ++++++++++++++++++
>  3 files changed, 128 insertions(+)
>  create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c
> 
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
> index 000000000000..28865a123c63
> --- /dev/null
> +++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  dell-dw5826e-reset.c - Dell DW5826e reset driver
> + *
> + *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
> + *

Remove extra empty lines.

> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/acpi.h>
> +#include <linux/miscdevice.h>
> +#include <linux/fs.h>
> +#include <linux/uaccess.h>

Please order alphabetically.

> +
> +static guid_t palc_dsm_guid =
> +	GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd8, 0xfd, 0xfe, 0x59);

Add include.

> +
> +struct palc_dev {
> +	struct device *dev;
> +	acpi_handle handle;
> +	struct miscdevice miscdev;
> +};
> +
> +static int trigger_palc_pldr(struct palc_dev *palc)
> +{
> +	union acpi_object *obj;
> +
> +	dev_info(palc->dev, "Triggering PLDR via ACPI _DSM Function 1...\n");

Add include.

> +
> +	obj = acpi_evaluate_dsm(palc->handle, &palc_dsm_guid, 1, 1, NULL);
> +
> +	if (!obj) {

Don't leave empty lines in between call and it's error handling.

> +		dev_err(palc->dev, "Failed to evaluate _DSM\n");
> +		return -EIO;
> +	}
> +
> +	if (obj->type == ACPI_TYPE_BUFFER)
> +		dev_info(palc->dev, "PLDR _DSM executed successfully\n");
> +
> +	ACPI_FREE(obj);
> +	return 0;
> +}
> +
> +static ssize_t palc_write(struct file *filp, const char __user *buf, size_t count, loff_t *ppos)
> +{
> +	struct palc_dev *palc = filp->private_data;
> +
> +	trigger_palc_pldr(palc);
> +
> +	return count;
> +}
> +
> +static int palc_open(struct inode *inode, struct file *filp)
> +{
> +	struct palc_dev *palc = container_of(filp->private_data, struct palc_dev, miscdev);
> +
> +	filp->private_data = palc;
> +	return 0;
> +}
> +
> +static const struct file_operations palc_fops = {
> +	.owner  = THIS_MODULE,
> +	.open   = palc_open,
> +	.write  = palc_write,
> +};
> +
> +static int palc_acpi_probe(struct acpi_device *adev)
> +{
> +	struct palc_dev *palc;
> +
> +	palc = devm_kzalloc(&adev->dev, sizeof(*palc), GFP_KERNEL);
> +	if (!palc)
> +		return -ENOMEM;
> +
> +	palc->dev    = &adev->dev;
> +	palc->handle = adev->handle;
> +
> +	palc->miscdev.minor  = MISC_DYNAMIC_MINOR;
> +	palc->miscdev.name   = "reset_palc";
> +	palc->miscdev.fops   = &palc_fops;
> +	palc->miscdev.parent = &adev->dev;
> +
> +	if (misc_register(&palc->miscdev))
> +		return -EINVAL;
> +
> +	dev_set_drvdata(&adev->dev, palc);
> +
> +	dev_info(&adev->dev, "DW5826e Reset Device (PALC0001) Driver Loaded\n");

Don't print anything on success path please.

> +	return 0;
> +}
> +
> +static void palc_acpi_remove(struct acpi_device *adev)
> +{
> +	struct palc_dev *palc = dev_get_drvdata(&adev->dev);
> +
> +	if (palc)
> +		misc_deregister(&palc->miscdev);
> +}
> +
> +static const struct acpi_device_id palc_acpi_ids[] = {
> +	{ "PALC0001", 0 },
> +	{ "", 0 }
> +};
> +
> +static struct acpi_driver palc_acpi_driver = {
> +	.name  = "palc_reset",
> +	.ids   = palc_acpi_ids,
> +	.ops = {
> +		.add    = palc_acpi_probe,
> +		.remove = palc_acpi_remove,
> +	},
> +};

Rafael has been trying to get rid of all acpi_drivers, please don't add 
more.

> +
> +MODULE_DEVICE_TABLE(acpi, palc_acpi_ids);
> +module_acpi_driver(palc_acpi_driver);
> +
> +MODULE_DESCRIPTION("Dell DW5826e reset driver");
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("JackBB Wu");
> 

-- 
 i.

