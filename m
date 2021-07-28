Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A944C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 15:04:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E83E60F91
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 15:04:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235457AbhG1PEl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Jul 2021 11:04:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31054 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236891AbhG1PER (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 11:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627484655;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MuxZEFPYDdK62dHu+iPhNXbwcOxVPEU5Vee6i+kelWw=;
        b=cjMsUHWzsaPvd2YFriTmBY0YWQqH31nra5xnrdS+FBR24LDk1K0r+b4h0LJJ1A2bQTFLqF
        ckTQ9gyeEL8M48s0jBYnxoHAuMqLa8eghOJvY9nbPot3m6wYFyJMJEpNFrsd8lZkf590nK
        caeifY2YZAmfJpozwiUISKhtUTvsnbE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-76LN_BlPPM6Gzkf5z95lnA-1; Wed, 28 Jul 2021 11:04:13 -0400
X-MC-Unique: 76LN_BlPPM6Gzkf5z95lnA-1
Received: by mail-ej1-f69.google.com with SMTP id ci25-20020a1709072679b029058e79f6c38aso616444ejc.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jul 2021 08:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MuxZEFPYDdK62dHu+iPhNXbwcOxVPEU5Vee6i+kelWw=;
        b=gOpu7AfsahhKQIZ7dxa/Yqe0txBb7Z73kHY+TzJUrVt2tBw57gjSwyDO4IbaMBCIy5
         btkgs2jvMZWLmbPcPUWFeTIQrsF3rKe4TPZWKlY3+7pNe6AGJ+lpYcXr9LMgwKtvDJkM
         ZQKEkrOYQr+SG97ckATU8BkBh6XcF26MBhEithKDz7/5AjeYnDr6fL9dTDDucu8Vg/F7
         SYbk/WHq9B+82lyvrXw0k6WpL17zJEkNY+zY7f8aZ5JHWMhC5Miof6cupwb+jZ6UymMw
         lgLjwzqynV5kmCE1lKot0aJkj50QnRfcKRg2/13eFUjUogUgBMSrJ7iCwU9ENJqAmiiD
         CmJQ==
X-Gm-Message-State: AOAM532X10+u10b1R/C7eZCyqDEny2/aa5kaxWIHWFQ2YqPOWeJybJ2K
        kATNM0HUF8A0abY/Zlsx18S4X6M+idxdp3yiG0zm3B26olw2w+fg/dT1AAYisYXYOp4vG4AbfK6
        pMBJ6Rh1jtMhqsBp8bsCmtALC50PCvMrbHDtIVm44UKqH2eeC2BvBX7qPBMKwFga5SRKLFO+dXN
        GiJQ50LMbbNA==
X-Received: by 2002:a05:6402:caf:: with SMTP id cn15mr313121edb.236.1627484652247;
        Wed, 28 Jul 2021 08:04:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEiO9YDlIrqgY0HvPCEJ85aczadBy8uNoahPkX93kDTcSF86l0N0m6yEQQS8FxZ1Li9GvSzQ==
X-Received: by 2002:a05:6402:caf:: with SMTP id cn15mr313089edb.236.1627484651967;
        Wed, 28 Jul 2021 08:04:11 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id i11sm4996eds.72.2021.07.28.08.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 08:04:10 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: Kconfig: Make wireless-hotkey depend on
 RFKILL
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
References: <20210720025351.1819-1-mario.limonciello@amd.com>
 <2f223058-3401-5c0a-d216-df32113e11f5@redhat.com>
 <86a93644-08ce-4f5e-356c-d51a5cbfa07d@amd.com>
 <d24de160-737e-10c1-02c4-489ef87dba0f@redhat.com>
Message-ID: <6236c406-90dd-d52e-f5c8-bb35ec21dfee@redhat.com>
Date:   Wed, 28 Jul 2021 17:04:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d24de160-737e-10c1-02c4-489ef87dba0f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/28/21 5:00 PM, Hans de Goede wrote:
> Hi,
> 
> On 7/28/21 4:55 PM, Limonciello, Mario wrote:
>> On 7/28/2021 07:31, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 7/20/21 4:53 AM, Mario Limonciello wrote:
>>>> This driver can be built on a kernel without rfkill, but events
>>>> won't work which causes an unexpected experience.
>>>>
>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>
>>> Mario I can understand where you are coming from here, but Kconfig
>>> dependencies are meant to express true in kernel dependencies.
>>>
>>> The wireless-hotkey driver is purely an ACPI based input driver
>>> from the kernel pov and as such it works fine without RFKILL
>>> being enabled.
>>>
>>> So adding a RFKILL dependency is the wrong thing to do here IMHO.
>>>
>>
>> Thanks, I get your point.  Is there another type of relationship that can be expressed for this?
> 
> No I'm afraid not.
> 
>> Is SELECT a better idea perhaps?
> 
> No select should only be used when enabling blocks of kernel code
> which in essence function as a library used by other code. In general
> either all users of a Kconfig symbol should either use depends on,
> or select. If different consumers of the functionality mix depends on
> and select then the Kconfig tools will typically exit with some error
> due to e.g. circular dependencies.

p.s.

More in general all the config options the kernel has simply offer so
much flexiblity that it is impossible to protect users against configurations
which may not work for them.

There simply is not much we can do about this. In general Kconfig changes
like the one which you propose should only be made to avoid having a
possible .config which will not build (typically due to linker errors)

Users should really just stick with def_config-s or distro configs.

Regards,

Hans





> 
> Regards,
> 
> Hans
> 
> 
> 
> 
>>>> ---
>>>>   drivers/platform/x86/Kconfig | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>>>> index 7d385c3b2239..22b6e7e3da13 100644
>>>> --- a/drivers/platform/x86/Kconfig
>>>> +++ b/drivers/platform/x86/Kconfig
>>>> @@ -419,6 +419,7 @@ config WIRELESS_HOTKEY
>>>>       tristate "Wireless hotkey button"
>>>>       depends on ACPI
>>>>       depends on INPUT
>>>> +    depends on RFKILL
>>>>       help
>>>>        This driver provides supports for the wireless buttons found on some AMD,
>>>>        HP, & Xioami laptops.
>>>>
>>>
>>

