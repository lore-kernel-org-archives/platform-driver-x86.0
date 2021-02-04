Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294F0C433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 09:20:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC22964F4D
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 09:20:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233850AbhBDJTz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 04:19:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20198 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233705AbhBDJTx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 04:19:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612430308;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qF2RHRLJSzWg3l+Fnd4fPAG6Xy9PgbFqFuHn4ZaX+3k=;
        b=Wo5VI0uw6rUeChJl7C0SXrJbjo+ndnBcb60NloFPQOoi+c9xAjZ0m5wCR1u3Irn91MFrOL
        ZD8/NyYYCc1udP62tgvYyrO8QmnNKIUp4chRbfo94QY7m5LXu4OWiIAjN8LaVol6iq4KI2
        gl//M19yae3YjHKJr9XgS4n9hPMKgMo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-n6H_ZQiGOLupBs8H0AJz3A-1; Thu, 04 Feb 2021 04:18:26 -0500
X-MC-Unique: n6H_ZQiGOLupBs8H0AJz3A-1
Received: by mail-ed1-f69.google.com with SMTP id g6so2414032edy.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Feb 2021 01:18:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qF2RHRLJSzWg3l+Fnd4fPAG6Xy9PgbFqFuHn4ZaX+3k=;
        b=ckoQBGfHVTedXuof7LR1/JoC8zUh+vtz8b5GO3Zh55I/CsLoGcVty/r7ZpRcyfMxqv
         kmC9J7ofXWtxK0EVSQ10EkXk3cOQQoR8/FpYNS8wKeXdhmK341Kk/luwWH9o5vgWtreh
         AlWMldAEAzf+jU+zFeg1ZBlDnl3oxy/qPrOOldixyOaEaYfujXmSq1qDdUuTI+cvnyAY
         AZKS3OgZrPXAKq2uP9Mn2zWiVmv3szOTDyNYlDPvvrRCF8NJ1AymujA8+2MLgC+TlwAb
         b0mfunaiGbIHhjRYVtmW1ZdT6WfQsN2CPCnIWo6robiHCTdO3HU/ZIg8tBeCm3+Lsqyn
         BtUw==
X-Gm-Message-State: AOAM533+B0D9aDnki++97piZX4IXWdaiQSiPetSfLkfYLMr7eHHlqdrx
        8bvw//HYvfGUmtA0Q8iS7JkZabvT9NcNtj92APUoN8QqrALwJNMuqAvK10ubrUbk1Y35a+zSNWK
        AUg2PRZx7hCPt9mpZmZdmnEkktIDlsmkaFw==
X-Received: by 2002:a05:6402:34c1:: with SMTP id w1mr7152490edc.147.1612430305034;
        Thu, 04 Feb 2021 01:18:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyykVXT9oSm72NonBeZE72TJTdnE4L4pjtbYCQx0vFl9j2nHIYKkpyJEipTP5nihZ9Mx6OYng==
X-Received: by 2002:a05:6402:34c1:: with SMTP id w1mr7152473edc.147.1612430304827;
        Thu, 04 Feb 2021 01:18:24 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id z22sm2134416edb.88.2021.02.04.01.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 01:18:24 -0800 (PST)
Subject: Re: [External] Re: [PATCH v9] platform/x86: thinkpad_acpi: Add
 platform profile support
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, rjw@rjwysocki.net,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        hadess@hadess.net, njoshi1@lenovo.com
References: <markpearson@lenovo.com>
 <20210111162237.3469-1-markpearson@lenovo.com>
 <39c453b5-c6f2-7e45-ee82-64344e800711@redhat.com>
 <ab6d9113-2bc6-3c02-bc08-65a0aa217325@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <48752174-26c3-fb83-ddf6-01bf2cafd1ab@redhat.com>
Date:   Thu, 4 Feb 2021 10:18:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <ab6d9113-2bc6-3c02-bc08-65a0aa217325@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/3/21 3:46 PM, Mark Pearson wrote:
> On 02/02/2021 09:49, Hans de Goede wrote:
>> Hi,
>>
>> On 1/11/21 5:22 PM, Mark Pearson wrote:
>>> Add support to thinkpad_acpi for Lenovo platforms that have DYTC
>>> version 5 support or newer to use the platform profile feature.
>>>
>>> This will allow users to determine and control the platform modes
>>> between low-power, balanced operation and performance modes.
>>>
>>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>>
>> Now that the acpi/platform_profile changes have landed I have
>> merged this patch (solving a trivial conflict caused by the
>> keyboard_lang changes).
>>
>> Thank you for your patch, I've applied this patch to my review-hans 
>> branch:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>
>> Note it will show up in my review-hans branch once I've pushed my
>> local branch there, which might take a while.
>>
>> Once I've run some tests on this branch the patches there will be
>> added to the platform-drivers-x86/for-next branch and eventually
>> will be included in the pdx86 pull-request to Linus for the next
>> merge-window.
>>
> Thanks Hans - sounds great.
> Let me know if you find any issues or need any extra tests running.

So the build-bots have found 2 issues:

1. Some symbols which are not exported need to be marked static (I will fix this myself,
that is the easiest / fastest):

drivers/platform/x86/thinkpad_acpi.c:10081:5: warning: no previous prototype for 'dytc_profile_get' [-Wmissing-prototypes]
drivers/platform/x86/thinkpad_acpi.c:10095:5: warning: no previous prototype for 'dytc_cql_command' [-Wmissing-prototypes]
drivers/platform/x86/thinkpad_acpi.c:10133:5: warning: no previous prototype for 'dytc_profile_set' [-Wmissing-prototypes]

2. This is a bigger problem, this is the result of a random-config test-build and I'm
pretty sure that the issue is that acpi_platform was build as a module while
thinkpad_acpi was builtin and builtin code cannot rely on modules.

drivers/platform/x86/thinkpad_acpi.c:10186: undefined reference to `platform_profile_notify'
drivers/platform/x86/thinkpad_acpi.c:10226: undefined reference to `platform_profile_register'
drivers/platform/x86/thinkpad_acpi.c:10246: undefined reference to `platform_profile_remove'

There are 2 ways to solve this:

1. Change

#if IS_ENABLED(CONFIG_ACPI_PLATFORM_PROFILE)

to:

#if IS_REACHABLE(CONFIG_ACPI_PLATFORM_PROFILE)

Which will disable the platform-profile support in acpi_thinkpad in the above scenario.

or.

2. Drop the #if IS_ENABLED(...) and add a

        depends on ACPI_PLATFORM_PROFILE

To the THINKPAD_ACPI Kconfig symbol.


I personally think 2. would be slightly better as it ensures that platform-profile
support is always available when thinkpad_acpi is build, hopefully leading to less
confusing bug-reports about it sometimes not working.

If you can let me know what you want, then I can fix this locally too and get
the fix in place before the merge-window opens.

Regards,

Hans

