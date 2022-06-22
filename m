Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E56DC43334
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Jun 2022 10:35:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245413AbiFVKfD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Jun 2022 06:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234868AbiFVKfC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jun 2022 06:35:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DAE51338B7
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 03:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655894100;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4Z5pMIlStsH9h51R4XW0kSPh6btd2q7pOqqzZrnGVV8=;
        b=g6bu7HjI0jYt7WjLoqL6XqOVqEWJ5WLHdUxveVjPxBuDoNrSZzMN8BOn6omVGb0uz4qMHi
        PpTwoMpl4VAjJlBvMuYgh722jPfZ8N8Fq6E2B7hRnpgPPzpMa9CxFM/gIR2B2O6Vm4jmXO
        fexuW7Gi19e0abQJFGcs+kp1g1PCcuw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-atGetansMQOeXF255YfDEQ-1; Wed, 22 Jun 2022 06:34:59 -0400
X-MC-Unique: atGetansMQOeXF255YfDEQ-1
Received: by mail-ej1-f70.google.com with SMTP id p10-20020a170906b20a00b0070c21a6d378so6125465ejz.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 03:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4Z5pMIlStsH9h51R4XW0kSPh6btd2q7pOqqzZrnGVV8=;
        b=s1/fh9dfukoE7GZL1dBW3xM64bOgib8dvXcMP66/OvKGkvlgsvxTyTddI084yfXZg1
         UKakyJFO7l+O9Qv3nhhcJ6VXpb2tDfhcvUzj5XbtilEls08Rn3pygPcB37FrxsUV8QKy
         5nZ/3L5nH8k2MvDXAVnKOmvTwTCPK3wfiptpdKhFdSsYeOo4Q8DSDU7UM3Z8plxPJiSq
         r2PmLm6hEysHTd1KpvGG1GWPzrcqPZRM8zq29ebahHyQ7NU10d3gbIGL3r5T/2i+MaFZ
         Olamg3Zqb8XZgpakToeFiGq0qTYtzcIl1KbYwAjUX/3oqxFMUuhV0zsAk9nQxRVfrOUQ
         VUaw==
X-Gm-Message-State: AJIora/sQVyAPwp0NQpi5MVFc2sXMvUnJVwAOBM3eAQ2ggLETCAhiMS9
        9K3o/Jly+61lgNeu9xyXo5BjXdv72LirDNlDnO1HUO+ropVPq5oMXE6MmW2W5R3YIczsugLCb1B
        wRpuiaygZyyfd79FYXpiotKI9hXjIagJ1xQ==
X-Received: by 2002:a50:9f6a:0:b0:435:5804:e07 with SMTP id b97-20020a509f6a000000b0043558040e07mr3388540edf.178.1655894098052;
        Wed, 22 Jun 2022 03:34:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vn5c9XlLGjWGgbEnWGRSovzn7seJibCUxi9KbrAiruSoq1S7v0/creZDCjUbcwScHWaZBVbw==
X-Received: by 2002:a50:9f6a:0:b0:435:5804:e07 with SMTP id b97-20020a509f6a000000b0043558040e07mr3388518edf.178.1655894097808;
        Wed, 22 Jun 2022 03:34:57 -0700 (PDT)
Received: from [192.168.43.127] ([109.37.135.195])
        by smtp.gmail.com with ESMTPSA id v18-20020a170906293200b006fece722508sm8718417ejd.135.2022.06.22.03.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 03:34:57 -0700 (PDT)
Message-ID: <00f264cf-3d79-63e3-e74f-1ee331d7e1f2@redhat.com>
Date:   Wed, 22 Jun 2022 12:34:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 2/3] platform/x86: Kconfig: Remove unnecessary "if X86"
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20220620145628.5882-1-hdegoede@redhat.com>
 <20220620145628.5882-2-hdegoede@redhat.com>
 <CAHp75VdgrUFTgzT6jYo4ff+JEbvBncZKbx0317FduZzGcida4A@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdgrUFTgzT6jYo4ff+JEbvBncZKbx0317FduZzGcida4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/20/22 17:00, Andy Shevchenko wrote:
> On Mon, Jun 20, 2022 at 4:56 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> drivers/platform/x86/Kconfig is wrapped in one big
>> if X86_PLATFORM_DEVICES .. endif and X86_PLATFORM_DEVICES already
>> has a "depends on X86" so the "if X86" in drivers/platform/Kconfig
>> is not necessary and except for mips non of the other includes
> 
> MIPS
> none ?
> 
>> there has such an if. So lets remove it.
> 
> 
> let's

Both fixed up.

>> While at it also move the x86/Kconfig include to the end of the file
>> for alphabetical sorting.
> 
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thanks, I've pushed this series to my review-hans branch now.

Regards,

Hans


> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2:
>> - Drop "if X86" from drivers/platform/Kconfig instead of dropping the
>>   "depends on X86" from X86_PLATFORM_DEVICES
>> ---
>>  drivers/platform/Kconfig | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
>> index 18fc6a08569e..b437847b6237 100644
>> --- a/drivers/platform/Kconfig
>> +++ b/drivers/platform/Kconfig
>> @@ -1,7 +1,4 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>> -if X86
>> -source "drivers/platform/x86/Kconfig"
>> -endif
>>  if MIPS
>>  source "drivers/platform/mips/Kconfig"
>>  endif
>> @@ -15,3 +12,5 @@ source "drivers/platform/mellanox/Kconfig"
>>  source "drivers/platform/olpc/Kconfig"
>>
>>  source "drivers/platform/surface/Kconfig"
>> +
>> +source "drivers/platform/x86/Kconfig"
>> --
>> 2.36.0
>>
> 
> 

