Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF7DC433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 11:49:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 768A164F27
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 11:49:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbhCDLtF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Mar 2021 06:49:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28690 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232266AbhCDLsm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Mar 2021 06:48:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614858436;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PaXwSwjCdHrW0dVqWe6n1Zv8hRNqIeGvaZMMt7ovvmg=;
        b=frfUrbv4MNpjOnnrmSu2j9t12VqiS3LmoRyXM9ZTfz4MuIytGYS4ngeLf+1MTfe4pLsECf
        xN0YkjlENv6+NfsuVr8tQPqabk6Pr5xyJjD5wnLbKhZT0UZDLSf7iXvEHrOcnIoNKoOlth
        sSXX8bS5SvxFnwzL0Tbi7Gu4kfs/9Fw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-OzEcqcbsMFa2mqg6jAfn1Q-1; Thu, 04 Mar 2021 06:47:15 -0500
X-MC-Unique: OzEcqcbsMFa2mqg6jAfn1Q-1
Received: by mail-ed1-f71.google.com with SMTP id q2so13870368edt.16
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Mar 2021 03:47:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PaXwSwjCdHrW0dVqWe6n1Zv8hRNqIeGvaZMMt7ovvmg=;
        b=i2mQ1ZaPBYyib0UacmqbzdlnNQb+bFTo27nbXugjhNR3RVEIByVjV3Be+Snnorhjcm
         pcQ0m4Ckb5Y4Q+vR2WQHfH4QcCtAsFZYUfSh2+I1g0BFzZS9M1+24T0DfjVd8bAl11w1
         soKHa3Qy/y0dJzsIiDNOS6rP0WZKMLfAc3XpGQBm6vaBu3R+DZitYMIiA9uJYbngscWk
         ZCsYG4NA3uR/2TksHIu/X//o6548qGTMco6Yv4uSYQGPJ6cZHwJahgf63R4wYrzs/lJW
         2HwbRIixdo0IWq8n++CNWDFad2oIeXX2JvoviKCD+8Thpm/2BL8TBDZfS9Mir8ZQFIaQ
         3wZw==
X-Gm-Message-State: AOAM530RU4JJMtgV7PAhWPwMJrlR6d0JhNWtx+ic8SlWA/m1DNr3KXVd
        alS6B5CTv1B/yA0gkI5H8xr0gR7ABQlptZQy+mHVcLlN1yqzgdV9MX8toW4xdtxCkpUToPZHlcw
        OmXzij1Gpduv5MPmgvodroGFmMl3zcvEQX9CH9jLhpSiMjf6FxkAcMxTkjf1dHWyYpAyT05J4Gd
        KQJ0NZuUGBxg==
X-Received: by 2002:aa7:c5c4:: with SMTP id h4mr3683151eds.375.1614858433610;
        Thu, 04 Mar 2021 03:47:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1u+UQhi8eATj0pDyHPCFiSGXjb3oVl6V6r05mx9FJT/LvAXQ6+ClCCX7Fk0TPmfcK7Kfu6Q==
X-Received: by 2002:aa7:c5c4:: with SMTP id h4mr3683134eds.375.1614858433416;
        Thu, 04 Mar 2021 03:47:13 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id cb1sm22181471ejb.69.2021.03.04.03.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 03:47:12 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: update MELLANOX HARDWARE PLATFORM SUPPORT
 maintainers
To:     mgross@linux.intel.com
Cc:     Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        platform-driver-x86@vger.kernel.org
References: <20210216152454.11878-1-hdegoede@redhat.com>
 <20210218161754.GN154917@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a4972bee-39a4-46c6-b4ec-9c0f389fc439@redhat.com>
Date:   Thu, 4 Mar 2021 12:47:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210218161754.GN154917@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/18/21 5:17 PM, mark gross wrote:
> On Tue, Feb 16, 2021 at 04:24:54PM +0100, Hans de Goede wrote:
>> The "MELLANOX HARDWARE PLATFORM SUPPORT" is maintained as part of the
>> pdx86 tree. But when Mark and I took over as new pdx86 maintainers the
>> "MELLANOX HARDWARE PLATFORM SUPPORT" MAINTAINERS entry was not updated.
>>
>> Update the entry now.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by : Mark Gross <mgross@linux.intel.com>

Thank you, I've applied this to my review-hans branch now.

Regards,

Hans


> 
>> ---
>>  MAINTAINERS | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 452f0f7b7c21..aa800d6829ae 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11367,8 +11367,8 @@ Q:	https://patchwork.kernel.org/project/netdevbpf/list/
>>  F:	drivers/net/ethernet/mellanox/mlxfw/
>>  
>>  MELLANOX HARDWARE PLATFORM SUPPORT
>> -M:	Andy Shevchenko <andy@infradead.org>
>> -M:	Darren Hart <dvhart@infradead.org>
>> +M:	Hans de Goede <hdegoede@redhat.com>
>> +M:	Mark Gross <mgross@linux.intel.com>
>>  M:	Vadim Pasternak <vadimp@nvidia.com>
>>  L:	platform-driver-x86@vger.kernel.org
>>  S:	Supported
>> -- 
>> 2.30.1
>>
> 

