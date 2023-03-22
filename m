Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A74C6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Mar 2023 21:23:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjCVVXP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Mar 2023 17:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjCVVXO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2023 17:23:14 -0400
Received: from irl.hu (irl.hu [95.85.9.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E4D261B6
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 14:23:13 -0700 (PDT)
Received: from [192.168.0.31] (51b68d67.dsl.pool.telekom.hu [::ffff:81.182.141.103])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000006FD9C.00000000641B71BE.00156CE9; Wed, 22 Mar 2023 22:23:10 +0100
Message-ID: <b6bd5c05-dc0f-9628-e47e-8606a3b4dfc8@irl.hu>
Date:   Wed, 22 Mar 2023 22:23:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH] Add Lenovo Yoga Mode Control driver
Content-Language: en-US, hu
To:     platform-driver-x86@vger.kernel.org
References: <20221004214332.35934-1-soyer@irl.hu>
From:   Gergo Koteles <soyer@irl.hu>
In-Reply-To: <20221004214332.35934-1-soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2022. 10. 04. 23:43, Gergo Koteles wrote:
> This is a WMI driver for the Mode Control switch for Lenovo Yoga
> notebooks.
> The mode is mapped to a SW_TABLET_MODE switch capable input device.
> 
> It should work with  models like the Yoga C940, Ideapad flex 14API,
> Yoga 9 14IAP7, Yoga 7 14ARB7.
> The 14ARB7 model must trigger the EC to send mode change events.
> This might be a firmware bug.
> 
> Introduces a global variable in the ideapad-laptop driver.
> I would like some advice on how to do it without the variable,
> or how to do it better.
> ---
>   drivers/platform/x86/Kconfig          |  10 ++
>   drivers/platform/x86/Makefile         |   1 +
>   drivers/platform/x86/ideapad-laptop.c |  18 +++
>   drivers/platform/x86/lenovo-ymc.c     | 185 ++++++++++++++++++++++++++
>   4 files changed, 214 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-ymc.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f2f98e942cf2..72ff6713e447 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -510,6 +510,16 @@ config IDEAPAD_LAPTOP
>   	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
>   	  rfkill switch, hotkey, fan control and backlight control.
>   
> +config LENOVO_YMC
> +	tristate "Lenovo Yoga Mode Control"
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	depends on IDEAPAD_LAPTOP
> +	select ACPI_PLATFORM_PROFILE
> +	select INPUT_SPARSEKMAP
> +	help
> +	  This is a driver for the Mode Control switch for Lenovo Yoga notebooks.
> +
>   config SENSORS_HDAPS
>   	tristate "Thinkpad Hard Drive Active Protection System (hdaps)"
>   	depends on INPUT
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 5a428caa654a..f8f0d6a0b43b 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -65,6 +65,7 @@ obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
>   # IBM Thinkpad and Lenovo
>   obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
>   obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
> +obj-$(CONFIG_LENOVO_YMC)	+= lenovo-ymc.o
>   obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
>   obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
>   obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index abd0c81d62c4..d88a4ee72bf6 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -103,6 +103,7 @@ enum {
>   	VPCCMD_W_FAN,
>   	VPCCMD_R_RF,
>   	VPCCMD_W_RF,
> +	VPCCMD_W_YMC = 0x2A,
>   	VPCCMD_R_FAN = 0x2B,
>   	VPCCMD_R_SPECIAL_BUTTONS = 0x31,
>   	VPCCMD_W_BL_POWER = 0x33,
> @@ -156,6 +157,8 @@ static bool allow_v4_dytc;
>   module_param(allow_v4_dytc, bool, 0444);
>   MODULE_PARM_DESC(allow_v4_dytc, "Enable DYTC version 4 platform-profile support.");
>   
> +static struct ideapad_private *ideapad_priv;
> +
>   /*
>    * ACPI Helpers
>    */
> @@ -1421,6 +1424,19 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv)
>   	}
>   }
>   
> +void ideapad_trigger_ymc_next_read(void)
> +{
> +	int err;
> +	if (ideapad_priv != NULL) {
> +		err = write_ec_cmd(ideapad_priv->adev->handle,
> +			VPCCMD_W_YMC, 1);
> +		if (err)
> +			dev_warn(&ideapad_priv->platform_device->dev,
> +				"Could not write YMC: %d\n", err);
> +	}
> +}
> +EXPORT_SYMBOL(ideapad_trigger_ymc_next_read);
> +
>   static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
>   {
>   	struct ideapad_private *priv = data;
> @@ -1663,6 +1679,7 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>   	}
>   #endif
>   
> +	ideapad_priv = priv;
>   	return 0;
>   
>   #if IS_ENABLED(CONFIG_ACPI_WMI)
> @@ -1696,6 +1713,7 @@ static int ideapad_acpi_remove(struct platform_device *pdev)
>   	struct ideapad_private *priv = dev_get_drvdata(&pdev->dev);
>   	int i;
>   
> +	ideapad_priv = NULL;
>   #if IS_ENABLED(CONFIG_ACPI_WMI)
>   	if (priv->fnesc_guid)
>   		wmi_remove_notify_handler(priv->fnesc_guid);
> diff --git a/drivers/platform/x86/lenovo-ymc.c b/drivers/platform/x86/lenovo-ymc.c
> new file mode 100644
> index 000000000000..0b899b02e12f
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-ymc.c
> @@ -0,0 +1,185 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * lenovo-ymc.c - Lenovo Yoga Mode Control driver
> + *
> + * Copyright © 2022 Gergo Koteles <soyer@irl.hu>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/wmi.h>
> +
> +#define LENOVO_YMC_EVENT_GUID	"06129D99-6083-4164-81AD-F092F9D773A6"
> +#define LENOVO_YMC_QUERY_GUID	"09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C"
> +
> +#define LENOVO_YMC_QUERY_INSTANCE 0
> +#define LENOVO_YMC_QUERY_METHOD 0xAB
> +
> +extern void ideapad_trigger_ymc_next_read(void);
> +
> +static bool ec_trigger __read_mostly;
> +module_param(ec_trigger, bool, 0644);
> +MODULE_PARM_DESC(ec_trigger, "Enable EC triggering to emit YMC events");
> +
> +static int enable_ec_trigger(const struct dmi_system_id *id)
> +{
> +       pr_debug("Lenovo YMC enable EC triggering.\n");
> +       ec_trigger = true;
> +       return 0;
> +}
> +
> +static const struct dmi_system_id ec_trigger_quirk_dmi_table[] = {
> +	{
> +		// Lenovo Yoga 7 14ARB7
> +		.callback = enable_ec_trigger,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
> +		},
> +	},
> +	{ },
> +};
> +
> +static void lenovo_ymc_trigger_ec(void) {
> +	if (ec_trigger) {
> +		ideapad_trigger_ymc_next_read();
> +	}
> +}
> +
> +
> +struct lenovo_ymc_private {
> +	struct input_dev *input_dev;
> +};
> +
> +
> +static const struct key_entry lenovo_ymc_keymap[] = {
> +	// Laptop
> +	{ KE_SW, 0x01, { .sw = { SW_TABLET_MODE, 0 } } },
> +	// Tablet
> +	{ KE_SW, 0x02, { .sw = { SW_TABLET_MODE, 1 } } },
> +	// Drawing Board
> +	{ KE_SW, 0x03, { .sw = { SW_TABLET_MODE, 1 } } },
> +	// Tent
> +	{ KE_SW, 0x04, { .sw = { SW_TABLET_MODE, 1 } } },
> +	{ KE_END },
> +};
> +
> +static void lenovo_ymc_notify(struct wmi_device *wdev, union acpi_object *data)
> +{
> +	struct lenovo_ymc_private *priv = dev_get_drvdata(&wdev->dev);
> +
> +	u32 input_val = 0;
> +	struct acpi_buffer input = {sizeof(input), &input_val};
> +	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
> +	acpi_status status;
> +	union acpi_object *obj;
> +	int code;
> +
> +	status = wmi_evaluate_method(LENOVO_YMC_QUERY_GUID,
> +				LENOVO_YMC_QUERY_INSTANCE,
> +				LENOVO_YMC_QUERY_METHOD,
> +				&input, &output);
> +
> +	if (ACPI_FAILURE(status)) {
> +		dev_warn(&wdev->dev,
> +			"Failed to evaluate query method %ud\n", status);
> +		return;
> +	}
> +
> +	obj = (union acpi_object *)output.pointer;
> +
> +	if (obj->type != ACPI_TYPE_INTEGER) {
> +		dev_warn(&wdev->dev,
> +			"WMI event data is not an integer\n");
> +		goto free_obj;
> +	}
> +	code = obj->integer.value;
> +
> +	if (!sparse_keymap_report_event(priv->input_dev, code, 1, true))
> +		dev_warn(&wdev->dev, "Unknown key %d pressed\n", code);
> +
> +free_obj:
> +	kfree(obj);
> +	lenovo_ymc_trigger_ec();
> +}
> +
> +static void lenovo_ymc_remove(struct wmi_device *wdev)
> +{
> +	struct lenovo_ymc_private *priv = dev_get_drvdata(&wdev->dev);
> +
> +	input_unregister_device(priv->input_dev);
> +}
> +
> +static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
> +{
> +	struct input_dev *input_dev;
> +	struct lenovo_ymc_private *priv;
> +	int err;
> +
> +	dmi_check_system(ec_trigger_quirk_dmi_table);
> +
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	input_dev = input_allocate_device();
> +	if (!input_dev) {
> +		return -ENOMEM;
> +	}
> +
> +	input_dev->name = "Lenovo Yoga Mode Control switch";
> +	input_dev->phys = LENOVO_YMC_EVENT_GUID "/input0";
> +	input_dev->id.bustype = BUS_HOST;
> +	input_dev->dev.parent = &wdev->dev;
> +
> +	input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
> +
> +	err = sparse_keymap_setup(input_dev, lenovo_ymc_keymap, NULL);
> +	if (err) {
> +		dev_err(&wdev->dev,
> +			"Could not set up input device keymap: %d\n", err);
> +		goto err_free_dev;
> +	}
> +
> +	err = input_register_device(input_dev);
> +	if (err) {
> +		dev_err(&wdev->dev,
> +			"Could not register input device: %d\n", err);
> +		goto err_free_dev;
> +	}
> +
> +	priv->input_dev = input_dev;
> +	dev_set_drvdata(&wdev->dev, priv);
> +	lenovo_ymc_trigger_ec();
> +	return 0;
> +
> +err_free_dev:
> +	input_free_device(input_dev);
> +	return err;
> +}
> +
> +static const struct wmi_device_id lenovo_ymc_wmi_id_table[] = {
> +	{ .guid_string = LENOVO_YMC_EVENT_GUID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, lenovo_ymc_wmi_id_table);
> +
> +static struct wmi_driver lenovo_ymc_driver = {
> +	.driver = {
> +		.name = "lenovo-ymc",
> +	},
> +	.id_table = lenovo_ymc_wmi_id_table,
> +	.probe = lenovo_ymc_probe,
> +	.remove = lenovo_ymc_remove,
> +	.notify = lenovo_ymc_notify,
> +};
> +
> +module_wmi_driver(lenovo_ymc_driver);
> +
> +MODULE_AUTHOR("Gergo Koteles <soyer@irl.hu>");
> +MODULE_DESCRIPTION("Lenovo Yoga Mode Control driver");
> +MODULE_LICENSE("GPL");

I missed Sob from this patch. I add it here.

Signed-off-by: Gergo Koteles <soyer@irl.hu>


