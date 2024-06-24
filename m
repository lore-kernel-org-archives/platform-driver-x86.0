Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70668129A7B
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jun 2024 11:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228871; cv=none; b=KLe5VJYLGXrxQ/stfKTv2OyUYzoxWJOcBfN9wtedV1HohGUOfJOBhGfZ1ZXHHvaG7PfMEBvnx3Er/ZBw5x1T7kIJRcvb6a5jaDI6LMJeR5Kkt9WkVf50HNpxRkaabncyQeRM2O2Ue/ONYG94sY2vOyW5EmWIVeUMUrDv26bFWNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228871; c=relaxed/simple;
	bh=C5DI4ykUX6mfuJFUQoRUWoodzXe5F79p4mr3sTH61Ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSFIQp9NUfD9TH/EfFdr7v3HpMrJVVp+andc/isvLkM2Gh4ivr0r17eI64VYVnPaH5G6rlTNR/kk+LuLD+W6v9ZuJGgB83JhhMH5bMHcnuRmq8X1fMDB6k2DUyUrHeFSFrs0a1/Lsq+NfBlNi0zEqOREJhrjkJLXZTU8/OHEXoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ggt9n7nB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ggt9n7nB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719228868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jG3E5jkG60r/vDkubJ7vrvwdnrUq2QMfexXsOxqXG1U=;
	b=Ggt9n7nBVVeszTHl30eurKfuQ9D0YkBhbLWraJ9yIe0EUJsuU0YHm3Lfwk6FG+fydivyIu
	pXHHr5P8b38XbTpfehXqOluU8Mv4s7QQ3IQWyIZcoz0p6zlEj+Jrepw20WvVLIXLMvDHag
	GwR9sBvlE4QWotyJkBrRXXPzBXgMyJ8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-4y4MVNXpOQigrdU9Rtj0ZA-1; Mon, 24 Jun 2024 07:34:26 -0400
X-MC-Unique: 4y4MVNXpOQigrdU9Rtj0ZA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7240b92b4dso81227566b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jun 2024 04:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719228865; x=1719833665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jG3E5jkG60r/vDkubJ7vrvwdnrUq2QMfexXsOxqXG1U=;
        b=mE4QgNx2Vi81aYK2vajd52W5Up3NOb1lOcxP69RPnCo62J2MNk9/WMio9muIDGEZ/m
         0YYN47PQBWTgNttxo9LXaA9mljbDD2hdSaHcKTtu1Z12GDiBhcDtO8Cz2OhfNK1kkfl6
         qcGPOVIu4FEp0sGFgPImuSTtD7F/UtB6Udrjc4ERDZEe6m1O3enTNDrc8z08Kxekymnb
         FU126DA8sgdZodlUquOBq93gBdLOCqhN/Vkj9aMKhae6okhS3bzXbVa7lIwXrQ/5mAP5
         5M7ib/Z8wIYV/OZkAvf4RFqC485CUuNzw5XknbsaaDjUJZJTMdXLMIGBcd9cEng+gF2U
         ckPQ==
X-Gm-Message-State: AOJu0YxZZmXa9scpQc8aQrsVjGCyExbJI/VQp7lu9R4UI/q4nyEsswTp
	ce659/fQEQY3BmDFmvTiB1Mvc0nbvd5kIdON1QApL4m1RLoh+OCN6xArZ3NvhrDX4/zuEouPq3w
	Ebprl9/6v3xmyEcYAUUe4wicBS8mMlCeJ4/Ldbydk7vnYnMdl38zEOpxGMgpYb7FKZJP1GDQ=
X-Received: by 2002:a17:907:8b8c:b0:a72:4b31:13aa with SMTP id a640c23a62f3a-a724b311555mr254429966b.55.1719228865681;
        Mon, 24 Jun 2024 04:34:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcRcb81PEYVXUvfHSEHi4n32Xp2cLtUT8BSe+FrmeethJzuTtdbHVxDMyQ0FVaHYL8O487mA==
X-Received: by 2002:a17:907:8b8c:b0:a72:4b31:13aa with SMTP id a640c23a62f3a-a724b311555mr254429166b.55.1719228865399;
        Mon, 24 Jun 2024 04:34:25 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560929sm399519266b.155.2024.06.24.04.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 04:34:25 -0700 (PDT)
Message-ID: <83211fc2-fe45-40f9-bcb6-22227b9ac715@redhat.com>
Date: Mon, 24 Jun 2024 13:34:24 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Justin Ernst <justin.ernst@hpe.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240611-md-drivers-platform-x86-v1-1-d850e53619ee@quicinc.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240611-md-drivers-platform-x86-v1-1-d850e53619ee@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/12/24 7:20 AM, Jeff Johnson wrote:
> With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/amilo-rfkill.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/uv_sysfs.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/ibm_rtl.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/xo1-rfkill.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/firmware_attributes_class.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/wireless-hotkey.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
> This is the last of the issues present (that I'm aware of) in
> drivers/platform/x86
> ---
>  drivers/platform/x86/amilo-rfkill.c              | 1 +
>  drivers/platform/x86/firmware_attributes_class.c | 1 +
>  drivers/platform/x86/ibm_rtl.c                   | 1 +
>  drivers/platform/x86/uv_sysfs.c                  | 1 +
>  drivers/platform/x86/wireless-hotkey.c           | 1 +
>  drivers/platform/x86/xo1-rfkill.c                | 1 +
>  6 files changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/amilo-rfkill.c b/drivers/platform/x86/amilo-rfkill.c
> index efcf909786a5..2423dc91debb 100644
> --- a/drivers/platform/x86/amilo-rfkill.c
> +++ b/drivers/platform/x86/amilo-rfkill.c
> @@ -171,6 +171,7 @@ static void __exit amilo_rfkill_exit(void)
>  }
>  
>  MODULE_AUTHOR("Ben Hutchings <ben@decadent.org.uk>");
> +MODULE_DESCRIPTION("Fujitsu-Siemens Amilo rfkill support");
>  MODULE_LICENSE("GPL");
>  MODULE_DEVICE_TABLE(dmi, amilo_rfkill_id_table);
>  
> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
> index dd8240009565..182a07d8ae3d 100644
> --- a/drivers/platform/x86/firmware_attributes_class.c
> +++ b/drivers/platform/x86/firmware_attributes_class.c
> @@ -49,4 +49,5 @@ int fw_attributes_class_put(void)
>  EXPORT_SYMBOL_GPL(fw_attributes_class_put);
>  
>  MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
> +MODULE_DESCRIPTION("Firmware attributes class helper module");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/ibm_rtl.c b/drivers/platform/x86/ibm_rtl.c
> index 1d4bbae115f1..231b37909801 100644
> --- a/drivers/platform/x86/ibm_rtl.c
> +++ b/drivers/platform/x86/ibm_rtl.c
> @@ -29,6 +29,7 @@ static bool debug;
>  module_param(debug, bool, 0644);
>  MODULE_PARM_DESC(debug, "Show debug output");
>  
> +MODULE_DESCRIPTION("IBM Premium Real Time Mode (PRTM) driver");
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Keith Mannthey <kmmanth@us.ibm.com>");
>  MODULE_AUTHOR("Vernon Mauery <vernux@us.ibm.com>");
> diff --git a/drivers/platform/x86/uv_sysfs.c b/drivers/platform/x86/uv_sysfs.c
> index 37372d7cc54a..f6a0627f36db 100644
> --- a/drivers/platform/x86/uv_sysfs.c
> +++ b/drivers/platform/x86/uv_sysfs.c
> @@ -929,4 +929,5 @@ module_init(uv_sysfs_init);
>  module_exit(uv_sysfs_exit);
>  
>  MODULE_AUTHOR("Hewlett Packard Enterprise");
> +MODULE_DESCRIPTION("Sysfs structure for HPE UV systems");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/wireless-hotkey.c b/drivers/platform/x86/wireless-hotkey.c
> index e95cdbbfb708..459e20f7e161 100644
> --- a/drivers/platform/x86/wireless-hotkey.c
> +++ b/drivers/platform/x86/wireless-hotkey.c
> @@ -14,6 +14,7 @@
>  #include <linux/acpi.h>
>  #include <acpi/acpi_bus.h>
>  
> +MODULE_DESCRIPTION("Airplane mode button for AMD, HP & Xiaomi laptops");
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Alex Hung");
>  MODULE_ALIAS("acpi*:HPQ6001:*");
> diff --git a/drivers/platform/x86/xo1-rfkill.c b/drivers/platform/x86/xo1-rfkill.c
> index e64d5646b4c7..5fe68296501c 100644
> --- a/drivers/platform/x86/xo1-rfkill.c
> +++ b/drivers/platform/x86/xo1-rfkill.c
> @@ -74,5 +74,6 @@ static struct platform_driver xo1_rfkill_driver = {
>  module_platform_driver(xo1_rfkill_driver);
>  
>  MODULE_AUTHOR("Daniel Drake <dsd@laptop.org>");
> +MODULE_DESCRIPTION("OLPC XO-1 software RF kill switch");
>  MODULE_LICENSE("GPL");
>  MODULE_ALIAS("platform:xo1-rfkill");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240611-md-drivers-platform-x86-a3a06234d33c
> 

