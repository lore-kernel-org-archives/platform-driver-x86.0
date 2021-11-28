Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2DAC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 28 Nov 2021 19:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235237AbhK1TMp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 28 Nov 2021 14:12:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39295 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231572AbhK1TKo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 28 Nov 2021 14:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638126448;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jw6NIPygJ0XUmk583CDcMgh7KLH/87f11FBz5sFQwak=;
        b=UQHa/vXVp6ZP36f33zaJt3jAHbq/ga3IxauN8DSqUH+gdBO9+nMM/MvLw0R3MabJvOtMBW
        0m/GRdkhnwp9oWXuR2CYoxFZdO6kOM+YkjJ95FnotbPcWoBP3VTUr2nggI04gFwyCbh/cv
        Jjwg54s54KQpnh7+vzQk79p0SjUzue0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-B5l3v5gSP_-DXOEEKxGvBQ-1; Sun, 28 Nov 2021 14:07:26 -0500
X-MC-Unique: B5l3v5gSP_-DXOEEKxGvBQ-1
Received: by mail-ed1-f71.google.com with SMTP id a3-20020a05640213c300b003e7d12bb925so11847890edx.9
        for <platform-driver-x86@vger.kernel.org>; Sun, 28 Nov 2021 11:07:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Jw6NIPygJ0XUmk583CDcMgh7KLH/87f11FBz5sFQwak=;
        b=AvBZhRJAIqdtt/q21GHoptWk06dNdcqEo/BVgpJ+YN5ehucJj2uJaPoGEao60z0TWX
         HZY3MkqcD1Mh7qpkJbj2itJx8BMTb+FBKklfGOykhUP3YS7pM7ec/oAdX0tpD7sjLJVI
         2915EnQ7fzz19xsCS7lBcMHuVYK3E/SS3i1/NrsD1UetnwjHqKKi0RORNimAmVMoazhe
         Q4mrN/uNKIjw2ilwySgm5+gBwz91nVlYsHQxTCD9huJVrv6pEOBVDp/5gHzJR5VGJz8H
         TNOkuhKpswGcff8m+aJBGKdM+nuwwpZTup6vsvLwSzLA6B4cqjCQjKscN0Tnho8PQ1OJ
         BKSQ==
X-Gm-Message-State: AOAM532nBv+jmTZ/2I15T/9rttTDgcK+IElhmVxk3uUMpe1ZzjnkcNMb
        8XidOEUICMhBoPfhaqAaEQPVJqM/oRqRrlv/k7moPxuSoXKnx6VOTOfBnQWnKU4rPmhWzv3o/AN
        mlbnhylNPLy/j8aIk6Q1AWFf7BV+Z/Iw6Ng==
X-Received: by 2002:a05:6402:845:: with SMTP id b5mr68317195edz.392.1638126445243;
        Sun, 28 Nov 2021 11:07:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxQFq61E0ZLPHbFHdCWDU1Tb3/a8z99NoexWyfzkfwTrztsMIAVVb/Pawki3qn1+r16V1peA==
X-Received: by 2002:a05:6402:845:: with SMTP id b5mr68317166edz.392.1638126445021;
        Sun, 28 Nov 2021 11:07:25 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u16sm7564099edr.43.2021.11.28.11.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Nov 2021 11:07:24 -0800 (PST)
Message-ID: <73858e6f-73a4-455d-10be-e54092847897@redhat.com>
Date:   Sun, 28 Nov 2021 20:07:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/5] platform/x86: lenovo-yogabook-wmi: Add driver for
 Lenovo Yoga Book
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20211128190031.405620-1-hdegoede@redhat.com>
 <20211128190031.405620-4-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211128190031.405620-4-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/28/21 20:00, Hans de Goede wrote:
> From: Yauhen Kharuzhy <jekhor@gmail.com>
> 
> Add driver to handle WMI events, control the keyboard backlight and
> bind/unbind the keyboard-touch / digitizer driver so that only one
> is active at a time.
> 
> It may seem a bit weird to handle the toggling of the modes in the
> kernel, but the hw actually expects only 1 device to be active
> at a time.
> 
> Changes by Hans de Goede:
> - Whole bunch of cleanups
> - Make the kernel do the driver bind/unbind itself instead of
>   sending events to userspace and requiring a special userspace
>   daemon to deal with this
> 
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> Co-developed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Note this new driver relies on my:

"pinctrl: cherryview: Do not allow the same interrupt line to be used by 2 pins"

patch to also be in the kernel, otherwise when the digitizer is
disabled during driver load (leaving only the touchscreen-kbd
active), this will result in disabling the "shared" interrupt
line breaking the touchscreen-kbd functionality until the users
toggles to digitizer mode and back to touchscreen-kbd again.

Regards,

Hans



> ---
>  drivers/platform/x86/Kconfig               |  13 +
>  drivers/platform/x86/Makefile              |   1 +
>  drivers/platform/x86/lenovo-yogabook-wmi.c | 339 +++++++++++++++++++++
>  3 files changed, 353 insertions(+)
>  create mode 100644 drivers/platform/x86/lenovo-yogabook-wmi.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index ad1c45682f0e..a1dd5e0676d1 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -127,6 +127,19 @@ config GIGABYTE_WMI
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called gigabyte-wmi.
>  
> +config YOGABOOK_WMI
> +	tristate "Lenovo Yoga Book tablet WMI key driver"
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	select LEDS_CLASS
> +	select NEW_LEDS
> +	help
> +	  Say Y here if you want to support the 'Pen' key and keyboard backlight
> +	  control on the Lenovo Yoga Book tablets.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called lenovo-yogabook-wmi.
> +
>  config ACERHDF
>  	tristate "Acer Aspire One temperature and fan driver"
>  	depends on ACPI && THERMAL
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index d6bd2ff5f76d..30047df8f701 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
>  obj-$(CONFIG_PEAQ_WMI)			+= peaq-wmi.o
>  obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
>  obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
> +obj-$(CONFIG_YOGABOOK_WMI)		+= lenovo-yogabook-wmi.o
>  
>  # Acer
>  obj-$(CONFIG_ACERHDF)		+= acerhdf.o
> diff --git a/drivers/platform/x86/lenovo-yogabook-wmi.c b/drivers/platform/x86/lenovo-yogabook-wmi.c
> new file mode 100644
> index 000000000000..ecd624d9108f
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-yogabook-wmi.c
> @@ -0,0 +1,339 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* WMI driver for Lenovo Yoga Book YB1-X90* / -X91* tablets */
> +
> +#include <linux/acpi.h>
> +#include <linux/devm-helpers.h>
> +#include <linux/module.h>
> +#include <linux/leds.h>
> +#include <linux/wmi.h>
> +#include <linux/workqueue.h>
> +
> +#define YB_MBTN_EVENT_GUID	"243FEC1D-1963-41C1-8100-06A9D82A94B4"
> +#define YB_MBTN_METHOD_GUID	"742B0CA1-0B20-404B-9CAA-AEFCABF30CE0"
> +
> +#define YB_PAD_ENABLE	1
> +#define YB_PAD_DISABLE	2
> +#define YB_LIGHTUP_BTN	3
> +
> +#define YB_KBD_BL_DEFAULT 128
> +
> +/* flags */
> +enum {
> +	YB_KBD_IS_ON,
> +	YB_DIGITIZER_IS_ON,
> +	YB_DIGITIZER_MODE,
> +	YB_SUSPENDED,
> +};
> +
> +struct yogabook_wmi {
> +	struct wmi_device *wdev;
> +	struct acpi_device *kbd_adev;
> +	struct acpi_device *dig_adev;
> +	struct device *kbd_dev;
> +	struct device *dig_dev;
> +	struct work_struct work;
> +	struct led_classdev kbd_bl_led;
> +	unsigned long flags;
> +	uint8_t brightness;
> +};
> +
> +static int yogabook_wmi_do_action(struct wmi_device *wdev, int action)
> +{
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_buffer input;
> +	acpi_status status;
> +	u32 dummy_arg = 0;
> +
> +	dev_dbg(&wdev->dev, "Do action: %d\n", action);
> +
> +	input.pointer = &dummy_arg;
> +	input.length = sizeof(dummy_arg);
> +
> +	status = wmi_evaluate_method(YB_MBTN_METHOD_GUID, 0, action, &input,
> +				     &output);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(&wdev->dev, "Calling WMI method failure: 0x%x\n",
> +			status);
> +		return status;
> +	}
> +
> +	kfree(output.pointer);
> +
> +	return 0;
> +}
> +
> +/*
> + * To control keyboard backlight, call the method KBLC() of the TCS1 ACPI
> + * device (Goodix touchpad acts as virtual sensor keyboard).
> + */
> +static int yogabook_wmi_set_kbd_backlight(struct wmi_device *wdev,
> +					  uint8_t level)
> +{
> +	struct yogabook_wmi *data = dev_get_drvdata(&wdev->dev);
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_object_list input;
> +	union acpi_object param;
> +	acpi_status status;
> +
> +	if (data->kbd_adev->power.state != ACPI_STATE_D0) {
> +		dev_warn(&wdev->dev, "keyboard touchscreen not in D0, cannot set brightness\n");
> +		return -ENXIO;
> +	}
> +
> +	dev_dbg(&wdev->dev, "Set KBLC level to %u\n", level);
> +
> +	input.count = 1;
> +	input.pointer = &param;
> +
> +	param.type = ACPI_TYPE_INTEGER;
> +	param.integer.value = 255 - level;
> +
> +	status = acpi_evaluate_object(acpi_device_handle(data->kbd_adev), "KBLC",
> +				      &input, &output);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(&wdev->dev, "Failed to call KBLC method: 0x%x\n", status);
> +		return status;
> +	}
> +
> +	kfree(output.pointer);
> +	return 0;
> +}
> +
> +static void yogabook_wmi_work(struct work_struct *work)
> +{
> +	struct yogabook_wmi *data = container_of(work, struct yogabook_wmi, work);
> +	struct device *dev = &data->wdev->dev;
> +	bool kbd_on, digitizer_on;
> +	int r;
> +
> +	if (test_bit(YB_SUSPENDED, &data->flags))
> +		return;
> +
> +	if (test_bit(YB_DIGITIZER_MODE, &data->flags)) {
> +		digitizer_on = true;
> +		kbd_on = false;
> +	} else {
> +		kbd_on = true;
> +		digitizer_on = false;
> +	}
> +
> +	if (!kbd_on && test_bit(YB_KBD_IS_ON, &data->flags)) {
> +		/*
> +		 * Must be done before releasing the keyboard touchscreen driver,
> +		 * so that the keyboard touchscreen dev is still in D0.
> +		 */
> +		yogabook_wmi_set_kbd_backlight(data->wdev, 0);
> +		device_release_driver(data->kbd_dev);
> +		clear_bit(YB_KBD_IS_ON, &data->flags);
> +	}
> +
> +	if (!digitizer_on && test_bit(YB_DIGITIZER_IS_ON, &data->flags)) {
> +		yogabook_wmi_do_action(data->wdev, YB_PAD_DISABLE);
> +		device_release_driver(data->dig_dev);
> +		clear_bit(YB_DIGITIZER_IS_ON, &data->flags);
> +	}
> +
> +	if (kbd_on && !test_bit(YB_KBD_IS_ON, &data->flags)) {
> +		r = device_reprobe(data->kbd_dev);
> +		if (r)
> +			dev_warn(dev, "Reprobe of keyboard touchscreen failed: %d\n", r);
> +
> +		yogabook_wmi_set_kbd_backlight(data->wdev, data->brightness);
> +		set_bit(YB_KBD_IS_ON, &data->flags);
> +	}
> +
> +	if (digitizer_on && !test_bit(YB_DIGITIZER_IS_ON, &data->flags)) {
> +		r = device_reprobe(data->dig_dev);
> +		if (r)
> +			dev_warn(dev, "Reprobe of digitizer failed: %d\n", r);
> +
> +		yogabook_wmi_do_action(data->wdev, YB_PAD_ENABLE);
> +		set_bit(YB_DIGITIZER_IS_ON, &data->flags);
> +	}
> +}
> +
> +static void yogabook_wmi_notify(struct wmi_device *wdev, union acpi_object *dummy)
> +{
> +	struct yogabook_wmi *data = dev_get_drvdata(&wdev->dev);
> +
> +	if (test_bit(YB_SUSPENDED, &data->flags))
> +		return;
> +
> +	if (test_bit(YB_DIGITIZER_MODE, &data->flags))
> +		clear_bit(YB_DIGITIZER_MODE, &data->flags);
> +	else
> +		set_bit(YB_DIGITIZER_MODE, &data->flags);
> +
> +	/*
> +	 * We are called from the ACPI core and the driver [un]binding which is
> +	 * done also needs ACPI functions, use a workqueue to avoid deadlocking.
> +	 */
> +	schedule_work(&data->work);
> +}
> +
> +static enum led_brightness kbd_brightness_get(struct led_classdev *cdev)
> +{
> +	struct yogabook_wmi *data =
> +		container_of(cdev, struct yogabook_wmi, kbd_bl_led);
> +
> +	return data->brightness;
> +}
> +
> +static int kbd_brightness_set(struct led_classdev *cdev,
> +			      enum led_brightness value)
> +{
> +	struct yogabook_wmi *data =
> +		container_of(cdev, struct yogabook_wmi, kbd_bl_led);
> +	struct wmi_device *wdev = data->wdev;
> +
> +	if ((value < 0) || (value > 255))
> +		return -EINVAL;
> +
> +	data->brightness = value;
> +
> +	if (data->kbd_adev->power.state != ACPI_STATE_D0)
> +		return 0;
> +
> +	return yogabook_wmi_set_kbd_backlight(wdev, data->brightness);
> +}
> +
> +static int yogabook_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct yogabook_wmi *data;
> +	int r;
> +
> +	data = devm_kzalloc(&wdev->dev, sizeof(struct yogabook_wmi), GFP_KERNEL);
> +	if (data == NULL)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&wdev->dev, data);
> +
> +	data->wdev = wdev;
> +	data->brightness = YB_KBD_BL_DEFAULT;
> +	set_bit(YB_KBD_IS_ON, &data->flags);
> +	set_bit(YB_DIGITIZER_IS_ON, &data->flags);
> +
> +	r = devm_work_autocancel(&wdev->dev, &data->work, yogabook_wmi_work);
> +	if (r)
> +		return r;
> +
> +	data->kbd_adev = acpi_dev_get_first_match_dev("GDIX1001", NULL, -1);
> +	if (!data->kbd_adev) {
> +		dev_err(&wdev->dev, "Cannot find the touchpad device in ACPI tables\n");
> +		return -ENODEV;
> +	}
> +
> +	data->dig_adev = acpi_dev_get_first_match_dev("WCOM0019", NULL, -1);
> +	if (!data->dig_adev) {
> +		dev_err(&wdev->dev, "Cannot find the digitizer device in ACPI tables\n");
> +		r = -ENODEV;
> +		goto error_put_devs;
> +	}
> +
> +	data->kbd_dev = get_device(acpi_get_first_physical_node(data->kbd_adev));
> +	if (!data->kbd_dev || !data->kbd_dev->driver) {
> +		r = -EPROBE_DEFER;
> +		goto error_put_devs;
> +	}
> +
> +	data->dig_dev = get_device(acpi_get_first_physical_node(data->dig_adev));
> +	if (!data->dig_dev || !data->dig_dev->driver) {
> +		r = -EPROBE_DEFER;
> +		goto error_put_devs;
> +	}
> +
> +	schedule_work(&data->work);
> +
> +	data->kbd_bl_led.name = "ybwmi::kbd_backlight";
> +	data->kbd_bl_led.brightness_set_blocking = kbd_brightness_set;
> +	data->kbd_bl_led.brightness_get = kbd_brightness_get;
> +	data->kbd_bl_led.max_brightness = 255;
> +
> +	r = devm_led_classdev_register(&wdev->dev, &data->kbd_bl_led);
> +	if (r < 0) {
> +		dev_err_probe(&wdev->dev, r, "Registering backlight LED device\n");
> +		goto error_put_devs;
> +	}
> +
> +	return 0;
> +
> +error_put_devs:
> +	put_device(data->dig_dev);
> +	put_device(data->kbd_dev);
> +	acpi_dev_put(data->dig_adev);
> +	acpi_dev_put(data->kbd_adev);
> +	return r;
> +}
> +
> +static void yogabook_wmi_remove(struct wmi_device *wdev)
> +{
> +	struct yogabook_wmi *data = dev_get_drvdata(&wdev->dev);
> +
> +	put_device(data->dig_dev);
> +	put_device(data->kbd_dev);
> +	acpi_dev_put(data->dig_adev);
> +	acpi_dev_put(data->kbd_adev);
> +}
> +
> +__maybe_unused int yogabook_wmi_suspend(struct device *dev)
> +{
> +	struct wmi_device *wdev = container_of(dev, struct wmi_device, dev);
> +	struct yogabook_wmi *data = dev_get_drvdata(dev);
> +
> +	set_bit(YB_SUSPENDED, &data->flags);
> +
> +	flush_work(&data->work);
> +
> +	/* Turn off the pen button at sleep */
> +	if (test_bit(YB_DIGITIZER_IS_ON, &data->flags))
> +		yogabook_wmi_do_action(wdev, YB_PAD_DISABLE);
> +
> +	return 0;
> +}
> +
> +__maybe_unused int yogabook_wmi_resume(struct device *dev)
> +{
> +	struct wmi_device *wdev = container_of(dev, struct wmi_device, dev);
> +	struct yogabook_wmi *data = dev_get_drvdata(dev);
> +
> +	if (test_bit(YB_KBD_IS_ON, &data->flags)) {
> +		/* Ensure keyboard touchpad is on before we call KBLC() */
> +		acpi_device_set_power(data->kbd_adev, ACPI_STATE_D0);
> +		yogabook_wmi_set_kbd_backlight(wdev, data->brightness);
> +	}
> +
> +	if (test_bit(YB_DIGITIZER_IS_ON, &data->flags))
> +		yogabook_wmi_do_action(wdev, YB_PAD_ENABLE);
> +
> +	clear_bit(YB_SUSPENDED, &data->flags);
> +
> +	return 0;
> +}
> +
> +static const struct wmi_device_id yogabook_wmi_id_table[] = {
> +	{
> +		.guid_string = YB_MBTN_EVENT_GUID,
> +	},
> +	{ } /* Terminating entry */
> +};
> +
> +static SIMPLE_DEV_PM_OPS(yogabook_wmi_pm_ops,
> +			 yogabook_wmi_suspend, yogabook_wmi_resume);
> +
> +static struct wmi_driver yogabook_wmi_driver = {
> +	.driver = {
> +		.name = "yogabook-wmi",
> +		.pm = &yogabook_wmi_pm_ops,
> +	},
> +	.no_notify_data = true,
> +	.id_table = yogabook_wmi_id_table,
> +	.probe = yogabook_wmi_probe,
> +	.remove = yogabook_wmi_remove,
> +	.notify = yogabook_wmi_notify,
> +};
> +module_wmi_driver(yogabook_wmi_driver);
> +
> +MODULE_DEVICE_TABLE(wmi, yogabook_wmi_id_table);
> +MODULE_AUTHOR("Yauhen Kharuzhy");
> +MODULE_DESCRIPTION("Lenovo Yoga Book WMI driver");
> +MODULE_LICENSE("GPL v2");
> 

