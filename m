Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49AFC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 11:30:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB797611BD
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 11:30:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240329AbhI1Lcg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Sep 2021 07:32:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44983 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240270AbhI1Lcg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 07:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632828656;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kBc3jZoXfduxvlm/XcU+502MGDbE2GfRXb76r3oPrug=;
        b=exREwNfpXTz9YOo/L1NGja20kSz0hLghh4ML5GO33keHKqhyIrUcWjctwrFve+y8/fRfkw
        jRrHc6ZRvV8veFvyjjW6ZW60CHFRNdpWURDM2aqwQTMgtEwe/299UCilCVDx9nOHF9IArn
        YbSmYKRiY30ZocehOHQGBjLhZdLXDXY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-CbkL_xpvOIOklV5V5_xptA-1; Tue, 28 Sep 2021 07:30:55 -0400
X-MC-Unique: CbkL_xpvOIOklV5V5_xptA-1
Received: by mail-ed1-f72.google.com with SMTP id c7-20020a05640227c700b003d27f41f1d4so21374662ede.16
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Sep 2021 04:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kBc3jZoXfduxvlm/XcU+502MGDbE2GfRXb76r3oPrug=;
        b=6TAx7/s0RXXJwS3HmjCjDLgognFBtVG3wV2dp+eZCdAfk+W+nrP9M0zUbNAcoWFYtR
         Y9SkqC+88nA2DmjRacN4AFH0t7EoANc/unuFDJ2nZJHhq7XGrUEv65f6OGnVOFeIbyKp
         BatkGC34GtJeweVQ6y1rdviAqLsjZqZ7Vw1t7sxktpwYAkWoRUBwXBmfM12XEOWBZUZF
         epvXbExF/4We+Vq8qYDO29ollxhK3/WI9U07IkeJfRetMp2R3lvvouDYQGxI9HjapxUv
         g0NQdhd2DgGo0l0CytpbACYbIXQovydN9MuJsU18g+LqIT+btEmc6bAuO//6zUy2ukqP
         DiGA==
X-Gm-Message-State: AOAM533ckesrML7sdef3VmFTbbIbOLTRrywLa7ULsjOu0X1g3YelovhA
        ThYgNKqOK8RG+kdMLgzXXoY7o9C8Sc2XNFLaqpDP7LRIbC7d9uCM0LUIKyXtGEEEo8qEZa21IaH
        zunYiQZB3ABXuOQ4Jp3ciYSujY7FL+sQK1A==
X-Received: by 2002:a17:907:2131:: with SMTP id qo17mr6238806ejb.224.1632828653751;
        Tue, 28 Sep 2021 04:30:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNOC17RfuJND/OOBpP6nW6t3kC9KX7YUneMG9keKlqNZiumgAzcacly7S4OhFZt4/jhVlD9Q==
X-Received: by 2002:a17:907:2131:: with SMTP id qo17mr6238793ejb.224.1632828653569;
        Tue, 28 Sep 2021 04:30:53 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ds10sm2649112ejc.99.2021.09.28.04.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 04:30:53 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: amd-pmc: Send command to dump data after
 clearing OS_HINT
To:     Sanket Goswami <Sanket.Goswami@amd.com>, Shyam-sundar.S-k@amd.com,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210921115910.19401-1-Sanket.Goswami@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7eecdc89-4a59-4a2a-9663-795629657d60@redhat.com>
Date:   Tue, 28 Sep 2021 13:30:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210921115910.19401-1-Sanket.Goswami@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/21/21 1:59 PM, Sanket Goswami wrote:
> It was reported that the resume stats received from the firmware are
> always zero. This happens because the SMU expects the driver to send the
> command to dump the log data after clearing the OS_HINT.
> 
> Adjust the order of the commands sent to SMU.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Question, should I also submit this as a bug-fix for 5.15, or
can this wait for the 5.16 cycle ?

Regards,

Hans


> ---
>  drivers/platform/x86/amd-pmc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 91c1f1c6c929..bc7c4498067b 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -436,14 +436,14 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
>  	int rc;
>  	u8 msg;
>  
> -	/* Let SMU know that we are looking for stats */
> -	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_DUMP_DATA, 0);
> -
>  	msg = amd_pmc_get_os_hint(pdev);
>  	rc = amd_pmc_send_cmd(pdev, 0, NULL, msg, 0);
>  	if (rc)
>  		dev_err(pdev->dev, "resume failed\n");
>  
> +	/* Let SMU know that we are looking for stats */
> +	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_DUMP_DATA, 0);
> +
>  	/* Dump the IdleMask to see the blockers */
>  	amd_pmc_idlemask_read(pdev, dev, NULL);
>  
> 

