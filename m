Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097E75338D
	for <platform-driver-x86@vger.kernel.org>; Sat,  5 Oct 2024 22:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728166171; cv=none; b=AGJKW7+bnQhLn5WjZWS1CKe9MPdj2ZQxhfXCsPEHHWy88AjLrwD+tdKQeDPU55nc+YOL4pkPdJNDhOhfBmOa/Xyyj+RVNKVwXoV1SH3OASRq+f0j38fgPCJkJZWWh/bydQfEE7DxgK7yNFPG/0W7TOiVZgLiXt1vp95+njqPt8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728166171; c=relaxed/simple;
	bh=LS+KZisFk5xKZjrebXQHneD9o0BSI4ajCpraT8FDljs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGB36yG5yoOEYgl04aTGK3zd9pYPHhtDtWwLjJVZ9k3lywJfqZy4bynL7ks7e3ERj+gu0QOnrYGtXtGwrr8pmCz4lPqu4Gj/NPynKHEEJRCwJvm1CaHvETRv4tyutjCUDXJep1Z6HNx73/Daa4PvK+Nq6tEyszdsogalSaN9kX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hbf3IDw0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hbf3IDw0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728166168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bmc4eKt3IzzzHnIUDnEsxnb2MHlk0H/XV5WrxntFJL4=;
	b=Hbf3IDw0VJ2btu6Pr6HTRNjO/Nr8MbHC1KB8z6VnmLvwE9fGMq+3V+Kov3dTh2u/Pwd73z
	CKIW8WmYG9i+8LPvo5f6Xvhc8mY1dwiKbYVNi10KdVRhweGPjMvqb9cmC7jPLQ3nNmF9jb
	AJ/oAuiUwHtptcEijFAMIKhDX4OHgCo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-VRa_IVyUM0ih3JnDolEL-Q-1; Sat, 05 Oct 2024 18:09:27 -0400
X-MC-Unique: VRa_IVyUM0ih3JnDolEL-Q-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5c883ccaf4cso1425371a12.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Oct 2024 15:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728166166; x=1728770966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bmc4eKt3IzzzHnIUDnEsxnb2MHlk0H/XV5WrxntFJL4=;
        b=p9ZIwAPXNFQPPqyG9Fg71z1k+HV8W7OD9oIka2KYyhDn21Vjw6ou4bSZCmUhkV8lZI
         w/xdMalPiizWlYE+u++U5pv9/iFgoyuGxqiN5Vgyv/AIPJsXnkUakdV1KUVU35LTZp53
         Yw2tByp7VHNqr96EILJ1E5BsbOL0tr9HXLQG96Uvy/6HJrUuVA5qSfG2Ne4uINEhQ8qC
         NMAke2Ty5RaKw78k7KY8ACW0GSSSaQWC+NqTdYG3e7l2G1cdboGAfcd0saGAN7srKFFY
         qAwzoBvMab34CmhcjWKBDWd/6xJAkGekRFXcp4ekSsYW5h7siPjtVl2jn8Mnm1DgMdgM
         EkXA==
X-Forwarded-Encrypted: i=1; AJvYcCWtpw/psTwOxCdf7i7hDGhBvRaU97de88pGCnNoldNmVMzAzLdbzBDLUk23IIcIjs32/9OOyc9diMRupgh78NSHBQqS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5f0SHQ/TlZmTR4Q7IWxY5PTJueV9MgwFjxLXz95aV5tTUI2f2
	t9dTv3n5RwFWMo7cDgegIkYxnuGmQg3Df1As+zLytmFp+jpb+bkRXaK2wjnXV2kvt0gIOW+1bJZ
	ngpumQPd1Qhy+I9/sHySGkyP4eab97MLQ3/y/ivyzXC/nckY4UPtTrTgwZja2YayHywRN5dU=
X-Received: by 2002:a05:6402:1e96:b0:5c5:b7fd:170a with SMTP id 4fb4d7f45d1cf-5c8d2e9fb61mr11362382a12.28.1728166166278;
        Sat, 05 Oct 2024 15:09:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3DD/7twFA7T0eYtcp0y60FKk2up32WZ7WjCj1218CtMQTkTvBFF45En5jwj5GxiwBL38YSg==
X-Received: by 2002:a05:6402:1e96:b0:5c5:b7fd:170a with SMTP id 4fb4d7f45d1cf-5c8d2e9fb61mr11362343a12.28.1728166165768;
        Sat, 05 Oct 2024 15:09:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05ac22fsm1407214a12.38.2024.10.05.15.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 15:09:24 -0700 (PDT)
Message-ID: <dedcc48b-73a5-419d-b8b7-7d71453f2b2a@redhat.com>
Date: Sun, 6 Oct 2024 00:09:23 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v9 08/11] platform/x86/amd/hsmp: Create separate ACPI, plat and
 common drivers
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20241003111515.2955700-1-suma.hegde@amd.com>
 <20241003111515.2955700-8-suma.hegde@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241003111515.2955700-8-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Suma,

On 3-Oct-24 1:15 PM, Suma Hegde wrote:
> Separate the probes for HSMP ACPI and platform device drivers.
> 
> Provide a Kconfig option to choose between ACPI or the platform device
> based driver. The common code which is the core part of the HSMP driver
> maintained at hsmp.c is guarded by AMD_HSMP config and is selected by
> these two driver configs. This will be built into separate hsmp_common.ko
> module and acpi as hsmp_acpi and plat as amd_hsmp respectively.
> 
> Also add "|| COMPILE_TEST" clause in Kconfig to get build coverage for
> HSMP.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v8:
> Removed unused hsmp_fops structure definition.
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410021345.okdVjjGy-lkp@intel.com/
> 
> Changes since v7:
> 1. Commit description is updated.
> 2. Makefile is updated to create 3 modules, hsmp_common, hsmp_acpi, amd_hsmp.
> 3. hsmp.c is modified to make it as a module and functions used by acpi.c and plat.c
>    are made as export symbols (hsmp_test(), hsmp_cache_proto_ver() etc).
> 4. "depends on AMD_HSMP_ACPI=n" is removed from Kconfig.
> 5. Documentation is updated to reflect new changes.
> 6. amd_hsmp.h is modified to remove  IS_ENABLED(CONFIG_AMD_HSMP_ACPI).

Thank you for the new version, the way the split is done now looks
good to me.

One small remark below (I have not done a full review only checked
the Kconfig / Makefile bits) :

<snip>

> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
> index b55d4ed9bceb..dc64b5b1165c 100644
> --- a/drivers/platform/x86/amd/hsmp/Kconfig
> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
> @@ -4,14 +4,44 @@
>  #
>  
>  config AMD_HSMP
> -	tristate "AMD HSMP Driver"
> -	depends on AMD_NB && X86_64 && ACPI
> +	tristate
> +
> +menu "AMD HSMP Driver"
> +	depends on AMD_NB || COMPILE_TEST
> +
> +config AMD_HSMP_ACPI
> +	tristate "AMD HSMP ACPI device driver"
> +	depends on ACPI
> +	select AMD_HSMP
>  	help
> +	  Host System Management Port (HSMP) interface is a mailbox interface
> +	  between the x86 core and the System Management Unit (SMU) firmware.
>  	  The driver provides a way for user space tools to monitor and manage
> -	  system management functionality on EPYC server CPUs from AMD.
> +	  system management functionality on EPYC and MI300A server CPUs
> +	  from AMD.
> +
> +	  This option supports ACPI based probing.
> +	  You may enable this, if your platform BIOS provides an ACPI object
> +	  as described in amd_hsmp.rst document.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called amd_hsmp.

This last line should be: "called hsmp_acpi.".

> +config AMD_HSMP_PLAT
> +	tristate "AMD HSMP platform device driver"
> +	select AMD_HSMP
> +	help
>  	  Host System Management Port (HSMP) interface is a mailbox interface
>  	  between the x86 core and the System Management Unit (SMU) firmware.
> +	  The driver provides a way for user space tools to monitor and manage
> +	  system management functionality on EPYC and MI300A server CPUs
> +	  from AMD.
> +
> +	  This option supports platform device based probing.
> +	  You may enable this, if your platform BIOS does not provide
> +	  HSMP ACPI object.
>  
>  	  If you choose to compile this driver as a module the module will be
>  	  called amd_hsmp.
> +
> +endmenu
> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
> index 0cc92865c0a2..3175d8885e87 100644
> --- a/drivers/platform/x86/amd/hsmp/Makefile
> +++ b/drivers/platform/x86/amd/hsmp/Makefile
> @@ -4,5 +4,9 @@
>  # AMD HSMP Driver
>  #
>  
> -obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
> -amd_hsmp-objs			:= hsmp.o plat.o acpi.o
> +obj-$(CONFIG_AMD_HSMP)			+= hsmp_common.o
> +hsmp_common-objs			:= hsmp.o
> +obj-$(CONFIG_AMD_HSMP_PLAT)		+= amd_hsmp.o
> +amd_hsmp-objs				:= plat.o
> +obj-$(CONFIG_AMD_HSMP_ACPI)		+= hsmp_acpi.o
> +hsmp_acpi-objs				:= acpi.o

Regards,

Hans


