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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CC9C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 15:00:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65C9E60F91
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 15:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235561AbhG1PAZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Jul 2021 11:00:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53644 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235457AbhG1PAY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 11:00:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627484422;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t1C1TqnaE9lcNAE7i446ZMdyXkAscVS2ohcM2WY3MBw=;
        b=iGPxFzXoysMkElLbT6CJJtzdy/4ZD6lgTdAfxQSKYbJRu2riCMJJh9Dpw4N7LNaPBVf59F
        hcBheTNrX0ELstus4/1faXFOw81WcN05RNOhhINYNm7XVX67U/5GWeo2PoRthGrqqyLOwX
        X4ayJ5IwP7tG2rpNjmbQsynKOmfUvaA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-JqkqJiymOtKqjPwDVxxB3w-1; Wed, 28 Jul 2021 11:00:21 -0400
X-MC-Unique: JqkqJiymOtKqjPwDVxxB3w-1
Received: by mail-ed1-f72.google.com with SMTP id a23-20020a50ff170000b02903b85a16b672so1398128edu.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jul 2021 08:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t1C1TqnaE9lcNAE7i446ZMdyXkAscVS2ohcM2WY3MBw=;
        b=rnmdzbLCJ7lBL7rBEH1lgvb8w2eeN6m6XSTwhS9tIdhv7S8O0DzWR9a5B8+Btz/cZJ
         R/cOH0HNIQ6Df9/Jqnt1cxa+G49TGlWUALak4SWsHIlzxPEyRrZlsDIzUG7ZfpoJ7K9M
         RKlwepMG/Kf+89qCbfeHkDEt2Z4276RgdUihOV06qWvGT/5iB4OEopDEyYlMhGA68zKU
         nojx+rfT3KIDiQ0FYFDvy71DVOtSo0dcyctHUg0h0gmqEm7cuoP8NJeTjFd3bkuQktUW
         HG39IxqgVoEuzmQbw4YUEIatRX4pQ0eVVR+SfS7ktGvsKMl/fgaCX70HXzWx4BW2Eb/e
         mScQ==
X-Gm-Message-State: AOAM532P4CPrOJyEqNqr1tbE9U4EeFieyk5YSe2EkY66xmyvCwbANxHe
        z8PO3yqmwIhz0tkdUKJanig/JzWq0WEKo07VlsVjbhrDHVrlteDr5x8jxCsy3PEAI8SnYzf1Lgw
        CBnU0nC7EFCI9tfKgdOO8bfQubrj9WHGScYofUSOAmrZGzW0cakCuSrp4bNSXD1rRksbWKWrG0G
        Lj+2pqFMg30A==
X-Received: by 2002:aa7:c048:: with SMTP id k8mr235641edo.295.1627484420044;
        Wed, 28 Jul 2021 08:00:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6jx4C0GB+5T/EV+/oOionpn7mTwPP1YJGRC2mGP7/AhPeCVDJqwPnv4gORvMDgPWrDibt9w==
X-Received: by 2002:aa7:c048:: with SMTP id k8mr235595edo.295.1627484419826;
        Wed, 28 Jul 2021 08:00:19 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id aq24sm9967ejc.48.2021.07.28.08.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 08:00:19 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: Kconfig: Make wireless-hotkey depend on
 RFKILL
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
References: <20210720025351.1819-1-mario.limonciello@amd.com>
 <2f223058-3401-5c0a-d216-df32113e11f5@redhat.com>
 <86a93644-08ce-4f5e-356c-d51a5cbfa07d@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d24de160-737e-10c1-02c4-489ef87dba0f@redhat.com>
Date:   Wed, 28 Jul 2021 17:00:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <86a93644-08ce-4f5e-356c-d51a5cbfa07d@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/28/21 4:55 PM, Limonciello, Mario wrote:
> On 7/28/2021 07:31, Hans de Goede wrote:
>> Hi,
>>
>> On 7/20/21 4:53 AM, Mario Limonciello wrote:
>>> This driver can be built on a kernel without rfkill, but events
>>> won't work which causes an unexpected experience.
>>>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>
>> Mario I can understand where you are coming from here, but Kconfig
>> dependencies are meant to express true in kernel dependencies.
>>
>> The wireless-hotkey driver is purely an ACPI based input driver
>> from the kernel pov and as such it works fine without RFKILL
>> being enabled.
>>
>> So adding a RFKILL dependency is the wrong thing to do here IMHO.
>>
> 
> Thanks, I get your point.  Is there another type of relationship that can be expressed for this?

No I'm afraid not.

> Is SELECT a better idea perhaps?

No select should only be used when enabling blocks of kernel code
which in essence function as a library used by other code. In general
either all users of a Kconfig symbol should either use depends on,
or select. If different consumers of the functionality mix depends on
and select then the Kconfig tools will typically exit with some error
due to e.g. circular dependencies.

Regards,

Hans




>>> ---
>>>   drivers/platform/x86/Kconfig | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>>> index 7d385c3b2239..22b6e7e3da13 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -419,6 +419,7 @@ config WIRELESS_HOTKEY
>>>       tristate "Wireless hotkey button"
>>>       depends on ACPI
>>>       depends on INPUT
>>> +    depends on RFKILL
>>>       help
>>>        This driver provides supports for the wireless buttons found on some AMD,
>>>        HP, & Xioami laptops.
>>>
>>
> 

