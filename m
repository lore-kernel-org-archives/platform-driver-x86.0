From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 2/8] platform/x86: dell-smbios: Introduce a WMI-ACPI
 interface
Date: Fri, 29 Sep 2017 17:51:27 -0700
Message-ID: <20170930005127.GA13307@fury>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <7b632baafbfdc6c55c4d56225c54fd441b747286.1506571188.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:44538 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752578AbdI3Av3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Sep 2017 20:51:29 -0400
Content-Disposition: inline
In-Reply-To: <7b632baafbfdc6c55c4d56225c54fd441b747286.1506571188.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com

On Wed, Sep 27, 2017 at 11:02:14PM -0500, Mario Limonciello wrote:
> The driver currently uses an SMI interface which grants direct access
> to physical memory to the firmware SMM methods via a pointer.
> 
> Now add a WMI-ACPI interface that is detected by WMI probe and preferred
> over the SMI interface.
> 
> Changing this to operate over WMI-ACPI will use an ACPI OperationRegion
> for a buffer of data storage when SMM calls are performed.
> 
> This is a safer approach to use in kernel drivers as the SMM will
> only have access to that OperationRegion.
> 
> As a result, this change removes the dependency on this driver on the
> dcdbas kernel module.  It's now an optional compilation option.
> 
> When modifying this, add myself to MAINTAINERS.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---

...

> +DELL SMBIOS DRIVER
> +M:	Pali Rohár <pali.rohar@gmail.com>
> +M:	Mario Limonciello <mario.limonciello@dell.com>
> +S:	Maintained
> +F:	drivers/platform/x86/dell-smbios.*

Pali, do you agree with this?

...

>  int dell_smbios_error(int value)
> @@ -60,13 +69,15 @@ struct calling_interface_buffer *dell_smbios_get_buffer(void)
>  {
>  	mutex_lock(&buffer_mutex);
>  	dell_smbios_clear_buffer();
> +	if (wmi_dev)
> +		return &((struct wmi_calling_interface_buffer *) buffer)->smi;
>  	return buffer;

Hrm, my hope had been to make this transparent at this level. ... This
may need more thought. I don't care for the casting here.... hopefully
enlightenment lies below...

> +static int run_wmi_smbios_call(struct wmi_calling_interface_buffer *buf)
> +{
> +	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
> +	struct acpi_buffer input;
> +	union acpi_object *obj;
> +	acpi_status status;
> +
> +	input.length = sizeof(struct wmi_calling_interface_buffer);
> +	input.pointer = buf;
> +
> +	status = wmidev_evaluate_method(wmi_dev, 0, 1, &input, &output);
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

We ensure we don't write beyond buf, but we havne't ensured we don't read beyond
obj.


	if (obj->length != input.length) { // or maybe >= ??
		pr_err("invalid buffer length : %d\n", obj->length);
		return -EINVAL;
	}

> -static int __init dell_smbios_init(void)
> +static int dell_smbios_wmi_probe(struct wmi_device *wdev)
> +{
> +	/* no longer need the SMI page */
> +	free_page((unsigned long)buffer);
> +
> +	/* WMI buffer should be 32k */
> +	buffer = (void *)__get_free_pages(GFP_KERNEL, 3);

Assuming PAGE_SIZE here (I know, this driver, this architecture,
etc...). But, please use get_order() to determine number of pages
from a linear size:

__get_free_pages(GFP_KERNEL, get_order(32768));

> +	if (!buffer)
> +		return -ENOMEM;
> +	bufferlen = sizeof(struct wmi_calling_interface_buffer);

Use a consistent way to allocate and set the len. Maybe set bufferlen
above and use get_order(bufferlen).

> +	wmi_dev = wdev;
> +	return 0;
> +}
> +
> +static int dell_smbios_wmi_remove(struct wmi_device *wdev)
>  {
> -	int ret;
> +	wmi_dev = NULL;
> +	free_pages((unsigned long)buffer, 3);
> +	return 0;
> +}
>  
> +static const struct wmi_device_id dell_smbios_wmi_id_table[] = {
> +	{ .guid_string = DELL_WMI_SMBIOS_GUID },
> +	{ },
> +};
> +
> +static struct wmi_driver dell_wmi_smbios_driver = {
> +	.driver = {
> +		.name = "dell-smbios",
> +	},
> +	.probe = dell_smbios_wmi_probe,
> +	.remove = dell_smbios_wmi_remove,
> +	.id_table = dell_smbios_wmi_id_table,
> +};
> +
> +static int __init dell_smbios_init(void)
> +{
>  	dmi_walk(find_tokens, NULL);
>  
>  	if (!da_tokens)  {
> @@ -181,34 +270,39 @@ static int __init dell_smbios_init(void)
>  		return -ENODEV;
>  	}
>  
> +#ifdef CONFIG_DCDBAS

If this cannot be avoided, then use IS_ENABLED(CONFIG_DCDBAS).

I still think we should be to come up with a cleaner way to deal with
the two buffers than a bunch of #ifdefs and if (wdev) {} else {} blocks.

...
> diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
...
> -/* This structure will be modified by the firmware when we enter
> - * system management mode, hence the volatiles */
> -
> +/* If called through fallback SMI rather than WMI this structure will be
> + * modified by the firmware when we enter system management mode, hence the
> + * volatiles
> + */

Follow coding style when modifying comment blocks (even when they
didn't before) please. See coding-style 8) COmmenting.

/*
 * If called ...
 ...
 * volatiles.
 */

-- 
Darren Hart
VMware Open Source Technology Center
