Return-Path: <SRS0=7IVD=DP=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F268C4363A
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Oct 2020 14:20:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AD962184D
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Oct 2020 14:20:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MvaIXp1N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730353AbgJHOUI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Oct 2020 10:20:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45113 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730482AbgJHOUI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Oct 2020 10:20:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602166806;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=28gyQXNpF1DN/ygNYXtmZFhoYYiRhK+HkImKGmUzg8Q=;
        b=MvaIXp1NckNuMY7K5GIhmBjp8AJ8e4mq6WfBn3Ln7rXx/Bvlvrwol+EWnLQJC/ncfr1YdN
        ZLr6gwT16HQ/VSDPdCaDHNpJrZuSzkv9xig5YbtyZng1anSRgav7BNczWye0yebKBndrP4
        uHw0Fy8uq0de6/EyoQXdeC8ZRZcW2lU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-BSoaXGOYM7a4marZ-IK1og-1; Thu, 08 Oct 2020 10:20:05 -0400
X-MC-Unique: BSoaXGOYM7a4marZ-IK1og-1
Received: by mail-ed1-f71.google.com with SMTP id j6so2245425edl.21
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Oct 2020 07:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=28gyQXNpF1DN/ygNYXtmZFhoYYiRhK+HkImKGmUzg8Q=;
        b=Z1RHIDez8OORa45He2kk8A7Wn8QPwYLV3TA0j5TsNpzKtCm7YQ8s6XA1IAE6GclIsa
         c7QufLQAo3lSCv+9phh9MZBdczhhgbUkm80Bpb6Y5pAhsBtkk3ro0bAaDtQns0W6I5il
         SxP3nMcUUhRJxHHvaoQ/fPX9o6HC32Vbc1dq7RO6Jy0/g8C0OcglFq9R4Z7HqOlFIiXC
         lDPo5Y1/83Ul0Ga8e0wgzgkTtvktDkrXtQDx53RrsSW58PyyqsI1GW6rgU3an/mSLLhp
         xuBIftxlUFFp3GDORJRjBu8oZL7I1NCb/pzHBEgLtitej7RXfGp4XVUVe6da/whqMZFG
         xlYA==
X-Gm-Message-State: AOAM530zMVwt4p6S1xSyWDayoJ/AdMQ6cgGH89CjzthQKaPyZlpvgu/2
        KXCGci4RxCPu1cX7dAFHaOmeWshCBNUmaAWMf517e+5wA0y7THITheZ5Tv/FRkV2ZVuzsCWY9P5
        gUU3GYdSvTKMoZe1GPQj2Q9QgnHaiJl6QVg==
X-Received: by 2002:aa7:cd98:: with SMTP id x24mr9016822edv.237.1602166803853;
        Thu, 08 Oct 2020 07:20:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxzFAf6/LrvEIPJQafA407xL21ruZvhDdt9yl4HgGg5gpcaswQVQnwdH87ON/AX90hBn4Wtg==
X-Received: by 2002:aa7:cd98:: with SMTP id x24mr9016793edv.237.1602166803590;
        Thu, 08 Oct 2020 07:20:03 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id h12sm4043238eds.22.2020.10.08.07.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2020 07:20:02 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] platform/surface: Create a platform subdirectory
 for Microsoft Surface devices
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Mark Gross <mgross@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Gayatri Kammela <gayatri.kammela@intel.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        =?UTF-8?Q?Bla=c5=be_Hrastnik?= <blaz@mxxn.io>,
        Stephen Just <stephenjust@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>, linux-kernel@vger.kernel.org
References: <20201005160307.39201-1-luzmaximilian@gmail.com>
 <a82e3aff-801d-d116-bbf4-91f3981f713b@redhat.com>
 <deb1c682-5843-61b1-173b-a70ef51e85f2@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4b77d470-0a73-ae3d-1364-7f6e9a01885c@redhat.com>
Date:   Thu, 8 Oct 2020 16:20:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <deb1c682-5843-61b1-173b-a70ef51e85f2@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/8/20 2:32 PM, Maximilian Luz wrote:
> On 10/8/20 1:44 PM, Hans de Goede wrote:
>> Hi Maximilian,
>>
>> On 10/5/20 6:03 PM, Maximilian Luz wrote:
>>> As has come up in the discussion around
>>>
>>>    [RFC PATCH] Add support for Microsoft Surface System Aggregator Module
>>>
>>> it may make sense to add a Microsoft Surface specific platform
>>> subdirectory. Andy has suggested drivers/platform/surface for that.
>>> This series follows said suggestion and creates that subdirectory, as
>>> well as moves Microsoft Surface related drivers over to it and updates
>>> their MAINTAINERS entries (if available) accordingly.
>>>
>>> This series does not modify any existing driver code, symbols, or help
>>> text.
>>
>> In case you do not know I'm taking over from any as
>> drivers/platform/x86 maintainer.
>>
>> I'm fine with the concept of this series, but who is going to maintain
>> this new drivers/platform/surface directory ?
>>
>> Ah I see that the first patch answers that question and the plan
>> is to keep this part of the pdx86 maintainership.
>>
>> I would prefer for the new dir to have its own
>> MAINTAINERS entry if I'm honest, I would like to try and
>> split maintainership for the surface stuff as follows:
>>
>> 1. Who will review (and add their Reviewed-by or ask for improvements
>>     or nack) patches to files in this dir?
>>
>> 2. Who will gather approved patches apply them to a for-next branch
>>     and send them out to Linus during the merge Window?
>>
>> I can pick up 2. but I could really use some help with 1. So I
>> was thinking having a separate MAINTAINERS entry for the new
>> dir with you (Maximilian) (and me and Mark Gross) listed as
>> MAINTAINERS; and then I'm hoping that you can do the review
>> of surface related patches. At least those which you have not
>> written yourself.
>>
>> How does that sound ?
> 
> Sounds good, I'd be happy to help review and approve any Surface related
> patches. However, I think it would be beneficial if you and Mark still
> have a final look (and say) over the ones I've reviewed and accepted (if
> that's not already a given). I feel like I may lack a bit of experience
> for this job and might miss some things.

Since Mark or I will be merging the patches we will indeed still take
a look at them, but it helps if someone else has already done a review
first.

> I'll add the MAINTAINERS entry and send a v3 later today, if that's OK.

That sounds good, thanks.

Regards,

Hans

