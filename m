Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06DBC433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:12:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A0FA60FF1
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:12:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346636AbhESNOG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 09:14:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48318 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346576AbhESNOF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 09:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621429965;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KazyqUhhV5jT22wuz5v/t4HTJczq9uF4wLpdlfh1A2s=;
        b=d94BSPIMaQDu03870mwDCNopfjJTPYIIIEgXhXdQ5gI278JrB8CXLbxY5diRcVo7yo2GAj
        zWct/qscTnNjkl6vAyTqxA0zQBVFMy7g8szyRmTpbbYP8EyHyK3lSRmErLDYvhmN+mTVCx
        ELYCUfHcPxw1IYaXu/eh1HuZnP3F6DA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-qH2wpTiyN4G7CN1cBwuz4Q-1; Wed, 19 May 2021 09:12:43 -0400
X-MC-Unique: qH2wpTiyN4G7CN1cBwuz4Q-1
Received: by mail-ed1-f70.google.com with SMTP id h16-20020a0564020950b029038cbdae8cbaso7629952edz.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 06:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KazyqUhhV5jT22wuz5v/t4HTJczq9uF4wLpdlfh1A2s=;
        b=bq3Hpy9lFNE+d+hWcvY6Nt037iMn+YQOG7bRtAUQdq8jVRKIRpJxNr+F6ceU/Bg85J
         gieP8q9n2I6w6ITIGlxaDbnrOMpz/TAoZYP9jXMOL8zQfoByXk8kXobt7hUdEJfr+uWZ
         KdkGFABH/iiDNaAolG1lmBi91zOYgPj13uXDAsPGcRqgDoU9WY6VhhI0bUngTsXjuMoC
         dm/fZH+LT1s27RJoT89DLcnrEFXfOoNRAIMoOOwmZV5z1X5PFGnWj/IzgCcd8BDRdi0p
         6i4SvWd8DkuHmBAN4rzHclQ1mVOVlUr2rKjGa/EEdT0sJCVQEoG+RQGd6Vs1bTa/eRJT
         Dkhw==
X-Gm-Message-State: AOAM530UQCUBeImyViJgKl0gzKn6K9AqVo2LuPMDqlywJN+W5m3fC4Lq
        j+T/lWWkwYlHJBnYUwhsbEtvQDWmNp6dVz6/lsKAQmsLsgwdbIpm3NOtDCrthdpP3c6lcOHEnEU
        Dsvpph16Q0cNrwVNlC88bdxBI6t4Uy1MgXQ==
X-Received: by 2002:a05:6402:3446:: with SMTP id l6mr14509241edc.305.1621429962217;
        Wed, 19 May 2021 06:12:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhotFthNBjj5czxWagomPrmyGS3seaiwZPuLFxjD8ghUBX2/O/LFAhjvsT82NQjNT4RPS10Q==
X-Received: by 2002:a05:6402:3446:: with SMTP id l6mr14509231edc.305.1621429962090;
        Wed, 19 May 2021 06:12:42 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b15sm2306236ede.66.2021.05.19.06.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 06:12:41 -0700 (PDT)
Subject: Re: [PATCH] platform/surface: aggregator: Add platform-drivers-x86
 list to MAINTAINERS entry
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210514221954.5976-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5b5cba19-984f-7f01-89f8-df61a482e5b8@redhat.com>
Date:   Wed, 19 May 2021 15:12:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210514221954.5976-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/15/21 12:19 AM, Maximilian Luz wrote:
> The Surface System Aggregator Module driver entry is currently missing a
> mailing list. Surface platform drivers are discussed on the
> platform-driver-x86 list and all other Surface platform drivers have a
> reference to that list in their entries. So let's add one here as well.
> 
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will also include this in the next pdx86-fixes pull-req for 5.13.

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd7aff0c120f..57467b6046f1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12180,6 +12180,7 @@ F:	drivers/platform/surface/surfacepro3_button.c
>  
>  MICROSOFT SURFACE SYSTEM AGGREGATOR SUBSYSTEM
>  M:	Maximilian Luz <luzmaximilian@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  W:	https://github.com/linux-surface/surface-aggregator-module
>  C:	irc://chat.freenode.net/##linux-surface
> 

