Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C9D374EB
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Feb 2024 10:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708251905; cv=none; b=fDPf4/v1DleTHKtBSvvi2Q3S+JNSijVEbK9sY/mo9gdCKu0C0mhetUsvvB3qAEP0Uq9/5zmrMCKRQoCwC4CxBdCa4OkC8d2BDVESqzxkEtmZIaEwvi7fm03Hl6b1Ufd4Xi5qtibAVdx9L9fTqAMSWVrdDI4YXjAoDAtSwholmiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708251905; c=relaxed/simple;
	bh=+gnKTf/dOqdNrsqhS9OLjs91dy/DL3/eFi7uPh1pouA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E3hdyGFgm1gW7qm2GLmoVJx7dt0CBRgFN+SRo7XxETe/+k621jeSMC/h0vMHROrw4aod1tsTV/dpGrxfEK/Tb9oLhyj2sMy1yffc/r+vWQIcMSstPsBp01nsYqupAmMaJ8kgez/Xg/HeQwPl6CT0ZoEz8RvjDjyxff6Twz+lDis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GS+/bPum; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GS+/bPum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708251901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Gg4eVbs6GW9dRcU8FjV1V0/DaV7tBYBFbCKi4ZVUDU=;
	b=GS+/bPumOFFZXJieegjociImI5Ci/1mBf8v67F0MmNDsyMd7yssw3h6HPNmtWPHQ783BqU
	GEuxgtM6PboEmNE6ubej+5zG6ZUt7GmH9vdpamoIij5bYdnmYtsgsahILTwsHJNoZHPw5K
	PzyxsNS/uSKIyhWKddkOoE9H9BMuclM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-NwAIJ9YxO32_Kg-jMUTBSA-1; Sun, 18 Feb 2024 05:24:59 -0500
X-MC-Unique: NwAIJ9YxO32_Kg-jMUTBSA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a3d4881bcf5so222081066b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Feb 2024 02:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708251898; x=1708856698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Gg4eVbs6GW9dRcU8FjV1V0/DaV7tBYBFbCKi4ZVUDU=;
        b=YTzGhKmc5CyCUZe/UhDNUzSduSVOT8Q5zLff17VkDX1gD6uAeNKaVbYpxyeh90fSX2
         y+9uHO8okFgPEQkMrsftt6+v7JZNBQ09DqhUHInSZyVYlTx6WNsg/4UdFD7U/H2YOuof
         +uIxk23VgP2nMIjwPdkmmC3MzUS+m7zukG3CkbQ87/OXTxUWp7HDUnD/jiRHvyCkTrcQ
         qfhrCuDLKfAqtvX9pfj1cpKyZcptZFp96lsxZW9xPinVU9pnMFcXn9JEZ7HHcUq6TgvO
         ZLkpG+eX2itDoZm3buV+zpXWYX6YnO1ly+chruHpNKoiMu3C/4ZNg6RMLNyyksMA/GrC
         JMBw==
X-Gm-Message-State: AOJu0Yy72vTeKM81X13v0sNypLxPSS5iBtg6FmMB2RBY6ea+XahGd/iL
	nCHNFGzcHpT5wTgVkSi7eer35NfLP8v2keMb8kLmZMWdRwUKOIU1JJFftfivW30Lsf/YC7ZR6HS
	Lps7BHfp6aTovYZDLi7cmT2OrPKgQd2CJILWo+kWK6zyfrHgeree+7s/Kp7sX0TgzL+hiuR0=
X-Received: by 2002:a17:906:f20d:b0:a3d:2637:b713 with SMTP id gt13-20020a170906f20d00b00a3d2637b713mr8164811ejb.54.1708251897950;
        Sun, 18 Feb 2024 02:24:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmmEmLpS4WUO9cVTbhjOE9by3F/Qb7OEv0mpAb+AvsquQRLPO3hjCSA+7e51qvtHRFLlbL+w==
X-Received: by 2002:a17:906:f20d:b0:a3d:2637:b713 with SMTP id gt13-20020a170906f20d00b00a3d2637b713mr8164799ejb.54.1708251897639;
        Sun, 18 Feb 2024 02:24:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id un1-20020a170907cb8100b00a3d5a08ccc1sm1812528ejc.191.2024.02.18.02.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 02:24:57 -0800 (PST)
Message-ID: <6d9cc65a-1eed-4fe7-b875-dac9e6bfdacc@redhat.com>
Date: Sun, 18 Feb 2024 11:24:56 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86/amd/pmf: remove smart_pc_status enum
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 mario.limonciello@amd.com
References: <20240216064112.962582-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240216064112.962582-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shyam,

On 2/16/24 07:41, Shyam Sundar S K wrote:
> Improve code readability by removing smart_pc_status enum, as the same
> can be done with a simple true/false check; Update the code checks
> accordingly.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v2->v3:
> - handle missing case for amd_pmf_init_smart_pc() after removing enum
> 
> v1->v2:
> - remove enum smart_pc_status and adjust the code handling
> 
>  drivers/platform/x86/amd/pmf/core.c   | 11 ++++++++---
>  drivers/platform/x86/amd/pmf/pmf.h    |  5 -----
>  drivers/platform/x86/amd/pmf/tee-if.c |  4 ++--
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index feaa09f5b35a..1d6dbd246d65 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -330,9 +330,14 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>  		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
>  	}
>  
> -	if (!amd_pmf_init_smart_pc(dev)) {
> +	amd_pmf_init_smart_pc(dev);
> +	if (dev->smart_pc_enabled) {
>  		dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
> -	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
> +		/* If Smart PC is enabled, no need to check for other features */
> +		return;

This return here is new behavior and a minimum should have been
mentioned in the commit message.

I plan to prepare a set of fixes to send to Linus tomorrow,
so I will take this as is. I'll amend the commit message myself.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

But next time, even for a one liner like adding this commit split
it out in a separate patch. Especially when it is causing significantly
different behavior of the driver as is the case here.

Regards,

Hans






> +	}
> +
> +	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>  		amd_pmf_init_auto_mode(dev);
>  		dev_dbg(dev->dev, "Auto Mode Init done\n");
>  	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
> @@ -351,7 +356,7 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>  		amd_pmf_deinit_sps(dev);
>  	}
>  
> -	if (!dev->smart_pc_enabled) {
> +	if (dev->smart_pc_enabled) {
>  		amd_pmf_deinit_smart_pc(dev);
>  	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>  		amd_pmf_deinit_auto_mode(dev);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 16999c5b334f..66cae1cca73c 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -441,11 +441,6 @@ struct apmf_dyn_slider_output {
>  	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
>  } __packed;
>  
> -enum smart_pc_status {
> -	PMF_SMART_PC_ENABLED,
> -	PMF_SMART_PC_DISABLED,
> -};
> -
>  /* Smart PC - TA internals */
>  enum system_state {
>  	SYSTEM_STATE_S0i3,
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index f8c0177afb0d..8b7e3f87702e 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -260,7 +260,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>  	res = amd_pmf_invoke_cmd_init(dev);
>  	if (res == TA_PMF_TYPE_SUCCESS) {
>  		/* Now its safe to announce that smart pc is enabled */
> -		dev->smart_pc_enabled = PMF_SMART_PC_ENABLED;
> +		dev->smart_pc_enabled = true;
>  		/*
>  		 * Start collecting the data from TA FW after a small delay
>  		 * or else, we might end up getting stale values.
> @@ -268,7 +268,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>  		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
>  	} else {
>  		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
> -		dev->smart_pc_enabled = PMF_SMART_PC_DISABLED;
> +		dev->smart_pc_enabled = false;
>  		return res;
>  	}
>  

