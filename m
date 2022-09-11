Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409F5C54EE9
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Sep 2022 16:18:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbiIKQS3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 11 Sep 2022 12:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiIKQS3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Sep 2022 12:18:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BFA62BB19
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Sep 2022 09:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662913106;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z/FR5J4HWk06MBQfBiMMXyF9rqCxcB3VaOBILMBr6Zw=;
        b=e20KBm3HYoqPB3aKGUQvP27nJX1WKsDUcYKCK26x12sxZdlsX5mU80zpxrHwoXCyifB2U4
        BuV5W/O/7cYgp8jpuvN6+ofZ09xtcFI6Gzi/xKAy3OlinGpsQ72IMg8JxLHb1Wn0+M0XWO
        RrpHgQQjVjGHYlKpxtFUkgc4ddiUdPo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-493-RreVB-yaNvWiXjkoCSTzIw-1; Sun, 11 Sep 2022 12:18:24 -0400
X-MC-Unique: RreVB-yaNvWiXjkoCSTzIw-1
Received: by mail-ed1-f72.google.com with SMTP id m3-20020a056402430300b004512f6268dbso3622515edc.23
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Sep 2022 09:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=z/FR5J4HWk06MBQfBiMMXyF9rqCxcB3VaOBILMBr6Zw=;
        b=LyamFldRSTOvngX3eO5DCe8h/Px/eM/R/lqHAYgJW/DufuGHh9wud77suCy79guRor
         Ev3i+fBBP5kdg1m+zFXxfxbY9hkPyGPZOFZTIl3H/dF3QLDMWhOx9Wv83SHYURXMvg/E
         pQRzKiB5/wkvUkyvD7DCLOAbJT6dgLNR6D3CCxbUoR92E9LMGUg1VgnAcnUcNK2h3BB/
         Qja3kvDJFwdz11jqC6Kll4IDngTp9p6lm+SA+6e9uNh2ErxzAtzMnCFVjPoiO5QqnHYO
         OYlgb8TSoAWEmeZqe/E3KtJsECDenVVKkUyI0TJidTxbmqRnbYJGhsCW+94POl1Jmmzv
         FeBQ==
X-Gm-Message-State: ACgBeo2FaQHwGVoPSQD98T7Z+8lfcvG3n/8EgKQMSaaTUFv/XKv9E2fB
        Sdqid/GWUNtYkSjTNwTwuzJWGMHqp+6KoaIyCw9C6jHxhzyojc7o0dxKrktFLShfSRw20rWboJ9
        cxPj4GpH3/iz0hVV91A2KU5eNAefKp2Gugg==
X-Received: by 2002:aa7:d998:0:b0:450:e180:3488 with SMTP id u24-20020aa7d998000000b00450e1803488mr12573646eds.211.1662913103098;
        Sun, 11 Sep 2022 09:18:23 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Tmsgz2RzfqaKsUvVVGqQgYkRaNiwNer6v2T6aJJbTBmovcjeOH4R6bRbI7KdR9+VCzVuo5Q==
X-Received: by 2002:aa7:d998:0:b0:450:e180:3488 with SMTP id u24-20020aa7d998000000b00450e1803488mr12573634eds.211.1662913102864;
        Sun, 11 Sep 2022 09:18:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906200100b00774f2fbfcbbsm3177945ejo.38.2022.09.11.09.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 09:18:22 -0700 (PDT)
Message-ID: <6c38ca87-d427-d34b-73d1-edb6df75af1b@redhat.com>
Date:   Sun, 11 Sep 2022 18:18:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] Add IdeaPad WMI Fn Keys driver
Content-Language: en-US
To:     Philipp Jungkamp <p.jungkamp@gmx.net>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220911160404.21692-1-p.jungkamp@gmx.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220911160404.21692-1-p.jungkamp@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Philipp,

On 9/11/22 18:04, Philipp Jungkamp wrote:
> Create an input device for WMI events corresponding to some special
> keys on the 'Lenovo Yoga' line.
> 
> This include the 3 keys to the right on the 'Lenovo Yoga9 14IAP7' and
> additionally the 'Lenovo Support' and 'Lenovo Favorites' (star with 'S'
> inside) in the fn key row as well as the event emitted on 'Fn+R' which
> toggles between 60Hz and 90Hz display refresh rate on windows.
> 
> Signed-off-by: Philipp Jungkamp <p.jungkamp@gmx.net>
> ---
> I found this patch by poking in the DSDT. I have not submitted any
> notable patches yet and hope you can help me improve in case I make
> unfortunate choices during submission.

No worries at a first glance (I have not looked at this in any
detail yet) this looks pretty good for a first submission.

And thank you for contributing to the Linux kernel!


> Philipp Jungkamp
> 
>  drivers/platform/x86/Kconfig       |  13 +++
>  drivers/platform/x86/Makefile      |   1 +
>  drivers/platform/x86/ideapad-wmi.c | 153 +++++++++++++++++++++++++++++
>  3 files changed, 167 insertions(+)
>  create mode 100644 drivers/platform/x86/ideapad-wmi.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f2f98e942cf2..e7c5148e5cb4 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -140,6 +140,19 @@ config YOGABOOK_WMI
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called lenovo-yogabook-wmi.
> 
> +config IDEAPAD_WMI
> +	tristate "Lenovo IdeaPad WMI Fn Keys"
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	select INPUT_SPARSEKMAP
> +	help
> +	  Say Y here if you want to receive key presses from some lenovo
> +	  specific keys. (Star Key, Support Key, Virtual Background,
> +	  Dark Mode Toggle, ...)
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called ideapad-wmi.
> +
>  config ACERHDF
>  	tristate "Acer Aspire One temperature and fan driver"
>  	depends on ACPI && THERMAL
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 5a428caa654a..d8bec884d6bc 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -16,6 +16,7 @@ obj-$(CONFIG_PEAQ_WMI)			+= peaq-wmi.o
>  obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
>  obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
>  obj-$(CONFIG_YOGABOOK_WMI)		+= lenovo-yogabook-wmi.o
> +obj-$(CONFIG_IDEAPAD_WMI)		+= ideapad-wmi.o
> 
>  # Acer
>  obj-$(CONFIG_ACERHDF)		+= acerhdf.o
> diff --git a/drivers/platform/x86/ideapad-wmi.c b/drivers/platform/x86/ideapad-wmi.c
> new file mode 100644
> index 000000000000..38f7b3d0c171
> --- /dev/null
> +++ b/drivers/platform/x86/ideapad-wmi.c
> @@ -0,0 +1,153 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * ideapad-wmi.c - Ideapad WMI fn keys driver
> + *
> + * Copyright (C) 2022 Philipp Jungkamp <p.jungkamp@gmx.net>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/wmi.h>
> +
> +#define IDEAPAD_FN_KEY_EVENT_GUID	"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294"

At a first hunch (basically huh, don't we have a driver for that
already?) I grepped through the kernel sources and found:

drivers/platform/x86/ideapad-laptop.c

can you see if you can make things work with that driver?

Regards,

Hans



> +
> +struct ideapad_wmi_private {
> +	struct wmi_device *wmi_device;
> +	struct input_dev *input_dev;
> +};
> +
> +static const struct key_entry ideapad_wmi_fn_key_keymap[] = {
> +	/* FnLock (handled by the firmware) */
> +	{ KE_IGNORE,	0x02 },
> +	/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
> +	{ KE_KEY,	0x01, { KEY_FAVORITES } },
> +	/* Dark mode toggle */
> +	{ KE_KEY,	0x13, { KEY_PROG1 } },
> +	/* Sound profile switch */
> +	{ KE_KEY,	0x12, { KEY_PROG2 } },
> +	/* Lenovo Virtual Background application */
> +	{ KE_KEY,	0x28, { KEY_PROG3 } },
> +	/* Lenovo Support */
> +	{ KE_KEY,	0x27, { KEY_HELP } },
> +	/* Refresh Rate Toggle */
> +	{ KE_KEY,	0x0a, { KEY_DISPLAYTOGGLE } },
> +	{ KE_END },
> +};
> +
> +static int ideapad_wmi_input_init(struct ideapad_wmi_private *priv)
> +{
> +	struct input_dev *input_dev;
> +	int err;
> +
> +	input_dev = input_allocate_device();
> +	if (!input_dev) {
> +		return -ENOMEM;
> +	}
> +
> +	input_dev->name = "Ideapad WMI Fn Keys";
> +	input_dev->phys = IDEAPAD_FN_KEY_EVENT_GUID "/input0";
> +	input_dev->id.bustype = BUS_HOST;
> +	input_dev->dev.parent = &priv->wmi_device->dev;
> +
> +	err = sparse_keymap_setup(input_dev, ideapad_wmi_fn_key_keymap, NULL);
> +	if (err) {
> +		dev_err(&priv->wmi_device->dev,
> +			"Could not set up input device keymap: %d\n", err);
> +		goto err_free_dev;
> +	}
> +
> +	err = input_register_device(input_dev);
> +	if (err) {
> +		dev_err(&priv->wmi_device->dev,
> +			"Could not register input device: %d\n", err);
> +		goto err_free_dev;
> +	}
> +
> +	priv->input_dev = input_dev;
> +	return 0;
> +
> +err_free_dev:
> +	input_free_device(input_dev);
> +	return err;
> +}
> +
> +static void ideapad_wmi_input_exit(struct ideapad_wmi_private *priv)
> +{
> +	input_unregister_device(priv->input_dev);
> +	priv->input_dev = NULL;
> +}
> +
> +static void ideapad_wmi_input_report(struct ideapad_wmi_private *priv,
> +				     unsigned int scancode)
> +{
> +	sparse_keymap_report_event(priv->input_dev, scancode, 1, true);
> +}
> +
> +static int ideapad_wmi_probe(struct wmi_device *wdev, const void *ctx)
> +{
> +	struct ideapad_wmi_private *priv;
> +	int err;
> +
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	priv->wmi_device = wdev;
> +
> +	err = ideapad_wmi_input_init(priv);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static void ideapad_wmi_remove(struct wmi_device *wdev)
> +{
> +	struct ideapad_wmi_private *priv = dev_get_drvdata(&wdev->dev);
> +
> +	ideapad_wmi_input_exit(priv);
> +}
> +
> +static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
> +{
> +	struct ideapad_wmi_private *priv = dev_get_drvdata(&wdev->dev);
> +
> +	if(data->type != ACPI_TYPE_INTEGER) {
> +		dev_warn(&priv->wmi_device->dev,
> +			"WMI event data is not an integer\n");
> +		return;
> +	}
> +
> +	ideapad_wmi_input_report(priv, data->integer.value);
> +}
> +
> +static const struct wmi_device_id ideapad_wmi_id_table[] = {
> +	{	/* Special Keys on the Yoga 9 14IAP7 */
> +		.guid_string = IDEAPAD_FN_KEY_EVENT_GUID
> +	},
> +	{ }
> +};
> +
> +static struct wmi_driver ideapad_wmi_driver = {
> +	.driver = {
> +		.name = "ideapad-wmi",
> +	},
> +	.id_table = ideapad_wmi_id_table,
> +	.probe = ideapad_wmi_probe,
> +	.remove = ideapad_wmi_remove,
> +	.notify = ideapad_wmi_notify,
> +};
> +
> +module_wmi_driver(ideapad_wmi_driver);
> +
> +MODULE_DEVICE_TABLE(wmi, ideapad_wmi_id_table);
> +MODULE_AUTHOR("Philipp Jungkamp <p.jungkamp@gmx.net>");
> +MODULE_DESCRIPTION("Ideapad WMI fn keys driver");
> +MODULE_LICENSE("GPL");
> --
> 2.37.3
> 

