Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C5AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Nov 2021 19:38:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351317AbhKXTlU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Nov 2021 14:41:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31162 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241791AbhKXTlP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Nov 2021 14:41:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637782685;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EBMyA879RvsAF1C+luC7hFdhhdb0lbrjQTlN8WSCnFk=;
        b=aDSlGlFPT4lJEBrNoSyB9rM6J1sZzciDm/7IgEzKz8EzfguerSg/le/qHHkh+kLtEYVdmO
        gh+N/UqrkUtmU3tu3uiXl0EY8zE3A4hCVtUlSH2+mZ8eLqua29Pd/d+HmTQjWoCbj+NcXF
        pwHQxtQHqZ3mZycEKf8gNhi+v+PWhko=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-29D2Hkz0OZWvUK_3yLghxQ-1; Wed, 24 Nov 2021 14:38:04 -0500
X-MC-Unique: 29D2Hkz0OZWvUK_3yLghxQ-1
Received: by mail-ed1-f70.google.com with SMTP id q17-20020aa7da91000000b003e7c0641b9cso3315397eds.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Nov 2021 11:38:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EBMyA879RvsAF1C+luC7hFdhhdb0lbrjQTlN8WSCnFk=;
        b=CNTBwcALa9eVXOxuKnIbDPjZFgfQlm5heq/jKl4yHDomRptOZvRACqbhbp9YGA4K8o
         eG3ZCYTg4M6d8ODCvvCgZE6+egX+ip3tJvwnHFPeoYUaGOq4rUqVAZW9Jcu1WE1ohZSj
         u8IFrvNlxCgw1ta5q9VpehHOtBS8gvn80l6DSgWY9FaRcJc0PDrSpav49tiFRsuOSs+J
         Cdf1O/a+a/v+07xhSZFsVXI89fYfJOId0/xgFwguQEPq+2eoXBFe2OAQcT3kqvN9J7Ru
         0BvLk7vjPEQYLGA5jNsf4lTihiHPXftI8GzkrGZrAcG5m9ktkjY1wC2XB7xPihiSe77P
         Y6nQ==
X-Gm-Message-State: AOAM532PZqPdFmfjcSjp23kixLvrNdCCmgqgGzAcOjnFhW7q2eKy9/V3
        HOzZF8WQ8lu/h5CwmkFZaBAZ9oWVWzsscUH+92XENGw+azo7DQ7l4OPs+Av5xtgNu1SkKed9D6g
        FxB1OGjdLRmnqV7/9o1ENDL+YTxVLT8itFQ==
X-Received: by 2002:a50:da0a:: with SMTP id z10mr29245619edj.298.1637782683048;
        Wed, 24 Nov 2021 11:38:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBFXtQywPJcpeP7Cae5o3iW6b2JD8nhe10LTlQSbjqidiFyuRVkCZhul9s25yC5JO8dnD7Eg==
X-Received: by 2002:a50:da0a:: with SMTP id z10mr29245588edj.298.1637782682857;
        Wed, 24 Nov 2021 11:38:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id d18sm557752edj.23.2021.11.24.11.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 11:38:02 -0800 (PST)
Message-ID: <add58c0b-de08-7bd9-9b9e-4b4289d8abc4@redhat.com>
Date:   Wed, 24 Nov 2021 20:38:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [External] Re: [PATCH 2/2] platform/x86: thinkpad_acpi: Add
 lid-logo-led to the list of safe LEDs
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
References: <20211123210524.266705-1-hdegoede@redhat.com>
 <20211123210524.266705-2-hdegoede@redhat.com>
 <ca16bf3e-2efe-49a6-94a2-4aeb66f398dc@t-8ch.de>
 <eeaa722c-b1e5-477f-d683-f4e55e50f8b5@redhat.com>
 <2cdab9d3-a433-5449-6602-069b7549603d@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2cdab9d3-a433-5449-6602-069b7549603d@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/24/21 20:13, Mark Pearson wrote:
> 
> 
> On 2021-11-24 11:28, Hans de Goede wrote:
>> Hi,
>>
>> On 11/24/21 16:53, Thomas Weißschuh wrote:
>>> Hi,
>>>
>>> On 2021-11-23 22:05+0100, Hans de Goede wrote:
>>>> There have been various bugs / forum threads about allowing control of
>>>> the LED in the ThinkPad logo on the lid of various models.
>>>>
>>>> This seems to be something which users want to control and there really
>>>> is no reason to require setting CONFIG_THINKPAD_ACPI_UNSAFE_LEDS for this.
>>>>
>>>> The lid-logo-led is LED number 10, so change the name of the 10th led
>>>> from unknown_led2 to lid_logo_led and add it to the TPACPI_SAFE_LEDS mask.
>>>>
>>>> Link: https://www.reddit.com/r/thinkpad/comments/7n8eyu/thinkpad_led_control_under_gnulinux/>>>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1943318>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>  drivers/platform/x86/thinkpad_acpi.c | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>>>> index 49fdf16b2db9..28f0299ecab0 100644
>>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>>> @@ -5661,11 +5661,11 @@ static const char * const tpacpi_led_names[TPACPI_LED_NUMLEDS] = {
>>>>  	"tpacpi::standby",
>>>>  	"tpacpi::dock_status1",
>>>>  	"tpacpi::dock_status2",
>>>> -	"tpacpi::unknown_led2",
>>>> +	"tpacpi::lid_logo_led",
>>>
>>> The suffix "_led" looks a bit redundant. Also non of the other LEDs have it.
>>
>> Hmm, good point, but without the _led to me it sounds as if it controls
>> some backlight for the entire logo, where it really is just the dot of the i.
>>
>> So I'm not sure what to do here :)
>>
>>> Also currently the reported brightness is 0 before writing to it, although the
>>> LED is powered on by default, not sure how this could be fixed though.
>>
>> Right, this is a known short-coming of the tpacpi LED interface, LEDs can be
>> set but you cannot get the current status.
>>
>> And once set, the LED is now fully under usercontrol, until the next reboot
>> (or maybe even power-cycle).
>>
> Apart from being vaguely fascinated that people want to play with the
> LED (I assume because it's annoying and a small waste of power?)

Some people just find the LED annoying so they just want to turn it off
I believe. Others want to repurpose it for their own purposes.

> is this
> something that I should put in a request for an API to get the LED status?

I don't believe not being able to read the status is really a big deal,
with that said it would be nice to have, but definitely a low priority item.

> I would like to get the FW teams point of view here too. We use the LED
> to show if the system is suspended or not so I'm somewhat curious as to
> what happens if a user overrides the setting.

AFAIK once the user has overridden the value it stays at the user selected
value until a reboot or power-cycle.

Note that most thinkpads also make the power-button-led "glow" when
suspended, and we already allow overriding this.

The reason why thinkpad_acpi has the notion of safe LEDs is to disallow
overriding some LEDs in older docks which indicate when it is safe to
unplug the laptop.

In that case overriding the LEDs could be quite bad but here we just loose
"I'm suspended" notification which may be annoying if the user is waiting
for the LED to start glowing after closing the lid (and before say bagging
the laptop). But presumably a user deliberately overriding the LED knows
it is not going to glow now.

> I doubt it's a big deal
> but I'd like to double check if there are any gotcha's.

Sounds good, thanks.

Regards,

Hans

