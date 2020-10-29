Return-Path: <SRS0=eM/Q=EE=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F469C4363A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 16:03:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C48192075E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 16:03:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="afAiZQxD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbgJ2QDZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Oct 2020 12:03:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59357 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725781AbgJ2QDY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Oct 2020 12:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603987402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uOasBam5gXvdPPyM9scWn8lcoOXB0UukZC1GOkaCgrA=;
        b=afAiZQxD0WJTkb8Qg6OVN8wQ+L0PgMRi9ejM31FtBjVYlGh597FK4fof40mw6tLsT6Lz6B
        ncVJxbBS5EWnlKJ1XCtsNXxMushVDCqyDmC0oVqqUI5PeGUKNVGx0bdewElcmE2ZjI+XmF
        gWbjzoT1JKyDkR4TYcC69w+1mqQdfUM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-fc1ikvdyPBSe6xiTZmYvvg-1; Thu, 29 Oct 2020 12:03:21 -0400
X-MC-Unique: fc1ikvdyPBSe6xiTZmYvvg-1
Received: by mail-ej1-f70.google.com with SMTP id b17so1326649ejb.20
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2020 09:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uOasBam5gXvdPPyM9scWn8lcoOXB0UukZC1GOkaCgrA=;
        b=sbYk4+aISNY/fufFGu3U0dgHXKn6mksx3/sMekEwRnCaoSML+mPX9Dts4c2Vjgcd/L
         Ka6PBgtsRQV2YoY8QkTEtMTg53xbITKHrosEatPvPxlQCuVRCoKXDesFjYmfc7JT/LR0
         Ol0h8WEOZtTPsVJ1dyBQKCT3X9ZpcyscrVmdAOrTZ+nzQEU5bDXBYZ8XwtjyTdikAGkC
         5EIGPolPUu9v1cWW+bPyRM+rPmzb+BY5NutwL1HiZLC4KLLHi3aGrhPchl2rPrSJpk2N
         vSZCNU/WM83Llb2AIgi6fMYUQ+QJLB3bGX5ZraaEHmUPCSWhbCzb9D+R6Ryg837HfNKa
         T8iw==
X-Gm-Message-State: AOAM532+ZWJZySaKTvZbrJ1zkE031MOlaPU+hnLEFHOGQWnV2GvZoN0f
        egtNrc/LmH6GeA5EdGlMELNSdho2EvTMSxszvzodXwU/GXTc+7qPx0gdcbX5Bc/l5QkXV78JW/U
        5cT3zlz7zTudipObeI05mcArLAp3xDutKbA==
X-Received: by 2002:a50:f190:: with SMTP id x16mr3457803edl.292.1603987399769;
        Thu, 29 Oct 2020 09:03:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFUhd3qUcLDQTPQgyVyZlDEFRb12fWwjdMuW58utoTfR7ZjAeL6gRI9dXv6/xZdlYXP0Mf5w==
X-Received: by 2002:a50:f190:: with SMTP id x16mr3457780edl.292.1603987399513;
        Thu, 29 Oct 2020 09:03:19 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id pw17sm1711891ejb.116.2020.10.29.09.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 09:03:18 -0700 (PDT)
Subject: Re: [PATCH] power: supply: olpc_battery: remove unnecessary
 CONFIG_PM_SLEEP
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andy@infradead.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:X86 PLATFORM DRIVERS - ARCH" 
        <platform-driver-x86@vger.kernel.org>,
        "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" 
        <linux-kernel@vger.kernel.org>
References: <20201029074100.225806-1-coiby.xu@gmail.com>
 <5350ef53-cf70-c4b6-cdf8-5738e9d4b10a@redhat.com>
 <20201029105941.i2kr2424wnrgtvz5@Rk>
 <2c09e34a-3312-628e-c9cd-518e9f58efb4@redhat.com>
 <20201029141646.sijo6iuj44ekytg7@Rk>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e615dc68-31ea-6469-8017-a9886fcc6f6e@redhat.com>
Date:   Thu, 29 Oct 2020 17:03:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201029141646.sijo6iuj44ekytg7@Rk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/29/20 3:16 PM, Coiby Xu wrote:
> On Thu, Oct 29, 2020 at 12:09:23PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 10/29/20 11:59 AM, Coiby Xu wrote:
>>> Hi Hans,
>>>
>>> Thank you for reviewing this patch!
>>>
>>> On Thu, Oct 29, 2020 at 11:04:36AM +0100, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 10/29/20 8:41 AM, Coiby Xu wrote:
>>>>> SIMPLE_DEV_PM_OPS has already took good care of CONFIG_PM_CONFIG.
>>>>
>>>> No it does not, when CONFIG_PM_SLEEP is not set then the
>>>> SET_SYSTEM_SLEEP_PM_OPS macro which SIMPLE_DEV_PM_OPS uses
>>>> is a no-op, so nothing will reference xo15_sci_resume leading to
>>>> a compiler warning when CONFIG_PM_SLEEP is not set.
>>>>
>>>> You could drop the ifdef and add __maybe_unused to the definition
>>>> of xo15_sci_resume, but that feels like needless churn, best to
>>>> just keep this as is IMHO.
>>>>
>>>
>>> Actually, this is a tree-wide change by some semi-automation scripts.
>>> Thank you for pointing out the issue to prevent me from releasing
>>> another ~150 emails to flood other mailing lists.
>>>
>>> Currently there are 929 drivers has device PM callbacks,
>>>
>>> $ grep -rI "\.pm = &" --include=*.cÃ‚Â  ./|wc -l
>>> 929
>>>
>>> I put all files having device PM callbacks into four categories
>>> based on weather a file has CONFIG_PM_SLEEP or PM macro like
>>> SET_SYSTEM_SLEEP_PM_OPS, here are the statistics,
>>> Ã‚Â  1. have both CONFIG_PM_SLEEP and PM_OPS macro: 213
>>> Ã‚Â  2. have CONFIG_PM_SLEEP but no PM_OPS macro: 19
>>> Ã‚Â  3. have PM macro but not CONFIG_PM_SLEEP: 347
>>> Ã‚Â  4. no PM macro or CONFIG_PM_SLEEP: 302
>>>
>>> Some drivers which have PM macro but not CONFIG_PM_SLEEP like
>>> sound/x86/intel_hdmi_audio.c indeed use __maybe_unused to eliminate
>>> the compiling warning. In 2011, there's a patch proposing to remove
>>> ONFIG_PM altogether but an objection was turning CONFIG_PM on would
>>> increase the kernel size [1]. So __maybe_unused also have this issue.
>>
>> I would expect the compiler to remove the unused function, it knows
>> it is unused, that is why __maybe_unused is necessary to suppress
>> the warning and compilers are pretty smart and agressive wrt remove
>> unnecessary code these days.
>>
> Then __maybe_unused is a good solution and there's also convincing
> reason to prefer __maybe_unused over CONFIG_PM_SLEEP according to
> Arnd Bergmann [2],

Ok, I would be happy to merge a patch for this which drops the #ifdef-s
and adds a __maybe_unused.

Regards,

Hans

