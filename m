Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4845314F9D2
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 13:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713792360; cv=none; b=mmRQUV+qLCZHYJm7QeKhV5IrJUi4teSgdmaRVpg/rfLY2XmQg7Y43e2dK1v42HTPfD/ZoCpOEyalVsuyLkRrzwY/JSjxUiwQXhBJcic4HR4Haj9tP6ndwhHzAlv3uFPVFc/1HMGfdguSHyjRYN0AhmDerVfGafrL5T88fsJuMGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713792360; c=relaxed/simple;
	bh=zzX5eE4yMUDKe0LvVLzQNY6kTp+yzD1J3zOF3ag/LAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QwqQRfoZh/eQEds/xLyEda7x/vu4HBzpwZt0manecldq/bnUexqQuSDlfa51k5Rhk95JcLDJwuiWWQtDqDO7fxZyp907m9Xer5W4GpJDSTRz0jgwd5THi6IiKSR7N+Ny3BgeXtSXaPtk/ZFsujVq4UPO4ZSm6VH6TNwYz4/jHmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VNoaoEnx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VNoaoEnx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713792358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ol/2RA90vNCMdV3wT9xM2JZGkm3yoQFPbLwEAxBwTSc=;
	b=VNoaoEnx9qbqhibtIcM0olCNHTab4P2dSzHw0BAxGFPKf7Q9+SKgmASjXBPYp62TO7NRsE
	nhmOiF45ftHLqhh3S+I0oWYZCt6N67BGXw33t9OZ4ygCLc1cPwOvBWleAzlMKpyhbYlh1Q
	KHvFZFFVISEXk8+HUB+BMQVkJIawz0g=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-z18_NRQiNGStSJrIhUgMwg-1; Mon, 22 Apr 2024 09:25:56 -0400
X-MC-Unique: z18_NRQiNGStSJrIhUgMwg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a555af96dd5so291405466b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 06:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713792355; x=1714397155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ol/2RA90vNCMdV3wT9xM2JZGkm3yoQFPbLwEAxBwTSc=;
        b=j7jI1K7eBaWU1GM5lVEy3i8Nu1d0ALwRJIFFFCM70SYzTrgYP9zQiTVJ+CtKEUFLzz
         +W9dizWotK1C86aI9/bFSHXaFYH+Wbmq1HHwJ4k/T8lzumPY/dg9iXvcANXc5EPBUaK2
         CrjWDJVkSDWiuYpsehZEiQB1NxiHeo83DtDelxOWkpO0WDYCwU19OCK3XI2BcYfKnbvD
         dv/5sS2N/dLdbW2dj8z58OtLns0UhvnZMWFuI2PxBDg0VJCSMhIFdfnaxD87l28Ul6KT
         b77KRhXjFZ9YqVmbsRx/B8f0tffd5bTKEK80n1D4849X14ywS2QcgpZzt5d0oxomN5Zz
         zVEA==
X-Gm-Message-State: AOJu0YwiVhuJHO3mXiop30pVXHOliWyCEwvwoK8vWyCOsKTuxs+XXFxA
	SDdylcFS+7IS0ozEkkF8fxNFXnzUzj+3DEqlnNFYgEWKAmSSrjW1akvb3odvYQvdaU/X8Jl47fC
	z7Dmpr1GgCZaEUUDCapZoGfC9YNz7kiokPRwvIMo2k/Tux2xpHZXev24j7V4w8deme2+/maw=
X-Received: by 2002:a17:906:fe0b:b0:a55:ab92:8baa with SMTP id wy11-20020a170906fe0b00b00a55ab928baamr4660376ejb.9.1713792355113;
        Mon, 22 Apr 2024 06:25:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFizyCClaD48IQHzVKa86p3t7HomFbWXivDIP/CjLWOxs68n/orswhkEk93S6EN8g/eJimpuQ==
X-Received: by 2002:a17:906:fe0b:b0:a55:ab92:8baa with SMTP id wy11-20020a170906fe0b00b00a55ab928baamr4660363ejb.9.1713792354738;
        Mon, 22 Apr 2024 06:25:54 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id x20-20020a1709060a5400b00a524b2ffed6sm5761118ejf.56.2024.04.22.06.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 06:25:54 -0700 (PDT)
Message-ID: <12ef6031-35e1-4d48-9771-8c431f7abe33@redhat.com>
Date: Mon, 22 Apr 2024 15:25:50 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel-uncore-freq: Don't present root domain
 on error
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240415215210.2824868-1-srinivas.pandruvada@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240415215210.2824868-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/15/24 11:52 PM, Srinivas Pandruvada wrote:
> If none of the clusters are added because of some error, fail to load
> driver without presenting root domain. In this case root domain will
> present invalid data.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Fixes: 01c10f88c9b7 ("platform/x86/intel-uncore-freq: tpmi: Provide cluster level control")
> Cc: <stable@vger.kernel.org> # 6.5+
> ---
> This error can be reproduced in the pre production hardware only.
> So can go through regular cycle and they apply to stable.

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




> 
>  .../x86/intel/uncore-frequency/uncore-frequency-tpmi.c     | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
> index bd75d61ff8a6..587437211d72 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
> @@ -240,6 +240,7 @@ static int uncore_probe(struct auxiliary_device *auxdev, const struct auxiliary_
>  	bool read_blocked = 0, write_blocked = 0;
>  	struct intel_tpmi_plat_info *plat_info;
>  	struct tpmi_uncore_struct *tpmi_uncore;
> +	bool uncore_sysfs_added = false;
>  	int ret, i, pkg = 0;
>  	int num_resources;
>  
> @@ -384,9 +385,15 @@ static int uncore_probe(struct auxiliary_device *auxdev, const struct auxiliary_
>  			}
>  			/* Point to next cluster offset */
>  			cluster_offset >>= UNCORE_MAX_CLUSTER_PER_DOMAIN;
> +			uncore_sysfs_added = true;
>  		}
>  	}
>  
> +	if (!uncore_sysfs_added) {
> +		ret = -ENODEV;
> +		goto remove_clusters;
> +	}
> +
>  	auxiliary_set_drvdata(auxdev, tpmi_uncore);
>  
>  	tpmi_uncore->root_cluster.root_domain = true;

