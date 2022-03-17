Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A084C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Mar 2022 12:17:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbiCQMTF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Mar 2022 08:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233499AbiCQMTE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Mar 2022 08:19:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 841551EA5F9
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Mar 2022 05:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647519465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XhMZPCy0qj8HNN18U+W3uKVdh3FfMoVyoVD7z4AFCEQ=;
        b=G/pX4QrzmDAoVu4mawU2wzkRp++ZwNt5cQh3JLfwm0pb4/uwXWUr14OBEGvTvG3bm4EcQe
        SnJnBfMDmEYMeKCk0i0xMieWskBbYxe+JX9m49XpxjFW5hBd4UfkQx703MvXdGTie6RCd4
        DxbeuiXhltCuoExqWmHXvmW57LUE+YM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-ASr77RraPPOOkPliDuiPEw-1; Thu, 17 Mar 2022 08:17:44 -0400
X-MC-Unique: ASr77RraPPOOkPliDuiPEw-1
Received: by mail-ed1-f70.google.com with SMTP id l24-20020a056402231800b00410f19a3103so3022101eda.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Mar 2022 05:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XhMZPCy0qj8HNN18U+W3uKVdh3FfMoVyoVD7z4AFCEQ=;
        b=IT0OtFVNtMePK4lSl1bmgdyf3/G11WyYONW3hTrLs6jvl0Vnq82c7cOfmlool1NLJz
         KKNv29orkGPqDqPgi1cOov8mZY2r9rsHnQTvNVRPaFsnIbCgwSiHCELiawLBySUKTHiq
         1UKrWpdP7zrgrf86g/qxD5vRpKxbWqw6JX3xZwXktnJYbntSOxXU1LeeNQYNp8H3swTp
         ozENy4Wwpi5/i2+OAf8TGntoFf2waRjIw3e+n3d+DzNxAhXapAbEVq5r7prE9WpvOMLF
         JQQ5Z9CGrOaLO12+2/jZOT8Sloqm+uBrEBiekQtQJlg3S90k4rzD6Kv2ghVjbAk8eq6x
         xhJw==
X-Gm-Message-State: AOAM530b2i8UGwlJM9UqQX0EZqn/j+P4updH3slw4NL6Rb6iJchES0P1
        2lK5eOOODR3obJwsyp6YQTNu3v0NAcHBQuSh8rNbvLadzGqNmdS608Ouyd5Xxe6wb6czQ1JJ1OV
        DHf1x7XIEgYuS1a/3dITsILau2n9zPbd6aw==
X-Received: by 2002:a05:6402:3452:b0:418:f963:42a3 with SMTP id l18-20020a056402345200b00418f96342a3mr2620136edc.12.1647519462941;
        Thu, 17 Mar 2022 05:17:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWe8w5jVcxDoczee1G5xpZ4Mie3qoUusJdAJYL+h3T2OadfxiDpbaemRsGgTXPg4P7BCWJSw==
X-Received: by 2002:a05:6402:3452:b0:418:f963:42a3 with SMTP id l18-20020a056402345200b00418f96342a3mr2620090edc.12.1647519462492;
        Thu, 17 Mar 2022 05:17:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id s11-20020a056402520b00b00416c0baee96sm2659056edd.6.2022.03.17.05.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 05:17:41 -0700 (PDT)
Message-ID: <100e0cb5-98c4-cdd9-cfc7-4b76edef8950@redhat.com>
Date:   Thu, 17 Mar 2022 13:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] nvidia-wmi-ec-backlight: Add workarounds for confused
 firmware
Content-Language: en-US
To:     Daniel Dadap <ddadap@nvidia.com>,
        platform-driver-x86@vger.kernel.org
Cc:     pobrn@protonmail.com, markgross@kernel.org,
        Mario.Limonciello@amd.com, Alexandru Dinu <alex.dinu07@gmail.com>
References: <0fbfd32e-904d-1e04-8508-e863c357a2ff@nvidia.com>
 <20220316203325.2242536-1-ddadap@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220316203325.2242536-1-ddadap@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/16/22 21:33, Daniel Dadap wrote:
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
> In order to work around these issues, add a quirk table to detect
> systems that are known to show these behaviors. So far, there is
> only one known system that requires these workarounds, and both
> issues are present on that system, but the quirks are tracked
> separately to make it easier to add them to other systems which
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

Ugh, I'm really not a fan of the backlight proxy plan here. I have
plans to clean-up the whole x86 backlight mess soon and an important part
of that is to stop registering multiple backlight interfaces for the
same panel/screen.

Where as going with this workaround requires us to have 2 active
backlight interfaces active. Also this will very likely work to
(subtly) different backlight behavior before and after the first
suspend/resume.

Is there no other way to solve this issue? Maybe we need to poke
vgaswitcheroo to set the current GPU mode even though this is
already reported as active to get things to switch to the ECs
control right away ?

I'm pretty certain that Windows is not doing this backlight proxying,
IMHO we need to figure out what causes the switch after suspend/resume
and then do that thing at boot.

Regards,

Hans



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
> Note: the Tested-by: line above applies to the previous version of this
> patch; an explicit ACK from the tester is required for it to apply to
> the current version.
> 
> v2:
>  * Add readable sysfs files for module params, use linear interpolation
>    from fixp-arith.h, fix return value of notifier callback, use devm_*()
>    for kzalloc and put_device. (Barnabás Pőcze <pobrn@protonmail.com>)
>  * Add comment to denote known firmware versions that exhibit the bugs.
>    (Mario Limonciello <Mario.Limonciello@amd.com>)
>  * Unify separate per-quirk tables. (Hans de Goede <hdegoede@redhat.com>)
> 
>  .../platform/x86/nvidia-wmi-ec-backlight.c    | 196 +++++++++++++++++-
>  1 file changed, 194 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> index 61e37194df70..95e1ddf780fc 100644
> --- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> +++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> @@ -3,8 +3,12 @@
>   * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
>   */
>  
> +#define pr_fmt(f) KBUILD_MODNAME ": " f "\n"
> +
>  #include <linux/acpi.h>
>  #include <linux/backlight.h>
> +#include <linux/dmi.h>
> +#include <linux/fixp-arith.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/types.h>
> @@ -75,6 +79,73 @@ struct wmi_brightness_args {
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
> +module_param(backlight_proxy_target, charp, 0444);
> +MODULE_PARM_DESC(backlight_proxy_target, "Relay brightness change requests to the named backlight driver, on systems which erroneously report EC backlight control.");
> +
> +static int max_reprobe_attempts = 128;
> +module_param(max_reprobe_attempts, int, 0444);
> +MODULE_PARM_DESC(max_reprobe_attempts, "Limit of reprobe attempts when relaying brightness change requests.");
> +
> +static bool restore_level_on_resume;
> +module_param(restore_level_on_resume, bool, 0444);
> +MODULE_PARM_DESC(restore_level_on_resume, "Restore the backlight level when resuming from suspend, on systems which reset the EC's backlight level on resume.");
> +
> +/* Bit field values for quirks table */
> +
> +#define NVIDIA_WMI_EC_BACKLIGHT_QUIRK_RESTORE_LEVEL_ON_RESUME   BIT(0)
> +
> +/* bits 1-7: reserved for future quirks; bits 8+: proxy target device names */
> +
> +#define NVIDIA_WMI_EC_BACKLIGHT_QUIRK_PROXY_TO_AMDGPU_BL1       BIT(8)
> +
> +#define QUIRK(name) NVIDIA_WMI_EC_BACKLIGHT_QUIRK_##name
> +#define HAS_QUIRK(data, name) (((long) data) & QUIRK(name))
> +
> +static int assign_quirks(const struct dmi_system_id *id)
> +{
> +	if (HAS_QUIRK(id->driver_data, RESTORE_LEVEL_ON_RESUME))
> +		restore_level_on_resume = 1;
> +
> +	/* If the module parameter is set, override the quirks table */
> +	if (!backlight_proxy_target) {
> +		if (HAS_QUIRK(id->driver_data, PROXY_TO_AMDGPU_BL1))
> +			backlight_proxy_target = "amdgpu_bl1";
> +	}
> +
> +	return true;
> +}
> +
> +#define QUIRK_ENTRY(vendor, product, quirks) {          \
> +	.callback = assign_quirks,                      \
> +	.matches = {                                    \
> +		DMI_MATCH(DMI_SYS_VENDOR, vendor),      \
> +		DMI_MATCH(DMI_PRODUCT_VERSION, product) \
> +	},                                              \
> +	.driver_data = (void *)(quirks)                 \
> +}
> +
> +static const struct dmi_system_id quirks_table[] = {
> +	QUIRK_ENTRY(
> +		/* This quirk is preset as of firmware revision HACN31WW */
> +		"LENOVO", "Legion S7 15ACH6",
> +		QUIRK(RESTORE_LEVEL_ON_RESUME) | QUIRK(PROXY_TO_AMDGPU_BL1)
> +	),
> +	{ }
> +};
> +
>  /**
>   * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
>   * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTNESS_GUID
> @@ -119,9 +190,30 @@ static int wmi_brightness_notify(struct wmi_device *w, enum wmi_brightness_metho
>  	return 0;
>  }
>  
> +/* Scale the current brightness level of 'from' to the range of 'to'. */
> +static int scale_backlight_level(const struct backlight_device *from,
> +				 const struct backlight_device *to)
> +{
> +	int from_max = from->props.max_brightness;
> +	int from_level = from->props.brightness;
> +	int to_max = to->props.max_brightness;
> +
> +	return fixp_linear_interpolate(0, 0, from_max, to_max, from_level);
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
> @@ -147,13 +239,78 @@ static const struct backlight_ops nvidia_wmi_ec_backlight_ops = {
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
> +		int ret;
> +
> +		p = container_of(nb, struct nvidia_wmi_ec_backlight_priv, nb);
> +		ret = backlight_update_status(p->bl_dev);
> +
> +		if (ret)
> +			pr_warn("failed to refresh backlight level: %d", ret);
> +
> +		return NOTIFY_OK;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static void putdev(void *data)
> +{
> +	struct device *dev = data;
> +
> +	put_device(dev);
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
> +	dmi_check_system(quirks_table);
> +
> +	if (backlight_proxy_target && backlight_proxy_target[0]) {
> +		static int num_reprobe_attempts;
> +
> +		target = backlight_device_get_by_name(backlight_proxy_target);
> +
> +		if (target) {
> +			ret = devm_add_action_or_reset(&wdev->dev, putdev,
> +						       &target->dev);
> +			if (ret)
> +				return ret;
> +		} else {
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
> @@ -188,7 +345,41 @@ static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ct
>  					      &wdev->dev, wdev,
>  					      &nvidia_wmi_ec_backlight_ops,
>  					      &props);
> -	return PTR_ERR_OR_ZERO(bdev);
> +
> +	if (IS_ERR(bdev))
> +		return PTR_ERR(bdev);
> +
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
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
> +
> +	if (priv->nb.notifier_call)
> +		unregister_pm_notifier(&priv->nb);
>  }
>  
>  #define WMI_BRIGHTNESS_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
> @@ -204,6 +395,7 @@ static struct wmi_driver nvidia_wmi_ec_backlight_driver = {
>  		.name = "nvidia-wmi-ec-backlight",
>  	},
>  	.probe = nvidia_wmi_ec_backlight_probe,
> +	.remove = nvidia_wmi_ec_backlight_remove,
>  	.id_table = nvidia_wmi_ec_backlight_id_table,
>  };
>  module_wmi_driver(nvidia_wmi_ec_backlight_driver);

