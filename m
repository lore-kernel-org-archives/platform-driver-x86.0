Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FCCC001B0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Aug 2023 20:18:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233985AbjHIUSO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Aug 2023 16:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjHIUSO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Aug 2023 16:18:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05CF110CF
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Aug 2023 13:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691612244;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Lr3GiLnlAC+xPvWF1RfzTjSqSRLJdfFt+hjS6z6XxhQ=;
        b=g2jDInvsQF48H0mtx129DXDqf6QsTDzs5Fq2dtyT6iYllOo8YhUnhdfU6F080l9OJUf+i1
        U41C1XEHjCQpBw0kkDkOgDDenytscHKBrChemZpuohrE8MLlcD6Qwm2d05GRJBMBgCxiYE
        82W7R8mYQTB7JX5ahRkuhbnjYIxarMs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-jq1KIcedOaOWbveGyYEpXA-1; Wed, 09 Aug 2023 16:17:22 -0400
X-MC-Unique: jq1KIcedOaOWbveGyYEpXA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-51d981149b5so77408a12.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Aug 2023 13:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691612241; x=1692217041;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lr3GiLnlAC+xPvWF1RfzTjSqSRLJdfFt+hjS6z6XxhQ=;
        b=Va4Yhla3+UarXiGZdMEL5BKzQ373/o6kJ4OobRdb/N8Z+t4vRe9rb+jFEvTPfd+kda
         HFQsMqLo2XhCJ+hVQwp7RHXjFMohyKsiGAvLFpGAUfv/ohFmHsd0uQ5YK2p/K5YyWvcS
         iKXGw7umQ1+1FtV9FN5g7uYYGgez1WDpf3OWq0/2OeZF19e0Bg3XO5udTD9oJt/Pmbsh
         xxYSZ1f+H0zF8CeIxbfLyNpKwG6/RDEajie0JEd/Lc6o0vukRyR9pNrmfoJMpUVMaxvW
         G/cTs5djnlO1yGkgliTzP/mcVS+UhyvayVK7Gwsv9r62n20+MVnnHyaNyGF1a5arZi7P
         Di7g==
X-Gm-Message-State: AOJu0YxQJ4GJInoLL9vL6cOpJEn7B2oyrdzc7kqnHL8KjfAAtoTrAFOw
        dof71XM6H4vU7EsmzGUbFPqe37XZvoNaztgbeNuswoM9EOldyox7s1lECmmDeK8uhwl5SagSB43
        PeX7rYly7km37ZDfYDb/nla2w1qbMvjAqEK0Z0kgZ6w==
X-Received: by 2002:a17:906:53ce:b0:961:be96:b0e7 with SMTP id p14-20020a17090653ce00b00961be96b0e7mr124306ejo.48.1691612240923;
        Wed, 09 Aug 2023 13:17:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi5enSz4+7S/hdQqf9nmKqDtHv6YXKZqfYN2DZXgla89kZwO8xisyoFdrMIKjbkQdREkPNBw==
X-Received: by 2002:a17:906:53ce:b0:961:be96:b0e7 with SMTP id p14-20020a17090653ce00b00961be96b0e7mr124298ejo.48.1691612240731;
        Wed, 09 Aug 2023 13:17:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c8-20020a170906170800b009930308425csm8439596eje.31.2023.08.09.13.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 13:17:20 -0700 (PDT)
Message-ID: <e908e683-1297-1d7c-5c36-d55e0342c807@redhat.com>
Date:   Wed, 9 Aug 2023 22:17:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [GIT PULL v2]: tools/power/x86/intel-speed-select pull request
 for 6.6-rc1
Content-Language: en-US, nl
To:     srinivas pandruvada <srinivas.pandruvada@linux.intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
Cc:     "frank.ramsay@hpe.com" <frank.ramsay@hpe.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <9994927f661f93289b9c4c78c7346cea93c8869a.camel@intel.com>
 <c32cebce5e394f155cf4ab9a678f530fb2cda3d6.camel@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c32cebce5e394f155cf4ab9a678f530fb2cda3d6.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/9/23 18:05, srinivas pandruvada wrote:
> Hi Hans,
> 
> Sorry, I have to update to fix a bugzilla issue from RedHat compared to
> previous pull for memory frequency display.
> 
> Pull request for Intel Speed Select version v1.17:
> Summary of changes:
> - Fix display issue for cpu count for power domain != 0
> - Increase sockect count
> - Preventing CPU 0 offline for kernel version 6.5 and later
> - Error when number of CPUs requested more than 256 in one request
> 
> The base branch for these changes 
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> branch: review-hans
> 
> The following changes since commit
> 6f8972a02a6c103b67dc3a0ed9b1722943f65276:
> 
>   platform/x86: hp-bioscfg: Use kmemdup() to replace kmalloc + memcpy
> (2023-08-07 13:36:20 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> 2fff509adceb10f991b259c02ef2e096a89f075e:

Thank you, I've merged this into my review-hans branch now.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans






>   tools/power/x86/intel-speed-select: v1.17 release (2023-08-09
> 08:57:58 -0700)
> 
> ----------------------------------------------------------------
> Frank Ramsay (1):
>       tools/power/x86/intel-speed-select: Support more than 8 sockets.
> 
> Srinivas Pandruvada (5):
>       tools/power/x86/intel-speed-select: Fix CPU count display
>       tools/power/x86/intel-speed-select: Error on CPU count exceed in
> request
>       tools/power/x86/intel-speed-select: Prevent CPU 0 offline
>       tools/power/x86/intel-speed-select: Change mem-frequency display
> name
>       tools/power/x86/intel-speed-select: v1.17 release
> 
>  tools/power/x86/intel-speed-select/isst-config.c  | 51
> +++++++++++++++++++++++++++++++++++++++++++++++++--
>  tools/power/x86/intel-speed-select/isst-display.c |  2 +-
>  tools/power/x86/intel-speed-select/isst.h         |  2 +-
>  3 files changed, 51 insertions(+), 4 deletions(-)
> 
> Thanks,
> Srinivas
> 
> On Tue, 2023-08-08 at 22:26 +0000, Pandruvada, Srinivas wrote:
>> Hi Hans,
>>
>> Pull request for Intel Speed Select version v1.17:
>> Summary of changes:
>> - Fix display issue for cpu count for power domain != 0
>> - Increase sockect count
>> - Preventing CPU 0 offline for kernel version 6.5 and later
>> - Error when number of CPUs requested more than 256 in one request
>>
>> The base branch for these changes 
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
>> branch: review-hans
>>
>> The following changes since commit
>> 6f8972a02a6c103b67dc3a0ed9b1722943f65276:
>>
>>   platform/x86: hp-bioscfg: Use kmemdup() to replace kmalloc + memcpy
>> (2023-08-07 13:36:20 +0200)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/spandruvada/linux-kernel.git intel-sst
>>
>> for you to fetch changes up to
>> 5abc392b38a1716d194c904c0f4f5aa201b0c0dd:
>>
>>   tools/power/x86/intel-speed-select: v1.17 release (2023-08-08
>> 15:16:40 -0700)
>>
>> ----------------------------------------------------------------
>> Frank Ramsay (1):
>>       tools/power/x86/intel-speed-select: Support more than 8
>> sockets.
>>
>> Srinivas Pandruvada (4):
>>       tools/power/x86/intel-speed-select: Fix CPU count display
>>       tools/power/x86/intel-speed-select: Error on CPU count exceed
>> in
>> request
>>       tools/power/x86/intel-speed-select: Prevent CPU 0 offline
>>       tools/power/x86/intel-speed-select: v1.17 release
>>
>>  tools/power/x86/intel-speed-select/isst-config.c | 51
>> +++++++++++++++++++++++++++++++++++++++++++++++++--
>>  tools/power/x86/intel-speed-select/isst.h        |  2 +-
>>  2 files changed, 50 insertions(+), 3 deletions(-)
>>
>> Thanks,
>> Srinivas
> 

