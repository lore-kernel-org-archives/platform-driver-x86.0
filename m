Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD06C4743E
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Jun 2021 19:58:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A203613AD
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Jun 2021 19:58:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbhFDUAe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Jun 2021 16:00:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41839 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231177AbhFDUAd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Jun 2021 16:00:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622836727;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0fVhjAHeVRgfpGwbjD+B87pacxHTlTdVbrkucRo5wXo=;
        b=dqZPerGSBjGwnzoCAZLQxXpQk2o3OjmR+oPdQP77VlkBD6elrUYTjK3jPQ/wBUJqmpVaND
        mnXOh5kpyJrIq0tvhYmsL6ixq9TcE+Jvr48e8L2ABnwXgz0UTDK1CFeLzBn4RpYGPftr1A
        QYRQtvyiqDRDrjQM3/SdYqQxbZ/UmoU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-WNJXGYXHOkW5lMJ7lfstsw-1; Fri, 04 Jun 2021 15:58:43 -0400
X-MC-Unique: WNJXGYXHOkW5lMJ7lfstsw-1
Received: by mail-ej1-f72.google.com with SMTP id 16-20020a1709063010b029037417ca2d43so3927418ejz.5
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Jun 2021 12:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0fVhjAHeVRgfpGwbjD+B87pacxHTlTdVbrkucRo5wXo=;
        b=ltVaOj/luEQ0BTmnIurLWTRqk3WZD2UYaVkLymDsoC2aAGsTZMArvtQzwvcQ0Ae0Ri
         GGD8Dqn0cwNiu2SRY3DerVzN0eKiaG4vteZVUTlOiyjAAOrNL2c2LTc1fbuo+NwxziaR
         8r4JKeh0+yByHk7qUnTFW6L83QYl/ZCO1ykYJ84UcBPP2g74pHNgZ+/m9DFr/Qv15Fmy
         Mzo7JySPYtDN3kTP/GV/QZCfslJA0H7nK0DdsgcDguELi7Ww/iHkEYZGfUxCnbUJ/Loo
         V2e4EimRLfDx1/10FpVq/V3UG4VmZSm1HMfJ8qDmS0YACX0WqUXNnLmX5G6F2EWNpyys
         kHbg==
X-Gm-Message-State: AOAM531A4GG5jK+oc84/uAHv6bDFMMFvoYitobEsris30/yWq7vD6GTL
        n5XrlSQxsDPU0Ih08u6wcn+7gH0FxtK2T6EEgEbl9pXgbxNNFT6SU/3UExw1X+S7ZuNpspkSqcp
        2hEk0zNiMOzWuBMdZsegZeRu39aVFFcAP+A==
X-Received: by 2002:a17:906:b754:: with SMTP id fx20mr5476940ejb.201.1622836722303;
        Fri, 04 Jun 2021 12:58:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeCbTbe6DUYucYVbhatoqJpQOqnbWTeTzTFKFcrz7PYXhjYAZidL0BezyF9QtAI0xjmGAW5A==
X-Received: by 2002:a17:906:b754:: with SMTP id fx20mr5476926ejb.201.1622836722103;
        Fri, 04 Jun 2021 12:58:42 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id o4sm3561290edc.94.2021.06.04.12.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 12:58:41 -0700 (PDT)
Subject: Re: [PATCH] platform/surface: dtx: Add missing mutex_destroy() call
 in failure path
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210604132540.533036-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8a317463-5c5f-fd64-f319-1df513e6956a@redhat.com>
Date:   Fri, 4 Jun 2021 21:58:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604132540.533036-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/4/21 3:25 PM, Maximilian Luz wrote:
> When we fail to open the device file due to DTX being shut down, the
> mutex is initialized but never destroyed. We are destroying it when
> releasing the file, so add the missing call in the failure path as well.
> 
> Fixes: 1d609992832e ("platform/surface: Add DTX driver")
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I'll also add this to the fixes branch, so that it gets included
in my next pull-req to Linus for 5.13.

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/surface/surface_dtx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/surface/surface_dtx.c b/drivers/platform/surface/surface_dtx.c
> index 5d9b758a99bb..1203b9a82993 100644
> --- a/drivers/platform/surface/surface_dtx.c
> +++ b/drivers/platform/surface/surface_dtx.c
> @@ -427,6 +427,7 @@ static int surface_dtx_open(struct inode *inode, struct file *file)
>  	 */
>  	if (test_bit(SDTX_DEVICE_SHUTDOWN_BIT, &ddev->flags)) {
>  		up_write(&ddev->client_lock);
> +		mutex_destroy(&client->read_lock);
>  		sdtx_device_put(client->ddev);
>  		kfree(client);
>  		return -ENODEV;
> 

