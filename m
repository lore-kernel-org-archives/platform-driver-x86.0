Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1D0146007
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Feb 2024 15:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709049345; cv=none; b=uh01VaKcPGJfSmhuOiOu0nX8EDkT2OwZb4Uxi6L2LV+RHVK1p5knCZ7B1bUcb7g2ZmG6LKRGkF/tMaJy8/+m2WNZixQyPmQT4kupdipaX1z574mmp7MMX6nD17/NOAVDhL0A+zbl0LqfcJzc7U67bpxpsJ9OJUE4PQ3jvykjwAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709049345; c=relaxed/simple;
	bh=ltKFc37okwoJ8SnQbYsOJ4FjQaMyRyRDQ3XuT/7lXUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FC8b5k9/QJ23pA5jKmwKNxuQns9Fb/uwHo3ARJK5k2+zjDJXJ9qNdMFJ0F+rOGrynd4gahspzXInK+KU1e02LptSZBphBTd9EA8zmteeW5EkFnNanVdSvl8Er0/eQhs1wgy0FnVPuLXaZsLZmOuWDy718zkqT6FTPKky1wS0wxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JowMD8pk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JowMD8pk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709049344; x=1740585344;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ltKFc37okwoJ8SnQbYsOJ4FjQaMyRyRDQ3XuT/7lXUY=;
  b=JowMD8pkwggDHOEdDMzBizJ4hAVux+oE1d8Qbv+Y0Tt4Giq57LLwcr6e
   ufXfirBlxeFWVrVQfCG0PQaLAbNEGexH366wsUXwyz784iKGlVqNOPRJ9
   X9e/cJsN9T9BUAHJewgjBf8qJSuY4EljDia5LtUYyxiRXeeyuGVClBhyE
   bqJKewn1szYBsTAA7KavG+md5z3+4FGXNqsII4+N5RRHzuWE9GUpk7T9T
   eWYjTK2oVMklYqBwk/dXrGQbVgsYbqDZA0fhLS/oO0ayAGPv1l8al21VR
   txeJMyUTJTWsXetswyZQ1Ttgre8dRkXetLYtjh3PRW53Y1OGWUO0pIQc6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3239329"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="3239329"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 07:55:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="7126467"
Received: from dschro4x-mobl.amr.corp.intel.com (HELO [10.212.137.190]) ([10.212.137.190])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 07:55:43 -0800
Message-ID: <ffa12009-1c12-41f9-ab3b-af9b2c21688f@linux.intel.com>
Date: Tue, 27 Feb 2024 07:55:42 -0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] platform/x86/amd/pmf: Disable debugfs support for
 querying power thermals
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
 <20240227125520.3153140-3-Shyam-sundar.S-k@amd.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240227125520.3153140-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2/27/24 4:55 AM, Shyam Sundar S K wrote:
> The GET interface to receive the active power thermal information from
> the PMFW has been depricated. Hence drop the debugfs support for the
> newer platforms.

Instead of "newer platforms", I recommend to use version numbers.

IIUC, you don't want to expose it for ver > 1.

>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
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

