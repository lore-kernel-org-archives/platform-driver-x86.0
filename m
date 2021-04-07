Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB1AC433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 11:25:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7AD86136A
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 11:25:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241745AbhDGLZu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 07:25:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32228 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234667AbhDGLZs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 07:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617794738;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6vTOve9t9MRfb5n6V3rOJN+vGohohWSYNISTo4uZoiA=;
        b=J0kmeXGdSS19LyF/m99BxzceMbsVo3Kek52rmU02vZQ87/37nz6wGWUaHkby5LfuvBdvq/
        WmTfI8+qr59vfDg4c7Co067YHdhy6nj5MvxULO096KFz8PgWRAw+gj2hKR3HdvhipJMie/
        BEZkQcb4w0Mgqr01oE//ddQcCVkCf/Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-nyBOpfFSORKgdeON0iAPIg-1; Wed, 07 Apr 2021 07:25:36 -0400
X-MC-Unique: nyBOpfFSORKgdeON0iAPIg-1
Received: by mail-ed1-f69.google.com with SMTP id bo11so1834531edb.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 04:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6vTOve9t9MRfb5n6V3rOJN+vGohohWSYNISTo4uZoiA=;
        b=USPFm3MjK6n72B8pZ63ldT8oD5EDsRLlkAttgeYQH4AkiPuyy2hdb9UYYyhd3Jr7gX
         43M8Q8JMuUrSd2jTm7p6d7Ka11IbQG+3vYEaq95qa36pXi726kiIqSSuVaSePjrkSLU8
         VhYE7dtHpqkA700WJr9taX0oHe/kA7H4UAxHv4htsZ2r7Yq3oQaIuxc8OfI8kng7vOVB
         NNzVqZXS52eDIARSSiGGp9FvlPeAkSnlCOjRaFpS5+ri1Orawf3o+PdNq2WLmuTQ6Og2
         t1xJfsOvn3NARNDWcg2n9QicxiFUmpY3J73SUtB/DE7g1bOue6BBWVM9WOmssM/GsG5U
         4H0g==
X-Gm-Message-State: AOAM530Qr+39XiCa+O+AgXQyjxhlAFPX5EqNZOf2XEJtQtUUdqe5mVV+
        bMBcdOJADOOaw7JpyJnZ0d+4niPZCjV53x6/PQtIAwwslAwyDPb7g4fXLgchaTGkA2AxqVqy6ro
        Zya49Y6TU76wY58NAymQ5TDTpK0L1vkZ40A==
X-Received: by 2002:a05:6402:148d:: with SMTP id e13mr3770680edv.29.1617794735523;
        Wed, 07 Apr 2021 04:25:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0kZjqz9PTJqFtWE3x1dV8jt1KkESynnl85mNB3EJ6D5KzQ3B0vRO/5Cla0AO3B3t4uiAqUQ==
X-Received: by 2002:a05:6402:148d:: with SMTP id e13mr3770672edv.29.1617794735409;
        Wed, 07 Apr 2021 04:25:35 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id la16sm2569695ejb.40.2021.04.07.04.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 04:25:35 -0700 (PDT)
Subject: Re: [PATCH] platform/surface: clean up a variable in
 surface_dtx_read()
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YF3TgCcpcCYl3a//@mwanda>
 <e614021b-62aa-c879-c324-fc1dc1eec73e@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f621186f-6c24-ff5c-237b-f0cc0fa092f8@redhat.com>
Date:   Wed, 7 Apr 2021 13:25:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e614021b-62aa-c879-c324-fc1dc1eec73e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/26/21 3:06 PM, Maximilian Luz wrote:
> On 3/26/21 1:28 PM, Dan Carpenter wrote:
>> The "&client->ddev->lock" and "&ddev->lock" are the same thing.  Let's
>> use "&ddev->lock" consistently.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Good catch, thanks!
> 
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>

Thank you for the review, I've merged this now:

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> 
>> ---
>>   drivers/platform/surface/surface_dtx.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/surface/surface_dtx.c b/drivers/platform/surface/surface_dtx.c
>> index 1fedacf74050..63ce587e79e3 100644
>> --- a/drivers/platform/surface/surface_dtx.c
>> +++ b/drivers/platform/surface/surface_dtx.c
>> @@ -487,7 +487,7 @@ static ssize_t surface_dtx_read(struct file *file, char __user *buf, size_t coun
>>               if (status < 0)
>>                   return status;
>>   -            if (down_read_killable(&client->ddev->lock))
>> +            if (down_read_killable(&ddev->lock))
>>                   return -ERESTARTSYS;
>>                 /* Need to check that we're not shut down again. */
>>
> 

