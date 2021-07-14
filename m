Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E39AC12002
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Jul 2021 20:31:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D799610CB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Jul 2021 20:31:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhGNUeZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 14 Jul 2021 16:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40103 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230229AbhGNUeY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Jul 2021 16:34:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626294692;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0L4aAF3E63w8L9/kTx8iHot8bpytoVX3Qj6qZHqolb8=;
        b=UnFeGbyVRcUGSpaJ+1vvAOs1dxD0HIIVdjGekaCjCb57yp7tmASu2i8z0hKWsimrt6mUS2
        wpDTvpiNsTfOBxj5OlALRJq83wty1Dvfcri1z0MM24mDuC7LJfn4L/x/ILRt2gxnZGsPZe
        xpXS2Xv+jIe+opcJTFOQ9qoBW+MNV4E=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-DcjiGaepPIiTTEo34D0cjw-1; Wed, 14 Jul 2021 16:31:31 -0400
X-MC-Unique: DcjiGaepPIiTTEo34D0cjw-1
Received: by mail-ed1-f70.google.com with SMTP id v4-20020a50a4440000b02903ab1f22e1dcso1875271edb.23
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Jul 2021 13:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0L4aAF3E63w8L9/kTx8iHot8bpytoVX3Qj6qZHqolb8=;
        b=pJjGQoJ/yiTkbKG7Pm1CcYP+C4Ax2gwd+ojLDi851CCaFf5QHu0SafbLuhDuGz8ZrE
         XrN/HIl0jkzJHYA5LBAUeTujjPoav4ctM9yYBYzRHjpH6tnUgudzfmBou9W8zbYX2Ctt
         AXTHqCkNoBk91V8LoqG83i12+4QeoEJzLsexoMn/DCExF+yAq+zf1aJnXLsLYqshLXm/
         0+Yvx7KqeRQUdXswfUslnurD/6B2vR10vFVJPX9HdBf53aIFrD1I/GGe+oh7cO/dCBaB
         n7Taah6x5a8GxrL/mQhZxK0j+aH3ma+uEmKxp6F53YosUWT2RS6in0Nj46GWlhw2UxIN
         7AXA==
X-Gm-Message-State: AOAM531mWZMKQBUq9P+dlPXEunrHRuhxHAPD1UoqWxumEcaPsaJIR92E
        wiYD5nfwxkTnFE7xWS7D7PnHOSjm8hdutdXf/m5D58s06fGgYZaXvWjqlfYMPPBFoWC+UqdHJew
        UHlfWZVOxbUld3XGoJ6+AuyQetzCmwaKWFg==
X-Received: by 2002:a17:906:794b:: with SMTP id l11mr15000ejo.343.1626294684858;
        Wed, 14 Jul 2021 13:31:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzU1FV3is8cTlMvWQ1WyXO3c1881EVqkG7gQna0dXVuCco9RFIF7lgyWJUK3BlG69Hf1CYMyw==
X-Received: by 2002:a17:906:794b:: with SMTP id l11mr14819ejo.343.1626294682559;
        Wed, 14 Jul 2021 13:31:22 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s12sm1435351edd.68.2021.07.14.13.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 13:31:22 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: amd-pmc: Use return code on suspend
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <20210707141647.8871-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3b2d6ee4-7073-882d-f9d0-8c9a473e91cc@redhat.com>
Date:   Wed, 14 Jul 2021 22:31:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707141647.8871-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/7/21 4:16 PM, Mario Limonciello wrote:
> Right now the driver will still return success even if the OS_HINT
> command failed to send to the SMU. In the rare event of a failure,
> the suspend should really be aborted here so that relevant logs
> can may be captured.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will also apply this to the fixes branch and include it in my
upcoming v5.14 pdx86 fixes pull-req to Linus.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/amd-pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index d2f9a62e1166..680f94c7e075 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -353,7 +353,7 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
>  	if (rc)
>  		dev_err(pdev->dev, "suspend failed\n");
>  
> -	return 0;
> +	return rc;
>  }
>  
>  static int __maybe_unused amd_pmc_resume(struct device *dev)
> 

