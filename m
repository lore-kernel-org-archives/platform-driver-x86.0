Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33BC5CDE9
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 10:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720692231; cv=none; b=A6jzK2BGOs96uZ2faI1kQ5XREdZdvr2qs8DXUZuiO8GtkqwQJokcPTMWu6+yyHeKL4R0RY+A0KpIJEIOl44GiAPw/uwPEYkdxZDCYpMjxqoxMIe4kGuTZUWdwAvZVjumythi2jKpC9vUkgiAVUxSRoLFwcHLuSqb3+O/LxiefTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720692231; c=relaxed/simple;
	bh=QONdmRWAEeFIWi3mVvPO3BBfbhRybmvkj2i03hP42x8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mKd8waV1rva21ljxxZM9rqOi4VzMOEq0f0T7cUipb+fNea6+ZMHe6vkVvw1Jn2FyJaFSNz7jg1ERCHm6c361ghbvmY/jWH0muhST4ch7vPSycqBKmj0BS6qGNCO5EydA0epOoabKzeU54ipd9TEx+eBmfe7xsut13mQ4acSNbU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/tp9qhf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/tp9qhf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720692230; x=1752228230;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=QONdmRWAEeFIWi3mVvPO3BBfbhRybmvkj2i03hP42x8=;
  b=K/tp9qhfN0fjyQcVQ3C5H776Uf6EZooeFGQTOyvhh6/+jV36n/h+GwAO
   va+krBFs2w4bOvRxcvnGx1lDmlE7AaVIvCAeQuY+bdMnmmpireNqNAw6S
   7EqdwQuJKPPkyoFeRUezIR2rN96r0aZjZBD208W33mmvhIqd4VdSVMsT4
   FktXAKNhNLPxhSXj4c4W4kQjL76B5odDAQzFENDqnp52zTBod3cBDDHzN
   60tBCWv7PYg39wfjXYZdRbd1n71m9VPVMYphmVJKLwfP7Ka9dbIo9TTw9
   lcrZP1JU8PeX8o+hTl8Pnfwb1+S3VZ/ejlOn7oDNaC8GGfdUozPef9DeV
   Q==;
X-CSE-ConnectionGUID: nHZ2uaG8T5GTMpbaftfh+Q==
X-CSE-MsgGUID: AXA+ZIaLRKWfqva9v1AeFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="35600037"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="35600037"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 03:02:36 -0700
X-CSE-ConnectionGUID: YER5shauQLKdBX9H6vwCNA==
X-CSE-MsgGUID: xnDYKcI/Q2C9r5aZJ6WkyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="79638544"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.127])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 03:02:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 11 Jul 2024 13:02:30 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v2 07/11] platform/x86/amd/hsmp: Create mutually exclusive ACPI
 and plat drivers
In-Reply-To: <20240711073314.2704871-7-suma.hegde@amd.com>
Message-ID: <4bb0600e-06b4-5f59-7aa3-9bc65f1698b4@linux.intel.com>
References: <20240711073314.2704871-1-suma.hegde@amd.com> <20240711073314.2704871-7-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 11 Jul 2024, Suma Hegde wrote:

> Separate the probes for ACPI and platform device drivers.
> Provide a Kconfig option to select either the
> ACPI or the platform device based driver.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v1:
> Rename "plat_dev" to "hsmp_pdev"
> 
>  arch/x86/include/asm/amd_hsmp.h        |   2 +-
>  drivers/platform/x86/amd/hsmp/Kconfig  |  25 ++++-
>  drivers/platform/x86/amd/hsmp/Makefile |  10 +-
>  drivers/platform/x86/amd/hsmp/acpi.c   | 119 ++++++++++++++++++++++--
>  drivers/platform/x86/amd/hsmp/hsmp.c   |  25 ++---
>  drivers/platform/x86/amd/hsmp/hsmp.h   |   8 +-
>  drivers/platform/x86/amd/hsmp/plat.c   | 122 +++++++------------------
>  7 files changed, 186 insertions(+), 125 deletions(-)
> 
> diff --git a/arch/x86/include/asm/amd_hsmp.h b/arch/x86/include/asm/amd_hsmp.h
> index 03c2ce3edaf5..ada14e55f9f4 100644
> --- a/arch/x86/include/asm/amd_hsmp.h
> +++ b/arch/x86/include/asm/amd_hsmp.h
> @@ -5,7 +5,7 @@
>  
>  #include <uapi/asm/amd_hsmp.h>
>  
> -#if IS_ENABLED(CONFIG_AMD_HSMP)
> +#if IS_ENABLED(CONFIG_AMD_HSMP) || IS_ENABLED(CONFIG_AMD_HSMP_ACPI)
>  int hsmp_send_message(struct hsmp_message *msg);
>  #else
>  static inline int hsmp_send_message(struct hsmp_message *msg)
> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
> index b55d4ed9bceb..15888a89581a 100644
> --- a/drivers/platform/x86/amd/hsmp/Kconfig
> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
> @@ -3,9 +3,30 @@
>  # AMD HSMP Driver
>  #
>  
> +menu "AMD Host System Management Port driver"
> +	depends on AMD_NB
> +
> +config AMD_HSMP_ACPI
> +	tristate "AMD HSMP ACPI driver"
> +	depends on ACPI
> +	help
> +	  The driver provides a way for user space tools to monitor and manage
> +	  system management functionality on EPYC server CPUs from AMD.
> +
> +	  Host System Management Port (HSMP) interface is a mailbox interface
> +	  between the x86 core and the System Management Unit (SMU) firmware.
> +
> +	  This driver supports ACPI based probing.
> +
> +	  You  may enable this, if your platform bios provides an ACPI object
> +	  as described in the documentation.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called amd_hsmp.
> +
>  config AMD_HSMP
>  	tristate "AMD HSMP Driver"
> -	depends on AMD_NB && X86_64 && ACPI
> +	depends on AMD_HSMP_ACPI=n
>  	help
>  	  The driver provides a way for user space tools to monitor and manage
>  	  system management functionality on EPYC server CPUs from AMD.
> @@ -15,3 +36,5 @@ config AMD_HSMP
>  
>  	  If you choose to compile this driver as a module the module will be
>  	  called amd_hsmp.
> +
> +endmenu
> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
> index 0cc92865c0a2..53ebc462b0f9 100644
> --- a/drivers/platform/x86/amd/hsmp/Makefile
> +++ b/drivers/platform/x86/amd/hsmp/Makefile
> @@ -4,5 +4,11 @@
>  # AMD HSMP Driver
>  #
>  
> -obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
> -amd_hsmp-objs			:= hsmp.o plat.o acpi.o
> +ifneq ($(CONFIG_AMD_HSMP), )
> +obj-$(CONFIG_AMD_HSMP)          += amd_hsmp.o
> +amd_hsmp-objs = hsmp.o plat.o
> +endif
> +ifneq ($(CONFIG_AMD_HSMP_ACPI), )
> +obj-$(CONFIG_AMD_HSMP_ACPI)     += amd_hsmp.o
> +amd_hsmp-objs = hsmp.o acpi.o
> +endif

I still don't agree with this approach. You can add another config for the 
hsmp core and select it, and it will work with the existing configs when 
they're properly run through make oldconfig or olddefconfig before 
building.

-- 
 i.

