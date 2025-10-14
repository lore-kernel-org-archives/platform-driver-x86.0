Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D532951B3
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 19:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760470152; cv=none; b=FZSgnvYmYJxS1jMeWClPnv6J9i4BOozQjJQjFCsHNuISy4HG3zJnAQdjKBrkC3xHxxUvtDrqQ6rFLpnSFmY8ayexrhjw4FHxvqapjc5Kcjtg7518CZtRinUTQt7gWEM8SzlqR7/EzCGQXZDpj4EgjVAbTb9miNVReFrXoIT4oNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760470152; c=relaxed/simple;
	bh=vBfPzKgSZ0fy39F3irRjEFiGNRZZTYUkjdyb2waFAKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otdx7FMwONW0bEbIt45+jfvzuXNo8uolkMAfttdo/iMooDFZDedT66Q/5mXzEYUxM/lrLS5z/8XUwC19kCVbgx9dFs8GvFSZiT77/mNpjIHvApQFSNulB+TwBhAiP34tlTyO2HWkNi5DcFRlwys1wF99AFk0htPTM8BJVCVTBVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idtEA2Zh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idtEA2Zh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760470150; x=1792006150;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vBfPzKgSZ0fy39F3irRjEFiGNRZZTYUkjdyb2waFAKE=;
  b=idtEA2ZhiKASV4DXGWfprTSlHvtbD3OSq2UrdiD8YBj44mF14mqGiDIG
   +8d9RwxXF0oxRg7gl8UB0JHStjzqNpHy1l8F7T6AX9jqwF84XgPBc9BVF
   B0JwedQYc9e7+dqFJUEq8zlQbgU1INeQeNk7dE7nTjmec22nzXrfFp0Ce
   /Kzy+nz+dBzweQuYdZ8EJemcgzc9EU933qGlilRlSHMU9PziQBVW1RH4S
   Q/Vn+E8+/6i7t1vfUqKT8gLn4gyFx6lU6VRSUu5tA6BfSZtjIn3RHqN2N
   GeThowGSuILTuvSrB984GfXe9nhhP3EZa6uVQp7d0SJhmDEpIVj8vRw7y
   A==;
X-CSE-ConnectionGUID: QkEM9TnvTYmem5Cv7r6vsQ==
X-CSE-MsgGUID: WrZIyUeHRY+SucVqrpVPOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62672870"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="62672870"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 12:29:09 -0700
X-CSE-ConnectionGUID: 4ww2mY5vTXaVvC7wMPmJJQ==
X-CSE-MsgGUID: HcM2zoyOSkSVRlk1DBPKKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="219111863"
Received: from xpardee-mobl.amr.corp.intel.com (HELO [10.124.130.255]) ([10.124.130.255])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 12:29:10 -0700
Message-ID: <dcd817d1-6ce5-4c09-a65b-21507424849b@linux.intel.com>
Date: Tue, 14 Oct 2025 12:29:08 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] platform/x86/intel/pmc: Always dump LPM status regs
 on unsuccessful paths
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 platform-driver-x86@vger.kernel.org
Cc: irenic.rajneesh@gmail.com, david.e.box@intel.com, kernel-dev@igalia.com,
 kernel@gpiccoli.net
References: <20250922230812.1584253-1-gpiccoli@igalia.com>
 <20250922230812.1584253-4-gpiccoli@igalia.com>
Content-Language: en-US
From: Xi Pardee <xi.pardee@linux.intel.com>
In-Reply-To: <20250922230812.1584253-4-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

My response is inline.

Thanks!

Xi

On 9/22/2025 3:52 PM, Guilherme G. Piccoli wrote:
> Right now, there are 2 fail paths on pmc_core_resume_common(): either
> after (some) package(s) didn't enter Cx state, or after s0ix was
> not successfully entered.
>
> The code has a debug output, dumping LPM registers, but *only*
> on s0ix fail path, not when packages fail to enter some Cx state.
>
> Let's make it output the LPM registers in both fail cases, in order to
> help debugging issues.
>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>   drivers/platform/x86/intel/pmc/core.c | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index c8ce5d6ec30c..aeb5e47cf5bb 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -1882,16 +1882,22 @@ int pmc_core_resume_common(struct pmc_dev *pmcdev)
>   					 msr_map[i].name, pc_cnt);
>   			}
>   		}
> -		return 0;
> +	} else {
> +		/* The real interesting case - S0ix failed - lets ask PMC why. */
> +		dev_warn(dev, "CPU did not enter SLP_S0!!! (S0ix cnt=%llu)\n",
> +			 pmcdev->s0ix_counter);
> +
> +		/*
> +		 * Notice that SLP_S0_DBG regs are captured on C10 entry,
> +		 * according to the spec. So if we didn't enter C10 (i.e.,
> +		 * the  above if-block was executed) seems to make no sense
> +		 * in dumping them.
> +		 */
> +		if (pmc->map->slps0_dbg_maps)
> +			pmc_core_slps0_display(pmc, dev, NULL);
> +
>   	}
>   
> -	/* The real interesting case - S0ix failed - lets ask PMC why. */
> -	dev_warn(dev, "CPU did not enter SLP_S0!!! (S0ix cnt=%llu)\n",
> -		 pmcdev->s0ix_counter);
> -
> -	if (pmc->map->slps0_dbg_maps)
> -		pmc_core_slps0_display(pmc, dev, NULL);
> -
>   	for (i = 0; i < ARRAY_SIZE(pmcdev->pmcs); ++i) {
>   		struct pmc *pmc = pmcdev->pmcs[i];
>   

Entering the S0ix state requires the system to reach the deepest package 
C-state, PC10. If the system fails to achieve PC10 residency during 
suspend, the slps0_dbg_maps data becomes irrelevant and may mislead 
users. For this reason, the driver hides this information when PC10 
residency is not attained.

