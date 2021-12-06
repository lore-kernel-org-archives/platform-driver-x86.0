Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB08C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Dec 2021 20:55:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238324AbhLFU6z (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Dec 2021 15:58:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349885AbhLFU6y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Dec 2021 15:58:54 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39DDBC0613F8
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Dec 2021 12:55:25 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id t5so48213911edd.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Dec 2021 12:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=bbzSUur4D7201RHAgxaEsX82qtPrE1ccFJigzDf/zfY=;
        b=IMJgP/b/Q90thAkE+VR/6rcexvTnyrpUQXVSmjf+KlxE3WaVY5JQulJhsFLvAoen8x
         4ChtOmkpXLEAcXmEZuGPZIPdF+BI2LeTsB8vYDXsHjHQ/wlYSvRej5ChDLbD5QU65CB6
         dAXm5wKr9ovlhhUtFzRKC+1DGwLquuLaLWMUPQSiaVB5szGxj+BZVmNN2uaiDHDiyXdp
         KS3HlwBsoQQQJg61B5BjnoIOGEYCwgtUYXMhWRfaFbvkALEhWu++p9whd0hM/rpwH/Zm
         AvC5DURTk2v6FxVr7HKSwBHrJtt3EEFpCXsSKPR9gOKb4GnrhxSTK48oUaQOyhzn5ww1
         Oxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bbzSUur4D7201RHAgxaEsX82qtPrE1ccFJigzDf/zfY=;
        b=kt0nu8toznHXWrzZX7rNvzYwc7SVdrYb9aaYrpmvMMCLgStluIXQixaKXwhjpo0cbv
         IxWjzSn1TVzgkpNpKkdV+ilL9vAttB/F2zra9M5qBOxghQyLsf/hiUXwhshEb1pxD2Fi
         3Gb2cege57QX7dvyO8PzT2XD4xf9XyClXbqNW18FBkrB1BqREaIgkweN/6GFYAaeDHcX
         C5aO6W9FBu8+ig8GU4soggvK1OxgXx+LjyukUff1UqnlNbDUAC1e52Ak5tfZwluHS6vS
         ZqGgseHC64OvSBua5Ql9KUUXdSgH6yUT97RSlpGVHzGt8a4sX2cf4Bg56GVn4mb035so
         /yPw==
X-Gm-Message-State: AOAM53091cfAvE8GohBPcENkTiXtTeYKkrkXoe1NaHBqg0HGotnbkytp
        JmcVaYFpi4DtnGdc5HfzQBcUrA6+m74=
X-Google-Smtp-Source: ABdhPJyCDvnIyKc3LDGDWsCGcKWRbvvUToGYLW0RT8d+lFElsgTABO4KaAVbIo+feHsv8ynf7JN1pQ==
X-Received: by 2002:a17:906:86da:: with SMTP id j26mr45311821ejy.19.1638824123689;
        Mon, 06 Dec 2021 12:55:23 -0800 (PST)
Received: from ?IPV6:2001:981:6fec:1:4191:929:8d49:102e? ([2001:981:6fec:1:4191:929:8d49:102e])
        by smtp.gmail.com with ESMTPSA id b11sm8978358ede.62.2021.12.06.12.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 12:55:23 -0800 (PST)
Message-ID: <f6410b61-e7f4-9ef4-c005-3a38db5cfb71@gmail.com>
Date:   Mon, 6 Dec 2021 21:55:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: resource sanity check, mapping multiple BARs
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
References: <51b6676b-0000-ba23-0003-1b7e53158ef4@gmail.com>
 <fc3480f0-c537-6017-862e-109595b28d02@redhat.com>
From:   Ferry Toth <fntoth@gmail.com>
In-Reply-To: <fc3480f0-c537-6017-862e-109595b28d02@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Op 06-12-2021 om 15:21 schreef Hans de Goede:
> Hi Ferry,
> 
> On 12/5/21 23:02, Ferry Toth wrote:
>> Hi,
>>
>> Between v5.15 and v5.16-rc the following (unrelated?) errors are appearing in kernel.log:
>>
>> resource sanity check: requesting [mem 0xff200000-0xff3fffff], which spans more than 0000:00:0e.0 [mem 0xff298000-0xff29bfff]
>> caller devm_ioremap+0x45/0x80 mapping multiple BARs
>> pmd_set_huge: Cannot satisfy [mem 0x05e00000-0x06000000] with a huge-page mapping due to MTRR override.
>>
>> This is on Intel Edison (Merrifield), which has (from lspci):
>>
>> 00:0e.0 System peripheral: Intel Corporation Device 119b (rev 01)
>>      Flags: fast devsel, IRQ 25
>>      Memory at ff298000 (32-bit, non-prefetchable) [size=16K]
>>      Memory at ff2a2000 (32-bit, non-prefetchable) [size=4K]
>>      Capabilities: [b0] Power Management version 3
>>      Capabilities: [b8] Vendor Specific Information: Len=08 <?>
>>      Capabilities: [c0] PCI-X non-bridge device
>>      Capabilities: [100] Vendor Specific Information: ID=0000 Rev=0 Len=024 <?>
>>
>> Any suggestions on the cause of this would be welcome.
> 
> Not sure why you send this to the platform-driver-x86 list.
> 
> The platform-driver-x86 list is for things like ACPI/WMI drivers for vendor
> specific firmware APIs, think drivers like dell-laptop, dell-wmi and
> thinkpad_acpi.
> 
> It is probably best if you resend your email to the linux-pci@vger
> and the generic linux-kernel@vger lists.
> 
I misunderstood where this should go properly, sorry about that.

But thanks for the recommendation.

> Regards,
> 
> Hans
> 

