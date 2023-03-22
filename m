Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D33C6FD1C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Mar 2023 14:25:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbjCVOZX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Mar 2023 10:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjCVOZW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2023 10:25:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2335D273E
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 07:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679495078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X0YgBxZCK3TKKEn5izOKf5PnBb3XSKNQIZxxERv+QSo=;
        b=jA+bHq2PqUfh6kkCvH+R6g99Nf4INV6s3ZpVIONjW1NTgq2BYAz1dXoQjPhJzNHOHjuGTA
        nyqgX8tYfnn9HfmGk6EqW+3S1IajFG2XV8EMixZJZMRksIhhZ1wbJX3OAOng5aMH5J8Smw
        FWZcjxzZ6ajzTAwFYffoA72clFnuvN8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-iitdSmtQNsmc6nrweFQQLg-1; Wed, 22 Mar 2023 10:24:36 -0400
X-MC-Unique: iitdSmtQNsmc6nrweFQQLg-1
Received: by mail-ed1-f70.google.com with SMTP id c11-20020a509f8b000000b00501e2facf47so6604279edf.16
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 07:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679495075;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X0YgBxZCK3TKKEn5izOKf5PnBb3XSKNQIZxxERv+QSo=;
        b=EXeIgJXnOYEjT2sVoneps1S8bWGYWUR32a1DwIRLcjqEgWJ3HEMUheaj7U0S70fmB3
         vs7ILKi8INy3uhGeHqIp9yO6O5JhfgQQ07LCRdr75yUg2AHJPohoTt8Pcr+TdWRP4svv
         Zb8rR7EJP8IxLbt/wWHqXC4+x873m7uDSeyuPrNQ90vuvKjqoegj54048m6PUc0q3Aro
         AeBWYIYpJHL42+vfd6S+H/5+kUy/61p5V2DS/uYuXP4NJJ1wcme3NRMVb8hFhHdyH2+X
         kTvb7oep+5qTChwZKutRJqY4YPXyY371QoGaAFa0Qc2aFpmSfPpinuo6UFJmRdDjl/Mr
         19uQ==
X-Gm-Message-State: AO0yUKXCQsvLEHwwwo3WKdtJSZq6WG7jECqMrX/XRwLUIT2BEIsNLR/o
        kXOxNFB6cD6M57DOblA3zCLCmxzTAqUQtAQND+ng6b/8W3uLNEqGvsYow2mv2A/2WLB+s1CLJRC
        rpvuPllgb9nAiK6/V6/veUdxm26vV1/t+Hw==
X-Received: by 2002:a17:906:646:b0:8a5:8620:575 with SMTP id t6-20020a170906064600b008a586200575mr7110697ejb.3.1679495075823;
        Wed, 22 Mar 2023 07:24:35 -0700 (PDT)
X-Google-Smtp-Source: AK7set/SB1ve6fWNoXZaagxeG14lg/EdGZCwqdfZCpyUdpRzlYoV89K92lV7Gw9DaHoFcBtXNP2fEA==
X-Received: by 2002:a17:906:646:b0:8a5:8620:575 with SMTP id t6-20020a170906064600b008a586200575mr7110678ejb.3.1679495075586;
        Wed, 22 Mar 2023 07:24:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e8-20020a170906c00800b008e1509dde19sm7209170ejz.205.2023.03.22.07.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 07:24:34 -0700 (PDT)
Message-ID: <14350685-1014-6db1-b459-8d0d590498c0@redhat.com>
Date:   Wed, 22 Mar 2023 15:24:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/surface: aggregator: Add missing
 fwnode_handle_put()
Content-Language: en-US, nl
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Liang He <windhl@126.com>, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20230322033057.1855741-1-windhl@126.com>
 <9c417628-f110-97e4-ff3e-4a835a0b0b27@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9c417628-f110-97e4-ff3e-4a835a0b0b27@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/22/23 13:41, Maximilian Luz wrote:
> On 3/22/23 04:30, Liang He wrote:
>> In fwnode_for_each_child_node(), we should add
>> fwnode_handle_put() when break out of the iteration
>> fwnode_for_each_child_node() as it will automatically
>> increase and decrease the refcounter.
>>
>> Fixes: fc622b3d36e6 ("platform/surface: Set up Surface Aggregator device registry")
>> Signed-off-by: Liang He <windhl@126.com>
>> ---
>>   drivers/platform/surface/aggregator/bus.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/surface/aggregator/bus.c b/drivers/platform/surface/aggregator/bus.c
>> index de539938896e..b501a79f2a08 100644
>> --- a/drivers/platform/surface/aggregator/bus.c
>> +++ b/drivers/platform/surface/aggregator/bus.c
>> @@ -485,8 +485,10 @@ int __ssam_register_clients(struct device *parent, struct ssam_controller *ctrl,
>>            * device, so ignore it and continue with the next one.
>>            */
>>           status = ssam_add_client_device(parent, ctrl, child);
>> -        if (status && status != -ENODEV)
>> +        if (status && status != -ENODEV) {
>> +            fwnode_handle_put(child);
>>               goto err;
>> +        }
>>       }
>>         return 0;
> 
> Thanks for spotting this.
> 
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>

Thank you both for the patch / review, I've applied
this patch to the pdx86/fixes branch now:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans

