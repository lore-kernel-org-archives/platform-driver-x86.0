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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8305C43460
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:12:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B11760FF1
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:12:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346503AbhESNN3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 09:13:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60286 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346652AbhESNN3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 09:13:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621429929;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=awY+ia0X5V2PMZw9CViuEIoYymBZhpNSbICZiHEMEkA=;
        b=J5/iJCbTTIdOm6icSqplIn/NyP6jeGL1jWJfPDB++j+XafGY+4etryt9EPHJdvuKTlMlJR
        SOKCUoxr8xo5z9uWpp9kU57umlquJG2ceYrzXL3DnEVHXN9ZRayAT4YkSvHnHxtk9CL6Q8
        qcx1638a7SBvgifPeliD7+Rb5ZIefVw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-VdXcgJxhOxCfUI44dUp27Q-1; Wed, 19 May 2021 09:12:07 -0400
X-MC-Unique: VdXcgJxhOxCfUI44dUp27Q-1
Received: by mail-ed1-f72.google.com with SMTP id y17-20020a0564023591b02903886c26ada4so7654883edc.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 06:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=awY+ia0X5V2PMZw9CViuEIoYymBZhpNSbICZiHEMEkA=;
        b=qC3OD8ZrUJIT5DuhshpKeks+4hUGXr0o14huZeu7y3Wq4sROeGz8sHliA9Lt24aKnR
         9LbUXHjA5qY/NHa67O/2X/46T7zWMZfa0fsmMOYRt/6Cv60VAkCI9A1NoNpBzeqEzSsC
         M+wcydYP4WG5cqFZcgehET0tEWsM0/muhKnoHDPLlR1Khh6VForsE/n52Y/3T1Z5RGyK
         XZfOT61SLTmtVy30VwhdsC4zn1WMLLPEHk0Kgwo2Mh4d+xaKIEVu7t54ulLb8mLte/1c
         4wl66aYP608NIwuSDAMy8qhwm0ichejTm83C6JBCuEeIK4ryiIhlmCPMS7CkvK9FwFPE
         b8/Q==
X-Gm-Message-State: AOAM531c4750TDD5ut06YhLDddiz820HfwY23EJs3axIowLAYp+fOK03
        qvr2vyvrNGSNQpl7RYn/m93xPrsnYvjCGJAA2lz3/8gUJnIGbxBaWYd2CgYCroJX9k0kMG9u1gP
        BAgNkg0QV++MepoK7z7bmOg1OHmPpHP8Zmw==
X-Received: by 2002:a17:906:b756:: with SMTP id fx22mr11371742ejb.224.1621429925031;
        Wed, 19 May 2021 06:12:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4QPnJBz6QHSbvlK/Q6gDbHpU3S4O+QF/UVRC62KeVjtb2wygYm4JwdKvbkKoVzgZhshK5/w==
X-Received: by 2002:a17:906:b756:: with SMTP id fx22mr11371673ejb.224.1621429924213;
        Wed, 19 May 2021 06:12:04 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id c3sm16426470edn.16.2021.05.19.06.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 06:12:03 -0700 (PDT)
Subject: Re: [PATCH] platform/surface: dtx: Fix poll function
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20210513134437.2431022-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bed4b8ed-c183-00ee-a832-2f25a4392888@redhat.com>
Date:   Wed, 19 May 2021 15:12:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513134437.2431022-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/13/21 3:44 PM, Maximilian Luz wrote:
> The poll function should not return -ERESTARTSYS.
> 
> Furthermore, locking in this function is completely unnecessary. The
> ddev->lock protects access to the main device and controller (ddev->dev
> and ddev->ctrl), ensuring that both are and remain valid while being
> accessed by clients. Both are, however, never accessed in the poll
> function. The shutdown test (via atomic bit flags) be safely done
> without locking, so drop locking here entirely.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 1d609992832e ("platform/surface: Add DTX driver> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

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
>  drivers/platform/surface/surface_dtx.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/surface/surface_dtx.c b/drivers/platform/surface/surface_dtx.c
> index 63ce587e79e3..5d9b758a99bb 100644
> --- a/drivers/platform/surface/surface_dtx.c
> +++ b/drivers/platform/surface/surface_dtx.c
> @@ -527,20 +527,14 @@ static __poll_t surface_dtx_poll(struct file *file, struct poll_table_struct *pt
>  	struct sdtx_client *client = file->private_data;
>  	__poll_t events = 0;
>  
> -	if (down_read_killable(&client->ddev->lock))
> -		return -ERESTARTSYS;
> -
> -	if (test_bit(SDTX_DEVICE_SHUTDOWN_BIT, &client->ddev->flags)) {
> -		up_read(&client->ddev->lock);
> +	if (test_bit(SDTX_DEVICE_SHUTDOWN_BIT, &client->ddev->flags))
>  		return EPOLLHUP | EPOLLERR;
> -	}
>  
>  	poll_wait(file, &client->ddev->waitq, pt);
>  
>  	if (!kfifo_is_empty(&client->buffer))
>  		events |= EPOLLIN | EPOLLRDNORM;
>  
> -	up_read(&client->ddev->lock);
>  	return events;
>  }
>  
> 

