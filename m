Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC59EC43334
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Jun 2022 10:24:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354539AbiFVKYp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Jun 2022 06:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354615AbiFVKYa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jun 2022 06:24:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 981483BA5A
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 03:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655893442;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5Os74LkYyLCMXIIdSPNx/FWApMAFK2xK/N4YdMkWG4k=;
        b=Ekwq2zAMpTev/fgfIgONwc2iUY6rwl2owLLcq2ZniCdgv1t56IGoDthOQQgUlbEB28WadN
        ePmFCxf4P/LEtxewU99aIG74dkxtntwT2R17SQn2Ofn4TOsJbJ9F9JO5i/RGP74hTAPTCY
        O+TUTf1YbNIeLu3yoLmaAO6sCMkQk4g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-eqdAKwIINP-etEQch49N7Q-1; Wed, 22 Jun 2022 06:24:01 -0400
X-MC-Unique: eqdAKwIINP-etEQch49N7Q-1
Received: by mail-ed1-f71.google.com with SMTP id y5-20020a056402358500b0043592ac3961so3930583edc.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 03:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5Os74LkYyLCMXIIdSPNx/FWApMAFK2xK/N4YdMkWG4k=;
        b=X/r1RbrkQa6+AYD+G/hY6yxFcE3prCgUiaZ1dM3d5P4YBmS1feZzqK2n72oDra9rrZ
         7uyrYCayWt+TmvVxOra0LXxSIqoFYq3Y9x3EWcO1R0p7KPhhKQ11Y5v9+7H/KCbN2qe4
         3S/e2+px1LMCfI1vku7g2euJHPrKq39BNfOBHfTTT0vcf8S6BjAHjWJufFwxKYs/tQuE
         pylsFW/sQ667hIdcz58D1QmvBLyzAqmsVUcMmA5BdFkP3xnZMIUurkTDKA/knHLVVBsn
         ldFhgswRSif55CfAHPqm56rQE/D1jli8h3sm9m9uE2tCwHdN2Imzk3UdBWq6Lghg+jNq
         g4YA==
X-Gm-Message-State: AJIora9pxkFYxOe4pfVh256qUn9b9zxutNafOC6Y6YclKmmkEWVQLco6
        GKAnM7hFXqdD9/i0JMtjQRf8l/qsIb0Tmawn0QQyNqNEXBhe9iFXnBRvFvD25mHSE6v5LHmKnmG
        CpqQzTB91v5bsxk0r/g5RevGyrFqP0YeUBg==
X-Received: by 2002:a05:6402:2806:b0:431:87c8:b45e with SMTP id h6-20020a056402280600b0043187c8b45emr3371517ede.130.1655893440267;
        Wed, 22 Jun 2022 03:24:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vm3DnB+9uZytnD7Hup1u9qPvqVbizMuaBQt6JqOBBJut6qc5nipsyUROtz0To51miRbdVkjg==
X-Received: by 2002:a05:6402:2806:b0:431:87c8:b45e with SMTP id h6-20020a056402280600b0043187c8b45emr3371500ede.130.1655893440093;
        Wed, 22 Jun 2022 03:24:00 -0700 (PDT)
Received: from [192.168.43.127] ([109.37.135.195])
        by smtp.gmail.com with ESMTPSA id f23-20020a170906825700b0070ad296e4b0sm8935604ejx.186.2022.06.22.03.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 03:23:59 -0700 (PDT)
Message-ID: <8a325309-a64c-d5c6-0164-9d626ff62e41@redhat.com>
Date:   Wed, 22 Jun 2022 12:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/mellanox: nvsw-sn2201: fix error code in
 nvsw_sn2201_create_static_devices()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Michael Shych <michaelsh@nvidia.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YqmUGwmPK7cPolk/@kili>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YqmUGwmPK7cPolk/@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/15/22 10:11, Dan Carpenter wrote:
> This should return PTR_ERR() instead of IS_ERR().  Also "dev->client"
> has been set to NULL by this point so it returns 0/success so preserve
> the error code earlier.
> 
> Fixes: 662f24826f95 ("platform/mellanox: Add support for new SN2201 system")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

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
>  drivers/platform/mellanox/nvsw-sn2201.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
> index 0bcdc7c75007..217e22e81c1a 100644
> --- a/drivers/platform/mellanox/nvsw-sn2201.c
> +++ b/drivers/platform/mellanox/nvsw-sn2201.c
> @@ -890,6 +890,7 @@ nvsw_sn2201_create_static_devices(struct nvsw_sn2201 *nvsw_sn2201,
>  				  int size)
>  {
>  	struct mlxreg_hotplug_device *dev = devs;
> +	int ret;
>  	int i;
>  
>  	/* Create I2C static devices. */
> @@ -901,6 +902,7 @@ nvsw_sn2201_create_static_devices(struct nvsw_sn2201 *nvsw_sn2201,
>  				dev->nr, dev->brdinfo->addr);
>  
>  			dev->adapter = NULL;
> +			ret = PTR_ERR(dev->client);
>  			goto fail_create_static_devices;
>  		}
>  	}
> @@ -914,7 +916,7 @@ nvsw_sn2201_create_static_devices(struct nvsw_sn2201 *nvsw_sn2201,
>  		dev->client = NULL;
>  		dev->adapter = NULL;
>  	}
> -	return IS_ERR(dev->client);
> +	return ret;
>  }
>  
>  static void nvsw_sn2201_destroy_static_devices(struct nvsw_sn2201 *nvsw_sn2201,

