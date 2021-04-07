Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E161AC43461
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 12:34:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFE71611EE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 12:34:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbhDGMed (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 08:34:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43950 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231347AbhDGMec (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 08:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617798862;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k+2I3Adi2bMq4cYv5k46EXXoYkeGnU8fAi36NDN6c9g=;
        b=PoiuFIbnHslfBiN8eTeh5XGWXTEJ3EbDVik68dHWU0hkDyqLAaZdkZV8e7sBJq7+ZPFcwo
        UEPZyx+TQPXrJhl4LkpvC+53KUv5ksyyzi0VtUcXpJqgsQod5EDRIiNTMMhPBTKH0YY15N
        ptaAnDkTnseMsKt5GkwQo+qeaYILW9k=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-1mGW34S4ND-dfm7ZzwLQjQ-1; Wed, 07 Apr 2021 08:34:21 -0400
X-MC-Unique: 1mGW34S4ND-dfm7ZzwLQjQ-1
Received: by mail-ej1-f71.google.com with SMTP id jt26so1032819ejc.18
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 05:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k+2I3Adi2bMq4cYv5k46EXXoYkeGnU8fAi36NDN6c9g=;
        b=mphliEy0kktL+MB72gq1KkrS5gTCLhpFgLw3IkzwhWpGzh/sut9A1VUZ9QpVTys0cZ
         PovnFyzn1dX3NwZVYbz8JfnqpTvA/9/qOrnNwx9d1miqpeLKTTMJ/hqn61pNhu9BainY
         4NbTA3ChrDDyDVd8+F4YtDXq/cbkmA0VbHM2O5tVOBCmdh60W/EBbo36rGkMVHcRJylA
         lAEyjSpry1TDa18/u7AhQ8nQ9NAjP6TL/G2JJGI8zwAzHUzmYuS8c2VRe3nKklUM1zh4
         enbayM5QwZdoJyCsGW9TbVN1LPSfUpNVS7+B3dv7d4WWlaS4oqMc87TQvWUI+MTEicg2
         XrRw==
X-Gm-Message-State: AOAM5334E6nsLLvJvnTauY3L0Rf1uGBXI9tfUrW/Efp8MA36LPNn/Mqf
        Uj87PH7xI0VuoFCJBt7fTtguw4kpmOlgpajJ/pLAG9L6zieoLqK9tBybVX1Uk2pNZr2zkMiSQrA
        BAtGlSe1+yRKGZhoNZMa1cWVVIXq3th3+de+hgVDM/0QEMjevIw49Vz3qrK1VKTWAo8dzSUdsyX
        7xQ/eN/ID7qw==
X-Received: by 2002:aa7:cc15:: with SMTP id q21mr4265768edt.140.1617798859832;
        Wed, 07 Apr 2021 05:34:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfYnMETtl4V0HkpsVrRifd9fs7Ue8IafDyvFcXWv+6eREXWHi/3kR83tSDQy0GJ4nZdXcWuA==
X-Received: by 2002:aa7:cc15:: with SMTP id q21mr4265750edt.140.1617798859647;
        Wed, 07 Apr 2021 05:34:19 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id w1sm7700510edt.89.2021.04.07.05.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 05:34:19 -0700 (PDT)
Subject: Re: [PATCH] platform/surface: aggregator: move to use request_irq by
 IRQF_NO_AUTOEN flag
To:     "tiantao (H)" <tiantao6@huawei.com>,
        Tian Tao <tiantao6@hisilicon.com>, luzmaximilian@gmail.com,
        mgross@linux.intel.com, Thomas Gleixner <tglx@linutronix.de>
Cc:     platform-driver-x86@vger.kernel.org
References: <1617778852-26492-1-git-send-email-tiantao6@hisilicon.com>
 <ddaed29b-f788-fed9-2522-8b2b3d1f46ec@redhat.com>
 <6e1db99e-8d12-dcd0-536d-7d205117f6b4@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5fede130-2b96-549c-7d99-569e5a974c0c@redhat.com>
Date:   Wed, 7 Apr 2021 14:34:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <6e1db99e-8d12-dcd0-536d-7d205117f6b4@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/7/21 2:30 PM, tiantao (H) wrote:
> 
> 在 2021/4/7 17:51, Hans de Goede 写道:
>> Hi,
>>
>> On 4/7/21 9:00 AM, Tian Tao wrote:
>>> disable_irq() after request_irq() still has a time gap in which
>>> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
>>> disable IRQ auto-enable because of requesting.
>> Thank you for your patch, it is good to see the issue of there not
>> being a simply way to request IRQs in a way where they are initially
>> disabled being solved.
>>
>>> this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
>>> is being merged: https://lore.kernel.org/patchwork/patch/1388765/
>> So this is not yet in Linus' tree. When you write "which is being merged",
>> I assume that means that this is going upstream in the 5.13 window.
> this is already in linux-next.git.
> 
> cbe16f3 genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()

That does not help though, since all subsystem branches/trees, including
mine are based on 5.12-rc2, which does not contain the commit.

But I see that tglx has already created a signed-tag for the input-subsys
maintainer to solve the same issue, so I can just re-use that:

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/tag/?h=irq-no-autoen-2021-03-25

Regards,

Hans



>>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>>> ---
>>>   drivers/platform/surface/aggregator/controller.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
>>> index aa6f37b..00e3828 100644
>>> --- a/drivers/platform/surface/aggregator/controller.c
>>> +++ b/drivers/platform/surface/aggregator/controller.c
>>> @@ -2483,7 +2483,8 @@ int ssam_irq_setup(struct ssam_controller *ctrl)
>>>        * interrupt, and let the SAM resume callback during the controller
>>>        * resume process clear it.
>>>        */
>>> -    const int irqf = IRQF_SHARED | IRQF_ONESHOT | IRQF_TRIGGER_RISING;
>>> +    const int irqf = IRQF_SHARED | IRQF_ONESHOT |
>>> +             IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN;
>>>         gpiod = gpiod_get(dev, "ssam_wakeup-int", GPIOD_ASIS);
>>>       if (IS_ERR(gpiod))
>>> @@ -2501,7 +2502,6 @@ int ssam_irq_setup(struct ssam_controller *ctrl)
>>>           return status;
>>>         ctrl->irq.num = irq;
>>> -    disable_irq(ctrl->irq.num);
>>>       return 0;
>>>   }
>>>  
>> .
>>
> 

