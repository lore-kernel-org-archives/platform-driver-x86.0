Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3E9215060
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 14:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937333; cv=none; b=qu6WLHuo/qJ6X5pWxjyJ4kUTugyYLOmoWjKkJgO5huIh/W8wczKcxSoJtIVZCbIoocWibDz0Zq0Qa3qdVjC/vmemr/MsQjkqtNkkj4TeOXjAKYijLJON+RuOsXr3bMWt4o0MIFv48jcOGAiA1kcT28E7fzojEoY70RtxWsRJOPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937333; c=relaxed/simple;
	bh=EzpFSqZDCh/9Anbs9RwFp2me8WvbJ4wiC5aLCMXXobc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YimUd0yfUNKohlHlxjkcHj2lRdzL2FVdyL8eDIwlevucUxoofzmDf+IB4PuxJoqLGG4h1WnFFP7jSQt422Gnj/G5jaj146NoRlJV+G2lsjiGFHZcNBvigDpuYjDbyyZDXGmCCTJdGAFcvDpXe1Pw6g9DzJ9myrnK9QxBRMYY2o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKiWgAuB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKiWgAuB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745937331; x=1777473331;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EzpFSqZDCh/9Anbs9RwFp2me8WvbJ4wiC5aLCMXXobc=;
  b=ZKiWgAuBX/TpvSyaJ6Zc5eAcC9mY6ctgRd3ogUBhMdmtdGUzlXj3vRWC
   aMLXw1fTjkw+4yOrUWjD/JsMBN1ckpSgofxjsbg6UR7gqWGCV/H0SkIEc
   C6cOf532/J1fdT3VqAZd4X253xqpwnnTFyIvqurwNrTUrWP/y0nC0vHZ9
   b5n58hF8KxRFhlI5LRzDh8SFGlxVhID88fhyNppUbz5oq0xt5BrtbiONv
   b63OIuXYdJC3HuX0YgpPuItcW3izmZo0oPPkVLwQL4Z1LCZrL0otV65dx
   Rxr7yI6f1dJEPM4fL0AlZbI0dTsCKKNnYw/vMu9BhZ4nV/qNOh6c+KORc
   A==;
X-CSE-ConnectionGUID: 2iMgLngDRjK6a4OjpOKfYg==
X-CSE-MsgGUID: Qq5ysbOFSw+IC/laCJ7qwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="72945615"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="72945615"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 07:35:30 -0700
X-CSE-ConnectionGUID: nclVC9m+S2aO8iBHiZ1zNA==
X-CSE-MsgGUID: +3OFpPCSTHq9zxNLznOjcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="164930336"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.205])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 07:35:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 29 Apr 2025 17:35:24 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>, Hans de Goede <hdegoede@redhat.com>
cc: platform-driver-x86@vger.kernel.org, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
    Gregory Price <gourry@gourry.net>
Subject: Re: [v2] platform/x86/amd/hsmp: Make amd_hsmp and hsmp_acpi as
 mutually exclusive drivers
In-Reply-To: <20250425102357.266790-1-suma.hegde@amd.com>
Message-ID: <b5e59360-0990-104a-f87c-6acd20dd6b74@linux.intel.com>
References: <20250425102357.266790-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Apr 2025, Suma Hegde wrote:

> amd_hsmp and hsmp_acpi are intended to be mutually exclusive drivers and
> amd_hsmp is for legacy platforms. To achieve this, it is essential to
> check for the presence of the ACPI device in plat.c. If the hsmp ACPI
> device entry is found, allow the hsmp_acpi driver to manage the hsmp
> and return an error from plat.c.
> 
> Additionally, rename the driver from amd_hsmp to hsmp_acpi to prevent
> "Driver 'amd_hsmp' is already registered, aborting..." error in case
> both drivers are loaded simultaneously.

This rename has userspace visible impact through sysfs, no? I'm just 
wondering what's the expected fallout once this patch goes to stable 
kernels?

-- 
 i.

> Also, support both platform device based and ACPI based probing for
> family 0x1A models 0x00 to 0x0F, implement only ACPI based probing
> for family 0x1A, models 0x10 to 0x1F. Return false from
> legacy_hsmp_support() for this platform.
> This aligns with the condition check in is_f1a_m0h().
> 
> Link: https://lore.kernel.org/platform-driver-x86/aALZxvHWmphNL1wa@gourry-fedora-PF4VCD3F/
> Fixes: 7d3135d16356 ("platform/x86/amd/hsmp: Create separate ACPI, plat and common drivers")
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Co-developed-by: Gregory Price <gourry@gourry.net>
> Signed-off-by: Gregory Price <gourry@gourry.net>
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> ---
> Changes since v1:
> 1. Change commit message and commit description
> 2. Merge below patch by Gregory Price into this
>    https://lore.kernel.org/platform-driver-x86/aALZxvHWmphNL1wa@gourry-fedora-PF4VCD3F/
> 
>  drivers/platform/x86/amd/hsmp/acpi.c | 3 +--
>  drivers/platform/x86/amd/hsmp/hsmp.h | 1 +
>  drivers/platform/x86/amd/hsmp/plat.c | 6 +++++-
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index c1eccb3c80c5..eaae044e4f82 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -27,9 +27,8 @@
>  
>  #include "hsmp.h"
>  
> -#define DRIVER_NAME		"amd_hsmp"
> +#define DRIVER_NAME		"hsmp_acpi"
>  #define DRIVER_VERSION		"2.3"
> -#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
>  
>  /* These are the strings specified in ACPI table */
>  #define MSG_IDOFF_STR		"MsgIdOffset"
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index af8b21f821d6..d58d4f0c20d5 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -23,6 +23,7 @@
>  
>  #define HSMP_CDEV_NAME		"hsmp_cdev"
>  #define HSMP_DEVNODE_NAME	"hsmp"
> +#define ACPI_HSMP_DEVICE_HID    "AMDI0097"
>  
>  struct hsmp_mbaddr_info {
>  	u32 base_addr;
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index b9782a078dbd..81931e808bbc 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -11,6 +11,7 @@
>  
>  #include <asm/amd_hsmp.h>
>  
> +#include <linux/acpi.h>
>  #include <linux/build_bug.h>
>  #include <linux/device.h>
>  #include <linux/module.h>
> @@ -266,7 +267,7 @@ static bool legacy_hsmp_support(void)
>  		}
>  	case 0x1A:
>  		switch (boot_cpu_data.x86_model) {
> -		case 0x00 ... 0x1F:
> +		case 0x00 ... 0x0F:
>  			return true;
>  		default:
>  			return false;
> @@ -288,6 +289,9 @@ static int __init hsmp_plt_init(void)
>  		return ret;
>  	}
>  
> +	if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1))
> +		return -ENODEV;
> +
>  	hsmp_pdev = get_hsmp_pdev();
>  	if (!hsmp_pdev)
>  		return -ENOMEM;
> 
