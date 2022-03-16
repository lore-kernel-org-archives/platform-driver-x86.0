Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF51EC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Mar 2022 16:09:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349988AbiCPQKX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Mar 2022 12:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349953AbiCPQKW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Mar 2022 12:10:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2995D14027
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 09:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647446946;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DcMrjL4IVJyYYshAGTDBg5kcjgGZtAuPaRULwekJRzc=;
        b=cB/QbF2NvUxlhBCr2IJQZGJmHrs62YyFWNORfn6xy4Xpf3AvY/cefu3vwhY0u4IkTJQkK1
        LFOcV3UOkJC4rxQXF1OW//+Sa9uu/r1+F+Yh31XMYN705pNGoXgaBE/PJpSkvLoFwFdypT
        m3RYPM9tLycE6jcJqQ36EC8W857ZYIY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-X8dYacRaMAicQUqpbQodpQ-1; Wed, 16 Mar 2022 12:09:04 -0400
X-MC-Unique: X8dYacRaMAicQUqpbQodpQ-1
Received: by mail-ej1-f69.google.com with SMTP id h22-20020a1709060f5600b006b11a2d3dcfso1428305ejj.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 09:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DcMrjL4IVJyYYshAGTDBg5kcjgGZtAuPaRULwekJRzc=;
        b=0mEtbBgZFGlOd2R5njl13IPHz/oMWHqG7GBqvFLhknOSSP1oGXamCi33Z+Wgmrk+wj
         ZNhZr+ekYUhSZ7R6m8FC45x056xj8YzP76x2nIu/yho/pGi/wnqlBmXxVnv9U+BJT6lR
         rHuagcVLxvzr6l0+u+EbgEgASjr/vN9cEbUnCebq5im1MYaFB5gL1k2UrsTO5KJ+37U5
         Fqx2OF5Z3NHa59v71XPNKl9K7qo73xZlLo3igIL6KsOdS6PXSBfDvITaNgiTV/nn2OpX
         FZGUtc7bollVJ5N8pYbBd3ZrDJZ7+QRhv2lB4cxPOsCi52tb3CJ1I2MV4nxyglDvEJOB
         T4kQ==
X-Gm-Message-State: AOAM53194yVMc3EAfUzoiplEkNOvWtF2tTBsr5yJwvytGs9+2O7cnYEl
        A5apunGbkk0vFj1MBEVDG6eJMSMqH7E5EX9PBk2aZxkYoAlW26N8zMAJkYJEH42tUMHcZHmfRlj
        wHKt+sjmwPnA+vgETEy2xstMAEhr2coAC0A==
X-Received: by 2002:aa7:d5d9:0:b0:416:1dd3:7714 with SMTP id d25-20020aa7d5d9000000b004161dd37714mr227092eds.256.1647446943352;
        Wed, 16 Mar 2022 09:09:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCtkGTQdiP3vvRu/2kBn3vjEyjsaD86uT7ggElKMStNWF4YDXMwHK5QYEqqeumvqUfmE/GdA==
X-Received: by 2002:aa7:d5d9:0:b0:416:1dd3:7714 with SMTP id d25-20020aa7d5d9000000b004161dd37714mr227069eds.256.1647446942979;
        Wed, 16 Mar 2022 09:09:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id u4-20020a170906780400b006ce69ff6050sm1060599ejm.69.2022.03.16.09.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 09:09:02 -0700 (PDT)
Message-ID: <27f17384-a59a-8649-ea71-392917d2d8f6@redhat.com>
Date:   Wed, 16 Mar 2022 17:09:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] nvidia-wmi-ec-backlight: Add workarounds for confused
 firmware
Content-Language: en-US
To:     Daniel Dadap <ddadap@nvidia.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Alexandru Dinu <alex.dinu07@gmail.com>
References: <20220316012516.2233984-1-ddadap@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220316012516.2233984-1-ddadap@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/16/22 02:25, Daniel Dadap wrote:
> Some notebook systems with EC-driven backlight control appear to have a
> firmware bug which causes the system to use GPU-driven backlight control
> upon a fresh boot, but then switches to EC-driven backlight control
> after completing a suspend/resume cycle. All the while, the firmware
> reports that the backlight is under EC control, regardless of what is
> actually controlling the backlight brightness.
> 
> This leads to the following behavior:
> 
> * nvidia-wmi-ec-backlight gets probed on a fresh boot, due to the
>   WMI-wrapped ACPI method erroneously reporting EC control.
> * nvidia-wmi-ec-backlight does not work until after a suspend/resume
>   cycle, due to the backlight control actually being GPU-driven.
> * GPU drivers also register their own backlight handlers: in the case
>   of the notebook system where this behavior has been observed, both
>   amdgpu and the NVIDIA proprietary driver register backlight handlers.
> * The GPU which has backlight control upon a fresh boot (amdgpu in the
>   case observed so far) can successfully control the backlight through
>   its backlight driver's sysfs interface, but stops working after the
>   first suspend/resume cycle.
> * nvidia-wmi-ec-backlight is unable to control the backlight upon a
>   fresh boot, but begins to work after the first suspend/resume cycle.
> * The GPU which does not have backlight control (NVIDIA in this case)
>   is not able to control the backlight at any point while the system
>   is in operation. On similar hybrid systems with an EC-controlled
>   backlight, and AMD/NVIDIA iGPU/dGPU, the NVIDIA proprietary driver
>   does not register its backlight handler. It has not been determined
>   whether the non-functional handler registered by the NVIDIA driver
>   is due to another firmware bug, or a bug in the NVIDIA driver.
> 
> Since nvidia-wmi-ec-backlight registers as a BACKLIGHT_FIRMWARE type
> device, it takes precedence over the BACKLIGHT_RAW devices registered
> by the GPU drivers. This in turn leads to backlight control appearing
> to be non-functional until after completing a suspend/resume cycle.
> However, it is still possible to control the backlight through direct
> interaction with the working GPU driver's backlight sysfs interface.
> 
> These systems also appear to have a second firmware bug which resets
> the EC's brightness level to 100% on resume, but leaves the state in
> the kernel at the pre-suspend level. This causes attempts to save
> and restore the backlight level across the suspend/resume cycle to
> fail, due to the level appearing not to change even though it did.
> 
> In order to work around these issue, add quirk tables to detect
> systems that are known to show these behaviors. So far, there is
> only one known system that requires these workarounds, and both
> issues are present on that system, but the quirks are tracked in
> separate tables to make it easier to add them to other systems which
> may exhibit one of the bugs, but not the other. The original systems
> that this driver was tested on during development do not exhibit
> either of these quirks.
> 
> If a system with the "GPU driver has backlight control" quirk is
> detected, nvidia-wmi-ec-backlight will grab a reference to the working
> (when freshly booted) GPU backlight handler and relays any backlight
> brightness level change requests directed at the EC to also be applied
> to the GPU backlight interface. This leads to redundant updates
> directed at the GPU backlight driver after a suspend/resume cycle, but
> it does allow the EC backlight control to work when the system is
> freshly booted.
> 
> If a system with the "backlight level reset to full on resume" quirk
> is detected, nvidia-wmi-ec-backlight will register a PM notifier to
> reset the backlight to the previous level upon resume.
> 
> These workarounds are also plumbed through to kernel module parameters,
> to make it easier for users who suspect they may be affected by one or
> both of these bugs to test whether these workarounds are effective on
> their systems as well.
> 
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> Tested-by: Alexandru Dinu <alex.dinu07@gmail.com>
> ---
>  .../platform/x86/nvidia-wmi-ec-backlight.c    | 181 +++++++++++++++++-
>  1 file changed, 179 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> index 61e37194df70..ccb3b506c12c 100644
> --- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> +++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> @@ -3,8 +3,11 @@
>   * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
>   */
>  
> +#define pr_fmt(f) "%s: " f "\n", KBUILD_MODNAME
> +
>  #include <linux/acpi.h>
>  #include <linux/backlight.h>
> +#include <linux/dmi.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/types.h>
> @@ -75,6 +78,69 @@ struct wmi_brightness_args {
>  	u32 ignored[3];
>  };
>  
> +/**
> + * struct nvidia_wmi_ec_backlight_priv - driver private data
> + * @bl_dev:       the associated backlight device
> + * @proxy_target: backlight device which receives relayed brightness changes
> + * @notifier:     notifier block for resume callback
> + */
> +struct nvidia_wmi_ec_backlight_priv {
> +	struct backlight_device *bl_dev;
> +	struct backlight_device *proxy_target;
> +	struct notifier_block nb;
> +};
> +
> +static char *backlight_proxy_target;
> +module_param(backlight_proxy_target, charp, 0);
> +MODULE_PARM_DESC(backlight_proxy_target, "Relay brightness change requests to the named backlight driver, on systems which erroneously report EC backlight control.");
> +
> +static int max_reprobe_attempts = 128;
> +module_param(max_reprobe_attempts, int, 0);
> +MODULE_PARM_DESC(max_reprobe_attempts, "Limit of reprobe attempts when relaying brightness change requests.");
> +
> +static bool restore_level_on_resume;
> +module_param(restore_level_on_resume, bool, 0);
> +MODULE_PARM_DESC(restore_level_on_resume, "Restore the backlight level when resuming from suspend, on systems which reset the EC's backlight level on resume.");
> +
> +static int assign_relay_quirk(const struct dmi_system_id *id)
> +{
> +	backlight_proxy_target = id->driver_data;
> +	return true;
> +}
> +
> +#define PROXY_QUIRK_ENTRY(vendor, product, quirk_data) { \
> +	.callback = assign_relay_quirk,                  \
> +	.matches = {                                     \
> +		DMI_MATCH(DMI_SYS_VENDOR, vendor),       \
> +		DMI_MATCH(DMI_PRODUCT_VERSION, product)  \
> +	},                                               \
> +	.driver_data = quirk_data                        \
> +}
> +
> +static const struct dmi_system_id proxy_quirk_table[] = {
> +	PROXY_QUIRK_ENTRY("LENOVO", "Legion S7 15ACH6", "amdgpu_bl1"),
> +	{ }
> +};
> +
> +static int assign_restore_quirk(const struct dmi_system_id *id)
> +{
> +	restore_level_on_resume = true;
> +	return true;
> +}
> +
> +#define RESTORE_QUIRK_ENTRY(vendor, product) {           \
> +	.callback = assign_restore_quirk,                \
> +	.matches = {                                     \
> +		DMI_MATCH(DMI_SYS_VENDOR, vendor),       \
> +		DMI_MATCH(DMI_PRODUCT_VERSION, product), \
> +	}                                                \
> +}
> +
> +static const struct dmi_system_id restore_quirk_table[] = {
> +	RESTORE_QUIRK_ENTRY("LENOVO", "Legion S7 15ACH6"),
> +	{ }
> +};
> +
>  /**
>   * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
>   * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTNESS_GUID

Note not a full review, just something which I noticed on a quick scan,
please use only 1 dmi_system_id table and make driver_data a bit field.

Here is some example code for that copied from another recent review:

So you would get something like this:

#define SERIO_QUIRK_RESET		BIT(0)
#define SERIO_QUIRK_NOMUX		BIT(1)
#define SERIO_QUIRK_NOPNP		BIT(2)
#define SERIO_QUIRK_NOLOOP		BIT(3)
#define SERIO_QUIRK_NOSELFTEST		BIT(4)
// etc.

static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
        {
                /* Entroware Proteus */
                .matches = {
                        DMI_MATCH(DMI_SYS_VENDOR, "Entroware"),
                        DMI_MATCH(DMI_PRODUCT_NAME, "Proteus"),
                        DMI_MATCH(DMI_PRODUCT_VERSION, "EL07R4"),
                },
		.driver_data = (void *)(SERIO_QUIRK_RESET | SERIO_QUIRK_NOMUX)
        },
	{}
};

I picked the Entroware EL07R4 as example here because it needs both the reset and nomux quirks.

And then when checking the quirks do:

#ifdef CONFIG_X86
	const struct dmi_system_id *dmi_id;
	long quirks = 0;

	dmi_id = dmi_first_match(i8042_dmi_quirk_table);
	if (dmi_id)
		quirks = (long)dmi_id->driver_data;

	if (i8042_reset == I8042_RESET_DEFAULT) {
		if (quirks & SERIO_QUIRK_RESET)
			i8042_reset = I8042_RESET_ALWAYS;
		if (quirks & SERIO_QUIRK_NOSELFTEST)
			i8042_reset = I8042_RESET_NEVER;
	}


This will already shrink the driver a bit by not having 2 dmi_system_id structs
for the single laptop model and this will also help to avoid getting even
more dmi_system_id tables if further quirks are necessary in the future,
basically I want to avoid ending up with something like the somewhat messy
code which is being cleaned-up here:

https://lore.kernel.org/linux-input/20220308170523.783284-2-wse@tuxedocomputers.com/

Regards,

Hans







> @@ -119,9 +185,30 @@ static int wmi_brightness_notify(struct wmi_device *w, enum wmi_brightness_metho
>  	return 0;
>  }
>  
> +static int scale_backlight_level(struct backlight_device *a,
> +				 struct backlight_device *b)
> +{
> +	/* because floating point math in the kernel is annoying */
> +	const int scaling_factor = 65536;
> +	int level = a->props.brightness;
> +	int relative_level = level * scaling_factor / a->props.max_brightness;
> +
> +	return relative_level * b->props.max_brightness / scaling_factor;
> +}
> +
>  static int nvidia_wmi_ec_backlight_update_status(struct backlight_device *bd)
>  {
>  	struct wmi_device *wdev = bl_get_data(bd);
> +	struct nvidia_wmi_ec_backlight_priv *priv = dev_get_drvdata(&wdev->dev);
> +	struct backlight_device *proxy_target = priv->proxy_target;
> +
> +	if (proxy_target) {
> +		int level = scale_backlight_level(bd, proxy_target);
> +
> +		if (backlight_device_set_brightness(proxy_target, level))
> +			pr_warn("Failed to relay backlight update to \"%s\"",
> +				backlight_proxy_target);
> +	}
>  
>  	return wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_LEVEL,
>  	                             WMI_BRIGHTNESS_MODE_SET,
> @@ -147,13 +234,65 @@ static const struct backlight_ops nvidia_wmi_ec_backlight_ops = {
>  	.get_brightness = nvidia_wmi_ec_backlight_get_brightness,
>  };
>  
> +static int nvidia_wmi_ec_backlight_pm_notifier(struct notifier_block *nb, unsigned long event, void *d)
> +{
> +
> +	/*
> +	 * On some systems, the EC backlight level gets reset to 100% when
> +	 * resuming from suspend, but the backlight device state still reflects
> +	 * the pre-suspend value. Refresh the existing state to sync the EC's
> +	 * state back up with the kernel's.
> +	 */
> +	if (event == PM_POST_SUSPEND) {
> +		struct nvidia_wmi_ec_backlight_priv *p;
> +
> +		p = container_of(nb, struct nvidia_wmi_ec_backlight_priv, nb);
> +		return backlight_update_status(p->bl_dev);
> +	}
> +
> +	return 0;
> +}
> +
>  static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ctx)
>  {
> +	struct backlight_device *bdev, *target = NULL;
> +	struct nvidia_wmi_ec_backlight_priv *priv;
>  	struct backlight_properties props = {};
> -	struct backlight_device *bdev;
>  	u32 source;
>  	int ret;
>  
> +	/*
> +	 * Check quirks tables to see if this system needs any of the firmware
> +	 * bug workarounds.
> +	 */
> +
> +	/* User-set quirks from the module parameters take precedence */
> +	if (!backlight_proxy_target)
> +		dmi_check_system(proxy_quirk_table);
> +
> +	dmi_check_system(restore_quirk_table);
> +
> +	if (backlight_proxy_target && backlight_proxy_target[0]) {
> +		static int num_reprobe_attempts;
> +
> +		target = backlight_device_get_by_name(backlight_proxy_target);
> +
> +		if (!target) {
> +			/*
> +			 * The target backlight device might not be ready;
> +			 * try again and disable backlight proxying if it
> +			 * fails too many times.
> +			 */
> +			if (num_reprobe_attempts < max_reprobe_attempts) {
> +				num_reprobe_attempts++;
> +				return -EPROBE_DEFER;
> +			}
> +
> +			pr_warn("Unable to acquire %s after %d attempts. Disabling backlight proxy.",
> +				backlight_proxy_target, max_reprobe_attempts);
> +		}
> +	}
> +
>  	ret = wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_SOURCE,
>  	                           WMI_BRIGHTNESS_MODE_GET, &source);
>  	if (ret)
> @@ -188,7 +327,44 @@ static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ct
>  					      &wdev->dev, wdev,
>  					      &nvidia_wmi_ec_backlight_ops,
>  					      &props);
> -	return PTR_ERR_OR_ZERO(bdev);
> +
> +	if (IS_ERR(bdev))
> +		return PTR_ERR(bdev);
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	priv->bl_dev = bdev;
> +
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	if (target) {
> +		int level = scale_backlight_level(target, bdev);
> +
> +		if (backlight_device_set_brightness(bdev, level))
> +			pr_warn("Unable to import initial brightness level from %s.",
> +				backlight_proxy_target);
> +		priv->proxy_target = target;
> +	}
> +
> +	if (restore_level_on_resume) {
> +		priv->nb.notifier_call = nvidia_wmi_ec_backlight_pm_notifier;
> +		register_pm_notifier(&priv->nb);
> +	}
> +
> +	return 0;
> +}
> +
> +static void nvidia_wmi_ec_backlight_remove(struct wmi_device *wdev)
> +{
> +	struct nvidia_wmi_ec_backlight_priv *priv = dev_get_drvdata(&wdev->dev);
> +	struct backlight_device *proxy_target = priv->proxy_target;
> +
> +	if (proxy_target)
> +		put_device(&proxy_target->dev);
> +
> +	if (priv->nb.notifier_call)
> +		unregister_pm_notifier(&priv->nb);
> +
> +	kfree(priv);
>  }
>  
>  #define WMI_BRIGHTNESS_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
> @@ -204,6 +380,7 @@ static struct wmi_driver nvidia_wmi_ec_backlight_driver = {
>  		.name = "nvidia-wmi-ec-backlight",
>  	},
>  	.probe = nvidia_wmi_ec_backlight_probe,
> +	.remove = nvidia_wmi_ec_backlight_remove,
>  	.id_table = nvidia_wmi_ec_backlight_id_table,
>  };
>  module_wmi_driver(nvidia_wmi_ec_backlight_driver);

