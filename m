Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E026EC4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Nov 2022 16:16:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235936AbiKNQQI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Nov 2022 11:16:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbiKNQQH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Nov 2022 11:16:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E2D22034E
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Nov 2022 08:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668442513;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lqfsJV7dPgqVx27qmgyKnfrpb21PpAlrqPXKtFaOkws=;
        b=K08Xif+ju0sdimOO36JQbYJcIu6IeRRrjBY/LJucVzO2tqGUJm8G2cQl0d8P22pi5SYfsd
        YtPgVUFvZjpdEwbwNtsVdfweShyyCU+X9ugoGo7LhCKj8/fYR6d7El8d0JTNtB0kVTBoEN
        KPIkQep8JLQ2fTZ7fmTpP553XP3sDqk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-WGBJl4KMOiWWnu1wfTSpSw-1; Mon, 14 Nov 2022 11:15:12 -0500
X-MC-Unique: WGBJl4KMOiWWnu1wfTSpSw-1
Received: by mail-ej1-f72.google.com with SMTP id sb4-20020a1709076d8400b007ae596eac08so5801033ejc.22
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Nov 2022 08:15:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lqfsJV7dPgqVx27qmgyKnfrpb21PpAlrqPXKtFaOkws=;
        b=4ZBVOZN444LzRzY7EUCNLai7SEhwe2lVfGWLyf8rolOLqCAZSruwbQpA0RhvsalBRv
         2Ob0mBaxJDaf63lKcOp49Unfu+QyQZARn+RcGj5Uj8HAtXgyqt5Iyl2d5/kxsnw7gU6r
         TS9hYV4UkfQu/hVGcUeRb+HwDuzEG9DMbu26vp9zK4CZJpPbrLXR8lViG1ZhokPDMiz5
         8p2rUeFluSD4l4x2deEdqWiw0aduxBBOcthEfprs2fOKkH6YkXRUQ6cy+XUe0RKAcipK
         nIRIWmNzTfc/HUCi4sVNbNTV/tcUcDxc93ZG2HP+MK06CeRhzwnJ8TdGewPXDdhxmQvR
         XTxg==
X-Gm-Message-State: ANoB5pkinfEl0pqQZQ46VpaMG724AoP7Sg2T5wcfC+3MDAxgAPkAKNoQ
        Bxoa1tJoWueyKzbnEG6bXJEa4OrYvkuuUaixm73BzRhPW7QscI19auFySKAkRPkkOG28YiX7A0E
        wLOh3eImY/zz2LjMx3+2rKTd8uTP83wBHtQ==
X-Received: by 2002:a17:907:76f1:b0:7ae:129b:2d3a with SMTP id kg17-20020a17090776f100b007ae129b2d3amr10567477ejc.552.1668442510838;
        Mon, 14 Nov 2022 08:15:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4UJzEFF73jP7RIZP8bYiC2W3jC2BVNmT4XYADdcTh2wMbcqhKMw1MY/CmmgSPvq/usJM1qSQ==
X-Received: by 2002:a17:907:76f1:b0:7ae:129b:2d3a with SMTP id kg17-20020a17090776f100b007ae129b2d3amr10567466ejc.552.1668442510609;
        Mon, 14 Nov 2022 08:15:10 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id q21-20020a17090676d500b007826c0a05ecsm4279911ejn.209.2022.11.14.08.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 08:15:10 -0800 (PST)
Message-ID: <777e0ff5-e10a-c9b0-2ca9-c480d7232b9f@redhat.com>
Date:   Mon, 14 Nov 2022 17:15:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: support for more special
 keys in WMI
Content-Language: en-US
To:     Philipp Jungkamp <p.jungkamp@gmx.net>, Armin Wolf <W_Armin@gmx.de>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <6794a6cc-6049-66bf-cee8-a35105669fcb@gmx.de>
 <20221114144140.5054-1-p.jungkamp@gmx.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221114144140.5054-1-p.jungkamp@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Philiph,

On 11/14/22 15:41, Philipp Jungkamp wrote:
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
> Hello,
> 
> is this about right? It works for me.
> 
> What I don't really like here is the dev_set_drvdata() which takes a non-const
> void * and I pass it a const pointer. I do cast the value of dev_get_drvdata()
> back to a const pointer, but this seems rather ugly.
> I preferred it over allocating a single int for the device or casting an enum
> to a void *. This additionally removes the need for a remove funtion.

Thank you for both the v2 and this new interesting approach. Unfortunately
I have a bit of a patch backlog so I'm not sure when I will get around to
this. I will try to get this reviewed / commented on no later then sometime
next week.

Regards,

Hans







> 
> Regards,
> Philipp
> 
>  drivers/platform/x86/ideapad-laptop.c | 109 +++++++++++++++++++-------
>  1 file changed, 80 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 33b3dfdd1b08..6d35a9e961cf 100644
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
> @@ -38,10 +39,19 @@
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
> +enum ideapad_wmi_event_type ideapad_wmi_esc = IDEAPAD_WMI_EVENT_ESC,
> +enum ideapad_wmi_event_type ideapad_wmi_fn_keys = IDEAPAD_WMI_EVENT_FN_KEYS;
> +
> +static const struct wmi_device_id ideapad_wmi_id_table[] = {
> +	{ "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", &ideapad_wmi_esc }, /* Yoga 3 */
> +	{ "56322276-8493-4CE8-A783-98C991274F5E", &ideapad_wmi_esc }, /* Yoga 700 */
> +	{ "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_fn_keys }, /* Legion 5 */
> +	{}
>  };
>  #endif
> 
> @@ -130,7 +140,7 @@ struct ideapad_private {
>  	struct ideapad_dytc_priv *dytc;
>  	struct dentry *debug;
>  	unsigned long cfg;
> -	const char *fnesc_guid;
> +	struct wmi_driver wmi_drv;
>  	struct {
>  		bool conservation_mode    : 1;
>  		bool dytc                 : 1;
> @@ -1074,6 +1084,7 @@ static void ideapad_sysfs_exit(struct ideapad_private *priv)
>  /*
>   * input device
>   */
> +#define IDEAPAD_WMI_KEY 0x100
>  static const struct key_entry ideapad_keymap[] = {
>  	{ KE_KEY,   6, { KEY_SWITCHVIDEOMODE } },
>  	{ KE_KEY,   7, { KEY_CAMERA } },
> @@ -1087,6 +1098,26 @@ static const struct key_entry ideapad_keymap[] = {
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
> @@ -1491,25 +1522,47 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
>  }
> 
>  #if IS_ENABLED(CONFIG_ACPI_WMI)
> -static void ideapad_wmi_notify(u32 value, void *context)
> +static int ideapad_wmi_probe(struct wmi_device *wdev, const void *context)
>  {
> -	struct ideapad_private *priv = context;
> +	dev_set_drvdata(&wdev->dev, (void *) context);
> +	return 0;
> +}
> +
> +static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
> +{
> +	struct wmi_driver *wdrv = container_of(wdev->dev.driver,
> +					       struct wmi_driver,
> +					       driver);
> +	struct ideapad_private *priv = container_of(wdrv,
> +						    struct ideapad_private,
> +						    wmi_drv);
> +	const enum ideapad_wmi_event_type *event = dev_get_drvdata(&wdev->dev);
>  	unsigned long result;
> 
> -	switch (value) {
> -	case 128:
> -		ideapad_input_report(priv, value);
> +	switch (*event) {
> +	case IDEAPAD_WMI_EVENT_ESC:
> +		ideapad_input_report(priv, 128);
>  		break;
> -	case 208:
> +	case IDEAPAD_WMI_EVENT_FN_KEYS:
>  		if (!eval_hals(priv->adev->handle, &result)) {
>  			bool state = test_bit(HALS_FNLOCK_STATE_BIT, &result);
> 
>  			exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF);
>  		}
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
>  		break;
> -	default:
> -		dev_info(&priv->platform_device->dev,
> -			 "Unknown WMI event: %u\n", value);
>  	}
>  }
>  #endif
> @@ -1671,25 +1724,24 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>  	}
> 
>  #if IS_ENABLED(CONFIG_ACPI_WMI)
> -	for (i = 0; i < ARRAY_SIZE(ideapad_wmi_fnesc_events); i++) {
> -		status = wmi_install_notify_handler(ideapad_wmi_fnesc_events[i],
> -						    ideapad_wmi_notify, priv);
> -		if (ACPI_SUCCESS(status)) {
> -			priv->fnesc_guid = ideapad_wmi_fnesc_events[i];
> -			break;
> -		}
> -	}
> +	priv->wmi_drv = (struct wmi_driver) {
> +		.driver = {
> +			.name = "ideapad-wmi-fn-keys",
> +		},
> +		.id_table = ideapad_wmi_id_table,
> +		.probe = ideapad_wmi_probe,
> +		.notify = ideapad_wmi_notify,
> +	};
> 
> -	if (ACPI_FAILURE(status) && status != AE_NOT_EXIST) {
> -		err = -EIO;
> -		goto notification_failed_wmi;
> -	}
> +	err = wmi_driver_register(&priv->wmi_drv);
> +	if (err)
> +		goto register_failed_wmi;
>  #endif
> 
>  	return 0;
> 
>  #if IS_ENABLED(CONFIG_ACPI_WMI)
> -notification_failed_wmi:
> +register_failed_wmi:
>  	acpi_remove_notify_handler(priv->adev->handle,
>  				   ACPI_DEVICE_NOTIFY,
>  				   ideapad_acpi_notify);
> @@ -1720,8 +1772,7 @@ static int ideapad_acpi_remove(struct platform_device *pdev)
>  	int i;
> 
>  #if IS_ENABLED(CONFIG_ACPI_WMI)
> -	if (priv->fnesc_guid)
> -		wmi_remove_notify_handler(priv->fnesc_guid);
> +	wmi_driver_unregister(&priv->wmi_drv);
>  #endif
> 
>  	acpi_remove_notify_handler(priv->adev->handle,
> --
> 2.38.1
> 

