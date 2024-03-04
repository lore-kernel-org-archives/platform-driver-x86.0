Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D545FDCB
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Mar 2024 16:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709571457; cv=none; b=OqclhSf0YHVPy+7syxyZ8vVqno4ibG+enY+09xl3hx3Tt5z+yoq60ht/dx5RTfwz36DxvEtahkigmq7dvknS0xR8VvO5u8bi1LUfZR0zNT7biqo5yrY6RE3Ff0ddwEqWwwRakF5kUOP1MtiPetQItTL0PTXZlk8tYU9PsEVWzXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709571457; c=relaxed/simple;
	bh=9OxuSXlUAAkHSjgdNxhAWnJy3LIVqOW1+hdGG3ZGS5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+mPmKSwAGC6lTz2jnJouEDgGC3u0uM3cLh+4gMYkqZfJgbHWEI0MzxQtmQuT2Q2MXKVdrJGutjiCGgPwIbcX1ZFrLFgv7ARQdD2kjlDAIWCFxSXMSC2RsruxC+IuGCdREolTC9ESMW+m7YtkhV+1AFlMZMq5NNWf+YdpAr89tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VrzdF3K5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VrzdF3K5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709571454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AlBk3gVwDcJKKsrS4jsAo8rmbEynrWIssEK39CmSxmA=;
	b=VrzdF3K5mz6QHtEwPi0GU2feWJJSu/mKsxLyzgGP9pYCZwMtvzfmqcmcsaEiOHWDa9cmi+
	8TOMf2rNBIirukw6+VNBUZOAZMcCkvjLn5b2AATN5+bR/WTNnZwIXditXMwb9nRfr10Vep
	KGrTpgptNgAV/0npl8awCTaLStOx8jE=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-FEjd-tx-NgK-Y2HYg-ZuhQ-1; Mon, 04 Mar 2024 11:57:30 -0500
X-MC-Unique: FEjd-tx-NgK-Y2HYg-ZuhQ-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-513182f4018so3280182e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Mar 2024 08:57:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709571448; x=1710176248;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AlBk3gVwDcJKKsrS4jsAo8rmbEynrWIssEK39CmSxmA=;
        b=PkcrcgxWgRzaZ4rIT5mi0t/7uYU7P9bLfQH1Ws1SaDhJ25/zFKuFf6f5DfoE3TC5xk
         3MWyQq46pa0vDh3CSUbYIUqM44HwurQ97F0l3CVvurM2/kmgPGV73mLtsPGW34J4VMPI
         AhTOGX/tPhVs4pxoz0aHsSjQ2UORJwiEUZTCo5iWwZko2+dEm5RBVJdMbuALqOODNl0T
         /mVmkec3Jp48Qswc863lDZakp14OTJq/GbbeStsQjAiQlTpb1pVOSQiGz4PYSySxoIMD
         9DfMDv0VEba9pK8qxlDyQ3hLeY63UnQQtzdAR9O7JlA98kRszXI4Zg07OV5/B/m5Ea95
         PZdA==
X-Forwarded-Encrypted: i=1; AJvYcCW0AE39wgJComK84hn5uJT5DRJZoc+CfZkga+INwpVI8lIefYRnb7PpGnjKm3qaeVvSOoZ2f0Vyhhwv+AOcIbMqQa7+mEW4vik9oJAPaVUVjFiqKQ==
X-Gm-Message-State: AOJu0Yww2Nz3SyfhYuHkP+75vL5kak4TKLigx+BzcHtwP/wCxLdWDSIg
	5lJMqeW6WFfYM3j3u4Yu5Ld60ta/Ned9IoNu3MA+dxascsd0VKoJiq/r5Vw1aKEV69RvX2Sz6iX
	/SHCHIQbMHhBFxvJTFTdDjQahUxcHOo8n5hEaMqkVZ7Gri4jT/KgebDf8pW16qIGkHfqJkyk=
X-Received: by 2002:a05:6512:31ce:b0:513:3d35:bef6 with SMTP id j14-20020a05651231ce00b005133d35bef6mr5404870lfe.51.1709571448412;
        Mon, 04 Mar 2024 08:57:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3gKm69xEtdhrx5ahjwFzQ4tyocLGE2enIJx1LHgL7epBS9Ks4QKBoBonvlnMcFFZnGyHzTA==
X-Received: by 2002:a05:6512:31ce:b0:513:3d35:bef6 with SMTP id j14-20020a05651231ce00b005133d35bef6mr5404860lfe.51.1709571448060;
        Mon, 04 Mar 2024 08:57:28 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id wr8-20020a170907700800b00a4553c6d52csm1218221ejb.35.2024.03.04.08.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 08:57:27 -0800 (PST)
Message-ID: <c0fb0480-5078-40eb-b1eb-dc5a7859f399@redhat.com>
Date: Mon, 4 Mar 2024 17:57:26 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Fix missing error code in
 amd_pmf_init_smart_pc()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, dan.carpenter@linaro.org
References: <20240226144011.2100804-1-harshit.m.mogalapalli@oracle.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240226144011.2100804-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/26/24 15:40, Harshit Mogalapalli wrote:
> On the error path, assign -ENOMEM to ret when memory allocation of
> "dev->prev_data" fails.
> 
> Fixes: e70961505808 ("platform/x86/amd/pmf: Fixup error handling for amd_pmf_init_smart_pc()")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Thank you for your patch/series, I've applied this patch
(series) to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in the pdx86 review-hans branch once I've
pushed my local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> ---
> This is based on static analysis with smatch, only compile tested
> ---
>  drivers/platform/x86/amd/pmf/tee-if.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 8527dca9cf56..dcbe8f85e122 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -458,8 +458,10 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  	amd_pmf_hex_dump_pb(dev);
>  
>  	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
> -	if (!dev->prev_data)
> +	if (!dev->prev_data) {
> +		ret = -ENOMEM;
>  		goto error;
> +	}
>  
>  	ret = amd_pmf_start_policy_engine(dev);
>  	if (ret)

