Return-Path: <SRS0=eM/Q=EE=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C8AC55178
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 11:10:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD7DC20756
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 11:10:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WCZ1bIbN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgJ2LJl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Oct 2020 07:09:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50650 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727645AbgJ2LJa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Oct 2020 07:09:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603969768;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ulPrPIim///GD383DoMCDOW+6QLsQhCgTfUq3eBfgQQ=;
        b=WCZ1bIbN309DE7mVahBlXKBdvdXgAgilnEDBLazm8JA7NNCEtOSZ31f9cqR1RY73Q6p3RX
        wy6gYd2XCFwuqnlAdnUbhxRWLZOrrrlwB/JLGG3vXS6mfvWwWcgfdj149J3RkJ4CedItjy
        4AeS6rll3ICrwC2lAThmIch5KRtjpWU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-Fd250RchNEuyWMkcCd1coA-1; Thu, 29 Oct 2020 07:09:27 -0400
X-MC-Unique: Fd250RchNEuyWMkcCd1coA-1
Received: by mail-ed1-f72.google.com with SMTP id y8so1040594edj.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2020 04:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ulPrPIim///GD383DoMCDOW+6QLsQhCgTfUq3eBfgQQ=;
        b=ZFvWwfMD68IXMGcFSZ3ChWUPkMHhGohxTd5K28mEyriqpKWeRVB30SDEmSuwo0WpJm
         U02r/D8mTzAPCoxGC5Kikz/BXFfQIc6pyd8dArIkhORJ9/r0Q44DDCv/zxm9kz5VAEGT
         gVT4TsGxdMokMGqqlzLa3AUfBMFaHh7DvoqD4BrqMo1HpV1mTej0P7PshFxL/dU72Urq
         45WmIwonS1W4qbc3LIiwIvfNSrLP0VT7bmqk8hCH5DizQfzcwbcav4FD6BA3gb0vx8Y/
         7sZ/CvdGhU7KC/GYgxTMzdySkgpH5JgUBYqpYcGmWZWg+unTBuTWD+uGeXG1i7tVuim3
         DrHA==
X-Gm-Message-State: AOAM5320PKb9dyYYACy4CGsXjMn96d1y9pW4HLULawFtRe3s6vlDBTM9
        5oIRxLu4nhQLGkHkYMHS/Pthp5v7lek6UEFEZ+7ROJwIsvqaB5T/7Aq0nGp2cOuE4bnO/eL39wQ
        NI7mZLTsnekGGmi+DW/AqqJHmDkJ/yAGMag==
X-Received: by 2002:aa7:cad6:: with SMTP id l22mr3373642edt.229.1603969765763;
        Thu, 29 Oct 2020 04:09:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwptOG11t2XxeOqWH7+pGgqpz2Wq37U+PJWlG3uxcg9bfNS61ETmLr1yNHXWpkFr9D1Jo67/w==
X-Received: by 2002:aa7:cad6:: with SMTP id l22mr3373613edt.229.1603969765485;
        Thu, 29 Oct 2020 04:09:25 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id oz18sm1303970ejb.55.2020.10.29.04.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 04:09:24 -0700 (PDT)
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2c09e34a-3312-628e-c9cd-518e9f58efb4@redhat.com>
Date:   Thu, 29 Oct 2020 12:09:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201029105941.i2kr2424wnrgtvz5@Rk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/29/20 11:59 AM, Coiby Xu wrote:
> Hi Hans,
> 
> Thank you for reviewing this patch!
> 
> On Thu, Oct 29, 2020 at 11:04:36AM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 10/29/20 8:41 AM, Coiby Xu wrote:
>>> SIMPLE_DEV_PM_OPS has already took good care of CONFIG_PM_CONFIG.
>>
>> No it does not, when CONFIG_PM_SLEEP is not set then the
>> SET_SYSTEM_SLEEP_PM_OPS macro which SIMPLE_DEV_PM_OPS uses
>> is a no-op, so nothing will reference xo15_sci_resume leading to
>> a compiler warning when CONFIG_PM_SLEEP is not set.
>>
>> You could drop the ifdef and add __maybe_unused to the definition
>> of xo15_sci_resume, but that feels like needless churn, best to
>> just keep this as is IMHO.
>>
> 
> Actually, this is a tree-wide change by some semi-automation scripts.
> Thank you for pointing out the issue to prevent me from releasing
> another ~150 emails to flood other mailing lists.
> 
> Currently there are 929 drivers has device PM callbacks,
> 
> $ grep -rI "\.pm = &" --include=*.c  ./|wc -l
> 929
> 
> I put all files having device PM callbacks into four categories
> based on weather a file has CONFIG_PM_SLEEP or PM macro like
> SET_SYSTEM_SLEEP_PM_OPS, here are the statistics,
>   1. have both CONFIG_PM_SLEEP and PM_OPS macro: 213
>   2. have CONFIG_PM_SLEEP but no PM_OPS macro: 19
>   3. have PM macro but not CONFIG_PM_SLEEP: 347
>   4. no PM macro or CONFIG_PM_SLEEP: 302
> 
> Some drivers which have PM macro but not CONFIG_PM_SLEEP like
> sound/x86/intel_hdmi_audio.c indeed use __maybe_unused to eliminate
> the compiling warning. In 2011, there's a patch proposing to remove
> ONFIG_PM altogether but an objection was turning CONFIG_PM on would
> increase the kernel size [1]. So __maybe_unused also have this issue.

I would expect the compiler to remove the unused function, it knows
it is unused, that is why __maybe_unused is necessary to suppress
the warning and compilers are pretty smart and agressive wrt remove
unnecessary code these days.

Regards,

Hans




>>> ---
>>>  arch/x86/platform/olpc/olpc-xo15-sci.c | 2 --
>>>  1 file changed, 2 deletions(-)
>>>
>>> diff --git a/arch/x86/platform/olpc/olpc-xo15-sci.c b/arch/x86/platform/olpc/olpc-xo15-sci.c
>>> index 85f4638764d6..716eefd735a4 100644
>>> --- a/arch/x86/platform/olpc/olpc-xo15-sci.c
>>> +++ b/arch/x86/platform/olpc/olpc-xo15-sci.c
>>> @@ -192,7 +192,6 @@ static int xo15_sci_remove(struct acpi_device *device)
>>>      return 0;
>>>  }
>>>
>>> -#ifdef CONFIG_PM_SLEEP
>>>  static int xo15_sci_resume(struct device *dev)
>>>  {
>>>      /* Enable all EC events */
>>> @@ -204,7 +203,6 @@ static int xo15_sci_resume(struct device *dev)
>>>
>>>      return 0;
>>>  }
>>> -#endif
>>>
>>>  static SIMPLE_DEV_PM_OPS(xo15_sci_pm, NULL, xo15_sci_resume);
>>>
>>>
>>
> 
> -- 
> Best regards,
> Coiby
> 

