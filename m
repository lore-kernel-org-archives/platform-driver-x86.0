Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAD92E175F;
	Tue, 18 Aug 2026 13:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058209; cv=none; b=E7T+HKk0m7dLvLHr/WaIbKlHyhhMPQtPyJEKvqOkCphzL04PQMkBOZTPuREycRLLLzYZWdHpHH3aIoWc+kz7eOBTb66JQVMDtI2m+0wTlQH+EO+RuxU1mtt3Q5P6FnIEasDQ4pMbx54AMLpsljlDikGmprjlUL7t+7j4Y/Aeka4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058209; c=relaxed/simple;
	bh=07g9W6ppxqZepjErZR6fncpo5KfHYS+3fliqMUG+vuU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hc8AUrzDgg1nIhrryshbmGEV+AJaO3alXBAuRajSTqC8Bb7P6OhMCLaYETAf59PQa/XLBzPvv8ar4mVBWTSkbPuOMEnip3mUsIsfA7JyK1NxwfAY2t8TFEeDieKdm3Yles/2jrPcXnla//smXriBlwtiAgjSWpnkdaNRqJ0MrWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRFepc6p; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRFepc6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787058207; x=1818594207;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=07g9W6ppxqZepjErZR6fncpo5KfHYS+3fliqMUG+vuU=;
  b=iRFepc6pdLPCFThjMHNmo5O9YII4rW/xdzmip+YbocrBsF5h4QooM6CN
   vplEJLz/GYA/8PqW1HLKwBkZsgXw6RAQhNiAviJMYUZ0R1SsmBSvnrwM2
   vkBsADbVsW84HDuyhrAiWl/imY9XDKuX0vL/h6YFwPt8ICzhVg/FMQZwt
   9wU+aJSF86QQKia7hW0yAE367p0rhuz7U1jbeaZWlK8lyswKcEJBff6hW
   ORZ7i7AIcmHHLOtFWgbfFqeNPWNjzTCRa+krmyBPtm6xQBdGY9qW1+CgV
   r6GMTcMsZ2mx5usoNNymGYvc9tokIpwtKdRctPw5f9yCJehIPavvZ1nqX
   Q==;
X-CSE-ConnectionGUID: 2F+KnfRbQnK6vxfvNHAdUw==
X-CSE-MsgGUID: wWdEcqHaS6Oa0ugZWD/2pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87671902"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87671902"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 06:03:26 -0700
X-CSE-ConnectionGUID: 9W3WNcx/Qpuf57LfEbdJMw==
X-CSE-MsgGUID: OUNbaOdCSdeDk1QdsE264A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261936119"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 06:03:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Aug 2026 16:03:20 +0300 (EEST)
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: ISST: Avoid model check for recent
 servers
In-Reply-To: <20260729180512.2048114-1-srinivas.pandruvada@linux.intel.com>
Message-ID: <9cbea11b-ef1c-cda5-8fdd-e9cff29612ff@linux.intel.com>
References: <20260729180512.2048114-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 29 Jul 2026, Srinivas Pandruvada wrote:

> To enable SST functions, a CPU model entry is required. This causes
> unnecessary delays in deploying new servers on older kernels.
> 
> To avoid this, if no CPU model match is found, allow the SST common
> driver to load, when all of the following conditions are met:
> 
> - Not running as a guest
> - The platform is identified as a server via ACPI PM profile
> - The CPU belongs to Intel family 0x19

Hi,

Sashiko notes this shouldn't be hex (and is contradicting with the code 
that uses decimal)? 

-- 
 i.


> - MSR 0x54 is present to retrieve the PM logical ID
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  .../intel/speed_select_if/isst_if_common.c    | 61 ++++++++++++++++++-
>  1 file changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> index 1c48bf6d5457..8b87dec2a4cd 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> @@ -7,6 +7,7 @@
>   * Author: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/cpufeature.h>
>  #include <linux/cpuhotplug.h>
>  #include <linux/fs.h>
> @@ -774,6 +775,58 @@ void isst_if_cdev_unregister(int device_type)
>  }
>  EXPORT_SYMBOL_GPL(isst_if_cdev_unregister);
>  
> +#ifdef CONFIG_ACPI
> +
> +static bool acpi_pm_profile_server(void)
> +{
> +	if (acpi_gbl_FADT.preferred_profile == PM_ENTERPRISE_SERVER ||
> +	    acpi_gbl_FADT.preferred_profile == PM_PERFORMANCE_SERVER)
> +		return true;
> +
> +	return false;
> +}
> +
> +#else
> +
> +static bool acpi_pm_profile_server(void)
> +{
> +	return false;
> +}
> +
> +#endif
> +
> +static const struct x86_cpu_id sst_allowed_families[] = {
> +	X86_MATCH_VENDOR_FAM(INTEL, 19, NULL),
> +	{}
> +};
> +
> +static bool isst_features_allowed(void)
> +{
> +	const struct x86_cpu_id *id;
> +	u64 data;
> +	int ret;
> +
> +	/* For hypervisors, explicit model addition is required */
> +	if (cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
> +		return false;
> +
> +	/* SST is server only feature */
> +	if (!acpi_pm_profile_server())
> +		return false;
> +
> +	/* Match for family 19 only */
> +	id = x86_match_cpu(sst_allowed_families);
> +	if (!id)
> +		return false;
> +
> +	/* Check for presence of MSR 0x54 */
> +	ret = rdmsrq_safe(MSR_PM_LOGICAL_ID, &data);
> +	if (ret)
> +		return false;
> +
> +	return true;
> +}
> +
>  #define SST_HPM_SUPPORTED	0x01
>  #define SST_MBOX_SUPPORTED	0x02
>  
> @@ -798,8 +851,13 @@ static int __init isst_if_common_init(void)
>  	const struct x86_cpu_id *id;
>  
>  	id = x86_match_cpu(isst_cpu_ids);
> -	if (!id)
> +	if (!id) {
> +		if (isst_features_allowed()) {
> +			isst_hpm_support = true;
> +			goto misc_reg;
> +		}
>  		return -ENODEV;
> +	}
>  
>  	if (id->driver_data == SST_HPM_SUPPORTED) {
>  		isst_hpm_support = true;
> @@ -812,6 +870,7 @@ static int __init isst_if_common_init(void)
>  			return -ENODEV;
>  	}
>  
> +misc_reg:
>  	return isst_misc_reg();
>  }
>  module_init(isst_if_common_init)
> 
