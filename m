Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F3AC00144
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 13:39:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231714AbiHANjC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 09:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbiHANjC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 09:39:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F13A83DBE9
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 06:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659361139;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Bxk5IP3/94tP9SFYyYIcCMGXNDnNDMS3Kt0vZ8Pz3Y8=;
        b=eyWMdxyYb8h5q+rDb5aTXOohyeWP2NE9ZgfUZuEJFjS8JG4jtnt42QpIelzLWBNMcus4ft
        dqtGBQJg88le7k5dOTHHQJsHkXB2lTPhD+xN7n7wTOc6wGh52kEzqEzXusCxpP3Y9mITJF
        4prtrcFLXzWyaKd9gEFQcynHa0qLVpo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-KFrq_XT5Pbebm-UjBsa3sg-1; Mon, 01 Aug 2022 09:38:58 -0400
X-MC-Unique: KFrq_XT5Pbebm-UjBsa3sg-1
Received: by mail-ed1-f72.google.com with SMTP id e6-20020a056402190600b0043bde36ab23so7230401edz.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Aug 2022 06:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Bxk5IP3/94tP9SFYyYIcCMGXNDnNDMS3Kt0vZ8Pz3Y8=;
        b=I1mkHtTvJEwbtzc8VKjrV6nRfG0bdfrUlQFY7Zl5r6W7JnCVhrTzjiQPyVSoKBjf+k
         0U1/fVGJ+3P+rdaLuwt6NuTmZbZ9W7OoqhGWlvwWzM+V8kfDFkQe+vz2oHd6ADGyzKPY
         0ngZQFR6k3yxEn2W2uK5BY1RvhHS3ReANFSZpFTHG0emhktdiMiUzVOEjTKyvZwueb8s
         JN1RU0qmerp/fWDsgOyZsACd8fI8laH+mPQuM9wcC3F928GjuYdbiUlRUptN0LsUL5xL
         MlpzujNMerpdr0RuSQ/E6UjgywzYowUVtw6x7mf858Wnmnu0vBBpsBtoQZ/PPA6wTmMC
         46Wg==
X-Gm-Message-State: AJIora8MSwj4EJqkmEECUbjePodij7nFHjeFqG/GS+FSp7qaOHXYJKCP
        KvyL434yEiOOwGa2HNUD7iAW5/Ns0nmV1Qsnie2iaY1wRnm1AG8BZvAfFsGQwn3L5ZnZGpTNdjI
        WkGOcd2QH0kPpz9IxA45UqyslPHpCzfKSLA==
X-Received: by 2002:a05:6402:2b88:b0:43a:6c58:6c64 with SMTP id fj8-20020a0564022b8800b0043a6c586c64mr16323575edb.348.1659361136876;
        Mon, 01 Aug 2022 06:38:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v5tg3PmSvHtnuiETSeF7KYKv7HUrAenheOhgZM5ZhMqK+FDb6jAJnez8c6YUXxRU77PS17iA==
X-Received: by 2002:a05:6402:2b88:b0:43a:6c58:6c64 with SMTP id fj8-20020a0564022b8800b0043a6c586c64mr16323550edb.348.1659361136684;
        Mon, 01 Aug 2022 06:38:56 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id kv22-20020a17090778d600b007307e7df83bsm1480827ejc.21.2022.08.01.06.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 06:38:55 -0700 (PDT)
Message-ID: <20f78e0f-cbf5-2672-7c27-e366f5d7be5f@redhat.com>
Date:   Mon, 1 Aug 2022 15:38:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/1] platform/x86: p2sb: Move out of
 X86_PLATFORM_DEVICES dependency
Content-Language: en-US
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee@kernel.org>
References: <20220718145328.14374-1-andriy.shevchenko@linux.intel.com>
 <2b1b4cd1-faec-85a1-5ad2-e2b29290e0c1@redhat.com>
 <YufTmwg/A94XjrQ8@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YufTmwg/A94XjrQ8@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/1/22 15:22, Lee Jones wrote:
> On Thu, 28 Jul 2022, Hans de Goede wrote:
> 
>> Hi,
>>
>> On 7/18/22 16:53, Andy Shevchenko wrote:
>>> The P2SB library is used for various drivers, including server
>>> platforms. That's why the dependency on X86_PLATFORM_DEVICES
>>> seems superfluous.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>> v2: added X86 to the dependencies of P2SB (Hans), added Rb tag (Hans)
>>
>> Lee I presume that since you've merged the original series
>> (in your ib-mfd-edac-i2c-leds-pinctrl-platform-watchdog-5.20
>> branch) that you will take this fix on top ?
> 
> The point of supplying an immutable branch is that whoever maintains
> this subsystem can pull from it and apply this patch on-top.

True, ok I'll merge the branch and add Andy's fix on top.

Regards,

Hans


> 
>> This fix is necessary to fix a bunch of randconfig build
>> failures in the current linux-next.
>>
>>>  drivers/platform/x86/Kconfig            | 12 ++++++++++++
>>>  drivers/platform/x86/Makefile           |  4 ++++
>>>  drivers/platform/x86/intel/Kconfig      | 12 ------------
>>>  drivers/platform/x86/intel/Makefile     |  2 --
>>>  drivers/platform/x86/{intel => }/p2sb.c |  0
>>>  5 files changed, 16 insertions(+), 14 deletions(-)
>>>  rename drivers/platform/x86/{intel => }/p2sb.c (100%)
> 

