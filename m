Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E784C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Dec 2022 15:11:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiLHPLR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Dec 2022 10:11:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiLHPLQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Dec 2022 10:11:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99819A13FA
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Dec 2022 07:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670512210;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FE57oxXa4i/1Vz7TH/Wp70vVhdGBPQCVO1nCrJ34Zkk=;
        b=Yp1BP0cuf9Olez2i/qpyzhyFm4TWSTeWu9cUmDIyCqgPtsfvuUygbpZAlHIM2VHV+xBLOS
        m1TucOiaIqdLUF3S6El1xv1E8+RCKcJscv+YHuGZCxozEzewAzU3p1fyJ4FokVt5IGktOJ
        ArbN9dAOrka0BDk71S3mjG1wJhrZlGY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-275-oSfG5ltVNvWpud63sSD7DQ-1; Thu, 08 Dec 2022 10:10:01 -0500
X-MC-Unique: oSfG5ltVNvWpud63sSD7DQ-1
Received: by mail-ej1-f71.google.com with SMTP id hq42-20020a1709073f2a00b007c100387d64so1347695ejc.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Dec 2022 07:10:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FE57oxXa4i/1Vz7TH/Wp70vVhdGBPQCVO1nCrJ34Zkk=;
        b=LN0reYtzLRyo4pwveyScLkAhab25JVZvlUTyYihTTwC4SiXAquVy8TjLYZFwCIMCkJ
         3Hsje3IaSqMnZ5bv1BasJtVBeM5p0a4MPDmypFHmynLhYnF854tisw20lWCGiigGIc1R
         POk1msieoSKk6jaR9E6Em9cYi7LOkPvSvMGj64/SLDuRmyzIZlokzXSBLjmE8Kbyow7b
         Cfqa/DrI2bAUhAYowKXRR4HlqjElHzeH5Z/8qGYXMmM7fc3vsWXywG11DnWgkLaciPjy
         wJvtH0TmFdS6loehpHWuxoE77clb+UIRJvVoDyFa3Az4/u/PduYkfmnY2kABFKZ5f/Wo
         UOkQ==
X-Gm-Message-State: ANoB5pk8KSQzXTZIBEB7eput9CoeWEd4ZnXh8CB5yA1CZCmYGjkTBRNe
        /sYKVEwPJ6cH3JPMEpUPRZTJ1VGjJSCh5KUgxURmDmwSRNMShtEJ9bq10vwM3E9LIgJaUQSVgnE
        ut/mTpPmdTczwh80SA7WSE9iqhrePEm5LNw==
X-Received: by 2002:a17:906:b114:b0:78d:f455:b4b6 with SMTP id u20-20020a170906b11400b0078df455b4b6mr2275728ejy.29.1670512200757;
        Thu, 08 Dec 2022 07:10:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf60fkiAwj01kDopgWlZGSPMfNRxmC8gbbbvAvg1FqhxRPAu9W0sYlxj6BSRp/WgQIZzdjanEw==
X-Received: by 2002:a17:906:b114:b0:78d:f455:b4b6 with SMTP id u20-20020a170906b11400b0078df455b4b6mr2275721ejy.29.1670512200490;
        Thu, 08 Dec 2022 07:10:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id k9-20020a17090646c900b0072af4af2f46sm9770006ejs.74.2022.12.08.07.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 07:09:58 -0800 (PST)
Message-ID: <56426127-f897-e4ed-de9e-34235f638ad6@redhat.com>
Date:   Thu, 8 Dec 2022 16:09:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Add Lenovo Yoga Tab 3
 (YT3-X90F) charger + fuel-gauge data
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20221127182458.104528-1-hdegoede@redhat.com>
 <Y4SLhlW1t5epgamh@smile.fi.intel.com>
 <58a7f20d-dd47-1ffc-f7b2-f1d30a0a7d69@redhat.com>
 <Y4SVh6qV7Se2Qc3k@smile.fi.intel.com>
 <0c686ea2-338b-28cf-688f-13d99ca92611@redhat.com>
 <Y4Sdp8AMOYAbRbil@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y4Sdp8AMOYAbRbil@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/28/22 12:38, Andy Shevchenko wrote:
> On Mon, Nov 28, 2022 at 12:24:59PM +0100, Hans de Goede wrote:
>> On 11/28/22 12:03, Andy Shevchenko wrote:
>>> On Mon, Nov 28, 2022 at 11:44:36AM +0100, Hans de Goede wrote:
>>>> On 11/28/22 11:20, Andy Shevchenko wrote:
>>>>> On Sun, Nov 27, 2022 at 07:24:58PM +0100, Hans de Goede wrote:
> 
> ...
> 
>>>>>> +	/*
>>>>>> +	 * The "bq25892_0" charger IC has its /CE (Charge-Enable) and OTG pins
>>>>>> +	 * connected to GPIOs, rather then having them hardwired to the correct
>>>>>> +	 * values as is normally done.
>>>>>> +	 *
>>>>>> +	 * The bq25890_charger driver controls these through I2C, but this only
>>>>>> +	 * works if not overridden by the pins. Set these pins here:
>>>>>> +	 * 1. Set /CE to 0 to allow charging.
>>>>>
>>>>> If I read this correctly then the /CE is an active low pin and setting to 0
>>>>> means active state
>>>>
>>>> Correct.
>>>>
>>>>> which...
>>>>>
>>>>>> +	 * 2. Set OTG to 0 disable V5 boost output since the 5V boost output of
>>>>>> +	 *    the main "bq25892_1" charger is used when necessary.
>>>>>> +	 */
>>>>>> +
>>>>>> +	/* /CE pin */
>>>>>> +	ret = x86_android_tablet_get_gpiod("INT33FF:02", 22, &gpiod);
>>>>>> +	if (ret < 0)
>>>>>> +		return ret;
>>>>>
>>>>>> +	gpiod_set_value(gpiod, 0);
>>>>>
>>>>> ...contradicts with the virtual state here. Perhaps you missed the
>>>>> corresponding flag to enable negation?
>>>>
>>>> x86_android_tablet_get_gpiod() gets the GPIO directly from
>>>> the gpio-chip using gpiochip_get_desc() since these GPIOs are
>>>> not described in ACPI. There is no option to pass a gpio_lookup_flags
>>>> flag like GPIO_ACTIVE_LOW this way since we are not doing an actual lookup.
>>>
>>> gpiod_toggle_active_low() is your friend, no?
>>
>> Note that the GPIO is never actually requested and doing
>> gpiod_toggle_active_low() on a non requested gpio_desc is not nice.
>>
>> Normally the GPIO_ACTIVE_LOW flag gets cleared on gpiod_free() to
>> leave it in a clean state for any future users, so we would need to
>> do something like:
>>
>> gpiod_toggle_active_low(gpiod);
>> gpiod_set_value(gpiod, 1);
>> gpiod_toggle_active_low(gpiod);
>>
>> or actually request the GPIO, which means adding an lenovo_yt3_exit()
>> to unrequest them; and adding a global lenovo_yt3_gpios[] variable
>> to store the descs in between init + exit.
>>
>> This is something which I did consider, since it would also list
>> the GPIOs in /sys/kernel/debug/gpio which would be somewhat nice,
>> otoh it is a bunch of extra code just for getting the GPIOs
>> listed in  debugfs file.
>>
>> Still if you really want me to mark it as active-low I believe
>> that doing a proper request of the GPIO + free on exit() is
>> the right way to go here.  That or just leave this as is in
>> this version 1 of this patch.
>>
>> Please let me know how you want to proceed with this.
> 
> I do not insist, but my objection here is the terminology (active state,
> inactive state vs. 0, 1 or other way around) and inconsistency with what you
> put as a value and what comment says taking into account / (or
> negation) of the real signal.
> 
> Ideally yes, would be nice to have it indeed requested since it's in use even
> from the Linux kernel perspective (one may debug its usage or see via user
> space, note as well that non-requested pin maybe easily altered in the Linux).
> 
> But if you guarantee nothing of this happens, feel free to amend the comment
> to make it more clear and proceed.

Ok, I've amended the comment to make things more clear and merged this
into my review-hans branch now.

Regards,

Hans




> 
>>>>>> +	ret = x86_android_tablet_get_gpiod("INT33FF:03", 19, &gpiod);
>>>>>> +	if (ret < 0)
>>>>>> +		return ret;
>>>>>> +
>>>>>> +	gpiod_set_value(gpiod, 0);
> 

