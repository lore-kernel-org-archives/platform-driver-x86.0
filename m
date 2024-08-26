Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3D0191F75
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Aug 2024 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683764; cv=none; b=SO/fE7X/V+x4gV+cdRVH0M/4V6o4qED3WWTLt8+YyOAN0BWu/eBtM8sa4VpEEXBEJVJN0rHulLXoyTXxnOhuLSueCYor6sC8RkiX3JNs6Vf0BOaGQ0NHh4iQflKXAObtjcEYo58lGAWRQP6i7/EQ5YatYUPl9Y6QE39AMnU3HIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683764; c=relaxed/simple;
	bh=hao22iwdPAxBXy/O4LUS8fH2eW/xYpSOSkSKiyIeSOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uU84lB/gmayu3OcpSBr/gOL7K9U72FVRWGJR+jXjFAV1dg72G1FTKqwe2snDdHKvHHnn5xF+eJmYAimVVy9h6+FOJs9qiUc36juRBD2yc39j+7cXbM/i+DiXc82bVdmxly7ePoSaURXMQ8brz+lvslzqEm6KwnnqmnbJvkMcwb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A9Mdk435; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A9Mdk435"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724683762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cOK0e2Ws4Ne3dFoIBfes+65II0den379VKkP5kmook0=;
	b=A9Mdk435k1gqazOCIuTUJYGeW4lHE8gY1Dkc8Ni9Gs3+qVD39Y8FIkJcCBiuYL+Y+QoejD
	Ns07ehF6JRo9qUQhXOZb1lgCzwnFuicacv7v+d/Ud987XYDpjTlzTcLqFMWL1w42VS7Vyb
	6wPil89y+9v+BHa5LqW1ccHUC9OqF7Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-AosDZAsSPQ6YKVZTxf_gag-1; Mon, 26 Aug 2024 10:49:21 -0400
X-MC-Unique: AosDZAsSPQ6YKVZTxf_gag-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5bee6a8843eso3774933a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Aug 2024 07:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724683760; x=1725288560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cOK0e2Ws4Ne3dFoIBfes+65II0den379VKkP5kmook0=;
        b=PzZ6/8gpJMyxb9AFobgmE8NbNf+eIASGk7agSMU9UiLlngZHes0wH/sTiRkdYxkwzX
         y+2nAGT0R3fmxfxLh/z4ncY1zB6DSId2rtYaKuc1SyKLl7KnPl/MwHUBjLQAXYjmN/wG
         uSAss+sGUAIuRxTIxF9NlvDlTvJ2guSYKblrG2oVlDr+ilKUmhsgeRZA2q0WzF6JCKjq
         5rA0vduJvO/sSolvfzLOd2ATfSdEsKYGPgLi5cDCLBTu9oHpgRNRlBwLDq1/fjpg4y9m
         wAHhtWCfOj7luRPXIF0E5FW7oa1nJrCrEakZV7U/ZLn29fZ8jUUC2QO58nTdoXlqYOHh
         EaBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrKu/fjmSFVLVjm4CvFMN2hKRuRKV4Z0VnZx8LxC+RNc5XE+mLwzp2O12FKjhOFKdZujjhn3hijcAf5OVqXMV9FGR5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjo3Ck96Yolr0vQnvhTMdHs0i38h8NFpBNdP/HtxetmvkMzWqX
	H1DZrHMePAFny1pYxojkTf0l/mtbMIrQNLzrrBujk/uwRJ5U5AYP4TeRNoUBPw6Fhi8BIXea1vi
	rdQVlL5GlPVkV4CTLyrAYzNYco2f5XvqyBNn6YpNFtmQQBIWQCPygP2niDT8Q1X/nONCRboHy8Y
	jJae74nQ==
X-Received: by 2002:a17:907:e299:b0:a86:743e:7a08 with SMTP id a640c23a62f3a-a86a52c356cmr661093466b.31.1724683759860;
        Mon, 26 Aug 2024 07:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyJBSuRQGQFCsxTcnq2q3+8/QPz1N/F/zEZNx8iMYbwJfLBAq94oDQDfS55kGLboLV0O67Dg==
X-Received: by 2002:a17:907:e299:b0:a86:743e:7a08 with SMTP id a640c23a62f3a-a86a52c356cmr661091866b.31.1724683759375;
        Mon, 26 Aug 2024 07:49:19 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2a5771sm671522366b.76.2024.08.26.07.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 07:49:19 -0700 (PDT)
Message-ID: <6060a8d1-7532-40ab-a501-5c74b172110c@redhat.com>
Date: Mon, 26 Aug 2024 16:49:16 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] platform/x86: intel-hid: Use string_choices API
 instead of ternary operator
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alex Hung <alexhung@gmail.com>
References: <20240821120458.3702655-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240821120458.3702655-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/21/24 2:04 PM, Andy Shevchenko wrote:
> Use modern string_choices API instead of manually determining the
> output using ternary operator.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

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
>  drivers/platform/x86/intel/hid.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index 10cd65497cc1..445e7a59beb4 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -13,6 +13,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/string_choices.h>
>  #include <linux/suspend.h>
>  #include "../dual_accel_detect.h"
>  
> @@ -331,10 +332,8 @@ static int intel_hid_set_enable(struct device *device, bool enable)
>  	acpi_handle handle = ACPI_HANDLE(device);
>  
>  	/* Enable|disable features - power button is always enabled */
> -	if (!intel_hid_execute_method(handle, INTEL_HID_DSM_HDSM_FN,
> -				      enable)) {
> -		dev_warn(device, "failed to %sable hotkeys\n",
> -			 enable ? "en" : "dis");
> +	if (!intel_hid_execute_method(handle, INTEL_HID_DSM_HDSM_FN, enable)) {
> +		dev_warn(device, "failed to %s hotkeys\n", str_enable_disable(enable));
>  		return -EIO;
>  	}
>  

