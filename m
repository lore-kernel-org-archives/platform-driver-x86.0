Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9C013A25D
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jun 2024 11:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228857; cv=none; b=chziUFxsjiqnAl97UxPeTOIjO2Xvoaso8MP7Xrd3yABzPNZfrf4xCDwwpimBGkzsXPHh0wxBKCiRpDWnY34ssX3QWmIlX9DuPypbijAyLCd++COv2EnHzWnICbHS/h2pmWizSEvbfgO+SLBH8XmK/v/VAtvlj6nNtMemcCMlOlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228857; c=relaxed/simple;
	bh=rP3AhGt0XPYvVMqPRvexwBnWuUQiMNd3QTg3693J/qE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=to3zkgRgh1aeO4T0HogPmKpt/7XCA2znCKf2RyX5rGP+A6pz6w1OJOwjyjcuQxzSdJNJZq3XqFRY20F3/wxTS8EKdXoRb17iz0ZvwQt2iKB13OhlLIsk4Gka68BSDntmCe8l4kz4aCDe+lLJMPH0rkl8AsKiSuVW/53QB9ZjkG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TfssW4jD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TfssW4jD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719228854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VCKMjpby00bDobCkZro5ZOxXPo0pbZqz3nGXBjwVgXE=;
	b=TfssW4jDdJVYuaIzghftjr6U209vO4B6FE/xtlGsmY3m5aAZ3zGWxiKivCy4lKc3c0uTKf
	zkYfN0wadffwDLoBS/5dzNpZZrajStlpVp+KAAphN7LQTrInf5ShVCRMmOHnwwcUb58O37
	mUDFCVvXY+g5ZKDBTFdPpoXRJf/Ulls=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-GkarWWXKOXujUFRJ9gViUQ-1; Mon, 24 Jun 2024 07:34:13 -0400
X-MC-Unique: GkarWWXKOXujUFRJ9gViUQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a725c45ab1dso36987066b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jun 2024 04:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719228852; x=1719833652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCKMjpby00bDobCkZro5ZOxXPo0pbZqz3nGXBjwVgXE=;
        b=lzF2rONVshP9BLIYCRNrlvHGq5/yusN+9bPtgUazWIyAUCgDWt6R3IH0x4l5oPJDOZ
         u43/BsE/E3AnmlQ8mnQOFZQaO/BZ8RaDcuSOT85gl3Pf8+EOclsQn6r3sUv0K3SCoYc3
         /wMbEuaZpi4P/KDxH3WfAJGNekLZaRAjTliUugXPYet2J1ksHaE216BRmLFqcHnwp9iU
         nAvY1+LGrRe62U5yW2a3RvtABeK2wEfY0l5BQuUtnbufU3M1LroavSZBQYqhJ6aEVSz6
         1U704GemXNzZNywpoPeMf9rEMICrNRQ29Y5gEf/e8bUCVBY+YLc3xgxY81oQUegNwvxx
         adEg==
X-Gm-Message-State: AOJu0Yxw0w8AXku2hTuLPbDsgFyEcA3nnXt6Ydmtm58x4tew29gbkGG5
	4q8vdGlVpTS0cr9jkteT+4HVgP8vnRsNy6j59VVMOpACiJMoaKbA8aN8vcFhc7Tfz1A+Gzf5k1o
	ssVK28vgxIZOGE/I4GTWcP+YMtqk+TSWEDT3hkOSp4igJIuM67VmSYM7taJ424hsQq55NcAA=
X-Received: by 2002:a17:906:48d8:b0:a6f:668b:3442 with SMTP id a640c23a62f3a-a7242d2ab06mr311820766b.77.1719228851839;
        Mon, 24 Jun 2024 04:34:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlN0JEAc1iattWsBfIJf9JXqX97F0IQkD4Cdeaw+2W32s/U+v/dzqJK63jJU+jnLYtVIwVCA==
X-Received: by 2002:a17:906:48d8:b0:a6f:668b:3442 with SMTP id a640c23a62f3a-a7242d2ab06mr311818866b.77.1719228851413;
        Mon, 24 Jun 2024 04:34:11 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72613d05c4sm21278866b.171.2024.06.24.04.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 04:34:11 -0700 (PDT)
Message-ID: <b53b9b5f-7cd5-46bb-ac53-7436a8715972@redhat.com>
Date: Mon, 24 Jun 2024 13:34:10 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel: add missing MODULE_DESCRIPTION()
 macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Alex Hung <alexhung@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>, AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240611-md-drivers-platform-x86-intel-v1-1-5ed967425b04@quicinc.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240611-md-drivers-platform-x86-intel-v1-1-5ed967425b04@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/12/24 6:56 AM, Jeff Johnson wrote:
> With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/pmc/intel_pmc_core_pltdrv.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/intel-hid.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/intel-vbtn.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/intel-rst.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/intel-smartconnect.o
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
>  drivers/platform/x86/intel/hid.c          | 1 +
>  drivers/platform/x86/intel/pmc/pltdrv.c   | 1 +
>  drivers/platform/x86/intel/rst.c          | 1 +
>  drivers/platform/x86/intel/smartconnect.c | 1 +
>  drivers/platform/x86/intel/vbtn.c         | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index c7a827645864..10cd65497cc1 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -38,6 +38,7 @@ MODULE_PARM_DESC(enable_sw_tablet_mode,
>  /* When NOT in tablet mode, VGBS returns with the flag 0x40 */
>  #define TABLET_MODE_FLAG BIT(6)
>  
> +MODULE_DESCRIPTION("Intel HID Event hotkey driver");
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Alex Hung");
>  
> diff --git a/drivers/platform/x86/intel/pmc/pltdrv.c b/drivers/platform/x86/intel/pmc/pltdrv.c
> index ddfba38c2104..f2cb87dc2d37 100644
> --- a/drivers/platform/x86/intel/pmc/pltdrv.c
> +++ b/drivers/platform/x86/intel/pmc/pltdrv.c
> @@ -86,4 +86,5 @@ static void __exit pmc_core_platform_exit(void)
>  
>  module_init(pmc_core_platform_init);
>  module_exit(pmc_core_platform_exit);
> +MODULE_DESCRIPTION("Intel PMC Core platform driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/platform/x86/intel/rst.c b/drivers/platform/x86/intel/rst.c
> index 6bc9c4a603e0..f3a60e14d4c1 100644
> --- a/drivers/platform/x86/intel/rst.c
> +++ b/drivers/platform/x86/intel/rst.c
> @@ -7,6 +7,7 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  
> +MODULE_DESCRIPTION("Intel Rapid Start Technology Driver");
>  MODULE_LICENSE("GPL");
>  
>  static ssize_t irst_show_wakeup_events(struct device *dev,
> diff --git a/drivers/platform/x86/intel/smartconnect.c b/drivers/platform/x86/intel/smartconnect.c
> index cd25d0585324..31019a1a6d5e 100644
> --- a/drivers/platform/x86/intel/smartconnect.c
> +++ b/drivers/platform/x86/intel/smartconnect.c
> @@ -6,6 +6,7 @@
>  #include <linux/acpi.h>
>  #include <linux/module.h>
>  
> +MODULE_DESCRIPTION("Intel Smart Connect disabling driver");
>  MODULE_LICENSE("GPL");
>  
>  static int smartconnect_acpi_init(struct acpi_device *acpi)
> diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
> index 84c1353eb12b..9b7ce03ba085 100644
> --- a/drivers/platform/x86/intel/vbtn.c
> +++ b/drivers/platform/x86/intel/vbtn.c
> @@ -24,6 +24,7 @@
>  
>  #define VGBS_TABLET_MODE_FLAGS (VGBS_TABLET_MODE_FLAG | VGBS_TABLET_MODE_FLAG_ALT)
>  
> +MODULE_DESCRIPTION("Intel Virtual Button driver");
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("AceLan Kao");
>  
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240611-md-drivers-platform-x86-intel-16fa0454fe2b
> 

