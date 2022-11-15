Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAC7C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Nov 2022 21:21:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbiKOVVF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Nov 2022 16:21:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238730AbiKOVUo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Nov 2022 16:20:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4DD42037D
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 13:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668547184;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S6ShQkyLLdbLnO//c2zo5jsrGb8IsoowZbdRWQ2W+pM=;
        b=iTNIbkqEOXqa+7Frswl6+rwgM8Kav1XeOXAHcDp1/7T+9MXV7opvXiiTKAvm6HXe7bnTK/
        pKXyDYEuYN+o+S1uIXMCaM1bb35FHCixxxweUNNYZ4HCNN/rEmfEBh/QJB45VC5Yp85KHm
        pkizFc/XKpaTyMYpiSUUUlAj4XeKP8Y=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-393-qNc6NxgeO1eIsZ_zikwQLw-1; Tue, 15 Nov 2022 16:19:43 -0500
X-MC-Unique: qNc6NxgeO1eIsZ_zikwQLw-1
Received: by mail-ej1-f71.google.com with SMTP id hs34-20020a1709073ea200b007ad86f91d39so8229496ejc.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 13:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6ShQkyLLdbLnO//c2zo5jsrGb8IsoowZbdRWQ2W+pM=;
        b=1z+Y9S+N/K2CgPvcKL5Ut+Ja8yVrnW7j6f4Bd7dGCsKiG04LsFDgI5RiUurZ1fVMbq
         2oOY6+6s5IeoN65ZCsbp8kigabcCaEC6vQxAI48M+6AXf5hAjfbDCa0c3qwKSiSa5NG2
         UeR21Q+BO8fQGA0IOMcJQpFw0l0qRtfU7wCnPSyVRAe0Ex0/ht5df/2OInlxE7n0u+1a
         Iwd5uPZllF9xMrLpOpTrNISjX1ZrqF8l/zsnVxCMDea9fqG+BnsuL0DyRSPgv4XykcSv
         hShVeVW8zKNdKUMHczalb1t7m9NSNx5CvLkaCHRv6bjJh1oUMySPEQQHRo8gA/Nu/aLE
         7FIg==
X-Gm-Message-State: ANoB5pkycOuMuVuKG2Vln7MCpJ30Xs3QdBl2/Wlg4M+40iecHbwmBHc8
        VT9iaoUDXgqFlfFVIszpMvaptr0ScZ7PTzx5WICg+i5jcthBccWGQaiED75S9wQrEnZEQDBnBrP
        6SzHha4eXsNCmk+0Ot+yrYxXbSAXnbuIXdQ==
X-Received: by 2002:a17:906:1613:b0:7a2:fa90:924 with SMTP id m19-20020a170906161300b007a2fa900924mr15503911ejd.674.1668547181213;
        Tue, 15 Nov 2022 13:19:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7sIzUDnDsumB0t+4uYno/kuwiC8gDqQsoLYUbNy6N97FePkA6mjs7o3HZp9nk75rWl+6kF5A==
X-Received: by 2002:a17:906:1613:b0:7a2:fa90:924 with SMTP id m19-20020a170906161300b007a2fa900924mr15503873ejd.674.1668547180397;
        Tue, 15 Nov 2022 13:19:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id kw9-20020a170907770900b00781dbdb292asm5933173ejc.155.2022.11.15.13.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 13:19:39 -0800 (PST)
Message-ID: <290fa898-9004-fac1-8071-d9864dd039ae@redhat.com>
Date:   Tue, 15 Nov 2022 22:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4] platform/x86: ideapad-laptop: support for more special
 keys in WMI
Content-Language: en-US, nl
To:     Philipp Jungkamp <p.jungkamp@gmx.net>, Armin Wolf <W_Armin@gmx.de>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <7e263715-e759-9293-ec53-27033a79a2bc@redhat.com>
 <20221115000954.51596-1-p.jungkamp@gmx.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221115000954.51596-1-p.jungkamp@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

I ended up looking at this because of:

https://patchwork.kernel.org/project/platform-driver-x86/patch/2655386.mvXUDI8C0e@wirelessprv-10-193-125-189.near.illinois.edu/

so here is a full review.

I have just pushed a slightly modified version of the above patch to:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

see:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=fixes&id=a3c272fae1468984d2ec4499d665ad8989d18388

this should also answer the concerns you mentioned in a previous email about the :

		if (!eval_hals(priv->adev->handle, &result)) {
			bool state = test_bit(HALS_FNLOCK_STATE_BIT, &result);

			exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF);
		}

part, since this will now be behind a DMI id based allow list,
since doing this everywhere clearly is a bad idea.

Also since you indicate that data->integer.value == 0x02 for
FnLock toggle, I believe that in your new code, this should
look something like this:

static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
{

...

	switch (wpriv->event) {
	case IDEAPAD_WMI_EVENT_ESC:
		ideapad_input_report(priv, 128);
		break;
	case IDEAPAD_WMI_EVENT_FN_KEYS:
		if (data->type != ACPI_TYPE_INTEGER) {
			dev_warn(&wdev->dev,
				 "WMI event data is not an integer\n");
			break;
		}

		dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
			data->integer.value);

		if (priv->features.set_fn_lock_led &&
		    data->integer.value == 0x02 &&
		    !eval_hals(priv->adev->handle, &result)) {
			bool state = test_bit(HALS_FNLOCK_STATE_BIT, &result);

			exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF);
		}

		ideapad_input_report(priv,
				     data->integer.value | IDEAPAD_WMI_KEY);

		break;
	}


Note I have also pushed some other pending ideapad-laptop changes to my review-hans
branch, so please base v5 on top of my latest review-hans branch:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I have some more comments inline below:

On 11/15/22 01:09, Philipp Jungkamp wrote:
> The event data of the WMI event 0xD0, which is assumed to be the
> fn_lock, is used to indicate several special keys on newer Yoga 7/9
> laptops.
> 
> The notify_id 0xD0 is non-unique in the DSDT of the Yoga 9 14IAP7, this
> causes wmi_get_event_data() to report wrong values.
> Port the ideapad-laptop WMI code to the wmi bus infrastructure which
> does not suffer from the shortcomings of wmi_get_event_data().
> 
> Signed-off-by: Philipp Jungkamp <p.jungkamp@gmx.net>
> ---
> This now uses the WMI bus infrastructure with both the platform driver and the
> wmi driver registered on module load. Is the synchronization used here
> sufficient?

Yes this looks good to me, thank you for doing it this way.

> Thanks for all the help!

You're welcome. Some small remarks in line.

> 
> Regards,
> Philipp Jungkamp
> 
>  drivers/platform/x86/ideapad-laptop.c | 240 ++++++++++++++++++++------
>  1 file changed, 188 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 33b3dfdd1b08..803bf5cf50f9 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -30,6 +30,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
> +#include <linux/wmi.h>
> 
>  #include <acpi/video.h>
> 
> @@ -38,10 +39,13 @@
>  #define IDEAPAD_RFKILL_DEV_NUM	3
> 
>  #if IS_ENABLED(CONFIG_ACPI_WMI)
> -static const char *const ideapad_wmi_fnesc_events[] = {
> -	"26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", /* Yoga 3 */
> -	"56322276-8493-4CE8-A783-98C991274F5E", /* Yoga 700 */
> -	"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", /* Legion 5 */
> +enum ideapad_wmi_event_type {
> +	IDEAPAD_WMI_EVENT_ESC,
> +	IDEAPAD_WMI_EVENT_FN_KEYS,
> +};
> +
> +struct ideapad_wmi_private {
> +	enum ideapad_wmi_event_type event;
>  };
>  #endif
> 
> @@ -130,7 +134,6 @@ struct ideapad_private {
>  	struct ideapad_dytc_priv *dytc;
>  	struct dentry *debug;
>  	unsigned long cfg;
> -	const char *fnesc_guid;
>  	struct {
>  		bool conservation_mode    : 1;
>  		bool dytc                 : 1;
> @@ -156,6 +159,42 @@ static bool allow_v4_dytc;
>  module_param(allow_v4_dytc, bool, 0444);
>  MODULE_PARM_DESC(allow_v4_dytc, "Enable DYTC version 4 platform-profile support.");
> 
> +/*
> + * shared data
> + */
> +
> +static struct ideapad_private *ideapad_shared;
> +static DEFINE_MUTEX(ideapad_shared_mutex);
> +
> +static int ideapad_shared_init(struct ideapad_private *priv)
> +{
> +	int ret;
> +
> +	mutex_lock(&ideapad_shared_mutex);
> +
> +	if (!ideapad_shared) {
> +		ideapad_shared = priv;
> +		ret = 0;
> +	} else {
> +		dev_warn(&priv->adev->dev, "found multiple platform devices\n");
> +		ret = -EINVAL;
> +	}
> +
> +	mutex_unlock(&ideapad_shared_mutex);
> +
> +	return ret;
> +}
> +
> +static void ideapad_shared_exit(struct ideapad_private *priv)
> +{
> +	mutex_lock(&ideapad_shared_mutex);
> +
> +	if (ideapad_shared == priv)
> +		ideapad_shared = NULL;
> +
> +	mutex_unlock(&ideapad_shared_mutex);
> +}
> +
>  /*
>   * ACPI Helpers
>   */
> @@ -1074,6 +1113,7 @@ static void ideapad_sysfs_exit(struct ideapad_private *priv)
>  /*
>   * input device
>   */
> +#define IDEAPAD_WMI_KEY 0x100
>  static const struct key_entry ideapad_keymap[] = {
>  	{ KE_KEY,   6, { KEY_SWITCHVIDEOMODE } },
>  	{ KE_KEY,   7, { KEY_CAMERA } },
> @@ -1087,6 +1127,28 @@ static const struct key_entry ideapad_keymap[] = {
>  	{ KE_KEY,  66, { KEY_TOUCHPAD_OFF } },
>  	{ KE_KEY,  67, { KEY_TOUCHPAD_ON } },
>  	{ KE_KEY, 128, { KEY_ESC } },
> +
> +	/*
> +	 * WMI keys
> +	 */
> +
> +	/* FnLock (handled by the firmware) */
> +	{ KE_IGNORE,	0x02 | IDEAPAD_WMI_KEY },
> +	/* Esc (handled by the firmware) */
> +	{ KE_IGNORE,	0x03 | IDEAPAD_WMI_KEY },
> +	/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
> +	{ KE_KEY,	0x01 | IDEAPAD_WMI_KEY, { KEY_FAVORITES } },
> +	/* Dark mode toggle */
> +	{ KE_KEY,	0x13 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
> +	/* Sound profile switch */
> +	{ KE_KEY,	0x12 | IDEAPAD_WMI_KEY, { KEY_PROG2 } },
> +	/* Lenovo Virtual Background application */
> +	{ KE_KEY,	0x28 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
> +	/* Lenovo Support */
> +	{ KE_KEY,	0x27 | IDEAPAD_WMI_KEY, { KEY_HELP } },
> +	/* Refresh Rate Toggle */
> +	{ KE_KEY,	0x0a | IDEAPAD_WMI_KEY, { KEY_DISPLAYTOGGLE } },
> +
>  	{ KE_END },
>  };
> 
> @@ -1490,30 +1552,6 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
>  	}
>  }
> 
> -#if IS_ENABLED(CONFIG_ACPI_WMI)
> -static void ideapad_wmi_notify(u32 value, void *context)
> -{
> -	struct ideapad_private *priv = context;
> -	unsigned long result;
> -
> -	switch (value) {
> -	case 128:
> -		ideapad_input_report(priv, value);
> -		break;
> -	case 208:
> -		if (!eval_hals(priv->adev->handle, &result)) {
> -			bool state = test_bit(HALS_FNLOCK_STATE_BIT, &result);
> -
> -			exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF);
> -		}
> -		break;
> -	default:
> -		dev_info(&priv->platform_device->dev,
> -			 "Unknown WMI event: %u\n", value);
> -	}
> -}
> -#endif
> -
>  /*
>   * Some ideapads have a hardware rfkill switch, but most do not have one.
>   * Reading VPCCMD_R_RF always results in 0 on models without a hardware rfkill,
> @@ -1589,6 +1627,95 @@ static void ideapad_check_features(struct ideapad_private *priv)
>  	}
>  }
> 
> +#if IS_ENABLED(CONFIG_ACPI_WMI)
> +/*
> + * WMI driver
> + */
> +static int ideapad_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct ideapad_wmi_private *wpriv;
> +
> +	wpriv = devm_kzalloc(&wdev->dev, sizeof(*wpriv), GFP_KERNEL);
> +	if (!wpriv)
> +		return -ENOMEM;
> +
> +	*wpriv = *(struct ideapad_wmi_private *)context;
> +
> +	dev_set_drvdata(&wdev->dev, wpriv);
> +	return 0;
> +}
> +
> +static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
> +{
> +	struct ideapad_wmi_private *wpriv = dev_get_drvdata(&wdev->dev);
> +	struct ideapad_private *priv;
> +	unsigned long result;
> +
> +	mutex_lock(&ideapad_shared_mutex);
> +
> +	priv = ideapad_shared;
> +	if (!priv)
> +		goto unlock;
> +
> +	switch (wpriv->event) {
> +	case IDEAPAD_WMI_EVENT_ESC:
> +		ideapad_input_report(priv, 128);
> +		break;
> +	case IDEAPAD_WMI_EVENT_FN_KEYS:
> +		if (!eval_hals(priv->adev->handle, &result)) {
> +			bool state = test_bit(HALS_FNLOCK_STATE_BIT, &result);
> +
> +			exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF);
> +		}
> +
> +		if (data->type != ACPI_TYPE_INTEGER) {
> +			dev_warn(&wdev->dev,
> +				 "WMI event data is not an integer\n");
> +			break;
> +		}
> +
> +		dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
> +			data->integer.value);
> +
> +		ideapad_input_report(priv,
> +				     data->integer.value | IDEAPAD_WMI_KEY);
> +
> +		break;
> +	}
> +unlock:
> +	mutex_unlock(&ideapad_shared_mutex);
> +}
> +
> +struct ideapad_wmi_private ideapad_wmi_context_esc = {
> +	.event = IDEAPAD_WMI_EVENT_ESC
> +};
> +
> +struct ideapad_wmi_private ideapad_wmi_context_fn_keys = {
> +	.event = IDEAPAD_WMI_EVENT_FN_KEYS
> +};
> +
> +static const struct wmi_device_id ideapad_wmi_ids[] = {
> +	{ "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", &ideapad_wmi_context_esc }, /* Yoga 3 */
> +	{ "56322276-8493-4CE8-A783-98C991274F5E", &ideapad_wmi_context_esc }, /* Yoga 700 */
> +	{ "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_context_fn_keys }, /* Legion 5 */
> +	{},
> +};
> +MODULE_DEVICE_TABLE(wmi, ideapad_wmi_ids);
> +
> +static struct wmi_driver ideapad_wmi_driver = {
> +	.driver = {
> +		.name = "ideapad_wmi",
> +	},
> +	.id_table = ideapad_wmi_ids,
> +	.probe = ideapad_wmi_probe,
> +	.notify = ideapad_wmi_notify,
> +};
> +

Please add the following here:

static int ideapad_wmi_register_driver(void)
{
	return wmi_driver_register(&ideapad_wmi_driver);
}

static void ideapad_wmi_unregister_driver(void)
{
	return wmi_driver_unregister(&ideapad_wmi_driver);
}

#else

static inline int ideapad_wmi_register_driver(void) { return 0; }
static inline void ideapad_wmi_unregister_driver(void) { }

> +#endif
> +
> +/*
> + * ACPI driver
> + */
>  static int ideapad_acpi_add(struct platform_device *pdev)
>  {
>  	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
> @@ -1670,30 +1797,16 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>  		goto notification_failed;
>  	}
> 
> -#if IS_ENABLED(CONFIG_ACPI_WMI)
> -	for (i = 0; i < ARRAY_SIZE(ideapad_wmi_fnesc_events); i++) {
> -		status = wmi_install_notify_handler(ideapad_wmi_fnesc_events[i],
> -						    ideapad_wmi_notify, priv);
> -		if (ACPI_SUCCESS(status)) {
> -			priv->fnesc_guid = ideapad_wmi_fnesc_events[i];
> -			break;
> -		}
> -	}
> -
> -	if (ACPI_FAILURE(status) && status != AE_NOT_EXIST) {
> -		err = -EIO;
> -		goto notification_failed_wmi;
> -	}
> -#endif
> +	err = ideapad_shared_init(priv);
> +	if (err)
> +		goto shared_init_failed;
> 
>  	return 0;
> 
> -#if IS_ENABLED(CONFIG_ACPI_WMI)
> -notification_failed_wmi:
> +shared_init_failed:
>  	acpi_remove_notify_handler(priv->adev->handle,
>  				   ACPI_DEVICE_NOTIFY,
>  				   ideapad_acpi_notify);
> -#endif
> 
>  notification_failed:
>  	ideapad_backlight_exit(priv);
> @@ -1719,10 +1832,7 @@ static int ideapad_acpi_remove(struct platform_device *pdev)
>  	struct ideapad_private *priv = dev_get_drvdata(&pdev->dev);
>  	int i;
> 
> -#if IS_ENABLED(CONFIG_ACPI_WMI)
> -	if (priv->fnesc_guid)
> -		wmi_remove_notify_handler(priv->fnesc_guid);
> -#endif
> +	ideapad_shared_exit(priv);
> 
>  	acpi_remove_notify_handler(priv->adev->handle,
>  				   ACPI_DEVICE_NOTIFY,
> @@ -1774,7 +1884,33 @@ static struct platform_driver ideapad_acpi_driver = {
>  	},
>  };
> 
> -module_platform_driver(ideapad_acpi_driver);
> +static int __init ideapad_laptop_init(void)
> +{
> +	int err;
> +
> +#if IS_ENABLED(CONFIG_ACPI_WMI)
> +	err = wmi_driver_register(&ideapad_wmi_driver);
> +	if (err)
> +		return err;
> +#endif

And use ideapad_wmi_register_driver() here and drop
the #ifdef-s. This using a little helper in the
existing/main #ifdef block + static inline no-op
versions in a #else there is a standard pattern in
the kernel to avoid sprinkling #ifdef-s everywhere.

> +
> +	err = platform_driver_register(&ideapad_acpi_driver);
> +	if (err)
> +		return err;

This needs to be:

	if (err) {
		ideapad_wmi__driver_unregister();
		return err;
	}

And the unregister here is also much cleaner with the wrappers
,avoiding another #ifdef  :)


> +
> +	return 0;
> +}
> +module_init(ideapad_laptop_init)
> +
> +static void __exit ideapad_laptop_exit(void)
> +{
> +#if IS_ENABLED(CONFIG_ACPI_WMI)
> +	wmi_driver_unregister(&ideapad_wmi_driver);
> +#endif

And use ideapad_wmi__driver_unregister here too.

Apart from my few small remarks above this looks good
and I expect that I can merge a v5 addressing these
remarks pretty quickly (so in time for the 6.2 merge window).

Regards,

Hans




> +
> +	platform_driver_unregister(&ideapad_acpi_driver);
> +}
> +module_exit(ideapad_laptop_exit)
> 
>  MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
>  MODULE_DESCRIPTION("IdeaPad ACPI Extras");
> --
> 2.38.1
> 

