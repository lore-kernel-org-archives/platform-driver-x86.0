Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B7EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Nov 2021 16:28:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242351AbhKXQbk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Nov 2021 11:31:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49824 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348622AbhKXQbj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Nov 2021 11:31:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637771308;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ba+EoWBPbNqWxVskipXZe1SQrXZNIvSH8EH+NB3g9yg=;
        b=TrfMyhy/K/n/kG7cQq1tkvtmMii0spTVVioZg5Quux9Ty/DsHjsI6LTfSWC1BjaOqQgoUh
        XuruWZJXKsEUpA7fh8s9Of5f3vpLXwacge6ic4Yg5+STUVpshqSO/LnVBVH8OTefVPnyHx
        Nx0mFchruGlkcRbGUKnZLEmm5X7HqNQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-123-dJB_zUHSPWeAQp0qhNgA4g-1; Wed, 24 Nov 2021 11:28:25 -0500
X-MC-Unique: dJB_zUHSPWeAQp0qhNgA4g-1
Received: by mail-ed1-f69.google.com with SMTP id k7-20020aa7c387000000b003e7ed87fb31so2898343edq.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Nov 2021 08:28:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ba+EoWBPbNqWxVskipXZe1SQrXZNIvSH8EH+NB3g9yg=;
        b=RwSfIiTJm0OtYel7RepIohZwuACcXiv87tkANCjTWZoCQNLOQKnqhoP9FhCaAQXDQW
         owN8ST7KplhUFQ4iSJ6X9pOUJr22rE402MRUzx6bgHl65ldDMZTaAv22l9BWYjzFKldA
         DaYMY1gSoO7RwlvJMSXMTxNVEt8VG9ZjboghcsbQYNjyW3hBT9ZUxYHYuXX0vo8wxbO7
         wRFn7h9g0w2/m4kUJytgmbICy7seLiYf42PcrI6BtWimfg7wjhzftDKLNtqZXa5cLzbc
         ZGF6/cwBN193blcHN7x6P8OE+euMUrYH7Dz3/FzuJ/nxXxHzENnJBDdob5lr08Ix6Fgo
         /yOA==
X-Gm-Message-State: AOAM5338pI6J04RxsDxHgMoURnWNTByDNJ1FbyjBl8baU6I50r6ifCIJ
        sUUwgTH59N+16AiUz4MeUe2VaA9PzE35XgsRMgfGEtQNk093NtTaL1+NvMRktRZmWOGK4zF+oTl
        TAMzQako0ZJL58JJDdNjZpsva8cuuhMfwuA==
X-Received: by 2002:a17:907:3f19:: with SMTP id hq25mr20837630ejc.225.1637771304357;
        Wed, 24 Nov 2021 08:28:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQ+JnHt3p27zkv4QJhcLrb5o6ng+ILGpyhzfiunImBY6czx1sltLv2gkZTp+yoVDnfGREo0Q==
X-Received: by 2002:a17:907:3f19:: with SMTP id hq25mr20837602ejc.225.1637771304187;
        Wed, 24 Nov 2021 08:28:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id i5sm172151ejw.121.2021.11.24.08.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 08:28:23 -0800 (PST)
Message-ID: <eeaa722c-b1e5-477f-d683-f4e55e50f8b5@redhat.com>
Date:   Wed, 24 Nov 2021 17:28:23 +0100
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ca16bf3e-2efe-49a6-94a2-4aeb66f398dc@t-8ch.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/24/21 16:53, Thomas Weißschuh wrote:
> Hi,
> 
> On 2021-11-23 22:05+0100, Hans de Goede wrote:
>> There have been various bugs / forum threads about allowing control of
>> the LED in the ThinkPad logo on the lid of various models.
>>
>> This seems to be something which users want to control and there really
>> is no reason to require setting CONFIG_THINKPAD_ACPI_UNSAFE_LEDS for this.
>>
>> The lid-logo-led is LED number 10, so change the name of the 10th led
>> from unknown_led2 to lid_logo_led and add it to the TPACPI_SAFE_LEDS mask.
>>
>> Link: https://www.reddit.com/r/thinkpad/comments/7n8eyu/thinkpad_led_control_under_gnulinux/
>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1943318
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/thinkpad_acpi.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index 49fdf16b2db9..28f0299ecab0 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -5661,11 +5661,11 @@ static const char * const tpacpi_led_names[TPACPI_LED_NUMLEDS] = {
>>  	"tpacpi::standby",
>>  	"tpacpi::dock_status1",
>>  	"tpacpi::dock_status2",
>> -	"tpacpi::unknown_led2",
>> +	"tpacpi::lid_logo_led",
> 
> The suffix "_led" looks a bit redundant. Also non of the other LEDs have it.

Hmm, good point, but without the _led to me it sounds as if it controls
some backlight for the entire logo, where it really is just the dot of the i.

So I'm not sure what to do here :)

> Also currently the reported brightness is 0 before writing to it, although the
> LED is powered on by default, not sure how this could be fixed though.

Right, this is a known short-coming of the tpacpi LED interface, LEDs can be
set but you cannot get the current status.

And once set, the LED is now fully under usercontrol, until the next reboot
(or maybe even power-cycle).

Regards,

Hans



