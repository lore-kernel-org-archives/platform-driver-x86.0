Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC5BC54EED
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 14:43:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237810AbjA3Onz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 09:43:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjA3Onz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 09:43:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09DF66583
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 06:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675089785;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+TV9JoY76bvy76j8dPVhuimxD+NY8aacJq7mtMm4XXk=;
        b=PZkduZGUmKp72Oco0G1UIjqaO26k2fAiHCO1I5d8ZGgQRylHfPlJAbpINFQfiQA8Nx2j6e
        +iI29mMmUEBA+OATOu4dzquktyNy7etSclLYKtqTmVeFZTgGv4kqF7v+ybtpEPExKmKk7F
        +DD3J31/psVgpaozHts8OitHqX+zpsQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-Ml5e0TIzMqGrDEPXAMxXOA-1; Mon, 30 Jan 2023 09:42:56 -0500
X-MC-Unique: Ml5e0TIzMqGrDEPXAMxXOA-1
Received: by mail-ej1-f71.google.com with SMTP id z2-20020a1709060be200b0088b579825f9so288138ejg.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 06:42:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+TV9JoY76bvy76j8dPVhuimxD+NY8aacJq7mtMm4XXk=;
        b=dKSo0lPebx8jmp3+UOjAJS9dt5ECB7Ssa+vSaDAFbtGyQ8VnfEMWdobDxVVMi+9ODc
         c2zmx6nGT1ZCrmqqR2GdkLtgyuqHIi4NtM4aD+6tP+mBm1l7K7cVGGCIT+3gsQ/dupVW
         EqP9E/l61zguNfGhv2bzR1CjKp3qR2nh+dA8lTIEeNSNknFZIvvyBmCCPp+KNdiuoeml
         6mlxft6ztxrkhoakgEUQep531ov+RjhjisxYCwPN//ob7Wk+CET4E0ZeB1kOyTYSfuS0
         ydzMmIgCe//ptHNsg55uPsvfaJpdiaAZ3BVy5LGd+tTGXCIGgKN9KEK0H9eJSdDULqc7
         QZMQ==
X-Gm-Message-State: AO0yUKWNs5glE6cZQYw0mVdhoJFOqELrfXuU9ckzJbPJKNmAeoChO60C
        QO63VdgJs/cnZR9HPOOmXKJSgOYkaN/sHC8rkK2xvAWXqAZF4IdQfCp9vmtSaiYZr6e6u1ZSrb1
        +wcmSbbUJorbNgI39wEtGJUjb0ensxnhnCA==
X-Received: by 2002:a17:906:2409:b0:884:d15e:10f8 with SMTP id z9-20020a170906240900b00884d15e10f8mr7014731eja.51.1675089774935;
        Mon, 30 Jan 2023 06:42:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+skMLLsVacyS/7byjTqCDf9T2utKkH7q2X634gw65yGVC2vkzoYxmXnh8yMdX/eHXlHfKzZg==
X-Received: by 2002:a17:906:2409:b0:884:d15e:10f8 with SMTP id z9-20020a170906240900b00884d15e10f8mr7014722eja.51.1675089774763;
        Mon, 30 Jan 2023 06:42:54 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id e18-20020a17090681d200b0088519b92080sm3129153ejx.127.2023.01.30.06.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 06:42:54 -0800 (PST)
Message-ID: <7f489853-4a60-f9ee-9fb9-9780c416481e@redhat.com>
Date:   Mon, 30 Jan 2023 15:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/4] platform/x86/amd: pmc: Write dummy postcode into the
 STB DRAM
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
 <20230125113127.3862898-3-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230125113127.3862898-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/25/23 12:31, Shyam Sundar S K wrote:
> Based on the recommendation from the PMFW team in order to get the
> recent telemetry data present on the STB DRAM the driver is required
> to send one dummy write to the STB buffer, so it internally triggers
> the PMFW to emit the latest telemetry data in the STB DRAM region.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/amd/pmc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index 01632e6b7820..0dd9fb576f09 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -43,6 +43,7 @@
>  #define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
>  #define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
>  #define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
> +#define AMD_PMC_STB_DUMMY_PC		0xC6000007
>  
>  /* STB S2D(Spill to DRAM) has different message port offset */
>  #define STB_SPILL_TO_DRAM		0xBE
> @@ -250,6 +251,11 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>  	u32 *buf, fsize, num_samples, stb_rdptr_offset = 0;
>  	int ret;
>  
> +	/* Write dummy postcode while reading the STB buffer */
> +	ret = amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
> +	if (ret)
> +		dev_err(dev->dev, "error writing to STB: %d\n", ret);
> +
>  	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
>  	if (!buf)
>  		return -ENOMEM;

