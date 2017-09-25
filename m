From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 04/12] platform/x86: dell-smbios: Switch to a WMI-ACPI
 interface
Date: Mon, 25 Sep 2017 18:18:51 +0200
Message-ID: <20170925161851.GK22190@pali>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <4da87eb0d9722ed906615409586a8b4d7becd65c.1505999739.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34277 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936132AbdIYQSz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Sep 2017 12:18:55 -0400
Content-Disposition: inline
In-Reply-To: <4da87eb0d9722ed906615409586a8b4d7becd65c.1505999739.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com

On Thursday 21 September 2017 08:57:09 Mario Limonciello wrote:
> The driver currently uses an SMI interface which grants direct access
> to physical memory to the platform via a pointer.
> 
> Changing this to operate over WMI-ACPI will use an ACPI OperationRegion
> for a buffer of data storage when platform calls are performed.
> 
> This is a safer approach to use in kernel drivers as the platform will
> only have access to that OperationRegion.

In my opinion direct access is safer then using ACPI wrapper for same
functionality.

Anyway, this change would break support for laptops without ACPI-WMI
functionality. IIRC I read in some Dell ACPI-WMI documentation that Dell
SMM via ACPI-WMI is not supported on all machines (probably older
machines) and it is needed to check some vendor bit in DMI data if Dell
SMM ACPI-WMI is really supported.

In linux kernel we do not want to remove support for older machines,
just because machines with new firmware can use also different new
communication method/protocol.

> As a result, this change removes the dependency on this driver on the
> dcdbas kernel module.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  drivers/platform/x86/Kconfig       |  8 ++--
>  drivers/platform/x86/dell-smbios.c | 76 ++++++++++++++++++++++++++------------
>  drivers/platform/x86/dell-smbios.h | 11 +++---
>  3 files changed, 63 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 9e52f05daa2e..81d61c0f4ef8 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -92,13 +92,13 @@ config ASUS_LAPTOP
>  	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
>  
>  config DELL_SMBIOS
> -	tristate
> -	select DCDBAS
> +	tristate "Dell WMI SMBIOS calling interface"
> +	depends on ACPI_WMI
>  	---help---
>  	This module provides common functions for kernel modules using
> -	Dell SMBIOS.
> +	Dell SMBIOS over ACPI-WMI.
>  
> -	If you have a Dell laptop, say Y or M here.
> +	If you have a Dell computer, say Y or M here.
>  
>  config DELL_LAPTOP
>  	tristate "Dell Laptop Extras"
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
> index e9b1ca07c872..c06262a89169 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -4,6 +4,7 @@
>   *  Copyright (c) Red Hat <mjg@redhat.com>
>   *  Copyright (c) 2014 Gabriele Mazzotta <gabriele.mzt@gmail.com>
>   *  Copyright (c) 2014 Pali Rohár <pali.rohar@gmail.com>
> + *  Copyright (c) 2017 Dell Inc.
>   *
>   *  Based on documentation in the libsmbios package:
>   *  Copyright (C) 2005-2014 Dell Inc.
> @@ -18,13 +19,12 @@
>  #include <linux/module.h>
>  #include <linux/dmi.h>
>  #include <linux/err.h>
> -#include <linux/gfp.h>
>  #include <linux/mutex.h>
> -#include <linux/slab.h>
> -#include <linux/io.h>
> -#include "../../firmware/dcdbas.h"
> +#include <linux/wmi.h>
>  #include "dell-smbios.h"
>  
> +#define DELL_WMI_SMBIOS_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
> +
>  struct calling_interface_structure {
>  	struct dmi_header header;
>  	u16 cmdIOAddress;
> @@ -76,20 +76,39 @@ void dell_smbios_release_buffer(void)
>  }
>  EXPORT_SYMBOL_GPL(dell_smbios_release_buffer);
>  
> -void dell_smbios_send_request(int class, int select)
> +int run_wmi_smbios_call(struct calling_interface_buffer *buffer)
>  {
> -	struct smi_cmd command;
> +	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
> +	struct acpi_buffer input;
> +	union acpi_object *obj;
> +	acpi_status status;
> +
> +	input.length = sizeof(struct calling_interface_buffer);
> +	input.pointer = buffer;
> +
> +	status = wmi_evaluate_method(DELL_WMI_SMBIOS_GUID,
> +				     0, 1, &input, &output);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("%x/%x [%x,%x,%x,%x] call failed\n",
> +			buffer->class, buffer->select, buffer->input[0],
> +			buffer->input[1], buffer->input[2], buffer->input[3]);
> +			return -EIO;
> +	}
> +	obj = (union acpi_object *)output.pointer;
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		pr_err("invalid type : %d\n", obj->type);
> +		return -EIO;
> +	}
> +	memcpy(buffer, obj->buffer.pointer, input.length);
>  
> -	command.magic = SMI_CMD_MAGIC;
> -	command.command_address = da_command_address;
> -	command.command_code = da_command_code;
> -	command.ebx = virt_to_phys(buffer);
> -	command.ecx = 0x42534931;
> +	return 0;
> +}
>  
> +void dell_smbios_send_request(int class, int select)
> +{
>  	buffer->class = class;
>  	buffer->select = select;
> -
> -	dcdbas_smi_request(&command);
> +	run_wmi_smbios_call(buffer);
>  }
>  EXPORT_SYMBOL_GPL(dell_smbios_send_request);
>  
> @@ -170,7 +189,7 @@ static void __init find_tokens(const struct dmi_header *dm, void *dummy)
>  	}
>  }
>  
> -static int __init dell_smbios_init(void)
> +static int dell_smbios_probe(struct wmi_device *wdev)
>  {
>  	int ret;
>  
> @@ -181,11 +200,7 @@ static int __init dell_smbios_init(void)
>  		return -ENODEV;
>  	}
>  
> -	/*
> -	 * Allocate buffer below 4GB for SMI data--only 32-bit physical addr
> -	 * is passed to SMI handler.
> -	 */
> -	buffer = (void *)__get_free_page(GFP_KERNEL | GFP_DMA32);
> +	buffer = (void *)__get_free_page(GFP_KERNEL);
>  	if (!buffer) {
>  		ret = -ENOMEM;
>  		goto fail_buffer;
> @@ -198,17 +213,32 @@ static int __init dell_smbios_init(void)
>  	return ret;
>  }
>  
> -static void __exit dell_smbios_exit(void)
> +static int dell_smbios_remove(struct wmi_device *wdev)
>  {
>  	kfree(da_tokens);
>  	free_page((unsigned long)buffer);
> +	return 0;
>  }
>  
> -subsys_initcall(dell_smbios_init);
> -module_exit(dell_smbios_exit);
> +static const struct wmi_device_id dell_smbios_id_table[] = {
> +	{ .guid_string = DELL_WMI_SMBIOS_GUID },
> +	{ },
> +};
> +
> +static struct wmi_driver dell_smbios_driver = {
> +	.driver = {
> +		.name = "dell-smbios",
> +	},
> +	.probe = dell_smbios_probe,
> +	.remove = dell_smbios_remove,
> +	.id_table = dell_smbios_id_table,
> +};
> +module_wmi_driver(dell_smbios_driver);
> +
>  
>  MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
>  MODULE_AUTHOR("Gabriele Mazzotta <gabriele.mzt@gmail.com>");
>  MODULE_AUTHOR("Pali Rohár <pali.rohar@gmail.com>");
> -MODULE_DESCRIPTION("Common functions for kernel modules using Dell SMBIOS");
> +MODULE_AUTHOR("Mario Limonciello <mario.limonciello@dell.com>");
> +MODULE_DESCRIPTION("Common functions for kernel modules using Dell SMBIOS over WMI");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
> index 45cbc2292cd3..e1e29697b362 100644
> --- a/drivers/platform/x86/dell-smbios.h
> +++ b/drivers/platform/x86/dell-smbios.h
> @@ -4,6 +4,7 @@
>   *  Copyright (c) Red Hat <mjg@redhat.com>
>   *  Copyright (c) 2014 Gabriele Mazzotta <gabriele.mzt@gmail.com>
>   *  Copyright (c) 2014 Pali Rohár <pali.rohar@gmail.com>
> + *  Copyright (c) 2017 Dell Inc.
>   *
>   *  Based on documentation in the libsmbios package:
>   *  Copyright (C) 2005-2014 Dell Inc.
> @@ -18,14 +19,14 @@
>  
>  struct notifier_block;
>  
> -/* This structure will be modified by the firmware when we enter
> - * system management mode, hence the volatiles */
> -
>  struct calling_interface_buffer {
>  	u16 class;
>  	u16 select;
> -	volatile u32 input[4];
> -	volatile u32 output[4];
> +	u32 input[4];
> +	u32 output[4];
> +	u32 argattrib;
> +	u32 blength;
> +	u8 data[4052];
>  } __packed;
>  
>  struct calling_interface_token {

-- 
Pali Rohár
pali.rohar@gmail.com
