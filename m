Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188B42E645
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708345856; cv=none; b=SySg19oQALTfSecsgOWVJGNOOvRlRFVUGPxt8lAXBeFi/I1Is0dpcOfTTqfmkQZhUwd3MBn0dUm/jbMIDEEDECvTfNSW5Rp+EAVInKOxSFug0jTXbu+TYG5QR02mR9ACURUAdaN1Bh3YquBcIMdqvMozu+5nIEsmJsTK4bqaLIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708345856; c=relaxed/simple;
	bh=IDTbPb8asY+ferm6mqqlqxZXxYiD0ZNqwygEqzr2sdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ccgAsRx9FN4V09dHehkBGVjrkeqQ/GADukJWjo0GiBiFi2134ldFwnPHZD8wgBeFdLkffW7NRRZkzTiwpol8XFb2uAyfaS4HenoYwIY/u0+M6K1aOapBaFrC9w8SjwdV9+c0AKhM/CjwGJyb6cJ3k5Wo2xXe1Bpax+bhk0pJw7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ilIRkIoq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ilIRkIoq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708345852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YdH2Ze9iNCElmUDBvOdq9sHylN6X8PQU7Qi39Aqlfp4=;
	b=ilIRkIoqdcUBcRbyR5V4f0XeaqFU+oO00mKBMSpHDX5YwL8pYlxp6lZuEuImQfXzBIBq2o
	RDfO+nMLUDGkVzHvh5QLaKujUJJyD+gWAcu2tcBlr3pvsQMmA0+vUkla2jPXqfL+3PPDSQ
	UPIHSagZD2yJpeZ9cbuQHv+pRVc3i0s=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517--LjxpaSCPGuYOAvivmzH_g-1; Mon, 19 Feb 2024 07:30:51 -0500
X-MC-Unique: -LjxpaSCPGuYOAvivmzH_g-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-512acebbafaso1065089e87.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 04:30:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708345849; x=1708950649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YdH2Ze9iNCElmUDBvOdq9sHylN6X8PQU7Qi39Aqlfp4=;
        b=VFw0GIJ9h8Njqb+Z1bDfWqijJa1yuMOmNTz7s53gkG4E8pSvnlpZSPqEl44CVSzgjf
         5k8+7ZGx7SpCb/Qr8B+FTbNGjrHkG8T05WhfYOxXSl4Gxf3wzjnervQ/sn2h293GF+SJ
         D0ywKL3ATigl55YmJxgoRdhX1K8LwonUpp7Z7poMWGKZzjCclVezYB06U1gqafEI/u/V
         x1ChNHWS6kIy0d22s87Uqu0Uy7ZAJUvZ4HGAnRKWupyTChgN7UnX1y4aBT/nZniSpsSr
         TyDNeVpqv8IRthc5ERes1tZRb3zWN/+ZCGtNWV0nEyQ2gwb7ERAGsBvurDzWbCQ1dypj
         DjGg==
X-Gm-Message-State: AOJu0YylVjmh6AaiuDyMUqvnRSftZ/B6MDV/e5dIsbSu9zdPW7NiR5B1
	NU4KdSEcMHW4NxhvcoCmKrKU6b8HBhklzJOYrgGRg4UC6q4BSomdUCNe6mbM4Nn9TA2g4I87s4p
	u2W7I+WhY64e0x9Ie+8K2eZgoqHGEY5TLwQlLpxDC3PunrxOdYk7tiqnaJ7KVQEIXw16fJuc=
X-Received: by 2002:a05:6512:3d8d:b0:512:be44:656f with SMTP id k13-20020a0565123d8d00b00512be44656fmr658764lfv.63.1708345849715;
        Mon, 19 Feb 2024 04:30:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnnYbm6CLP6LhauYdapFeonPxhMoFGBFXGCUGyg/sBLf9e2Cahk8+3t+Luhosaa0CjPe3rqw==
X-Received: by 2002:a05:6512:3d8d:b0:512:be44:656f with SMTP id k13-20020a0565123d8d00b00512be44656fmr658747lfv.63.1708345849370;
        Mon, 19 Feb 2024 04:30:49 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id th7-20020a1709078e0700b00a3e059c5c5fsm2895602ejc.188.2024.02.19.04.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 04:30:49 -0800 (PST)
Message-ID: <bd84948c-6e05-492c-8a77-7c31c5631edb@redhat.com>
Date: Mon, 19 Feb 2024 13:30:48 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86/amd/pmf: remove smart_pc_status enum
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 mario.limonciello@amd.com
References: <20240216064112.962582-1-Shyam-sundar.S-k@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240216064112.962582-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/16/24 07:41, Shyam Sundar S K wrote:
> Improve code readability by removing smart_pc_status enum, as the same
> can be done with a simple true/false check; Update the code checks
> accordingly.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thank you for your patch-series, I've applied this series
to my review-hans  branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




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

