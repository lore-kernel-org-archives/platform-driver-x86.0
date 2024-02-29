Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19D06CC0D
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 17:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709227245; cv=none; b=TUzLy/HGi5NDKXxGG6DhpAGpNZEIXIYIRnNL5AFFHOy/KH6AA5Q2SAJUmlncajfOnNhRFZVrtEBQWGPDeXMTpLn24jakG5wOyPLjIhAux+zv2ev+daJKwzNTahgMIpwdCLL/0b5IewSHD91/B5Z6SpPk9DLzmbEN2lKgClufgro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709227245; c=relaxed/simple;
	bh=QddnZdwwLCuNca55VsjSyvUS4WUJfFDy/ahR3qYbcK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BeKF6+oymis3dfTpW3aIC3EYJNlgoMmzTgEzeq0srJigNCv3MVazHNJfqiD6oSFK4BcDlv+TXt14HNzCkLZ8pMBqTAV0t5KwAa0gvF7nWNWpjREI7UHy4GeOOnkQjBtjcG5KausC33h+VIwjKN3rvuh/vjSYui0xfzpeA28mueQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIcmexKq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIcmexKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709227244; x=1740763244;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QddnZdwwLCuNca55VsjSyvUS4WUJfFDy/ahR3qYbcK0=;
  b=dIcmexKqdVbXpKT86NBFzXrxoo2rLWzbpNJR6GP7Rozbw4Y9hmSnpsGb
   6dDNGx0izDmkQEYawruOCJu2AYWg0RUCKqAVosASBno8WZRXJ1+TX1NyA
   6dEoPLYrWaBqNtliyFvAwDwcW8wyevmA0K9v8Or//uXv4h011GBVdfdqE
   PlHWIdWWNF254LJ5sMZCQP4q2crKHW7AqhFlNBCm+3CB7WEfr8XFZxulB
   gPa7n3u1yIzR79UsT55yin19mphGj+eDmDoD9tRcwoJXKaV1MCCCPSTCA
   qzz1qWkriMAoP+Yv1zQkxAfcYjuIXEk9/gqlxzc7GsnjZ+n3TwXz8oC8d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14867081"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="14867081"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 09:20:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="31083357"
Received: from gditter-mobl1.amr.corp.intel.com (HELO [10.209.51.74]) ([10.209.51.74])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 09:20:42 -0800
Message-ID: <0170de36-bdc1-484d-bfaf-2f10dee757e7@linux.intel.com>
Date: Thu, 29 Feb 2024 09:20:41 -0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 2/7] platform/x86/amd/pmf: Disable debugfs
 support for querying power thermals
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20240229105901.455467-1-Shyam-sundar.S-k@amd.com>
 <20240229105901.455467-3-Shyam-sundar.S-k@amd.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240229105901.455467-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2/29/24 2:58 AM, Shyam Sundar S K wrote:
> The GET interface to receive the active power thermal information from
> the PMFW has been depricated. Hence drop the debugfs support from
> version2 onwards.
>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---

Looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>  drivers/platform/x86/amd/pmf/core.c | 5 +++--
>  drivers/platform/x86/amd/pmf/pmf.h  | 2 ++
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 4f734e049f4a..2230bc2b1f59 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -113,8 +113,9 @@ static void amd_pmf_dbgfs_unregister(struct amd_pmf_dev *dev)
>  static void amd_pmf_dbgfs_register(struct amd_pmf_dev *dev)
>  {
>  	dev->dbgfs_dir = debugfs_create_dir("amd_pmf", NULL);
> -	debugfs_create_file("current_power_limits", 0644, dev->dbgfs_dir, dev,
> -			    &current_power_limits_fops);
> +	if (dev->pmf_if_version == PMF_IF_V1)
> +		debugfs_create_file("current_power_limits", 0644, dev->dbgfs_dir, dev,
> +				    &current_power_limits_fops);
>  }
>  
>  int amd_pmf_get_power_source(void)
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index e51ac981af73..4364af72a7a3 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -83,6 +83,8 @@
>  #define TA_OUTPUT_RESERVED_MEM				906
>  #define MAX_OPERATION_PARAMS					4
>  
> +#define PMF_IF_V1		1
> +
>  /* AMD PMF BIOS interfaces */
>  struct apmf_verify_interface {
>  	u16 size;

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

