Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F48FC7618D
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 Apr 2023 12:25:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbjDFMZc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 6 Apr 2023 08:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjDFMZb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Apr 2023 08:25:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68216EB7
        for <platform-driver-x86@vger.kernel.org>; Thu,  6 Apr 2023 05:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680783885;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rFvyBfjox5+bnK9Lfvx24U6ipTJX9Aj5tgTTMumZlZI=;
        b=DOMVzEYuU6kBcCFOpCGimHdltIwsbJJrzici8TFnQeMengR58DQ9rU6TaA4hjrzdrbUu0m
        pnuykMESGG/DlwVzjM1Ef5jTuTxPFfgMGebbuvjmrRTnul0IzE2lcIUlYAy6lhEbj9xFlR
        15IwLrsDX1eFMejp021KLOELhtOuUjg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-ZsuPIaO7OzGvOaBDzlJzZg-1; Thu, 06 Apr 2023 08:24:43 -0400
X-MC-Unique: ZsuPIaO7OzGvOaBDzlJzZg-1
Received: by mail-ed1-f71.google.com with SMTP id c1-20020a0564021f8100b004acbe232c03so51873184edc.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Apr 2023 05:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680783882; x=1683375882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rFvyBfjox5+bnK9Lfvx24U6ipTJX9Aj5tgTTMumZlZI=;
        b=nNxWPws5YuqYh9gQp/kBNzUNvQHWyeQNTu8gIR1mnCBIby13VwN+YqeVQZpFOtYwvx
         q+s1Jm4P4eXmVpf9tZ7Q0P+yRJydbDAIWKcFqTWSgLyGlmaja/QUPvHt7ZKbtLkZaChb
         Jb2wDomMZrebue8/A8vHW38l+yYQ0jRU7L8znGZNedaf/cb/vMw0TUcoTI11J3BxMloJ
         PRiqEPRozDKVtw/HS0zTyB/lyujKQvyynRb0Hj2hs3Xl42giWaAfuBH3M43h8hso31h9
         auR3hh/NWR/zBtiG3V/dItRY2vjbvCT/s8L/ASXcJl+aN5waU/G6/yTBI5ZuTHUQcT9K
         +IFQ==
X-Gm-Message-State: AAQBX9cm5lEmQ838RLhgmXvR1ZF8XD1IU2siUU0UDhWtizldrFTLXzBv
        7YjokfFVzAQu6XtTxbCgxZ4kKpeBaYeXUs9ZAnefBybuBecS3uRdKvmUSENClRVLYu0K84GA3m9
        oyJ3jU+WuSACydHJLmYN0f0pRnp+VROvGBA==
X-Received: by 2002:a17:906:578c:b0:933:4ca3:9678 with SMTP id k12-20020a170906578c00b009334ca39678mr6719432ejq.24.1680783882750;
        Thu, 06 Apr 2023 05:24:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350YrmYaqZaPySuMDfCkpE506z6r67KskIJURtFjr0t/lwdaV8xGGp2dOTddcA2QUZTvC/Wuhkg==
X-Received: by 2002:a17:906:578c:b0:933:4ca3:9678 with SMTP id k12-20020a170906578c00b009334ca39678mr6719411ejq.24.1680783882444;
        Thu, 06 Apr 2023 05:24:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n20-20020a170906725400b0093295ea18c4sm758092ejk.67.2023.04.06.05.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 05:24:41 -0700 (PDT)
Message-ID: <d00e0574-63be-9fa5-6978-f34407e93502@redhat.com>
Date:   Thu, 6 Apr 2023 14:24:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: apple-gmux: Fix iomem_base __iomem
 annotation
Content-Language: en-US, nl
To:     Orlando Chamberlain <orlandoch.dev@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
References: <20230404111955.43266-1-hdegoede@redhat.com>
 <59222D5C-C810-4F17-AE0B-A65CA03889EF@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <59222D5C-C810-4F17-AE0B-A65CA03889EF@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/4/23 13:47, Orlando Chamberlain wrote:
> Thanks for fixing this up, Hans.
> 
> Reviewed-by: Orlando Chamberlain <orlandoch.dev@gmail.com>

Thanks.

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans



>> On 4 Apr 2023, at 9:20 pm, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> ﻿Fix the __iomem annotation of the iomem_base pointers in the apple-gmux
>> code. The __iomem should go before the *.
>>
>> This fixes a bunch of sparse warnings like this one:
>>
>> drivers/platform/x86/apple-gmux.c:224:48: sparse:
>> expected void const [noderef] __iomem *
>> got unsigned char [usertype] *
>>
>> Fixes: 0c18184de990 ("platform/x86: apple-gmux: support MMIO gmux on T2 Macs")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Link: https://lore.kernel.org/oe-kbuild-all/202304040401.IMxt7Ubi-lkp@intel.com/
>> Suggested-by: Dan Carpenter <error27@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> drivers/platform/x86/apple-gmux.c | 2 +-
>> include/linux/apple-gmux.h        | 2 +-
>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
>> index 4c311e1dedad..e02b4aea4f1e 100644
>> --- a/drivers/platform/x86/apple-gmux.c
>> +++ b/drivers/platform/x86/apple-gmux.c
>> @@ -57,7 +57,7 @@
>> struct apple_gmux_config;
>>
>> struct apple_gmux_data {
>> -    u8 *__iomem iomem_base;
>> +    u8 __iomem *iomem_base;
>>    unsigned long iostart;
>>    unsigned long iolen;
>>    const struct apple_gmux_config *config;
>> diff --git a/include/linux/apple-gmux.h b/include/linux/apple-gmux.h
>> index a7a7d430024b..206d97ffda79 100644
>> --- a/include/linux/apple-gmux.h
>> +++ b/include/linux/apple-gmux.h
>> @@ -66,7 +66,7 @@ static inline bool apple_gmux_is_indexed(unsigned long iostart)
>>
>> static inline bool apple_gmux_is_mmio(unsigned long iostart)
>> {
>> -    u8 *__iomem iomem_base = ioremap(iostart, 16);
>> +    u8 __iomem *iomem_base = ioremap(iostart, 16);
>>    u8 val;
>>
>>    if (!iomem_base)
>> -- 
>> 2.39.1
>>
> 

