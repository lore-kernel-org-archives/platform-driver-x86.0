From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2] Support intel-vbtn based tablet mode switch
Date: Tue, 23 Jan 2018 13:31:58 +0100
Message-ID: <20180123123158.7goxhzxk4jdexjiu@pali>
References: <1516710146-2021-1-git-send-email-notmart@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1516710146-2021-1-git-send-email-notmart@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Martin <notmart@gmail.com>
Cc: linux-kernel@vger.kernel.org, mjg59@srcf.ucam.org, dvhart@infradead.org, andy@infradead.org, bhush94@gmail.com, platform-driver-x86@vger.kernel.org, mario.limonciello@dell.com, Mario Limonciello <mario_limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday 23 January 2018 13:22:26 Marco Martin wrote:
> Some laptops such as Dell Inspiron 7000 series have the
> tablet mode switch implemented in Intel ACPI,
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
>  drivers/platform/x86/intel-vbtn.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> index 58c5ff3..2a4ed68 100644
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
> +	{ KE_SW,  0xCC, { .sw = { SW_TABLET_MODE, 1 } } }, /* Tablet mode in */
> +	{ KE_SW,  0xCD, { .sw = { SW_TABLET_MODE, 0 } } }, /* Tablet mode out */
>  	{ KE_END },
>  };
>  
> @@ -88,6 +93,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>  
>  static int intel_vbtn_probe(struct platform_device *device)
>  {
> +	struct acpi_buffer vgbs_output = { ACPI_ALLOCATE_BUFFER, NULL };
>  	acpi_handle handle = ACPI_HANDLE(&device->dev);
>  	struct intel_vbtn_priv *priv;
>  	acpi_status status;
> @@ -110,6 +116,27 @@ static int intel_vbtn_probe(struct platform_device *device)
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

This is already called by sparse_keymap_setup(), is not it?

> +		if (obj && obj->type == ACPI_TYPE_INTEGER) {
> +			if (obj->integer.value & TABLET_MODE_FLAG)
> +				input_report_switch(priv->input_dev,
> +									SW_TABLET_MODE,
> +									0);
> +			else
> +				input_report_switch(priv->input_dev,
> +									SW_TABLET_MODE,
> +									1);

You are calling one function two times with two same parameters. You can
simplify it.

> +		}
> +	}
> +
>  	status = acpi_install_notify_handler(handle,
>  					     ACPI_DEVICE_NOTIFY,
>  					     notify_handler,

-- 
Pali Rohár
pali.rohar@gmail.com
