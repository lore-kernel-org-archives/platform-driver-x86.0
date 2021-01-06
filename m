Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E377C433E6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 19:00:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E38D02312E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 19:00:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbhAFTA4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Jan 2021 14:00:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43525 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725800AbhAFTA4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Jan 2021 14:00:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609959569;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TSFE0aSW3LcsKvHoR82DnOjH34JJLOgYNFUFYlRYZ2A=;
        b=Eh+Sdpe342Syb9Ra95yZqNF26ld+IOTwSiaUbC5rD71Ufm85/Z76lZWihWxXAE/E2cASGH
        YHsCbwV0wg50A0aZ0v2HWVXNmKa58O/wyw1lulXtxwQ+Rsuy+1+DtFPRAT7jk706bsCtWC
        RMEXjRZ1dSyieMSP4EXVDO+oRHLa/lQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-0DiS-y_UPSuaN8yYnLvRJw-1; Wed, 06 Jan 2021 13:59:28 -0500
X-MC-Unique: 0DiS-y_UPSuaN8yYnLvRJw-1
Received: by mail-ed1-f72.google.com with SMTP id l33so2277052ede.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Jan 2021 10:59:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TSFE0aSW3LcsKvHoR82DnOjH34JJLOgYNFUFYlRYZ2A=;
        b=FTxmO2ZfTeZU5ZVYhZJJ7bFtPxmfMo11aA3wbepUTkDVZD6TlhkU2aBMP0Vcsq1XKd
         FxgJrAiGthA2OA5LluGmyNGFyxfXni4jrEy82W5dYgerP1gKFFcyVzgnxwyKlIr9TLG6
         NWjROZCUNfaHxvsNB8XH2eyCm4KmVm+SkK7wshyQTh69tcyqI5JaXWdNz/k3rYdxVUzT
         8LL/knupbTVserHIYxkWAOBECpOuIprt/U7pyL2nnQXPjhZjISsCotksM6xaiefQ5ykc
         MfITaJitKR5lscxosoN/tbCb2czV+F9xX+tso01GfPQzgyl7IDPbvqm6QLX/yF9tyv5u
         NT+Q==
X-Gm-Message-State: AOAM530zdFuJk3EFKl6cpiOAApi4ztQJVvrIe3DX8lL5rFVcSWXGmBHf
        MYSStvpcYEypkfa2RyO+8SiQG1PrPitB1ClF8zKdD/omvi+44XDZtcISCZ7hfHm9wtAA37nPJ6t
        jH6HgKXEGwFMk1BjACYU1zTHPRkes1zHgXkR+LQv4nrGTnxDUDog0h2ZD8UKg9PVRAB06gsCG5d
        Mf2TXpOaaz+w==
X-Received: by 2002:a17:907:429d:: with SMTP id ny21mr3794357ejb.290.1609959566283;
        Wed, 06 Jan 2021 10:59:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVkrXaIcZIt2cwjwcrd1EFKHFMHBiD9KtiXbZqdofjz8p5JEDgPFveHF5+pMNc0RLMLpI+9w==
X-Received: by 2002:a17:907:429d:: with SMTP id ny21mr3794344ejb.290.1609959566056;
        Wed, 06 Jan 2021 10:59:26 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id gt11sm1589090ejb.67.2021.01.06.10.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 10:59:25 -0800 (PST)
Subject: Re: How to detect Cherry Trail vs Brasswell inside the kernel ?
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <37906985-e026-48d3-cda8-6e63696e72aa@redhat.com>
 <SA1PR19MB492668D0A7FA8F09DCFDECA0FAD00@SA1PR19MB4926.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <70d39d5c-e412-110e-f403-d1c05573c6ce@redhat.com>
Date:   Wed, 6 Jan 2021 19:59:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <SA1PR19MB492668D0A7FA8F09DCFDECA0FAD00@SA1PR19MB4926.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/6/21 7:52 PM, Limonciello, Mario wrote:
>> So I was wondering if anyone else has any better ideas here?
>>
>> Regards,
>>
>> Hans
>>
>>
>> p.s.
>>
>> Just FYI the 2 issues which I want to resolve are:
>>
>> 1. Prevent drivers/platform/x86/intel_int0002_vgpio.c binding on Braswell
>> (non "tablet") SoCs. The INT0002 ACPI device is used for some wakeup
>> events (from S2idle) on the tablet (Cherry Trail) versions of the SoC.
>>
>> The current code will also bind to the INT0002 ACPI device (if present) on
>> Braswell, this is causing suspend/resume issues on some devices.
>> ATM we are working around this by setting the IRQCHIP_SKIP_SET_WAKE on
>> the irq-chip for the INT0002 vGPIO pin. But this in turn is breaking wakeup
>> by USB peripherals on Cherry Trail devices. If we can just stop the driver
>> from binding on Braswell devices all together then that would be better.
>>
> 
> Would it be possible to ask the vendor to remove INT0002 device from the
> firmware?

Even if all vendors would issue BIOs updates for this for all models
(which they won't) then we still cannot count on users installing those
BIOS updates. Because of this relying on a BIOS update is almost never the
right answer.

(Note I guess there might be some extreme circumstans / some corner case where
things are so broken that we will tell users to just upgrade their BIOS)

>> 2. Deal with non functional /sys/class/backlight/acpi_video[0-7] devices
>> showing up on BYT/CHT based media-boxes / hdmi-sticks. These devices do
>> not have a LCD panel, so there will be no "native" backlight driver causing
>> drivers/acpi/video-detect.c to select acpi_backlight_video as backlight-type.
>> drivers/acpi/acpi-video.c tries to avoid registering non-functional
>> /sys/class/backlight/acpi_video devices in cases like this, but that depends
>> on a DMI chassis-type check (to avoid suppressing the backlight interface
>> on laptops where we likely do want it) and many of these media-boxes /
>> hdmi-sticks are derived from BYT/CHT tablet designs and often the DMI
>> chassis type still says "Tablet". Actual Cherry Trail devices with a LCD
>> panel always use the native intel_backlight interface, but I guess some
>> Braswell based devices might use the acpi_video interface.
> 
> Maybe a function to look at specifically the DMI chassis type of "Tablet" and
> check for the lack of an internal LCD panel.  That seems like detecting that
> combination shouldn't ever try to run this code.

The issue is that we cannot detect the presence of a LCD panel from the
ACPI-video code. That is done by the i915 driver (on these devices) and
we really don't want any (more) dependencies between the acpi-video code
and the i915 code as those are very hard to manage wrt things like the
probing order. Also the ACPI-video code is supposed to be platform and
even architecture independent.

Regards,

Hans

