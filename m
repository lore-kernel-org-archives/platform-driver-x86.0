Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA9CC433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 May 2021 11:40:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 646A161920
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 May 2021 11:40:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbhEKLlH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 May 2021 07:41:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26212 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231126AbhEKLlF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 May 2021 07:41:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620733199;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yDB76Nuv1O481lcRSgt/kb99YqkhJkPgTfC3877PSJQ=;
        b=R4mC1uJ/i4kvMI0kohWIymTOxiLnAhi2Z0cALgB+E8M+kDDk3Ohm/WVeDCJteO/lQu1lKf
        PijOXXOcoVXDORncxw51edk81tWu8fYoYQJPI6t/XDnRgwGjtVilltj/gmg4xvAjmgqsow
        QDQ0b2tjmHbfuMWeIFN923FXKyUiT5k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-QSscQO4RNlyfDfrqaL6zPg-1; Tue, 11 May 2021 07:39:57 -0400
X-MC-Unique: QSscQO4RNlyfDfrqaL6zPg-1
Received: by mail-ed1-f70.google.com with SMTP id c21-20020a0564021015b029038c3f08ce5aso5271875edu.18
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 May 2021 04:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yDB76Nuv1O481lcRSgt/kb99YqkhJkPgTfC3877PSJQ=;
        b=W3HbO36w+TVslC7pEixjrFo0NdXSDJLaOKns2p+Mp2hFxByjD4Gwku6KjiwKSf3Tkc
         eWeNslKX0Ah/B+zERWoL68l8Qnzl2zfNbN5U2V7Rj8cr/uCimB5DY1RFu/svD1OjBHFG
         U3McH1R4VbtItWdA1nh0HXwCGgXX3TJe+XLXNkLKp+slsDLntclkzymjFmBu4WsA/mF3
         vozZnLmGuj+7KRuwAHPrTfyV2n/1BxGV6scpqEiKR+RLIv6roU1CNmHuPAmBN/HPwRLD
         19ptOcIgVgQtPpLkwxyPzLQRwNtdFxBaHVQDsE/OBPXiN6q2ywUlK73MjCe5AbLUTySA
         3v4Q==
X-Gm-Message-State: AOAM533y9nox0gCAOh7c5mT69ChOwT2OYLqAGv38F+k46KePpIzNzFzN
        3Aq/XVLJx7SPH+PTPpIQmU8j0UHb7Al9uuB7EbiSLaIt7qgqmuJvKPGtdH0UuZSqLXM9l2067w/
        xYACHUvxQnB2gc1KbERoJDxWZHda7vfbJAQ==
X-Received: by 2002:a17:906:36da:: with SMTP id b26mr31448625ejc.8.1620733195757;
        Tue, 11 May 2021 04:39:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweLh4EyNU8M/Z76zmGVlIevsMFuGyy66retPVlD4ZLn92YLUcGdHLVfvg0lZuWEc4O8+c/+Q==
X-Received: by 2002:a17:906:36da:: with SMTP id b26mr31448616ejc.8.1620733195613;
        Tue, 11 May 2021 04:39:55 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id g9sm11417543ejo.8.2021.05.11.04.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 04:39:54 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: ideapad-laptop: fix a NULL pointer
 dereference
To:     Ike Panhc <ike.pan@canonical.com>,
        Qiu Wenbo <qiuwenbo@kylinos.com.cn>, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210428050636.8003-1-qiuwenbo@kylinos.com.cn>
 <a95f27a5-bc5a-a195-09e4-db56d024629e@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8253fa3a-6baa-1879-e928-1825878e7f88@redhat.com>
Date:   Tue, 11 May 2021 13:39:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a95f27a5-bc5a-a195-09e4-db56d024629e@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/30/21 10:45 AM, Ike Panhc wrote:
> On 4/28/21 1:06 PM, Qiu Wenbo wrote:
>> The third parameter of dytc_cql_command should not be NULL since it will
>> be dereferenced immediately.
>>
>> Signed-off-by: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
> 
> Fixes: ff36b0d953dc4 ("platform/x86: ideapad-laptop: rework and create new ACPI helpers")
> Acked-by: Ike Panhc <ike.pan@canonical.com>

Thank you I've added this to my review-hans branch with the 2 above
tags added. I'll also add this to my fixes branch and include it in
a future pdx86 fixes pull-req for Linus for 5.13.

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
>>  drivers/platform/x86/ideapad-laptop.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
>> index 6cb5ad4be231..8f871151f0cc 100644
>> --- a/drivers/platform/x86/ideapad-laptop.c
>> +++ b/drivers/platform/x86/ideapad-laptop.c
>> @@ -809,6 +809,7 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
>>  {
>>  	struct ideapad_dytc_priv *dytc = container_of(pprof, struct ideapad_dytc_priv, pprof);
>>  	struct ideapad_private *priv = dytc->priv;
>> +	unsigned long output;
>>  	int err;
>>  
>>  	err = mutex_lock_interruptible(&dytc->mutex);
>> @@ -829,7 +830,7 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
>>  
>>  		/* Determine if we are in CQL mode. This alters the commands we do */
>>  		err = dytc_cql_command(priv, DYTC_SET_COMMAND(DYTC_FUNCTION_MMC, perfmode, 1),
>> -				       NULL);
>> +				       &output);
>>  		if (err)
>>  			goto unlock;
>>  	}
>>
> 

