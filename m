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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F03C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 11:26:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0884B6102A
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 11:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245758AbhDGL0W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 07:26:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30371 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238486AbhDGL0W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 07:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617794772;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hevnKcQ4I9jq+ZzW4AWSbIV29KiYxHuVFGDAD6+MJjk=;
        b=InqJH9Na46w5hPszAycdni17NJfTNm4qYSpDXmLNNBh/6csKrSu4cq/mW10hgvxNKG00Zy
        5TsyV6y5scwq0MrJRIZU5ThFEHfiwix1lQ64mWjIrWPxNfUnu9Q7iw3Af4r5orwStQ3Xaw
        MCH2jd7WhvkZPsNr5XYpSjQsbIUCQT8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-bl7yYRb4MHuLDSxiME04Dg-1; Wed, 07 Apr 2021 07:26:10 -0400
X-MC-Unique: bl7yYRb4MHuLDSxiME04Dg-1
Received: by mail-ed1-f72.google.com with SMTP id q12so11932890edv.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 04:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hevnKcQ4I9jq+ZzW4AWSbIV29KiYxHuVFGDAD6+MJjk=;
        b=ZIRjwfuMTuOhTVKur3q2FGRpyVDtIOeGUBwANBCULQiVZ7NNEWPxzSUhVLXVg6Ezz8
         JYqYh4QJ35mtUi17Q7xD2oTZS3y8jlKvBPh41AyxKV4Aygl36rU9CmsOM/h2SwErli6i
         pSnerIVpFSBDQ9BOs0lyAaJPztJcT2FL2S68+uovBdik5mWhOZlGGxpkvzZXPAk4lfNQ
         OTHitaoZryRlusAudtRWA7KD53iCroq0vCBnzl4VcvR+Csn8VlIqNEGdZ9yJOnQnMliA
         1dr2AJWZmPmx79SeFN8C3JLuSqsDN/OCArr5uu7+gEeiQ4kAeMmuyB2LweZp0BShdTab
         QHHw==
X-Gm-Message-State: AOAM531FT2ry5fONF7SKcdZeOxT+AcdYpORJNNrwElW0myowh3msj49c
        1dmNN3wHobQvhVj3sGo8WdCxFowTYmlYQ2S4Iz0h1u9M77Ibnyh3+CyBmoIGs3nTI4mt9A79cGX
        G9ap4jOyCme1o10Aqt8MePLklwGbFg3C0aQ==
X-Received: by 2002:a17:906:5056:: with SMTP id e22mr3077608ejk.289.1617794769515;
        Wed, 07 Apr 2021 04:26:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJltS0uUBU91wWC+Pkq7DwEgumF1o8eQ6ZXJwpirqAtiwQthRhT5WzUwSkKd89iCBCI/whxQ==
X-Received: by 2002:a17:906:5056:: with SMTP id e22mr3077593ejk.289.1617794769324;
        Wed, 07 Apr 2021 04:26:09 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k19sm8306722ejk.117.2021.04.07.04.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 04:26:09 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: panasonic-laptop: remove redundant
 assignment of variable result
To:     Colin King <colin.king@canonical.com>,
        Kenneth Chan <kenneth.t.chan@gmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210326192022.623001-1-colin.king@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e270b8b9-2562-ba49-32af-0f9d5ea1760b@redhat.com>
Date:   Wed, 7 Apr 2021 13:26:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210326192022.623001-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/26/21 8:20 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable result is being assigned a value that is never
> read and it is being updated later with a new value. The
> assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

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



> ---
>  drivers/platform/x86/panasonic-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
> index 6388c3c705a6..d4f444401496 100644
> --- a/drivers/platform/x86/panasonic-laptop.c
> +++ b/drivers/platform/x86/panasonic-laptop.c
> @@ -973,7 +973,7 @@ static int acpi_pcc_hotkey_add(struct acpi_device *device)
>  	pcc->mute = pcc->sinf[SINF_MUTE];
>  	pcc->ac_brightness = pcc->sinf[SINF_AC_CUR_BRIGHT];
>  	pcc->dc_brightness = pcc->sinf[SINF_DC_CUR_BRIGHT];
> -	result = pcc->current_brightness = pcc->sinf[SINF_CUR_BRIGHT];
> +	pcc->current_brightness = pcc->sinf[SINF_CUR_BRIGHT];
>  
>  	/* add sysfs attributes */
>  	result = sysfs_create_group(&device->dev.kobj, &pcc_attr_group);
> 

