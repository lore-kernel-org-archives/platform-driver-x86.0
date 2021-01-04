Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BE2C433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 14:58:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A396522211
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jan 2021 14:58:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbhADO6B (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jan 2021 09:58:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49729 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726300AbhADO6A (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jan 2021 09:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609772194;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sOoUM+WZHNxHLdeWzOKCYYXiLYc1B+scKdmS3TBejyY=;
        b=b0L1omHHTEu3BnoQxN4+/tYOV+Zt8RbChPqu4+Xpi1Lz/hJK4wsHyEt/lqvMWhZtlUbT7w
        Gndoytrqgy0e3jPjK4y6UuHSbmQBFEty5ewbDLGLdaXRhZ5Ez+UHIQzKHaqJejUPFIqfcK
        aegWvxGaxaB3jeFbKDjcKGzxmBlJO3A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-hsgYKTpBMr-UmRxYWJnvqg-1; Mon, 04 Jan 2021 09:56:32 -0500
X-MC-Unique: hsgYKTpBMr-UmRxYWJnvqg-1
Received: by mail-ed1-f69.google.com with SMTP id i15so12307311edx.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jan 2021 06:56:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sOoUM+WZHNxHLdeWzOKCYYXiLYc1B+scKdmS3TBejyY=;
        b=h/S9f5qZBnHt5LbSHofw+U6FGVMcUlHDhb5MrDLwhWTZrleKqhAKmMV52aVaxH2rNs
         QIPNbwXEZzFC/E+jx1h2kO9VNA0ai2nAZyAiWmHjVZWYvzrAwf4CDd/o9WFoJPsq5CU1
         Ae2tJiQdF6vAsl4sgRIYfbjbw/0og2KmojQMzdLpZTBG7kjMK4lIbKhFZRNcGqigcXbr
         /qJuyJLZdx0THm6C/WvK5MWS6UVX666xlhkWy5IjQbs87OmqONmIt948dKGCBIqWpRkR
         iaM/bpFbc+4AGXUPZ/phO/Sfc/Zdz3FWPzwMIAKBM49ud6wVXphEkWAwVB3YB9MeDlRU
         St6Q==
X-Gm-Message-State: AOAM531O7ToGsYNvVmcLVE1oXxNjPdubWWzNOD2BviBLSUmcnF61GczZ
        4rhRgfGMv+1mx6qUbhw/NmzlAAzualSyqI7x522kj1wD0dOQXnri08aQYOoGi8qkZV/PVQxCu7N
        eS4jxTbJ3wkfHl0DBygWRH1eX2DNDHEjlnL+SNa/eAXTMNSvugHreDP3+2E0URzibdvG1K+zXQs
        21M6IvmEn0Bg==
X-Received: by 2002:a17:906:6d14:: with SMTP id m20mr65999447ejr.3.1609772191135;
        Mon, 04 Jan 2021 06:56:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAQmiewCjM7wmtCVDEMzuh3tMcIxtGe1ebvfg7sXITuYZaIwjg4VDWgXP1hGma/5ozCECYig==
X-Received: by 2002:a17:906:6d14:: with SMTP id m20mr65999432ejr.3.1609772190912;
        Mon, 04 Jan 2021 06:56:30 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id 35sm43401471ede.0.2021.01.04.06.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 06:56:30 -0800 (PST)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: correct palmsensor error
 checking
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20201230024726.7861-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e10adbc2-d599-72f3-c903-f08933856f76@redhat.com>
Date:   Mon, 4 Jan 2021 15:56:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201230024726.7861-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/30/20 3:47 AM, Mark Pearson wrote:
> The previous commit adding functionality for the palm sensor had a
> mistake which meant the error conditions on initialisation was not checked
> correctly. On some older platforms this meant that if the sensor wasn't
> available an error would be returned and the driver would fail to load.
> 
> This commit corrects the error condition. Many thanks to Mario Oenning
> for reporting and determining the issue
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Since this is a bugfix I will also cherry-pick this patch to the fixes
branch and include it in an upcoming fixes pull-req for 5.11.

Regards,

Hans

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index e03df2881dc6..c102657b3eb3 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9951,9 +9951,9 @@ static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
>  	if ((palm_err == -ENODEV) && (lap_err == -ENODEV))
>  		return 0;
>  	/* Otherwise, if there was an error return it */
> -	if (palm_err && (palm_err != ENODEV))
> +	if (palm_err && (palm_err != -ENODEV))
>  		return palm_err;
> -	if (lap_err && (lap_err != ENODEV))
> +	if (lap_err && (lap_err != -ENODEV))
>  		return lap_err;
>  
>  	if (has_palmsensor) {
> 

