Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BCCC433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Nov 2022 21:03:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbiKJVDX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Nov 2022 16:03:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbiKJVDV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Nov 2022 16:03:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F153456554
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 13:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668114145;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FgEhia7CpLYHD7tgACuAFAJQORPe754U7UU4z/Biwfs=;
        b=PKkxRi4Km/x39dik+eOKkicFsAso7sf+2dYoWBhhC+wrrpUcE+tXCzUU/WKMFdBvtRir0W
        rxWXlyPXTfioLjJdMf6XBwVJr3QoIr/jXWXlCkFtT8waHqtMg0dOnIyHqdsYpkJfv6oIXA
        bajLcT6pG/xxtJl2zg5e2Gtv7jti414=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-124-ZEVzbBjxM5u-0lakkOfI6A-1; Thu, 10 Nov 2022 16:02:23 -0500
X-MC-Unique: ZEVzbBjxM5u-0lakkOfI6A-1
Received: by mail-ej1-f70.google.com with SMTP id sh31-20020a1709076e9f00b007ae32b7eb51so1877578ejc.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 13:02:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FgEhia7CpLYHD7tgACuAFAJQORPe754U7UU4z/Biwfs=;
        b=Zzx70EDnyFcY2PWhggU9KZ4ana2SBkgnj7wTl/lY/UT6+Rq8k18SmU89CTZOP6htD1
         si0HzsJfFDKIVdT4whoMBf7zMweR2Wf79AJXoH2eioS9bPzsxC9RxZSBuJhhJk4ty4lZ
         JcjYXGuQ26thPFnM/1zfUbY+gYFqgoahJ8eR2CduP/T7j+o0Qa7ottkLE6/8Cx3ZR2TV
         Nh+gQTNuzUA+s80Amr0cNiyPjxRZH7cQzID53NyRc/oUXv7FCFMQpZdbdGE5uWWHCBa1
         Jwho84fOozKsQXtJjn9TghmjxFq6squrZdGINqtFmpvSBG6csjXgj57VtHApy3ReEwWp
         XbCQ==
X-Gm-Message-State: ACrzQf2IHxFIPF7zuWaWn1dyUpBJzflODIyNCbIpCWUO5zl8N5AzXJth
        YVRGSgriX/oFqzUMm1KrfcdJHgEwly+xM8Nuu+oSVNQxYjYjyGCGbQoS27k0DGtEQuyQgoMvLMb
        UkFioAi+qoP91oaGXwJZ5x70BcUBKpOI1Wg==
X-Received: by 2002:a05:6402:3811:b0:459:cdb:92ad with SMTP id es17-20020a056402381100b004590cdb92admr3438342edb.77.1668114142044;
        Thu, 10 Nov 2022 13:02:22 -0800 (PST)
X-Google-Smtp-Source: AMsMyM48eXdi+Sravma5xpVKqYj/F3Sq67uqjbBx2bEKrkm0SBagjmH+/ZeOw/iOjTp8m+b8muZ33g==
X-Received: by 2002:a05:6402:3811:b0:459:cdb:92ad with SMTP id es17-20020a056402381100b004590cdb92admr3438311edb.77.1668114141682;
        Thu, 10 Nov 2022 13:02:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id l22-20020a056402029600b004611c230bd0sm281039edv.37.2022.11.10.13.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 13:02:21 -0800 (PST)
Message-ID: <8d54fbbb-0933-aaea-5f66-bb7807f5506d@redhat.com>
Date:   Thu, 10 Nov 2022 22:02:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] Add IdeaPad WMI Fn Keys driver
To:     Philipp Jungkamp <p.jungkamp@gmx.net>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220911160404.21692-1-p.jungkamp@gmx.net>
 <6c38ca87-d427-d34b-73d1-edb6df75af1b@redhat.com>
 <c251e107-2ad2-417d-c184-b67e778b905a@redhat.com>
 <362cfa1aa490d226218b30d10d2b392fd7e96abb.camel@gmx.net>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <362cfa1aa490d226218b30d10d2b392fd7e96abb.camel@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Philipp,

On 11/10/22 21:02, Philipp Jungkamp wrote:
> On Mon, 2022-09-19 at 08:54 +0100, Hans de Goede wrote:
>> Hi again,
>>
>> On 9/11/22 17:18, Hans de Goede wrote:
>>> Hi Philipp,
>>>
>>> On 9/11/22 18:04, Philipp Jungkamp wrote:
>>>> Create an input device for WMI events corresponding to some
>>>> special
>>>> keys on the 'Lenovo Yoga' line.
>>>>
>>>> This include the 3 keys to the right on the 'Lenovo Yoga9 14IAP7'
>>>> and
>>>> additionally the 'Lenovo Support' and 'Lenovo Favorites' (star
>>>> with 'S'
>>>> inside) in the fn key row as well as the event emitted on 'Fn+R'
>>>> which
>>>> toggles between 60Hz and 90Hz display refresh rate on windows.
>>>>
>>>> Signed-off-by: Philipp Jungkamp <p.jungkamp@gmx.net>
>>>> ---
>>>> I found this patch by poking in the DSDT. I have not submitted
>>>> any
>>>> notable patches yet and hope you can help me improve in case I
>>>> make
>>>> unfortunate choices during submission.
>>>
>>> No worries at a first glance (I have not looked at this in any
>>> detail yet) this looks pretty good for a first submission.
>>>
>>> And thank you for contributing to the Linux kernel!
>>>
>>>
>>>> Philipp Jungkamp
>>>>
>>>>  drivers/platform/x86/Kconfig       |  13 +++
>>>>  drivers/platform/x86/Makefile      |   1 +
>>>>  drivers/platform/x86/ideapad-wmi.c | 153
>>>> +++++++++++++++++++++++++++++
>>>>  3 files changed, 167 insertions(+)
>>>>  create mode 100644 drivers/platform/x86/ideapad-wmi.c
>>>>
>>>> diff --git a/drivers/platform/x86/Kconfig
>>>> b/drivers/platform/x86/Kconfig
>>>> index f2f98e942cf2..e7c5148e5cb4 100644
>>>> --- a/drivers/platform/x86/Kconfig
>>>> +++ b/drivers/platform/x86/Kconfig
>>>> @@ -140,6 +140,19 @@ config YOGABOOK_WMI
>>>>           To compile this driver as a module, choose M here: the
>>>> module will
>>>>           be called lenovo-yogabook-wmi.
>>>>
>>>> +config IDEAPAD_WMI
>>>> +       tristate "Lenovo IdeaPad WMI Fn Keys"
>>>> +       depends on ACPI_WMI
>>>> +       depends on INPUT
>>>> +       select INPUT_SPARSEKMAP
>>>> +       help
>>>> +         Say Y here if you want to receive key presses from some
>>>> lenovo
>>>> +         specific keys. (Star Key, Support Key, Virtual
>>>> Background,
>>>> +         Dark Mode Toggle, ...)
>>>> +
>>>> +         To compile this driver as a module, choose M here: the
>>>> module will
>>>> +         be called ideapad-wmi.
>>>> +
>>>>  config ACERHDF
>>>>         tristate "Acer Aspire One temperature and fan driver"
>>>>         depends on ACPI && THERMAL
>>>> diff --git a/drivers/platform/x86/Makefile
>>>> b/drivers/platform/x86/Makefile
>>>> index 5a428caa654a..d8bec884d6bc 100644
>>>> --- a/drivers/platform/x86/Makefile
>>>> +++ b/drivers/platform/x86/Makefile
>>>> @@ -16,6 +16,7 @@ obj-
>>>> $(CONFIG_PEAQ_WMI)                        += peaq-wmi.o
>>>>  obj-$(CONFIG_XIAOMI_WMI)               += xiaomi-wmi.o
>>>>  obj-$(CONFIG_GIGABYTE_WMI)             += gigabyte-wmi.o
>>>>  obj-$(CONFIG_YOGABOOK_WMI)             += lenovo-yogabook-wmi.o
>>>> +obj-$(CONFIG_IDEAPAD_WMI)              += ideapad-wmi.o
>>>>
>>>>  # Acer
>>>>  obj-$(CONFIG_ACERHDF)          += acerhdf.o
>>>> diff --git a/drivers/platform/x86/ideapad-wmi.c
>>>> b/drivers/platform/x86/ideapad-wmi.c
>>>> new file mode 100644
>>>> index 000000000000..38f7b3d0c171
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/ideapad-wmi.c
>>>> @@ -0,0 +1,153 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +/*
>>>> + * ideapad-wmi.c - Ideapad WMI fn keys driver
>>>> + *
>>>> + * Copyright (C) 2022 Philipp Jungkamp <p.jungkamp@gmx.net>
>>>> + */
>>>> +
>>>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>>> +
>>>> +#include <linux/acpi.h>
>>>> +#include <linux/input.h>
>>>> +#include <linux/input/sparse-keymap.h>
>>>> +#include <linux/list.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/wmi.h>
>>>> +
>>>> +#define IDEAPAD_FN_KEY_EVENT_GUID      "8FC0DE0C-B4E4-43FD-B0F3-
>>>> 8871711C1294"
>>>
>>> At a first hunch (basically huh, don't we have a driver for that
>>> already?) I grepped through the kernel sources and found:
>>>
>>> drivers/platform/x86/ideapad-laptop.c
>>>
>>> can you see if you can make things work with that driver?
>>
>> So I have taken a quick look at this and it seems to me that this
>> really should be able to work with the existing ideapad-laptop.c code
>> ?
>>
>> For starters you could add a debug printk / dev_info to this block,
>>
>> #if IS_ENABLED(CONFIG_ACPI_WMI)
>>         for (i = 0; i < ARRAY_SIZE(ideapad_wmi_fnesc_events); i++) {
>>                 status =
>> wmi_install_notify_handler(ideapad_wmi_fnesc_events[i],
>>                                                    
>> ideapad_wmi_notify, priv);
>>                 if (ACPI_SUCCESS(status)) {
>>                         priv->fnesc_guid =
>> ideapad_wmi_fnesc_events[i];
>>                         break;
>>                 }
>>         }
>>
>>         if (ACPI_FAILURE(status) && status != AE_NOT_EXIST) {
>>                 err = -EIO;
>>                 goto notification_failed_wmi;
>>         }
>> #endif
>>
>> checking which event GUID ideapad-laptop binds to on your laptop.
>> Assuming that
>> it does bind to the GUID this driver is binding to too, then it would
>> be
>> a matter of extending the existing ideapad_wmi_notify() to do the
>> same
>> as your notify function in this stand-alone driver. Note you can get
>> the
>> the equivalend of the union acpi_object *data argument in your wmi
>> handler
>> by calling wmi_get_event_data().
>>
>> Regards,
>>
>> Hans
>>
> 
> Hello Hans,
> 
> I did actually start by doing that.
> The problem lies with the wmi_get_event_data() function not working
> for my ACPI.
> 
> wmi_get_event_data() takes the event notify_id as input and is supposed
> to give the data associated with the event back. This occures by
> calling _WED on the first WMI block that contains said notify_id.
> 
> drivers/platform/x86/wmi.c:657:
> 	list_for_each_entry(wblock, &wmi_block_list, list) {
> 		struct guid_block *gblock = &wblock->gblock;
> 
> 		if ((gblock->flags & ACPI_WMI_EVENT) && gblock-
>> notify_id == event)
> 			return get_event_data(wblock, out);
> 	}
> 
> The ACPI of the Lenovo Yoga 9 14IAP7 contains multiple WMI event
> blocks hat contain the same notify_id 0xD0.
> 
> Here are two of the four WMI objects found in the DSDT:
> 
> in _WDG of block WMIY:
> 	06129D99-6083-4164-81AD-F092F9D773A6:
> 		notify_id: 0xD0
> 		instance_count: 1
> 		flags: 0x8 ACPI_WMI_EVENT
> 
> in _WDG of block WMIU:
> 	8FC0DE0C-B4E4-43FD-B0F3-8871711C1294:
> 		notify_id: 0xD0
> 		instance_count: 1
> 		flags: 0x8 ACPI_WMI_EVENT
> 
> These event block belong to different WMI devices and report
> unrelated values from different _WED handlers. WMIY for example
> triggers its event on "mode changes", e.g. laptop/tablet/tent based
> on the accelometers/hinge.
> WMIU is the WMI block with the event which reports the special keys
> I'm interested in.
> 
> WMIY comes before WMIU in the wmi_block_list.
> Calling wmi_get_event_data() in ideapad_wmi_notify() calls the wrong
> _WED (the one of WMIY) and thus returns the wrong event data.
> 
> I noticed that the wmi_driver interface does not incur the problem
> with the event because it binds to a wmi_block and calls the _WED
> directly without searching through other WMI devices.

Right, I see in that case I guess that using the wmi_driver
interface does make sense.

> I thought of changing the signature of wmi_get_event_data() to include
> the GUID of the correct WMI block, but chose wmi_driver instead.
> Would you consider adding a wmi_get_event_data_for_guid() function to
> the wmi module and using that in the ideapad_wmi_notify function to be
> a better solution than the one in the patch presented here?

So the problem is that ideapad-laptop is using the old interface
and it does:

                status = wmi_install_notify_handler(ideapad_wmi_fnesc_events[i],
                                                    ideapad_wmi_notify, priv);

And then the code to call that notifier in wmi.c goes like this:

        if (test_bit(WMI_PROBED, &wblock->flags) && wblock->dev.dev.driver) {
                struct wmi_driver *driver = drv_to_wdrv(wblock->dev.dev.driver);
                struct acpi_buffer evdata = { ACPI_ALLOCATE_BUFFER, NULL };
                acpi_status status;

                if (!driver->no_notify_data) {
                        status = get_event_data(wblock, &evdata);
                        if (ACPI_FAILURE(status)) {
                                dev_warn(&wblock->dev.dev, "failed to get event data\n");
                                return;
                        }
                }

                if (driver->notify)
                        driver->notify(&wblock->dev, evdata.pointer);

                kfree(evdata.pointer);
        } else if (wblock->handler) {
                /* Legacy handler */
                wblock->handler(event, wblock->handler_data);
        }

So if we move ahead with your new style wmi-driver for GUID 
8FC0DE0C-B4E4-43FD-B0F3-8871711C1294.

Then we hit the "true" path of the if and the legacy handler
(registered by ideapad-laptop) will never trigger.

I guess you could argue that this is a feature since your
new-style driver "replaces" ideapad-laptop, but ending up with
2 drivers for ideapad laptops / for GUID
8FC0DE0C-B4E4-43FD-B0F3-8871711C1294 and them having them have
to coordinate to decide which one to load sounds less then ideal.

So I think that your idea to add a wmi_get_event_data_for_guid()
function to wmi.c is actually a good idea.

Can you give that a try please and see how that goes ?

Regards,

Hans



