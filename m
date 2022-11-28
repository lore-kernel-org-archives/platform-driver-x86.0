Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1EEC43217
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Nov 2022 11:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbiK1L0z (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Nov 2022 06:26:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbiK1L0D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Nov 2022 06:26:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A8191CE
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Nov 2022 03:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669634708;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gnvENzRB0XPBtXmjg1f+QzLTyuENY5dgH0VHoU0CHDc=;
        b=KMwgt3EIQ7HLjyFJY7Mbo039pBxt/WHEygQwvQwyUiPphZI8yR4vfUvzZ+wgOCJnG9q08k
        alGSetXYnPiJ8NbqqedZSv0kwsWi6zgO2f/0cfMNU7ObcOGla7mIw7Zt1ugSNt3yKc1plv
        ZEvTrhCRH768WUCXMRgVPjdylqxmR1Y=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-271-zYarzTDyOi6gmayvfVxgvw-1; Mon, 28 Nov 2022 06:25:07 -0500
X-MC-Unique: zYarzTDyOi6gmayvfVxgvw-1
Received: by mail-ej1-f71.google.com with SMTP id hq18-20020a1709073f1200b007ade8dd3494so4099378ejc.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Nov 2022 03:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gnvENzRB0XPBtXmjg1f+QzLTyuENY5dgH0VHoU0CHDc=;
        b=ORRXjIfN0vO7hZrNXuYZETYMQRK/VxSpBG3+b7VFSBpER9uuZBf5G+lmmSwHaEgXOy
         dvmKbdQEiX5NCr3p8Hs/mY/pEOqXouHYRA209Yv3mBfV5zn9bHQ8oAFH4TdJBSW+/R6h
         vsbmgYHtJZaL7l0IxYhwt71ONoxgVbxDQ7CS25/wjfot0+uwmllkeHZ5IiczW6l4p2+l
         sWgYVgAQCXOdWbx1N2uKDdPD19J8bWfZVVL1vwtmNHhhouNk7mucLNEhS+DhhFEIz6tI
         kcgaWlRMWSNDNGkjx9b+Bvn/Rq3mOUwUgfh1veW0a7xiZsXISWtIq5NQixzYbDon7E1N
         HXkA==
X-Gm-Message-State: ANoB5pkSFJcf2SVMdhoh8cT3/RjBB0dDjfyfD98nhoQCMxpK5wHqvP/b
        Ul7/9ITtArRcIMWrVG0bft+rAcVxTBwgIOMClwSTV4SRbTzy4TkF/IuLYUWW+vHo++xxNVVSQVG
        wJ+jH7SZwSgVwXsCI5tJwAgq3s2l9yBYsUg==
X-Received: by 2002:a17:906:1445:b0:7a1:6786:444f with SMTP id q5-20020a170906144500b007a16786444fmr25937751ejc.409.1669634705346;
        Mon, 28 Nov 2022 03:25:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7aF7FWN8Dh0WBaxm3BtLxWj2ic4thR4cgZ+GO85sF2ZVPbS1WdK7WveyO8Mu2+8GXl3n3wow==
X-Received: by 2002:a17:906:1445:b0:7a1:6786:444f with SMTP id q5-20020a170906144500b007a16786444fmr25937736ejc.409.1669634705183;
        Mon, 28 Nov 2022 03:25:05 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id y4-20020a1709064b0400b0073c10031dc9sm4810007eju.80.2022.11.28.03.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 03:25:04 -0800 (PST)
Message-ID: <0c686ea2-338b-28cf-688f-13d99ca92611@redhat.com>
Date:   Mon, 28 Nov 2022 12:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Add Lenovo Yoga Tab 3
 (YT3-X90F) charger + fuel-gauge data
Content-Language: en-US
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20221127182458.104528-1-hdegoede@redhat.com>
 <Y4SLhlW1t5epgamh@smile.fi.intel.com>
 <58a7f20d-dd47-1ffc-f7b2-f1d30a0a7d69@redhat.com>
 <Y4SVh6qV7Se2Qc3k@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y4SVh6qV7Se2Qc3k@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/28/22 12:03, Andy Shevchenko wrote:
> On Mon, Nov 28, 2022 at 11:44:36AM +0100, Hans de Goede wrote:
>> On 11/28/22 11:20, Andy Shevchenko wrote:
>>> On Sun, Nov 27, 2022 at 07:24:58PM +0100, Hans de Goede wrote:
> 
> ...
> 
>>>> +	/*
>>>> +	 * The "bq25892_0" charger IC has its /CE (Charge-Enable) and OTG pins
>>>> +	 * connected to GPIOs, rather then having them hardwired to the correct
>>>> +	 * values as is normally done.
>>>> +	 *
>>>> +	 * The bq25890_charger driver controls these through I2C, but this only
>>>> +	 * works if not overridden by the pins. Set these pins here:
>>>> +	 * 1. Set /CE to 0 to allow charging.
>>>
>>> If I read this correctly then the /CE is an active low pin and setting to 0
>>> means active state
>>
>> Correct.
>>
>>> which...
>>>
>>>> +	 * 2. Set OTG to 0 disable V5 boost output since the 5V boost output of
>>>> +	 *    the main "bq25892_1" charger is used when necessary.
>>>> +	 */
>>>> +
>>>> +	/* /CE pin */
>>>> +	ret = x86_android_tablet_get_gpiod("INT33FF:02", 22, &gpiod);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>
>>>> +	gpiod_set_value(gpiod, 0);
>>>
>>> ...contradicts with the virtual state here. Perhaps you missed the
>>> corresponding flag to enable negation?
>>
>> x86_android_tablet_get_gpiod() gets the GPIO directly from
>> the gpio-chip using gpiochip_get_desc() since these GPIOs are
>> not described in ACPI. There is no option to pass a gpio_lookup_flags
>> flag like GPIO_ACTIVE_LOW this way since we are not doing an actual lookup.
> 
> gpiod_toggle_active_low() is your friend, no?

Note that the GPIO is never actually requested and doing
gpiod_toggle_active_low() on a non requested gpio_desc is not nice.

Normally the GPIO_ACTIVE_LOW flag gets cleared on gpiod_free() to
leave it in a clean state for any future users, so we would need to
do something like:

gpiod_toggle_active_low(gpiod);
gpiod_set_value(gpiod, 1);
gpiod_toggle_active_low(gpiod);

or actually request the GPIO, which means adding an lenovo_yt3_exit()
to unrequest them; and adding a global lenovo_yt3_gpios[] variable
to store the descs in between init + exit.

This is something which I did consider, since it would also list
the GPIOs in /sys/kernel/debug/gpio which would be somewhat nice,
otoh it is a bunch of extra code just for getting the GPIOs
listed in  debugfs file.

Still if you really want me to mark it as active-low I believe
that doing a proper request of the GPIO + free on exit() is
the right way to go here.  That or just leave this as is in
this version 1 of this patch.

Please let me know how you want to proceed with this.

Regards,

Hans







> 
>>>> +	ret = x86_android_tablet_get_gpiod("INT33FF:03", 19, &gpiod);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	gpiod_set_value(gpiod, 0);
> 

