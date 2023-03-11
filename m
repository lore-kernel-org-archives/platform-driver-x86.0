Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA00C6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Sat, 11 Mar 2023 14:17:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbjCKOR0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 11 Mar 2023 09:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbjCKORU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Mar 2023 09:17:20 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A871F2C34
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Mar 2023 06:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678544198;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1iG+fjnzXNUUAw3R/ZarZG33QxnXVTiItT/wxoL/grM=;
        b=A98twABi+bO1aNGhTxvQr26WgYbN52LPiOGuAFKpGtg4XVEytmXs1eGDnsBBcl/95RuSuS
        k4smtUEv1Rl2OnDO2+1cv0k5nzwQnt24eRvm0txBDs+EjJdLxft9cO6s/q1n2GGSdte4Ld
        41B4gNECXZqFkKIfaM1qnbaiRlIYx0s=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-OI6cc0NwMTSwg61nl0i5Ag-1; Sat, 11 Mar 2023 09:16:37 -0500
X-MC-Unique: OI6cc0NwMTSwg61nl0i5Ag-1
Received: by mail-qt1-f197.google.com with SMTP id k13-20020ac8074d000000b003bfd04a3cbcso4503352qth.16
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Mar 2023 06:16:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678544196;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1iG+fjnzXNUUAw3R/ZarZG33QxnXVTiItT/wxoL/grM=;
        b=4NZ6Hx0qTrWIo5HSpHBkLZn+xkVYfPv1Nxpw8wH8v4ZE9k9Q36Xfo1CPUzNqatFSfN
         hjwtSk9uYNOxoP3Tt++S1TvjHC4hGezUeMcG4To5yGgtRn3v7FJ/48H0WB+wPOTz6Fve
         +bFQwbPMxbEW9622kpBFmTLhsjPAw7xDU+QftiBvie/sPrKAD+kqOw96jRUq0IoQ3xsa
         q76hmuY0CtrdPGv+6prC6UU50OYTl973zeK8LtBbx3IoSqOc075cYb38c41xSRSe6cUe
         xKN/W9qSzAYOJ3bdKLiPITLVDHabFqweVyJQKW/TR1OwWzjDsDLrVULSxvhQ4rdIGp+C
         eJKA==
X-Gm-Message-State: AO0yUKXPZxFs2fTKFwTI5WImwqVEzMv5ZC346lSgW2slfFo9DK8RO9Eg
        750jad0s2j+U3iSfGDyHV/UUj/pweWu1fG1JJKTRdPJb1CEl0jfJPSU6Pe/BIG6YMHlQLV3cpTJ
        j8psurF6N0aJ4662OKCb+m3Y/5dT4+Bjtak0q9gvB2w==
X-Received: by 2002:a05:622a:134a:b0:3c0:3f60:de2e with SMTP id w10-20020a05622a134a00b003c03f60de2emr26168136qtk.16.1678544196368;
        Sat, 11 Mar 2023 06:16:36 -0800 (PST)
X-Google-Smtp-Source: AK7set+Uacq/yCB6vygqoe7xjYr4ZM97FA4S13Brk0Ob44yDZmTcRVeFTIuBL8ns3HyWTiiSsAxBPQ==
X-Received: by 2002:a05:622a:134a:b0:3c0:3f60:de2e with SMTP id w10-20020a05622a134a00b003c03f60de2emr26168114qtk.16.1678544196129;
        Sat, 11 Mar 2023 06:16:36 -0800 (PST)
Received: from [192.168.1.19] (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id dt37-20020a05620a47a500b007343fceee5fsm1915114qkb.8.2023.03.11.06.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 06:16:35 -0800 (PST)
Subject: Re: [PATCH] platform/x86: x86-android-tablets: select PMIC_OPREGION
 to resolve a link error of intel_soc_pmic_exec_mipi_pmic_seq_element
To:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230310192915.2700069-1-trix@redhat.com>
 <e3c00116-5283-8c76-7414-66f36fb575fa@redhat.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <b8fa13a6-5fd7-13e6-812f-2e31b64b1eaf@redhat.com>
Date:   Sat, 11 Mar 2023 06:16:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e3c00116-5283-8c76-7414-66f36fb575fa@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 3/11/23 3:12 AM, Hans de Goede wrote:
> Hi,
>
> On 3/10/23 20:29, Tom Rix wrote:
>> A rand config causes this link error
>> drivers/platform/x86/x86-android-tablets/lenovo.o: In function `lenovo_yt3_init':
>> lenovo.c:(.init.text+0x6c): undefined reference to `intel_soc_pmic_exec_mipi_pmic_seq_element'
>>
>> The rand config has
>> CONFIG_X86_ANDROID_TABLETS=y
>> CONFIG_PMIC_OPREGION=n
>>
>> PMIC_OPREGION should be selected to build the
>> intel_soc_pmic_exec_mipi_pmic_seq_element symbol.
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
> Thanks, but this is a dup with:
>
> https://patchwork.kernel.org/project/platform-driver-x86/patch/20230309094035.18736-1-hdegoede@redhat.com/
>
> I just did not get around to pushing that out to pdx86/for-next yet.
> I have just pushed this to pdx86/for-next to avoid further duplicate fixes.
>
> FWIW, since all other users of PMIC_OPREGION use depends on, not select this
> should have been a depends on too. Unless Kconfig symbols are explicitly
> intended to be selected (typically these are hidden Kconfig symbols (1))
> then you should usually use depends on. Mixing depends on and select leads
> to Kconfig circular dependencies errors.

Ok, thanks for the pointer.

Tom

>
> Regards,
>
> Hans
>
>
> 1) A hidden Kconfig symbol is one which is e.g. just 'bool' not
> 'bool "Description of feature here"' these typically are libraries /
>
> helpers.
>
>
>
>
>> ---
>>   drivers/platform/x86/x86-android-tablets/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/x86/x86-android-tablets/Kconfig b/drivers/platform/x86/x86-android-tablets/Kconfig
>> index 2b3daca5380b..65980229d783 100644
>> --- a/drivers/platform/x86/x86-android-tablets/Kconfig
>> +++ b/drivers/platform/x86/x86-android-tablets/Kconfig
>> @@ -6,6 +6,7 @@
>>   config X86_ANDROID_TABLETS
>>   	tristate "X86 Android tablet support"
>>   	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB
>> +	select PMIC_OPREGION
>>   	help
>>   	  X86 tablets which ship with Android as (part of) the factory image
>>   	  typically have various problems with their DSDTs. The factory kernels

