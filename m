From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Support intel-vbtn based tablet mode switch
Date: Mon, 22 Jan 2018 15:46:08 -0800
Message-ID: <20180122234608.rstey3i2pwoqhntz@dtor-ws>
References: <1516625281-16547-1-git-send-email-notmart@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33814 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751038AbeAVXqM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Jan 2018 18:46:12 -0500
Content-Disposition: inline
In-Reply-To: <1516625281-16547-1-git-send-email-notmart@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Martin <notmart@gmail.com>
Cc: linux-kernel@vger.kernel.org, mjg59@srcf.ucam.org, pali.rohar@gmail.com, dvhart@infradead.org, andy@infradead.org, bhush94@gmail.com, platform-driver-x86@vger.kernel.org, mario.limonciello@dell.com, Mario Limonciello <mario_limonciello@dell.com>

On Mon, Jan 22, 2018 at 01:48:01PM +0100, Marco Martin wrote:
> some laptops such as Dell Inspiron 7000 series have the
> tablet mode switch implemented in intel acpi,
> the events to enter and exit the tablet mode are 0xCC and 0xCD
> 
> CC: platform-driver-x86@vger.kernel.org
> CC: Matthew Garrett <mjg59@srcf.ucam.org>
> CC: "Pali Rohár" <pali.rohar@gmail.com>
> CC: Darren Hart <dvhart@infradead.org>
> CC: Mario Limonciello <mario_limonciello@dell.com>
> CC: Andy Shevchenko <andy@infradead.org>
> 
> Signed-off-by: Marco Martin <notmart@gmail.com>
> ---
>  drivers/platform/x86/intel-vbtn.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> index 4809267..c4362df 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -26,6 +26,9 @@
>  #include <linux/suspend.h>
>  #include <acpi/acpi_bus.h>
>  
> +/* When NOT in tablet mode, VBDS has the flag 0x40 */
> +#define TABLET_MODE_FLAG 0x40
> +
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("AceLan Kao");
>  
> @@ -42,6 +45,8 @@ static const struct key_entry intel_vbtn_keymap[] = {
>  	{ KE_IGNORE, 0xC5, { KEY_VOLUMEUP } },		/* volume-up key release */
>  	{ KE_KEY, 0xC6, { KEY_VOLUMEDOWN } },		/* volume-down key press */
>  	{ KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN } },	/* volume-down key release */
> +	{ KE_SW,  0xCC, { .sw = { SW_TABLET_MODE, 1 } } }, /* Tabletmode in */
> +	{ KE_SW,  0xCD, { .sw = { SW_TABLET_MODE, 0 } } }, /* Tabletmode out */
>  	{ KE_END },
>  };
>  
> @@ -81,6 +86,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>  			return;
>  		}
>  	} else if (sparse_keymap_report_event(priv->input_dev, event, 1, true)) {
> +		input_sync(priv->input_dev);

I do not understand why this is needed, as sparse keymap should issue
sync for you. From sparse_keymap_report_entry():

	case KE_SW:
		value = ke->sw.value;
		/* fall through */

	case KE_VSW:
		input_report_switch(dev, ke->sw.code, value);
		input_sync(dev);

		^^^^^^^^^- here is the sync.

		break;
	}
}

>  		return;
>  	}
>  	dev_info(&device->dev, "unknown event index 0x%x\n", event);
> @@ -92,6 +98,7 @@ static int intel_vbtn_probe(struct platform_device *device)
>  	struct intel_vbtn_priv *priv;
>  	acpi_status status;
>  	int err;
> +	struct acpi_buffer vgbs_output = { ACPI_ALLOCATE_BUFFER, NULL };
>  
>  	status = acpi_evaluate_object(handle, "VBDL", NULL, NULL);
>  	if (ACPI_FAILURE(status)) {
> @@ -110,6 +117,27 @@ static int intel_vbtn_probe(struct platform_device *device)
>  		return err;
>  	}
>  
> +	status = acpi_evaluate_object(handle, "VGBS", NULL, &vgbs_output);
> +	/* VGBS being present and returning something means
> +	 * we have a tablet mode switch
> +	 */
> +	if (ACPI_SUCCESS(status)) {
> +		union acpi_object *obj = vgbs_output.pointer;
> +
> +		input_set_capability(priv->input_dev, EV_SW, SW_TABLET_MODE);
> +
> +		if (obj && obj->type == ACPI_TYPE_INTEGER) {

Do you want to set the capability if you do not get 'obj' or it is of
different type?

> +			if (obj->integer.value & TABLET_MODE_FLAG)
> +				input_report_switch(priv->input_dev,
> +							SW_TABLET_MODE,
> +							0);
> +			else
> +				input_report_switch(priv->input_dev,
> +							SW_TABLET_MODE,
> +							1);

Can be shorter:

			input_report_switch(priv->input_dev, SW_TABLET_MODE,
					obj->integer.value & TABLET_MODE_FLAG);

You also need:

			input_sync(priv->input_dev);

Thanks.

-- 
Dmitry
