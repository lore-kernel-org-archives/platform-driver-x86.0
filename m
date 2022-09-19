Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78F1C6FA86
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Sep 2022 07:54:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbiISHy4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Sep 2022 03:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbiISHy4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2022 03:54:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14DABBC2F
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 00:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663574093;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j9qQ4zvRmiLrY002hFa4VNcq0RL3Cdv+SfRNiH5/jmk=;
        b=agKhPWrmTLtWUxJS6Ilbzet9CEh208FEIUsp6UrPVLeHmQ5JEKpo5X9zA69fUQXgr3lPrH
        oKzf5jtqurvhUf3K35hI0xDRa+P10aU/it3sMvA/eUgaG+RKBy2k5bikqgwLbpqrFvM+0K
        hB+3uVd7Q73Vnq2JGJor3QFHYc4aZeM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-288-7b-2cfKbMwqkGLFA6QAXcg-1; Mon, 19 Sep 2022 03:54:51 -0400
X-MC-Unique: 7b-2cfKbMwqkGLFA6QAXcg-1
Received: by mail-ej1-f69.google.com with SMTP id nb35-20020a1709071ca300b007805be52049so3570135ejc.17
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 00:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=j9qQ4zvRmiLrY002hFa4VNcq0RL3Cdv+SfRNiH5/jmk=;
        b=XUho5nXbdMc6IAm4ImSV5EPj8HhM8EsimSgd2m9EymPkxb3S+ry7MoFgnkOXEwdmOC
         +sFPSC+XsX294yY9KgmaJGyvPe1Nq4QRWx91ryVzrCqN3ZBXmJXBzm1RzWYKpiq6QlT+
         AI6oQ47QBv2pCUm0+wsh6EO3cvL3odGdapQtOFe7rbxM16X1W9Hucu/JbKlbJzJyEYx/
         GIyjS4XCsMQO2MAkb3TTqjUecsOHHJXrlniAfn/OewNgDSzIy5X0MT9i1C27Zdqb4f8d
         mQkWtg//NPfn5ApzZR2PDjeqmgwenPgErLT1x8pBgFPLKp/sLH9u+u9Z2Jmr2J7e4w2a
         laTw==
X-Gm-Message-State: ACrzQf3c0CWehZ6SzAXSWIUkJU+IRH7ruaX9M0b2Pkeg5jSpJF80CtXI
        OwPgmE8eIR+V5Yr+o7USf2V/w+DkbMSBudUMdYuTfjULefiOaI9fKP2NCG9TC/zZsX3dUv30ToS
        cPeZ9awN1SyyMU0zxsI78DRmxQ3B6G8QMLQ==
X-Received: by 2002:a05:6402:901:b0:454:2b6d:c39 with SMTP id g1-20020a056402090100b004542b6d0c39mr2003862edz.50.1663574090356;
        Mon, 19 Sep 2022 00:54:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM79y976M2JTLQC9oYSYbg3nNdbEfhdqWtI8PVIT3vEIRfG4E5w0IyQeUgr1sYbVFb0Qn07jGg==
X-Received: by 2002:a05:6402:901:b0:454:2b6d:c39 with SMTP id g1-20020a056402090100b004542b6d0c39mr2003852edz.50.1663574090147;
        Mon, 19 Sep 2022 00:54:50 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id h20-20020a50ed94000000b00447e5983478sm19778045edr.76.2022.09.19.00.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 00:54:49 -0700 (PDT)
Message-ID: <c251e107-2ad2-417d-c184-b67e778b905a@redhat.com>
Date:   Mon, 19 Sep 2022 08:54:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] Add IdeaPad WMI Fn Keys driver
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Philipp Jungkamp <p.jungkamp@gmx.net>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220911160404.21692-1-p.jungkamp@gmx.net>
 <6c38ca87-d427-d34b-73d1-edb6df75af1b@redhat.com>
In-Reply-To: <6c38ca87-d427-d34b-73d1-edb6df75af1b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi again,

On 9/11/22 17:18, Hans de Goede wrote:
> Hi Philipp,
> 
> On 9/11/22 18:04, Philipp Jungkamp wrote:
>> Create an input device for WMI events corresponding to some special
>> keys on the 'Lenovo Yoga' line.
>>
>> This include the 3 keys to the right on the 'Lenovo Yoga9 14IAP7' and
>> additionally the 'Lenovo Support' and 'Lenovo Favorites' (star with 'S'
>> inside) in the fn key row as well as the event emitted on 'Fn+R' which
>> toggles between 60Hz and 90Hz display refresh rate on windows.
>>
>> Signed-off-by: Philipp Jungkamp <p.jungkamp@gmx.net>
>> ---
>> I found this patch by poking in the DSDT. I have not submitted any
>> notable patches yet and hope you can help me improve in case I make
>> unfortunate choices during submission.
> 
> No worries at a first glance (I have not looked at this in any
> detail yet) this looks pretty good for a first submission.
> 
> And thank you for contributing to the Linux kernel!
> 
> 
>> Philipp Jungkamp
>>
>>  drivers/platform/x86/Kconfig       |  13 +++
>>  drivers/platform/x86/Makefile      |   1 +
>>  drivers/platform/x86/ideapad-wmi.c | 153 +++++++++++++++++++++++++++++
>>  3 files changed, 167 insertions(+)
>>  create mode 100644 drivers/platform/x86/ideapad-wmi.c
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index f2f98e942cf2..e7c5148e5cb4 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -140,6 +140,19 @@ config YOGABOOK_WMI
>>  	  To compile this driver as a module, choose M here: the module will
>>  	  be called lenovo-yogabook-wmi.
>>
>> +config IDEAPAD_WMI
>> +	tristate "Lenovo IdeaPad WMI Fn Keys"
>> +	depends on ACPI_WMI
>> +	depends on INPUT
>> +	select INPUT_SPARSEKMAP
>> +	help
>> +	  Say Y here if you want to receive key presses from some lenovo
>> +	  specific keys. (Star Key, Support Key, Virtual Background,
>> +	  Dark Mode Toggle, ...)
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called ideapad-wmi.
>> +
>>  config ACERHDF
>>  	tristate "Acer Aspire One temperature and fan driver"
>>  	depends on ACPI && THERMAL
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>> index 5a428caa654a..d8bec884d6bc 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -16,6 +16,7 @@ obj-$(CONFIG_PEAQ_WMI)			+= peaq-wmi.o
>>  obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
>>  obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
>>  obj-$(CONFIG_YOGABOOK_WMI)		+= lenovo-yogabook-wmi.o
>> +obj-$(CONFIG_IDEAPAD_WMI)		+= ideapad-wmi.o
>>
>>  # Acer
>>  obj-$(CONFIG_ACERHDF)		+= acerhdf.o
>> diff --git a/drivers/platform/x86/ideapad-wmi.c b/drivers/platform/x86/ideapad-wmi.c
>> new file mode 100644
>> index 000000000000..38f7b3d0c171
>> --- /dev/null
>> +++ b/drivers/platform/x86/ideapad-wmi.c
>> @@ -0,0 +1,153 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * ideapad-wmi.c - Ideapad WMI fn keys driver
>> + *
>> + * Copyright (C) 2022 Philipp Jungkamp <p.jungkamp@gmx.net>
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/input.h>
>> +#include <linux/input/sparse-keymap.h>
>> +#include <linux/list.h>
>> +#include <linux/module.h>
>> +#include <linux/wmi.h>
>> +
>> +#define IDEAPAD_FN_KEY_EVENT_GUID	"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294"
> 
> At a first hunch (basically huh, don't we have a driver for that
> already?) I grepped through the kernel sources and found:
> 
> drivers/platform/x86/ideapad-laptop.c
> 
> can you see if you can make things work with that driver?

So I have taken a quick look at this and it seems to me that this
really should be able to work with the existing ideapad-laptop.c code ?

For starters you could add a debug printk / dev_info to this block,

#if IS_ENABLED(CONFIG_ACPI_WMI)
        for (i = 0; i < ARRAY_SIZE(ideapad_wmi_fnesc_events); i++) {
                status = wmi_install_notify_handler(ideapad_wmi_fnesc_events[i],
                                                    ideapad_wmi_notify, priv);
                if (ACPI_SUCCESS(status)) {
                        priv->fnesc_guid = ideapad_wmi_fnesc_events[i];
                        break;
                }
        }

        if (ACPI_FAILURE(status) && status != AE_NOT_EXIST) {
                err = -EIO;
                goto notification_failed_wmi;
        }
#endif

checking which event GUID ideapad-laptop binds to on your laptop. Assuming that
it does bind to the GUID this driver is binding to too, then it would be
a matter of extending the existing ideapad_wmi_notify() to do the same
as your notify function in this stand-alone driver. Note you can get the
the equivalend of the union acpi_object *data argument in your wmi handler
by calling wmi_get_event_data().

Regards,

Hans



>> +
>> +struct ideapad_wmi_private {
>> +	struct wmi_device *wmi_device;
>> +	struct input_dev *input_dev;
>> +};
>> +
>> +static const struct key_entry ideapad_wmi_fn_key_keymap[] = {
>> +	/* FnLock (handled by the firmware) */
>> +	{ KE_IGNORE,	0x02 },
>> +	/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
>> +	{ KE_KEY,	0x01, { KEY_FAVORITES } },
>> +	/* Dark mode toggle */
>> +	{ KE_KEY,	0x13, { KEY_PROG1 } },
>> +	/* Sound profile switch */
>> +	{ KE_KEY,	0x12, { KEY_PROG2 } },
>> +	/* Lenovo Virtual Background application */
>> +	{ KE_KEY,	0x28, { KEY_PROG3 } },
>> +	/* Lenovo Support */
>> +	{ KE_KEY,	0x27, { KEY_HELP } },
>> +	/* Refresh Rate Toggle */
>> +	{ KE_KEY,	0x0a, { KEY_DISPLAYTOGGLE } },
>> +	{ KE_END },
>> +};
>> +
>> +static int ideapad_wmi_input_init(struct ideapad_wmi_private *priv)
>> +{
>> +	struct input_dev *input_dev;
>> +	int err;
>> +
>> +	input_dev = input_allocate_device();
>> +	if (!input_dev) {
>> +		return -ENOMEM;
>> +	}
>> +
>> +	input_dev->name = "Ideapad WMI Fn Keys";
>> +	input_dev->phys = IDEAPAD_FN_KEY_EVENT_GUID "/input0";
>> +	input_dev->id.bustype = BUS_HOST;
>> +	input_dev->dev.parent = &priv->wmi_device->dev;
>> +
>> +	err = sparse_keymap_setup(input_dev, ideapad_wmi_fn_key_keymap, NULL);
>> +	if (err) {
>> +		dev_err(&priv->wmi_device->dev,
>> +			"Could not set up input device keymap: %d\n", err);
>> +		goto err_free_dev;
>> +	}
>> +
>> +	err = input_register_device(input_dev);
>> +	if (err) {
>> +		dev_err(&priv->wmi_device->dev,
>> +			"Could not register input device: %d\n", err);
>> +		goto err_free_dev;
>> +	}
>> +
>> +	priv->input_dev = input_dev;
>> +	return 0;
>> +
>> +err_free_dev:
>> +	input_free_device(input_dev);
>> +	return err;
>> +}
>> +
>> +static void ideapad_wmi_input_exit(struct ideapad_wmi_private *priv)
>> +{
>> +	input_unregister_device(priv->input_dev);
>> +	priv->input_dev = NULL;
>> +}
>> +
>> +static void ideapad_wmi_input_report(struct ideapad_wmi_private *priv,
>> +				     unsigned int scancode)
>> +{
>> +	sparse_keymap_report_event(priv->input_dev, scancode, 1, true);
>> +}
>> +
>> +static int ideapad_wmi_probe(struct wmi_device *wdev, const void *ctx)
>> +{
>> +	struct ideapad_wmi_private *priv;
>> +	int err;
>> +
>> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	dev_set_drvdata(&wdev->dev, priv);
>> +
>> +	priv->wmi_device = wdev;
>> +
>> +	err = ideapad_wmi_input_init(priv);
>> +	if (err)
>> +		return err;
>> +
>> +	return 0;
>> +}
>> +
>> +static void ideapad_wmi_remove(struct wmi_device *wdev)
>> +{
>> +	struct ideapad_wmi_private *priv = dev_get_drvdata(&wdev->dev);
>> +
>> +	ideapad_wmi_input_exit(priv);
>> +}
>> +
>> +static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
>> +{
>> +	struct ideapad_wmi_private *priv = dev_get_drvdata(&wdev->dev);
>> +
>> +	if(data->type != ACPI_TYPE_INTEGER) {
>> +		dev_warn(&priv->wmi_device->dev,
>> +			"WMI event data is not an integer\n");
>> +		return;
>> +	}
>> +
>> +	ideapad_wmi_input_report(priv, data->integer.value);
>> +}
>> +
>> +static const struct wmi_device_id ideapad_wmi_id_table[] = {
>> +	{	/* Special Keys on the Yoga 9 14IAP7 */
>> +		.guid_string = IDEAPAD_FN_KEY_EVENT_GUID
>> +	},
>> +	{ }
>> +};
>> +
>> +static struct wmi_driver ideapad_wmi_driver = {
>> +	.driver = {
>> +		.name = "ideapad-wmi",
>> +	},
>> +	.id_table = ideapad_wmi_id_table,
>> +	.probe = ideapad_wmi_probe,
>> +	.remove = ideapad_wmi_remove,
>> +	.notify = ideapad_wmi_notify,
>> +};
>> +
>> +module_wmi_driver(ideapad_wmi_driver);
>> +
>> +MODULE_DEVICE_TABLE(wmi, ideapad_wmi_id_table);
>> +MODULE_AUTHOR("Philipp Jungkamp <p.jungkamp@gmx.net>");
>> +MODULE_DESCRIPTION("Ideapad WMI fn keys driver");
>> +MODULE_LICENSE("GPL");
>> --
>> 2.37.3
>>

