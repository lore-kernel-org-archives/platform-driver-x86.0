Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E503A52F62
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 May 2024 10:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714557903; cv=none; b=W3NYwX61UUbfKN/V4OwNYH16LtbgsoQ2MYnQX11W6KqRncqmDwJStmpioUHSuUtxYS65b6N3t5JWYmjH/pr2zs6ubPp/rD5VR5IC00lGpQ21j5+JhsGEYRvIiYAdixudriurvau3Hz861g7hlY9+3YVzuzZHQN465JPn5cuXqQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714557903; c=relaxed/simple;
	bh=zRIOVwIbuRT/C61qM9NViozdpwS2MV3uEzoWw2VcWUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TcoKoD1Ok4TPuMZgyxtQ1NRcUOUZKUnc7G7l8wmWecg836bAFLksrCULILY3kQCQiLcX1G6svsRtSthYDla02oxLHP8ISsh19oy6OuEI+WTbDUhhz0v0FhZ/q2Uv31grh0zydiOsS4cY5AWTKC+G7p7ZJ1Jp0+JOSLCFWy/ECfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PxLZmO+U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PxLZmO+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714557899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nco7um67jte34vjyYL03elkp+CiCw7RycyAoOwG9/n4=;
	b=PxLZmO+UR2JIv6xRLMOiJbCjNzYs1RT4ggZi0gmKSWlPcAECokJ6hskynTfjovgbb7OCzn
	Vhu4rOdxQ9effFQdTwmG8smCkdTRCMYX3UoHMCjrXW3hgwlcj7EcJzuDfU3QmQS2H+8w6d
	qudAm+auEbccpwBVL2cRIL/MSWdXho0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-SHpaP8jJOUms3ZtOwrP-Hg-1; Wed, 01 May 2024 06:04:58 -0400
X-MC-Unique: SHpaP8jJOUms3ZtOwrP-Hg-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-51d797671b7so3226378e87.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 May 2024 03:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714557897; x=1715162697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nco7um67jte34vjyYL03elkp+CiCw7RycyAoOwG9/n4=;
        b=gKqlYOxng7HVMURsTSMtnPiytTcASWqtpMY9EVJPRUz6rUyJgrBSzx5Uy1T2tw0EMo
         jfyTC8gglBldE79wkNS4MrWHGAXAigFqYiv54iuvgtY4ZV8ovsNoadC+b1z8mDcM2+Rv
         C8egXd5pNSHq7MLz7/CsA91z6TT4vV5rHZO/P4vcV9voYeZ4//DfW8boBOFpKG2QZFWv
         Ux8xgdJPIsOne+JX9B8d7kVcEFn0Am7PHBfqVHQgs4mmGisJ2UlePgHtvPJtlf2W1N7t
         AZ0PUF+yxP87PgLPbjkF6dOLCBnIymJ8/JRHOK8BYWYslfUhtHKEx6pIOViVBltDTo+x
         /EEw==
X-Gm-Message-State: AOJu0Yy9UmjdQvxUMOD5T8u2mVo4GtJkpSt02Sq7lONr2YEGZ1BVB1VQ
	gbTTU8G/6Yo1mu95PbMSDsLNBJBaOLf1BMn27UIxSv/DbDyBzpLsW8J2JgulWOFhhYX8wJA53U9
	kUULb37hhrbh6kozDBRgm6UIVjdDblKVkrrCOIElfASRaZQ6nqC2u4R6SqB7oEbHVL6pw47nkQ1
	BohlM=
X-Received: by 2002:a05:6512:478:b0:51e:25d2:453f with SMTP id x24-20020a056512047800b0051e25d2453fmr1062761lfd.68.1714557896856;
        Wed, 01 May 2024 03:04:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDzNjgasG6pTmAis+w8S8UbF/yOq/g9I/RXtOuc1slfRwaMySZoMjc7NM5pkOViqTv3n6VqQ==
X-Received: by 2002:a05:6512:478:b0:51e:25d2:453f with SMTP id x24-20020a056512047800b0051e25d2453fmr1062749lfd.68.1714557896403;
        Wed, 01 May 2024 03:04:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s3-20020a056402164300b00562d908daf4sm15176493edx.84.2024.05.01.03.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 03:04:55 -0700 (PDT)
Message-ID: <7940339d-e9a9-4367-9fce-1e5a201e7ab7@redhat.com>
Date: Wed, 1 May 2024 12:04:54 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: ISST: Support SST-BF and SST-TF per level
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 ilpo.jarvinen@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zhang Rui <rui.zhang@intel.com>
References: <20240430221052.15825-1-srinivas.pandruvada@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240430221052.15825-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/1/24 12:10 AM, Srinivas Pandruvada wrote:
> SST SST-BF and SST-TF can be enabled/disabled per SST-PP level. So return
> a mask of all levels, where the feature is supported, instead of just for
> level 0.
> 
> Since the return value returns all levels mask, not just level 0, update
> API version.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Reviewed-by: Zhang Rui <rui.zhang@intel.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  .../intel/speed_select_if/isst_tpmi_core.c    | 38 +++++++++++++++----
>  1 file changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> index 6bcbb97b0101..7bac7841ff0a 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> @@ -847,6 +847,8 @@ static int isst_if_get_perf_level(void __user *argp)
>  {
>  	struct isst_perf_level_info perf_level;
>  	struct tpmi_per_power_domain_info *power_domain_info;
> +	unsigned long level_mask;
> +	u8 level, support;
>  
>  	if (copy_from_user(&perf_level, argp, sizeof(perf_level)))
>  		return -EFAULT;
> @@ -866,12 +868,34 @@ static int isst_if_get_perf_level(void __user *argp)
>  		      SST_PP_FEATURE_STATE_START, SST_PP_FEATURE_STATE_WIDTH, SST_MUL_FACTOR_NONE)
>  	perf_level.enabled = !!(power_domain_info->sst_header.cap_mask & BIT(1));
>  
> -	_read_bf_level_info("bf_support", perf_level.sst_bf_support, 0, 0,
> -			    SST_BF_FEATURE_SUPPORTED_START, SST_BF_FEATURE_SUPPORTED_WIDTH,
> -			    SST_MUL_FACTOR_NONE);
> -	_read_tf_level_info("tf_support", perf_level.sst_tf_support, 0, 0,
> -			    SST_TF_FEATURE_SUPPORTED_START, SST_TF_FEATURE_SUPPORTED_WIDTH,
> -			    SST_MUL_FACTOR_NONE);
> +	level_mask = perf_level.level_mask;
> +	perf_level.sst_bf_support = 0;
> +	for_each_set_bit(level, &level_mask, BITS_PER_BYTE) {
> +		/*
> +		 * Read BF support for a level. Read output is updated
> +		 * to "support" variable by the below macro.
> +		 */
> +		_read_bf_level_info("bf_support", support, level, 0, SST_BF_FEATURE_SUPPORTED_START,
> +				    SST_BF_FEATURE_SUPPORTED_WIDTH, SST_MUL_FACTOR_NONE);
> +
> +		/* If supported set the bit for the level */
> +		if (support)
> +			perf_level.sst_bf_support |= BIT(level);
> +	}
> +
> +	perf_level.sst_tf_support = 0;
> +	for_each_set_bit(level, &level_mask, BITS_PER_BYTE) {
> +		/*
> +		 * Read TF support for a level. Read output is updated
> +		 * to "support" variable by the below macro.
> +		 */
> +		_read_tf_level_info("tf_support", support, level, 0, SST_TF_FEATURE_SUPPORTED_START,
> +				    SST_TF_FEATURE_SUPPORTED_WIDTH, SST_MUL_FACTOR_NONE);
> +
> +		/* If supported set the bit for the level */
> +		if (support)
> +			perf_level.sst_tf_support |= BIT(level);
> +	}
>  
>  	if (copy_to_user(argp, &perf_level, sizeof(perf_level)))
>  		return -EFAULT;
> @@ -1648,7 +1672,7 @@ void tpmi_sst_dev_resume(struct auxiliary_device *auxdev)
>  }
>  EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_resume, INTEL_TPMI_SST);
>  
> -#define ISST_TPMI_API_VERSION	0x02
> +#define ISST_TPMI_API_VERSION	0x03
>  
>  int tpmi_sst_init(void)
>  {

