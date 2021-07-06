Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18C5C07E96
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 09:59:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DD9B6198D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 09:59:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbhGFKC2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Jul 2021 06:02:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44519 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231181AbhGFKC2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jul 2021 06:02:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625565589;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Hs5g3BOMNcVF19CYMqDw9MsRiB9bGHwkSE/Y2r/XKW4=;
        b=UELw0bsM9T87/lkuGM8MdLmJtb3wooKbBFhxKJP25Jzr2tGMVZyneSwVqFuGswS844PXH2
        67U2jKSf0h1c8vTfDvQdBUxpPvF5k7E/x1xDyY61PnHWoHN6nMNUAL8yyXrprOn/e8bT95
        OxdY6Fi0k3EiYNEzo70t5FzG+vFTCiA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-lyXjM0Y2NPmRHRRcEy8iRg-1; Tue, 06 Jul 2021 05:59:48 -0400
X-MC-Unique: lyXjM0Y2NPmRHRRcEy8iRg-1
Received: by mail-ed1-f72.google.com with SMTP id s6-20020a0564020146b029039578926b8cso7635917edu.20
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jul 2021 02:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Hs5g3BOMNcVF19CYMqDw9MsRiB9bGHwkSE/Y2r/XKW4=;
        b=K0HPz3Ef1k+B2JZ6HK6zymeM5/6PLzMYTmGIWIni3LQ2zlQDX7zCAP2ieSSjPDJM3v
         xKtkLQvgwqe7LxES9sMY0hap8qjleLZJOIBLPgwNDqRuC3xtmDQZM5M8qybJgr4yJLU7
         Ik5uYHoonejnf0tTpr9ROHDYC9exuKt5efid1Wrcynw+BK1Vrj7ybXvNhfMRdyOwFHA5
         wrGKmudeWY9GPWH89cOXhMNScPXIZkKiMi5KVGRRvvwfyGgdQkKb5OOpq2LWiBcjRcI9
         qiTRQ4YP4qdijU1CuvsIN4Eyl9zAFcyyLAOh0FU+uwpDDoy/eXUCk4yRw/ZWSReODAfE
         w18g==
X-Gm-Message-State: AOAM531FhkzLldZjxUmIAz4BNyWbQw2ii8NS9qO3HGsZcOTdsrajlWXR
        6wtj714wNPV32JBcgst5XdB0n6MxZIofBnzUIa5rL30z5VKMU3VERIXely1+SFe2SH/iYltE1FK
        2bMNSUJBzgg6YJ00sk2K+OekcFiyeAFR2Xp3GSYDJ6AuDbqzjgXd1eCQ/vYgecrlo/1w+25JaEy
        qr/yF1x05hnw==
X-Received: by 2002:a17:906:b190:: with SMTP id w16mr17966190ejy.332.1625565587272;
        Tue, 06 Jul 2021 02:59:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcnfTGUMP9gMA2zxJCYp6LHAjTt/DRVEJ7wyfJZDDYgIT0X5Th33ZHLO/iZV5nNMWJtWDXkg==
X-Received: by 2002:a17:906:b190:: with SMTP id w16mr17966166ejy.332.1625565586989;
        Tue, 06 Jul 2021 02:59:46 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e21sm5485286ejy.54.2021.07.06.02.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 02:59:46 -0700 (PDT)
Subject: Re: [PATCH v5 3/7] platform/x86: amd-pmc: call dump registers only
 once
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        mgross@linux.intel.com, rrangel@chromium.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20210629084803.248498-1-Shyam-sundar.S-k@amd.com>
 <20210629084803.248498-4-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5a5fcc11-1fdd-278a-d458-e10954e083b4@redhat.com>
Date:   Tue, 6 Jul 2021 11:59:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629084803.248498-4-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/29/21 10:47 AM, Shyam Sundar S K wrote:
> Currently amd_pmc_dump_registers() routine is being called at
> multiple places. The best to call it is after command submission
> to SMU.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v2: split into multiple patches as suggested by Hans
> v3: No change
> v4: No change
> v5: No change

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> 
>  drivers/platform/x86/amd-pmc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index b1d6175a13b2..e5107e3b1911 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -182,6 +182,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
>  
>  out_unlock:
>  	mutex_unlock(&dev->lock);
> +	amd_pmc_dump_registers(dev);
>  	return rc;
>  }
>  
> @@ -194,7 +195,6 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
>  	if (rc)
>  		dev_err(pdev->dev, "suspend failed\n");
>  
> -	amd_pmc_dump_registers(pdev);
>  	return 0;
>  }
>  
> @@ -207,7 +207,6 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
>  	if (rc)
>  		dev_err(pdev->dev, "resume failed\n");
>  
> -	amd_pmc_dump_registers(pdev);
>  	return 0;
>  }
>  
> @@ -279,8 +278,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	if (!dev->regbase)
>  		return -ENOMEM;
>  
> -	amd_pmc_dump_registers(dev);
> -
>  	mutex_init(&dev->lock);
>  	platform_set_drvdata(pdev, dev);
>  	amd_pmc_dbgfs_register(dev);
> 

