Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61292C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Nov 2022 14:44:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbiKPOox (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Nov 2022 09:44:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiKPOox (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Nov 2022 09:44:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF64A3E0B7
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Nov 2022 06:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668609839;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NVKf04pTFPGwU+ic8tNp50Mm+OIe3d1s8c54oWnOmcU=;
        b=iivGo6xSXDV5Dkq9MU/SqeFdcsspJcGE94OQdiLvPQ9JgEb7gFKbFY0euZ2NBXbNu38tmS
        JrRQp57i65qps5QWIu/TQcm/W8h2BxfJw7I/3NCXO7DHt8Lv/7Rxy3DnWcH7wNX3CNqL0j
        fmp7WsHGFF43+abgqDTKkPwjxGnvxEU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-400-d-kKNRGjPDysMqT-nu1a3A-1; Wed, 16 Nov 2022 09:43:57 -0500
X-MC-Unique: d-kKNRGjPDysMqT-nu1a3A-1
Received: by mail-ej1-f70.google.com with SMTP id ne36-20020a1709077ba400b007aeaf3dcbcaso9411281ejc.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Nov 2022 06:43:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NVKf04pTFPGwU+ic8tNp50Mm+OIe3d1s8c54oWnOmcU=;
        b=HO/E8Joy8DZmljwaDQs3/yQPQg1VnDMr1fyttuNVnp0EYv5Q36a2komSo7AN9smfRG
         eowFDumBX9eoMZBM1z39xcHH8ipKX/sfrackE4ZUhmJGJpPeQO/tCf+Z1Fw4IutT72Lv
         RI4P2ep/b8vwWSKyAHCTBcv0mHyU6b8unmUEcdi9WsndQXzDLWzvPf4jXd7167xuPwh1
         LKGwJ13c3Y8eYOJCukbE8ErzU7r7wdK2Iwg7flOUnoHzxDIeUqmWTYKCMEatsAY/5Tik
         XviOBaFCKUUOKMIeAg6D+o3VWx8XCKef7vOrI0jGp03ErlHfR5Njd2w4rnHlo21zdj9e
         sHYw==
X-Gm-Message-State: ANoB5pmHvVdTrh+m9GGZRP6Ff3RKAPwZhoqJhlq0NGBW0hYkG98jjSoM
        K2HoYORBdN5dlFRtnTrPmO+1+TpPPBcq9auibCUtHoZDsCdsPe7zf81m6Guvpv6WeGdfWv8GWC3
        GHJzlVv3kYZfBtMPO1HiAWZ11SUvUepznqA==
X-Received: by 2002:aa7:d88d:0:b0:461:b4e2:904d with SMTP id u13-20020aa7d88d000000b00461b4e2904dmr19331458edq.216.1668609836538;
        Wed, 16 Nov 2022 06:43:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4QytGbjMb27iCF9OSapjHttdwWLBIvhynHi4HEgolqIfMEK/KEyhTN1X5xm/Qka/jwrwZzfQ==
X-Received: by 2002:aa7:d88d:0:b0:461:b4e2:904d with SMTP id u13-20020aa7d88d000000b00461b4e2904dmr19331446edq.216.1668609836267;
        Wed, 16 Nov 2022 06:43:56 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id qo14-20020a170907874e00b007a03313a78esm6971650ejc.20.2022.11.16.06.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 06:43:55 -0800 (PST)
Message-ID: <869466b7-46d5-b0be-d951-899f8fd0c321@redhat.com>
Date:   Wed, 16 Nov 2022 15:43:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5] platform/x86: ideapad-laptop: support for more special
 keys in WMI
Content-Language: en-US, nl
To:     Philipp Jungkamp <p.jungkamp@gmx.net>, Armin Wolf <W_Armin@gmx.de>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <290fa898-9004-fac1-8071-d9864dd039ae@redhat.com>
 <20221116110647.3438-1-p.jungkamp@gmx.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221116110647.3438-1-p.jungkamp@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/16/22 12:06, Philipp Jungkamp wrote:
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
> I did not add the "data->integer.value == 0x02" condition to the wmi_notify
> handler. The event data 0x02 and 0x03 are both emitted when changing toggling
> the fn-lock, depending on the new setting. Since I don't know whether the
> event data checks out on the affected laptops I'd prefer to omit the check.

Ok, that is fair. Maybe one day we can actually get someone to run some
tests and add an data->integer.value check later.

I have merged this now, with some small fixups, see comments inline / below
for the fixups:

<std patch accepted message>
Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.
</std patch accepted message>


>  drivers/platform/x86/ideapad-laptop.c | 255 ++++++++++++++++++++------
>  1 file changed, 200 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index a279f41d984b..ac5ad0e36e5e 100644
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

These declarations are not used outside of the other

#if IS_ENABLED(CONFIG_ACPI_WMI) block, so I have
moved them to the top of that block to avoid
the extra #if / #endif pair


> @@ -141,7 +145,6 @@ struct ideapad_private {
>  	struct ideapad_dytc_priv *dytc;
>  	struct dentry *debug;
>  	unsigned long cfg;
> -	const char *fnesc_guid;
>  	struct {
>  		bool conservation_mode    : 1;
>  		bool dytc                 : 1;
> @@ -182,6 +185,42 @@ MODULE_PARM_DESC(set_fn_lock_led,
>  	"Enable driver based updates of the fn-lock LED on fn-lock changes. "
>  	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
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
> @@ -1110,6 +1149,7 @@ static void ideapad_sysfs_exit(struct ideapad_private *priv)
>  /*
>   * input device
>   */
> +#define IDEAPAD_WMI_KEY 0x100
>  static const struct key_entry ideapad_keymap[] = {
>  	{ KE_KEY,   6, { KEY_SWITCHVIDEOMODE } },
>  	{ KE_KEY,   7, { KEY_CAMERA } },
> @@ -1123,6 +1163,28 @@ static const struct key_entry ideapad_keymap[] = {
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
> @@ -1526,33 +1588,6 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
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
> -		if (!priv->features.set_fn_lock_led)
> -			break;
> -
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
>  /* On some models we need to call exec_sals(SALS_FNLOCK_ON/OFF to set the LED */
>  static const struct dmi_system_id set_fn_lock_led_list[] = {
>  	{
> @@ -1643,6 +1678,110 @@ static void ideapad_check_features(struct ideapad_private *priv)
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
> +		if (priv->features.set_fn_lock_led &&
> +		    !eval_hals(priv->adev->handle, &result)) {
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

These 2 can be (and should be) "static const struct ..." I've
fixed this up while merging the patch.

Other then this, the patch looks great (and has been merged)
thank you for your work on this.

Regards,

Hans










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
> +static int ideapad_wmi_driver_register(void)
> +{
> +	return wmi_driver_register(&ideapad_wmi_driver);
> +}
> +
> +static void ideapad_wmi_driver_unregister(void)
> +{
> +	return wmi_driver_unregister(&ideapad_wmi_driver);
> +}
> +
> +#else
> +
> +static inline int ideapad_wmi_driver_register(void) { return 0; }
> +static inline void ideapad_wmi_driver_unregister(void) { }
> +#endif
> +
> +/*
> + * ACPI driver
> + */
>  static int ideapad_acpi_add(struct platform_device *pdev)
>  {
>  	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
> @@ -1724,30 +1863,16 @@ static int ideapad_acpi_add(struct platform_device *pdev)
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
> @@ -1773,10 +1898,7 @@ static int ideapad_acpi_remove(struct platform_device *pdev)
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
> @@ -1828,7 +1950,30 @@ static struct platform_driver ideapad_acpi_driver = {
>  	},
>  };
> 
> -module_platform_driver(ideapad_acpi_driver);
> +static int __init ideapad_laptop_init(void)
> +{
> +	int err;
> +
> +	err = ideapad_wmi_driver_register();
> +	if (err)
> +		return err;
> +
> +	err = platform_driver_register(&ideapad_acpi_driver);
> +	if (err) {
> +		ideapad_wmi_driver_unregister();
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +module_init(ideapad_laptop_init)
> +
> +static void __exit ideapad_laptop_exit(void)
> +{
> +	ideapad_wmi_driver_unregister();
> +	platform_driver_unregister(&ideapad_acpi_driver);
> +}
> +module_exit(ideapad_laptop_exit)
> 
>  MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
>  MODULE_DESCRIPTION("IdeaPad ACPI Extras");
> --
> 2.38.1
> 

