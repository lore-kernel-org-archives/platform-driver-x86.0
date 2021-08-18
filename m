Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C75C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 15:31:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5253B60560
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 15:31:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233849AbhHRPcQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 11:32:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49808 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230360AbhHRPcQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 11:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629300701;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zDI4yjcgiCmBYisirSyOP2sKvcQ3Yi4cV/lHfNDHlf4=;
        b=BvhrTJEd2AOOih3rD2Y1rfpm0by7AaAPphZOFBfFqq84XG2iikGQaQj2VtIJPWvmd249In
        hSH0WhE3ra5v9DXjlRWE1n3X9CIhfynaf7gksB5SvX2aMw2A8TTb70tQCbrc68wiLrr2j5
        2L/VL/cYkd/GZe+RIq+zRlNrTE1NiWY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-qLrdmDV0Ozux7RCbVDm3yA-1; Wed, 18 Aug 2021 11:31:39 -0400
X-MC-Unique: qLrdmDV0Ozux7RCbVDm3yA-1
Received: by mail-ed1-f72.google.com with SMTP id k13-20020aa7c04d000000b003bf04c03fc4so1218203edo.22
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 08:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zDI4yjcgiCmBYisirSyOP2sKvcQ3Yi4cV/lHfNDHlf4=;
        b=ppcrmakw2chLJWR5pyw9U9Y6fA/6kX1LBPK/z9LvYBpUUq9t4M/o8LR5q2OPXnkYrM
         NC62xTSQUO4KbaQ6dbxhE2244m79mL470HpTmG7o1KOXjZNr5psVtnwpP2Hh6rFsFxt/
         DAhVbERBVXPfMvmQq3AagiDK9eoopw0jSvjKSlsRr32/gNDjNtoE7RaAdZsx2KhxV9ZQ
         2UyrbgVUEAFhFFe/UxlUc0HVCnLqoNjFlkCqx7K+/fuXu3kDubLU73gy25otuieWRZo3
         1WlHk1FN/2G8qTmdHwNSUoxxQrSB+rGmWsiB57yg4vk47vcQFZuhWHTg1n7K1qGJ1TKr
         Gjeg==
X-Gm-Message-State: AOAM533RNZzcOEln3tAsGCEBk08Yf+rSu3a5nVvs4Jq3dgs9R2fEX3A8
        X7aqdgMwwWp4sk7nYT4Z5/RmVS+am6S649xLG6ij7w2qbaT1RTbf5PKaUgNzrdr9Hsucxrkg7jp
        SqTAi8pghC6U0HwTvUd0yATBbkSvmGiK5u75JgTx86em9LndtI7rmSKEWQagaWJJLb5eGdcZx2M
        qT0UrG8rirqw==
X-Received: by 2002:a17:906:44e:: with SMTP id e14mr2502403eja.389.1629300698449;
        Wed, 18 Aug 2021 08:31:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaowq21SwUL3L69xTQO7JeQmV+w85QIImAAOJ70tn8Xpe/DK9Cx2mRWccnedqJ1ttkX+pjmQ==
X-Received: by 2002:a17:906:44e:: with SMTP id e14mr2502391eja.389.1629300698282;
        Wed, 18 Aug 2021 08:31:38 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id g26sm38888ejr.48.2021.08.18.08.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 08:31:37 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: lg-laptop: Support for battery charge limit
 on newer models
To:     Matan Ziv-Av <matan@svgalib.org>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
References: <9338b0b1-e76e-68f5-36de-a642745ba6ad@svgalib.org>
 <7d2ea9fc-6942-d7c9-c6cf-61072dc13ba9@redhat.com>
 <d8f5fb50-68d5-b331-3a56-e638e423d269@svgalib.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c7b789f9-7679-50e2-e8cf-a7d58103926e@redhat.com>
Date:   Wed, 18 Aug 2021 17:31:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d8f5fb50-68d5-b331-3a56-e638e423d269@svgalib.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/18/21 3:36 PM, Matan Ziv-Av wrote:
> On Wed, 18 Aug 2021, Hans de Goede wrote:
> 
>> Hi,
>>
>> On 8/14/21 12:11 AM, Matan Ziv-Av wrote:
>>>
>>> Add support for the difference between various models:
>>>
>>> - Use dmi to detect laptop model.
>>> - 2019 and newer models use _wmbb method to set battery charge limit.
>>>
>>> Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
>>
>> Thank you for the patch, some small comments inline.
>>
>>
>> Please drop the ! from the if condition and swap the 2 branches.
> 
> Fixed.

Thanks.

>>> +	product = dmi_get_system_info(DMI_PRODUCT_NAME);
>>> +	if (strlen(product) > 4)
>>> +		switch (product[4]) {
>>> +		case '5':
>>> +		case '6':
>>> +			year = 2016;
>>> +			break;
>>> +		case '7':
>>> +			year = 2017;
>>> +			break;
>>> +		case '8':
>>> +			year = 2018;
>>> +			break;
>>> +		case '9':
>>> +			year = 2019;
>>> +			break;
>>> +		case '0':
>>> +			if (strlen(product) > 5)
>>> +				switch (product[5]) {
>>> +				case 'N':
>>> +					year = 2020;
>>> +					break;
>>> +				case 'P':
>>> +					year = 2021;
>>> +					break;
>>> +				default:
>>> +					year = 2022;
>>> +				}
>>> +			break;
>>> +		default:
>>> +			year = 2019;
>>> +		}
>>> +	pr_info("product: %s  year: %d\n", product, year);
>>> +
>>> +	if (year >= 2019)
>>> +		battery_limit_use_wmbb = 1;
>>
>> This does not feel very robust how about doing a strstr for "201" and if that
>> fails for "202" to find the year ?
> 
> Unfortunately, this is not so simple.
> 
> Some example model numbers:
> 
> 15Z960-A.AA75U1
> 15Z980-R.AAS9U1
> 14T990-U.AAS8U1
> 17Z90P-K.AAB8U1
> 
> First two digits represent screen size. Third letter device type. Fifth 
> digit is the last digit of the model year (up to 2021, where it is 0 and 
> the sixth letter indicates the model year).

Ok, then I'm just going to trust that you as the maintainer of the lg-laptop
driver know best and take the patch with the DMI string parsing left as
is (as you did in your new version).

>> p.s.
>>
>> While reviewing this I also took a quick look at the existing lg-laptop.c
>> and the wmi_keymap stood out to me, specifically:
>>
>>         {KE_KEY, 0x74, {KEY_F13} },      /* Touchpad toggle (F5) */
>>
>> If that key just sends this event and does not actually change the
>> touchpad settings, IOW userspace is supposed to react this (e.g.
>> filter out touchpad events in software after the toggle), then the
>> correct key to send here would be KEY_F21, this has been the standard
>> key-code to send for this for a while now and GNOME and KDE will
>> automatically do the right thing when sending that, including a
>> nice on-screen-display (OSD)notifcation (like when changing the volume)
>> indicating the new (software) state (on or off) of the touchpad.
>>
>> If the hw does actually handle the touchpad on/off itself
>> (I see there also is a touchpad-led?) then the right thing to do
>> would be to send f22 (Touchpad toggle off-to-on) and f23
>> (Touchpad toggle on-to-off). This assumes that you can figure
>> out the new touchpad state. When receiving f22 / f23 GNOME will
>> display the OSD without making any other settings changes.
>>
>> Also see: /lib/udev/hwdb.d/60-keyboard.hwdb
>>
>>
>>         {KE_KEY, 0x10000000, {KEY_F16} },/* Keyboard backlight (F8) - pressing
>>                                           * this key both sends an event and
>>                                           * changes backlight level.
>>                                           */
>>
>> If this hotkey changes the kbd-backlight level "in hardware"
>> then it should not send a key-press instead you should specify
>>
>> led_classdev.flags = LED_BRIGHT_HW_CHANGED
>>
>> For the kbd-backlight led_classdev and then call:
>>
>> 	led_classdev_notify_brightness_hw_changed(&kbd_backlight, new_backlight_level);
>>
>> When receiving the event. upower will pick the event send by this up
>> and then notify interested parties such as e.g. gnome-settings-daemon
>> which will then show a nice OSD with the new backlight level similar
>> to how it is done for e.g. volume controls.
>>
>>
>> If you can also send patches to change these 2 things, so that lg-laptop
>> conforms with the standard userspace APIs used for this that would be great.
> 
> I sent patches for this (in a separate thread).

Great, thank you.

Regards,

Hans


