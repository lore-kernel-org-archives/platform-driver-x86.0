From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 08/14] platform/x86: dell-smbios: Introduce a WMI-ACPI
 interface
Date: Wed, 27 Sep 2017 15:18:23 -0700
Message-ID: <20170927221823.GQ23572@fury>
References: <cover.1506451187.git.mario.limonciello@dell.com>
 <7c68f8592eaccecb599a5b21b97b9db5a79a0053.1506451187.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:52104 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752116AbdI0WS0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2017 18:18:26 -0400
Content-Disposition: inline
In-Reply-To: <7c68f8592eaccecb599a5b21b97b9db5a79a0053.1506451187.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com

On Tue, Sep 26, 2017 at 01:50:06PM -0500, Mario Limonciello wrote:
> The driver currently uses an SMI interface which grants direct access
> to physical memory to the platform via a pointer.
> 
> Now add a WMI-ACPI interface that is detected by WMI probe and preferred
> over the SMI interface.
> 
> Changing this to operate over WMI-ACPI will use an ACPI OperationRegion
> for a buffer of data storage when platform calls are performed.
> 
> This is a safer approach to use in kernel drivers as the platform will
> only have access to that OperationRegion.

As we discussed, in v3 please update the "platform" language here to clarify
when read from the Linux kernel developer perspective (one who is working on
code in the platform drivers subsystem ;-)

> 
> As a result, this change removes the dependency on this driver on the
> dcdbas kernel module.  It's now an optional compilation option.

Some update tot he Kconfig help informing the user of how to decide if they
should go and enable DCDBAS or not would be appropriate.

> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
...
> -#include "../../firmware/dcdbas.h"
> +#include <linux/wmi.h>
>  #include "dell-smbios.h"
>  
> +#ifdef CONFIG_DCDBAS
> +#include "../../firmware/dcdbas.h"
> +#endif

Perhaps this is the conditional include causing the build breakage?

> +
> +#define DELL_WMI_SMBIOS_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
> +
>  struct calling_interface_structure {
>  	struct dmi_header header;
>  	u16 cmdIOAddress;
> @@ -30,12 +37,14 @@ struct calling_interface_structure {
>  	struct calling_interface_token tokens[];
>  } __packed;
>  
> -static struct calling_interface_buffer *buffer;
> +static struct calling_interface_buffer *smi_buffer;
> +static struct wmi_calling_interface_buffer *wmi_buffer;
>  static DEFINE_MUTEX(buffer_mutex);
>  
>  static int da_command_address;
>  static int da_command_code;
>  static int da_num_tokens;
> +static int has_wmi;
>  static struct calling_interface_token *da_tokens;
>  
>  int dell_smbios_error(int value)
> @@ -57,13 +66,20 @@ struct calling_interface_buffer *dell_smbios_get_buffer(void)
>  {
>  	mutex_lock(&buffer_mutex);
>  	dell_smbios_clear_buffer();
> -	return buffer;
> +	if (has_wmi)
> +		return &wmi_buffer->smi;
> +	return smi_buffer;
>  }
>  EXPORT_SYMBOL_GPL(dell_smbios_get_buffer);
>  
>  void dell_smbios_clear_buffer(void)
>  {
> -	memset(buffer, 0, sizeof(struct calling_interface_buffer));
> +	if (has_wmi)
> +		memset(wmi_buffer, 0,
> +		       sizeof(struct wmi_calling_interface_buffer));
> +	else
> +		memset(smi_buffer, 0,
> +		       sizeof(struct calling_interface_buffer));
>  }
>  EXPORT_SYMBOL_GPL(dell_smbios_clear_buffer);

Would it be possible to dynamically setup "buffer" and "buflen" during
init or something, and avoid all this if/else dance at runtime?

>  
> @@ -73,20 +89,60 @@ void dell_smbios_release_buffer(void)
>  }
>  EXPORT_SYMBOL_GPL(dell_smbios_release_buffer);
>  
> -void dell_smbios_send_request(int class, int select)
> +int run_wmi_smbios_call(struct wmi_calling_interface_buffer *buf)
>  {
> -	struct smi_cmd command;
> +	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
> +	struct acpi_buffer input;
> +	union acpi_object *obj;
> +	acpi_status status;
> +
> +	input.length = sizeof(struct wmi_calling_interface_buffer);
> +	input.pointer = buf;
> +
> +	status = wmi_evaluate_method(DELL_WMI_SMBIOS_GUID,
> +				     0, 1, &input, &output);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("%x/%x [%x,%x,%x,%x] call failed\n",
> +			buf->smi.class, buf->smi.select,
> +			buf->smi.input[0], buf->smi.input[1],
> +			buf->smi.input[2], buf->smi.input[3]);
> +			return -EIO;
> +	}
> +	obj = (union acpi_object *)output.pointer;
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		pr_err("invalid type : %d\n", obj->type);
> +		return -EIO;
> +	}
> +	memcpy(buf, obj->buffer.pointer, input.length);
>  
> -	command.magic = SMI_CMD_MAGIC;
> -	command.command_address = da_command_address;
> -	command.command_code = da_command_code;
> -	command.ebx = virt_to_phys(buffer);
> -	command.ecx = 0x42534931;
> +	return 0;
> +}
>  
> -	buffer->class = class;
> -	buffer->select = select;
> +void dell_smbios_send_request(int class, int select)
> +{
> +	if (has_wmi) {
> +		wmi_buffer->smi.class = class;
> +		wmi_buffer->smi.select = select;
> +		run_wmi_smbios_call(wmi_buffer);
> +	}
>  
> -	dcdbas_smi_request(&command);
> +#ifdef CONFIG_DCDBAS

Rather than ifdef blocks of code, the preferred method is to modify the
declaration of things so the tests here can do the right thing. For
example, if CONFIG_DCDBAS is not set, can that be made equivalent to:

else if (smi_buffer) {

At this point in the code?

See coding-style.rst Section 20) Conditional Compilation
for more specific guidance. Apply throughout.

-- 
Darren Hart
VMware Open Source Technology Center
