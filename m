Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF893BBE0
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Jun 2024 09:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717408700; cv=none; b=I8maIYiaPKSQnVSgEGhFZlGEmT9pUBIRyC6KaZ6WyLHvCEkwOo2CRZxngEoJ5MQ0zeaACqMxMSOtThsUtXrOu5VsmW4A2x89PwdZWq4gFAs+dD1Ycv0DX8sLsIlAQnhpYOp4AXxv9hCqDN3sFQzGCIZ0YEIH+uvU7YvIk5dLCDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717408700; c=relaxed/simple;
	bh=gWfG9WiKpBg0KHi5fNj7HbYviopiLko6B/DfMRUF53E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZAqx+WF+9c9J+zdz8AN0kepTMeWovJnC23VNFxbcTN9psaBlBf+yds+PRlr7FBDuJosHxG3wLiWEt+eUNv4OzCYnqZ9lyVe455VWCsGS7zR9GAU15Kq5zaJ9w2N81P0NiymAGsLxnzMlSPnuuRA3cMg4u3a9n5t7GwJJ3Ao14wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dwX+HGfl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dwX+HGfl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717408697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k7A9A2iKad8mQwPOX0FQg8osO/lnETE0CpWourAiVp4=;
	b=dwX+HGflIxBDRcq54YvvLXW+O6eWr12n/oGGWk1BY2cgQ0EuP8mP2DmghZmlmPEkMimLmF
	vg+t7AewO8EO7i6AUIpGp6XjfAB42iwLo2ZqB5bgEaB3BT6A0iwwX1dO+o8vDMgBPSNo8r
	4mGMh1+1j74spDxJe5GPJ5XN3/kmulM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-EbX2DCmHNbu3ofk598njYQ-1; Mon, 03 Jun 2024 05:58:12 -0400
X-MC-Unique: EbX2DCmHNbu3ofk598njYQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a6900c7ce42so49048466b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Jun 2024 02:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717408691; x=1718013491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7A9A2iKad8mQwPOX0FQg8osO/lnETE0CpWourAiVp4=;
        b=MucfBoVtpzZ5Q8UvEvGgO/Kl3D8Zo6PEyZbX19Aqw0zl6P/hGjynDOGLrrG/+p2dGn
         BUbevVxo1ZIcaV3B+d2pRWJaP0wNEC1DgptpWtBzD1gHnOtoZx800n5w3Ic8iGiJB5T2
         Q2k5ocB3OYbxwmnowO9Ys5wtM7kc62nbtkWUfmybxoif4+fLFB1WYHtvwwLN9852EGz+
         ZFsmDHW9nBcgXOfCeQHqmUJ74oXmh/Ybx7BoscdUoXjn1i3Rt1MgbnA4OXP46giNI0wR
         QSxi5qC47N2Prl4Wozo3WHJgeBNIkSdSP96y5B7GDsDx+o5FhEzSi2vnAedxvz0l+af7
         atsw==
X-Forwarded-Encrypted: i=1; AJvYcCUHuQCEGcbSl0iXnF27jCyClfVZrmr+m0csYYI14z75F3HsRgIiu4NxSoMPEqY1RpFQnDuW3tXYR9Y3ZrT0l/TvkbBO9nfqgdRBm74u2JccZIET2w==
X-Gm-Message-State: AOJu0YwhuPntrKJH85cSvW8ov9Y8JZfqhXuDAX5eO0Tlaw5cPwaycEGg
	B8EFh9tzrzWNiL6bDZ4Cv5DZOc8szsGVMVL4Lx/HxCC25FTC8hgciJw0wBlq1EyRHDxXy02tpW6
	Qb8TTEjk2cIrhnRtetLGWzmHLaMbC+3TJX5iEK0JnO3Q1mI0gUqgbph0gx0Ad6ZlMMTgJd+g=
X-Received: by 2002:a17:906:3656:b0:a68:b8cc:842f with SMTP id a640c23a62f3a-a68b8cc861dmr378710366b.56.1717408691191;
        Mon, 03 Jun 2024 02:58:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGeyocekgaCMrtBLpywx34WtmpSfqsvwgEkWIzcy5WXYJvPclWJGW49BM5saMVfuWrPOBvLw==
X-Received: by 2002:a17:906:3656:b0:a68:b8cc:842f with SMTP id a640c23a62f3a-a68b8cc861dmr378709066b.56.1717408690666;
        Mon, 03 Jun 2024 02:58:10 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a689e8ecd3asm373493666b.19.2024.06.03.02.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 02:58:10 -0700 (PDT)
Message-ID: <fddc3bcb-1c96-4ea3-9919-72352b12e2e7@redhat.com>
Date: Mon, 3 Jun 2024 11:58:09 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/hsmp: Check HSMP support on AMD family
 of processors
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240603081512.142909-1-suma.hegde@amd.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240603081512.142909-1-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/3/24 10:15 AM, Suma Hegde wrote:
> HSMP interface is supported only on few x86 processors from AMD.
> Accessing HSMP registers on rest of the platforms might cause
> unexpected behaviour. So add a check.
> 
> Also unavailability of this interface on rest of the processors
> is not an error. Hence, use pr_info() instead of the pr_err() to
> log the message.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I've applied this patch to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans


> ---
> This patch addresses review comments from Mario Limonciello for 
> "Check HSMP support on AMD family of processors" patch at
> <https://lore.kernel.org/platform-driver-x86/20240423091434.2063246-2-suma.hegde@amd.com/>
> Please ignore the patch "platform/x86/amd/hsmp: Split the ACPI and non-ACPI code" in the above series.
> <https://lore.kernel.org/platform-driver-x86/20240423091434.2063246-3-suma.hegde@amd.com/>
> 
> We are working on addressing Hans comments on sysfs patch "Remove devm_* call for sysfs and use dev_groups"
> <https://lore.kernel.org/platform-driver-x86/20240410121746.1955500-1-suma.hegde@amd.com/>
> 
>  drivers/platform/x86/amd/hsmp.c | 50 ++++++++++++++++++++++++++++-----
>  1 file changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index d84ea66eecc6..8fcf38eed7f0 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -907,16 +907,44 @@ static int hsmp_plat_dev_register(void)
>  	return ret;
>  }
>  
> +/*
> + * This check is only needed for backward compatibility of previous platforms.
> + * All new platforms are expected to support ACPI based probing.
> + */
> +static bool legacy_hsmp_support(void)
> +{
> +	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
> +		return false;
> +
> +	switch (boot_cpu_data.x86) {
> +	case 0x19:
> +		switch (boot_cpu_data.x86_model) {
> +		case 0x00 ... 0x1F:
> +		case 0x30 ... 0x3F:
> +		case 0x90 ... 0x9F:
> +		case 0xA0 ... 0xAF:
> +			return true;
> +		default:
> +			return false;
> +		}
> +	case 0x1A:
> +		switch (boot_cpu_data.x86_model) {
> +		case 0x00 ... 0x1F:
> +			return true;
> +		default:
> +			return false;
> +		}
> +	default:
> +		return false;
> +	}
> +
> +	return false;
> +}
> +
>  static int __init hsmp_plt_init(void)
>  {
>  	int ret = -ENODEV;
>  
> -	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD || boot_cpu_data.x86 < 0x19) {
> -		pr_err("HSMP is not supported on Family:%x model:%x\n",
> -		       boot_cpu_data.x86, boot_cpu_data.x86_model);
> -		return ret;
> -	}
> -
>  	/*
>  	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
>  	 * if we have N SMN/DF interfaces that ideally means N sockets
> @@ -930,7 +958,15 @@ static int __init hsmp_plt_init(void)
>  		return ret;
>  
>  	if (!plat_dev.is_acpi_device) {
> -		ret = hsmp_plat_dev_register();
> +		if (legacy_hsmp_support()) {
> +			/* Not ACPI device, but supports HSMP, register a plat_dev */
> +			ret = hsmp_plat_dev_register();
> +		} else {
> +			/* Not ACPI, Does not support HSMP */
> +			pr_info("HSMP is not supported on Family:%x model:%x\n",
> +				boot_cpu_data.x86, boot_cpu_data.x86_model);
> +			ret = -ENODEV;
> +		}
>  		if (ret)
>  			platform_driver_unregister(&amd_hsmp_driver);
>  	}

