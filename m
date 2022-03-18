Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0C3C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 18 Mar 2022 11:04:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbiCRLFZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 18 Mar 2022 07:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbiCRLFZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Mar 2022 07:05:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AF0B01A3BB
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Mar 2022 04:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647601443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zllBQhArZnpwN+9LcU5/uYXvhQg2SWpOR7mVblQ0ybY=;
        b=BUkXhdyDOcqYftGLbfbYj/BjSaGvnHlrKwhKlPUehPYXRye65mTEnzz1YjhDOJ/XyJnxsk
        uQa6u6zvTcibX4B3bDP8KtQorDCozPGdquzB/vSkBUHKy7CcvbFFNGF+2AEQW53+Cffksv
        yvjyx27sLAnRLSaR0UhL3WzsEHFhZWk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-XO5lNdSlOuCy7nctrpbk-w-1; Fri, 18 Mar 2022 07:04:01 -0400
X-MC-Unique: XO5lNdSlOuCy7nctrpbk-w-1
Received: by mail-ej1-f71.google.com with SMTP id zd21-20020a17090698d500b006df778721f7so4347834ejb.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Mar 2022 04:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zllBQhArZnpwN+9LcU5/uYXvhQg2SWpOR7mVblQ0ybY=;
        b=jbYDUx47zrvPfpQXeIcF4r23X7uI6JCQUdT8mi98wPRCi3pH2SFzxIhAtccwyC7vYU
         +b+oP8iNVbOdEMQiXXzf0msZcusow3a6iMs3s/bM9SiGR2dfh9pcR2jIdotUry8/lh4H
         Bov6vjESHr3LYnqrbMZq7Run60wbE6fVy4uT0MYIFCrDxvEb/O3Pn/PRg87ditTvfgQ1
         G3Vj7vwma+GKko4/TK/NB3G8DhUBszDT53zabvHicFWnE1AisznDpFbqxKqw7IwuIbJu
         c//l5mhwd3Etuf2DOzgqBgwzb6tInXSjFTQhl1IapT+1/ywdpIj9PL/KNuvfP8pOz/0z
         hvCA==
X-Gm-Message-State: AOAM533gp/2g65kJ0q1oGai8Zf+2eCMhhnIB3WHxJeFn9kwOLfemDLsb
        Y6WYuhersRLalT2R8SGRDDe2zrpNsRBmeATUoQ6+03cJssEOZyqck9XDIgw8hY5R+1NXL4wgOJY
        Ii0deuhyYVEvdj2JptgnOHXXTxS4xfruvXQ==
X-Received: by 2002:a17:906:b757:b0:6d6:e990:b0de with SMTP id fx23-20020a170906b75700b006d6e990b0demr8293467ejb.603.1647601440722;
        Fri, 18 Mar 2022 04:04:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyjnOw+D0qWUOdtZ+gCVK4486nEGJim91rftoLPhBmY9TUL15x5+KGyZtAaW4a7t0X+qc5tA==
X-Received: by 2002:a17:906:b757:b0:6d6:e990:b0de with SMTP id fx23-20020a170906b75700b006d6e990b0demr8293451ejb.603.1647601440485;
        Fri, 18 Mar 2022 04:04:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id l9-20020a056402254900b00416b0ec98b5sm3996711edb.45.2022.03.18.04.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 04:04:00 -0700 (PDT)
Message-ID: <adf4dbff-6259-5f29-325c-26bd9211cf6f@redhat.com>
Date:   Fri, 18 Mar 2022 12:03:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] platform/x86: amd-pmc: Only report STB errors when STB
 enabled
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:AMD PMC DRIVER" <platform-driver-x86@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220317190301.6818-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220317190301.6818-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/17/22 20:03, Mario Limonciello wrote:
> Currently if STB is disabled but an earlier function reported an
> error an incorrect error will be emitted about failing to write to
> STB.
> 
> Correct this logic error by only showing errors when STB is enabled.
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

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
>  drivers/platform/x86/amd-pmc.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 7317993cd91b..e9d0dbbb2887 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -655,10 +655,11 @@ static void amd_pmc_s2idle_prepare(void)
>  		return;
>  	}
>  
> -	if (enable_stb)
> +	if (enable_stb) {
>  		rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
> -	if (rc)
> -		dev_err(pdev->dev, "error writing to STB: %d\n", rc);
> +		if (rc)
> +			dev_err(pdev->dev, "error writing to STB: %d\n", rc);
> +	}
>  }
>  
>  static void amd_pmc_s2idle_restore(void)
> @@ -679,10 +680,11 @@ static void amd_pmc_s2idle_restore(void)
>  	amd_pmc_idlemask_read(pdev, pdev->dev, NULL);
>  
>  	/* Write data incremented by 1 to distinguish in stb_read */
> -	if (enable_stb)
> +	if (enable_stb) {
>  		rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF + 1);
> -	if (rc)
> -		dev_err(pdev->dev, "error writing to STB: %d\n", rc);
> +		if (rc)
> +			dev_err(pdev->dev, "error writing to STB: %d\n", rc);
> +	}
>  
>  	/* Notify on failed entry */
>  	amd_pmc_validate_deepest(pdev);

