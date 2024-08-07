Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D400B2AF10
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Aug 2024 14:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723040272; cv=none; b=Jh/d08283sYCqoRtwpvCh2OLcGKhg34983VzslyoVDB6JWib4eaL+G3CfvwPxBgl9AuSkGs+pX5vhRPoCEAEfK0jbRD3urws1MmdoPt8rkvOpaeVGIJA/T1AqCN8I0m8HemOQtE1aILmCEeGGhpchadYrwD9Ok/ZyPf8QJeA054=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723040272; c=relaxed/simple;
	bh=lAe6V/2M5ZRD7bI5SX//kXKDgHqvbMltgNxeGhN6YyE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=I3mLccc9caP1DFzeGCsrZbsFwj3ynDODGIuAi/KvfjTbdmKzlj/jOyUFz40q6lE9AQVNs6nUmH5/i7zuPc4AA97E9PL+vUmtBz0aJGaTQa+HPMh9csp8xIYP69ha+sRuUPdHMC+1Putz72ZB4vqdm5LL9Jo1kWoPjykcRcuvh34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+gc8twu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+gc8twu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723040271; x=1754576271;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lAe6V/2M5ZRD7bI5SX//kXKDgHqvbMltgNxeGhN6YyE=;
  b=k+gc8twuS5y8akbzFk6wBg2RzhhUMyBCvSNbzKq1n7+d3+yXTbHiY/pn
   w2uB/QEqsnXwK7vbC6R/H7QsoaZwU44IEOnpYFjxjonbcD1Jco7gzjzNp
   6CB86gSDYoUFG5SBRlb5Ox84tnpuF8wgNJNVqfBuE/aZG7YaztLwoCsBZ
   tFtIrVhbEhYBCSisaV7uqUA11r0+xppSHTocQ/USfWnofnHrJ7+4q9RC6
   Nshz40HGAtZoQiDd2pzgDtJ69+8gicpsH46gddT0VCMcLNBHxvPF1EKhU
   eG9osY0yy20XNlFCOlkYgCslZW4GvB2imMB/0GFbUbqKYovDxB3VReI34
   Q==;
X-CSE-ConnectionGUID: /Dobx/KKRDmrTG6ER3YN9Q==
X-CSE-MsgGUID: Z2CSUhAjTPujUJt5wWKnNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24876650"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="24876650"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 07:17:50 -0700
X-CSE-ConnectionGUID: BPv/cYkuRfCBPA7y/rbUjQ==
X-CSE-MsgGUID: /l7WSxBURA2qp2HTZwnSPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="61812057"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 07:17:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 7 Aug 2024 17:17:45 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v3 07/11] platform/x86/amd/hsmp: Create mutually exclusive ACPI
 and plat drivers
In-Reply-To: <20240720174552.946255-7-suma.hegde@amd.com>
Message-ID: <79261dbf-f1b8-c357-3a03-d8c9f99b45a6@linux.intel.com>
References: <20240720174552.946255-1-suma.hegde@amd.com> <20240720174552.946255-7-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 20 Jul 2024, Suma Hegde wrote:

> Separate the probes for ACPI and platform device drivers.
> Provide a Kconfig option to select either the
> ACPI or the platform device based driver.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v2:
> Following files are modified to add new symbol
>  - drivers/platform/x86/amd/hsmp/Kconfig, 
>  - drivers/platform/x86/amd/hsmp/Makefile
>  - drivers/platform/x86/amd/Makefile
> AMD_HSMP is used as common symbol and new AMD_HSMP_PLAT symbol is added
> 
> Changes since v1:
> Rename "plat_dev" to "hsmp_pdev"
> 
>  arch/x86/include/asm/amd_hsmp.h        |   2 +-
>  drivers/platform/x86/amd/Makefile      |   2 +-
>  drivers/platform/x86/amd/hsmp/Kconfig  |  33 ++++++-
>  drivers/platform/x86/amd/hsmp/Makefile |   6 +-
>  drivers/platform/x86/amd/hsmp/acpi.c   | 119 ++++++++++++++++++++++--
>  drivers/platform/x86/amd/hsmp/hsmp.c   |  25 ++---
>  drivers/platform/x86/amd/hsmp/hsmp.h   |   8 +-
>  drivers/platform/x86/amd/hsmp/plat.c   | 122 +++++++------------------
>  8 files changed, 188 insertions(+), 129 deletions(-)
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
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> index 96ec24c8701b..f0b2fe81c685 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -5,6 +5,6 @@
>  #
>  
>  obj-$(CONFIG_AMD_PMC)		+= pmc/
> -obj-y				+= hsmp/
> +obj-$(CONFIG_AMD_HSMP)		+= hsmp/
>  obj-$(CONFIG_AMD_PMF)		+= pmf/
>  obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
> index b55d4ed9bceb..23fb98066225 100644
> --- a/drivers/platform/x86/amd/hsmp/Kconfig
> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
> @@ -4,14 +4,39 @@
>  #
>  
>  config AMD_HSMP
> -	tristate "AMD HSMP Driver"
> -	depends on AMD_NB && X86_64 && ACPI
> +	tristate "AMD Host System Management Port driver"
> +	depends on AMD_NB
>  	help
> +	  Host System Management Port (HSMP) interface is a mailbox interface
> +	  between the x86 core and the System Management Unit (SMU) firmware.
>  	  The driver provides a way for user space tools to monitor and manage
>  	  system management functionality on EPYC server CPUs from AMD.
>  
> -	  Host System Management Port (HSMP) interface is a mailbox interface
> -	  between the x86 core and the System Management Unit (SMU) firmware.
> +menu "AMD HSMP Probe"
> +	depends on AMD_HSMP
> +
> +config AMD_HSMP_ACPI
> +	tristate "ACPI based probe"
> +	depends on ACPI
> +	help
> +	  This driver supports ACPI based probing.
> +
> +	  You may enable this, if your platform bios provides an ACPI object
> +	  as described in the documentation.
>  
>  	  If you choose to compile this driver as a module the module will be
>  	  called amd_hsmp.
> +
> +config AMD_HSMP_PLAT
> +	tristate "Platform device based probe"
> +	depends on AMD_HSMP_ACPI=n
> +	help
> +	  This driver supports platform device based probing.
> +
> +	  You may enable this, if your platform bios does not provide
> +	  HSMP ACPI object.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called amd_hsmp.
> +

One additional point, please also make sure it gets compiled if 
COMPILE_TEST is set regardless of e.g. AMD_NB to get better 
compile coverage.

-- 
 i.

