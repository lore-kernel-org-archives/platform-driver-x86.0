Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D94CC4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 20:11:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDAF860EFE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 20:11:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233260AbhHRUMH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 16:12:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21794 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233215AbhHRUME (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 16:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629317488;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MLs6kjcvM8JscWCnRxRfzkFiQuDwgW1TjvaPNWOcLuE=;
        b=SpFC92UtAuhmphFzANigXy15M5/RDiIfIvzyHxWUuE9tpHnQl0lVDtYmg/ZdcavMJPo3iJ
        3eRB0ntmsNmu07UJaai5BghPfBkbWJKTGiiVcs5eTQ8ShafEB+oiWQ67csUToILBJAbwtk
        x/xXkmD3jkjm4vb4fpVXFV1a1oRTxbo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-PzOGHPMNMRKH0hYUfVa1dw-1; Wed, 18 Aug 2021 16:11:27 -0400
X-MC-Unique: PzOGHPMNMRKH0hYUfVa1dw-1
Received: by mail-ej1-f69.google.com with SMTP id e15-20020a1709061fcf00b005bd9d618ea0so1296858ejt.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 13:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MLs6kjcvM8JscWCnRxRfzkFiQuDwgW1TjvaPNWOcLuE=;
        b=FxrY0estUPmCPTVLbzxmUtjynUYHa0s/7yEgoR4U9IGzl6Eq4OqOPFD6bWJw2TA0HO
         k72NJ3YzhWvkyMBfJdfK+sXZBnQP2TKZSEsp0go4rBeAjgjCg+/ia1Q4sK7djfw5gIoM
         AGuGQJ0LmLbMaDqo7XGnuQCYYMr1N8nwEjwkzwvBhZA9OZNypuIYWy80DkoZoQUfZwSZ
         PSldJ95zssSPFgaHueOfDQ8rCVYgzY1WWIaVWtXWyR5U4or1FBJLn1YjVLFCIo8ynkR4
         qgfKWQwOLXKwIGNaoepF63X6SkHysRLqt/mKuJ+3CYLbafK1ukgXGspV2Jsxi9erhkOC
         PPnQ==
X-Gm-Message-State: AOAM530s1Bi60WfefZcPKBRKly9dmPIT53cXn4RXMfZTAynaIPEmZoEW
        3/Y/LL6raIf8dJNbH7EngbNi+XMzgmqAS014MPnp2jKffWqzQdWxBqKkYvLLQM5G9AdoVaXKAIm
        5vDhH7ZHTpsId2LUdmig+ZO8TXu3uMUV0uCcU9jjsIftUo0fCdZh/fPVWtLHIKRag+HHJId9f//
        Vaz5Y3cJjPDQ==
X-Received: by 2002:a17:906:f190:: with SMTP id gs16mr11713419ejb.439.1629317485881;
        Wed, 18 Aug 2021 13:11:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/BgGyHdAEnrW2mb49uKtrU4aN5u4gAYv/XRY8V8vSeIN6dDnAL66mGaOiytPd76Wjbjpzlg==
X-Received: by 2002:a17:906:f190:: with SMTP id gs16mr11713403ejb.439.1629317485685;
        Wed, 18 Aug 2021 13:11:25 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id v1sm335171ejd.31.2021.08.18.13.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 13:11:25 -0700 (PDT)
Subject: Re: [PATCH v5 1/1] asus-wmi: Add support for platform_profile
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        "Luke D. Jones" <luke@ljones.dev>
Cc:     linux-kernel@vger.kernel.org, hadess@hadess.net,
        platform-driver-x86@vger.kernel.org
References: <20210818190731.19170-1-luke@ljones.dev>
 <20210818190731.19170-2-luke@ljones.dev>
 <tkJb_14m7EeHjs3G_DaqN0tMCLMA4qNheZDxfrsnGHoxFrsxOebsq46o8pXT-f7i2SgcZiFGk8FEy6BWVeT7xtTShgbyXqYNyeu58bayOS0=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <028ac156-6fac-487b-3e24-e9e92d6a0b4d@redhat.com>
Date:   Wed, 18 Aug 2021 22:11:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <tkJb_14m7EeHjs3G_DaqN0tMCLMA4qNheZDxfrsnGHoxFrsxOebsq46o8pXT-f7i2SgcZiFGk8FEy6BWVeT7xtTShgbyXqYNyeu58bayOS0=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/18/21 9:25 PM, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2021. augusztus 18., szerda 21:07 keltezéssel, Luke D. Jones írta:
>> Add initial support for platform_profile where the support is
>> based on availability of ASUS_THROTTLE_THERMAL_POLICY.
>>
>> Because throttle_thermal_policy is used by platform_profile and is
>> writeable separately to platform_profile any userspace changes to
>> throttle_thermal_policy need to notify platform_profile.
>>
>> In future throttle_thermal_policy sysfs should be removed so that
>> only one method controls the laptop power profile.
>>
>> Signed-off-by: Luke D. Jones <luke@ljones.dev>
>> ---
>>  drivers/platform/x86/Kconfig    |   1 +
>>  drivers/platform/x86/asus-wmi.c | 130 +++++++++++++++++++++++++++++++-
>>  2 files changed, 127 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index d12db6c316ea..46dec48a36c1 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> [...]
>> +static int platform_profile_set(struct platform_profile_handler *pprof,
>> +				enum platform_profile_option profile)
>> +{
>> +	struct asus_wmi *asus;
>> +	int tp;
>> +
>> +	asus = container_of(pprof, struct asus_wmi, platform_profile_handler);
>> +
>> +	switch (profile) {
>> +	case PLATFORM_PROFILE_PERFORMANCE:
>> +		tp = ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST;
>> +		break;
>> +	case PLATFORM_PROFILE_BALANCED:
>> +		tp = ASUS_THROTTLE_THERMAL_POLICY_DEFAULT;
>> +		break;
>> +	case PLATFORM_PROFILE_QUIET:
>> +		tp = ASUS_THROTTLE_THERMAL_POLICY_SILENT;
>> +		break;
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	asus->throttle_thermal_policy_mode = tp;
>> +	return throttle_thermal_policy_write(asus);
> 
> Here the new mode will be stored even if activating it fails, no?

Yes I noticed this too. This is the same way how writing to
the throttle_thermal_policy sysfs file works, so this is consistent.

I know it is a bit weird, but normally the throttle_thermal_policy_write()
call never fails (throttle_thermal_policy_store does not check it at all).

And even if it fails, what does that mean we certainly did make the ACPI
call maybe the profile was actually changed but then some later ACPI code
setting up the return buffer failed ?  Or maybe the ACPI code did actually
never get around to forwarding the value to e.g. the EC ?

We basically don't know ...

IOW I think this is fine as is, it is a bit weird but it is consistent
with the existing callers of throttle_thermal_policy_write().

Regards,

Hans

