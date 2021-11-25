Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC77C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Nov 2021 08:32:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349975AbhKYIfO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Nov 2021 03:35:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37957 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348709AbhKYIdM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Nov 2021 03:33:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637829000;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qSQiNAe/mOqPgpYr95u8H67sx7RWSHIkXF9QG5UjvC0=;
        b=R0JzvUKsITNX20Gp9SeQsfTcYTp+dkqO92Hb8PTijZNQll1ZCBlnKrF1QYbiiBKHntFPXu
        7djC8IVilwYrviIRt9VCe4tp7T+z+8CIAd0Rof+vyj3WwZgVi5thUCRlJEkATjyZrkGblM
        sbruFfCUBYuiolxfgAmE9OuHHqZNEo0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-nIKSjvYXOwqLrfZYha8aYg-1; Thu, 25 Nov 2021 03:29:59 -0500
X-MC-Unique: nIKSjvYXOwqLrfZYha8aYg-1
Received: by mail-ed1-f72.google.com with SMTP id v1-20020aa7cd41000000b003e80973378aso4787213edw.14
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Nov 2021 00:29:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qSQiNAe/mOqPgpYr95u8H67sx7RWSHIkXF9QG5UjvC0=;
        b=eKdO7GDH+gNMcDRiT9RZmUryTDgI+GyP59Dpj2IPsXw5XKBVruNBpnBuGTInaAHZQY
         JJ1LtMDV2ePaV87w11h3Cw1nbqOy5XmWqhGMt6hR+t4EQk4dHQJbbeDLkBKRjDONRdO+
         GKsb6WcmiLN4qDYJGyq/+C52RaUuDvJkPM1bMwUx305GovFiL9Her3JuoSaSogb+lZ1q
         ieRWo7CmbpU9hT0wz9ONK8jIhV8jVGDVbXAGIHKvvd9brxSROOfM9KbwrcDUs+1VjFMq
         qANBZ8x3YhhCuk4UsjQ57wgal30jPAyF5URGz36QHlqOxjAlOWHIuXctJVXlyDmLkIqj
         /eWA==
X-Gm-Message-State: AOAM530vSj2YBQw4LY4B+/O06knTkP/TiX1nt1VGT/x7hf6R0uaEZExs
        9MJmvaUBPqxSkBHvUTHTI1AcL419bItoi8AvRrBRxS2msRlPbm9LBeuSy49mzkLLEFUrfRqdHLv
        VjO+5sExiEp9jV4Pz3n7ZKsnpVsTD1+zieg==
X-Received: by 2002:aa7:d34c:: with SMTP id m12mr36507409edr.269.1637828997810;
        Thu, 25 Nov 2021 00:29:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4KU/N0Tj7vJf0Qd0PcoDUA/pHBvV4fM1Y8Hq4pwbuqTrcsMK/QdhC7X0v7tcTrAe/6W0yuw==
X-Received: by 2002:aa7:d34c:: with SMTP id m12mr36507390edr.269.1637828997677;
        Thu, 25 Nov 2021 00:29:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id j14sm1503055edw.96.2021.11.25.00.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 00:29:57 -0800 (PST)
Message-ID: <c397f082-e08a-7eac-dec0-f2f25fe34a8d@redhat.com>
Date:   Thu, 25 Nov 2021 09:29:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] platform/x86: thinkpad_acpi: Add lid-logo-led to the
 list of safe LEDs
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>,
        platform-driver-x86@vger.kernel.org
References: <20211123210524.266705-1-hdegoede@redhat.com>
 <20211123210524.266705-2-hdegoede@redhat.com>
 <ca16bf3e-2efe-49a6-94a2-4aeb66f398dc@t-8ch.de>
 <eeaa722c-b1e5-477f-d683-f4e55e50f8b5@redhat.com>
 <ce072aa8-90b5-46e1-9bb9-f103286cec81@t-8ch.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ce072aa8-90b5-46e1-9bb9-f103286cec81@t-8ch.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/24/21 23:59, Thomas Weißschuh wrote:
> On 2021-11-24 17:28+0100, Hans de Goede wrote:
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
>>>> Link: https://www.reddit.com/r/thinkpad/comments/7n8eyu/thinkpad_led_control_under_gnulinux/
>>>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1943318
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
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
> 
> lid_logo_dot? Not sure it's worth the bikeshedding :-)

lid_logo_dot, I like that, lid_logo_dot it is; and agreed on the bikeshedding :)

Regards,

Hans

