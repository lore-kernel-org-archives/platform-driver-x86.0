Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7D3438023;
	Fri, 10 Jul 2026 16:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699782; cv=none; b=Mb054daeoUmK6f/KioBCobPpYdqOWPqr9aYFQPZ512HU29xGfXgRA1I+ZegfeO23m+MvPEhUg+R6FTyHryzbxQm7ncUDtIoMzLIt5fev+wOFGobEPhxUetOZNQJY5YhPqMNEnH0AIn17lFwSHrTOB1wsFWjV8WLu9qxZHeeMaao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699782; c=relaxed/simple;
	bh=MQGMqaKokorzW5wlpRkag7Nn8tzA+5EDmwGHdIMtSJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNv2fYYbc1ibqXHmsGkXS6T18sz4O8ZdSbcN2xOjqPAc7rn8tdMCYEX+lYlXASMt5YmDiJcFfYUi/DLvRHwK+U7bHa1A9dGu8/OV7hyaDw5Abilg96HwFpgtwu5jUulpapSG1akSqirtZ5iu0VERWlKv1zLfd1Cp+oHtN5yayL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DdbM7JwF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DdbM7JwF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783699777; x=1815235777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MQGMqaKokorzW5wlpRkag7Nn8tzA+5EDmwGHdIMtSJw=;
  b=DdbM7JwFOtpN5FfIEB4/OIwkE3IUUr4X7LH54Pxq9Ftxl+j7yZ/Jfoe+
   Aht+9QjseCJUqlNmU/wge0rLPS59DXoiqZJnB6ogVLQGkNaCDFneytkPV
   lpPcqbWShhhA/RZ3Y5ig9rTmG10ofKKVTbvdeXG3JHk+n3FjqpQeKavF6
   ILRNxo8f3SsKt6zlcCq+N1i46Ii1sQcJLymmCLG/VrlhvsyYQTddQMUOH
   9Xp9dqVoEE4YbKromdXCfalxkDaVx4zuhTAnpahMUW2GTcpKdp4+X1T5h
   E8ddTfsj54ymjDf3/fPwMUfQhMkHg0SF98kVg3RWQgk5RGYxvc9ZFPjvV
   g==;
X-CSE-ConnectionGUID: OmiRPwc8QqSbl5lc9JVarg==
X-CSE-MsgGUID: saj6bRpkSNiwycqMDQlQVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84453263"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84453263"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 09:09:29 -0700
X-CSE-ConnectionGUID: dRBh8UoETRqAj0hCePSxpg==
X-CSE-MsgGUID: ZTOXvyFfSr+uJu74h7IGoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259243171"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 09:09:28 -0700
Date: Fri, 10 Jul 2026 09:09:28 -0700
From: David Box <david.e.box@linux.intel.com>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86/intel/pmc: validate LPM mode without stale
 index
Message-ID: <jxbxgf7oxlv2tic2b4ck4sp4dp3ieebnekuhfiatjyxfpaddm5@akudfvxl5ush>
References: <20260630105125.54053-1-alhouseenyousef@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630105125.54053-1-alhouseenyousef@gmail.com>

On Tue, Jun 30, 2026 at 12:51:25PM +0200, Yousef Alhouseen wrote:
> pmc_lpm_mode_write() compares the requested mode with the loop variable
> after pmc_for_each_mode().  If no low-power modes are enabled,
> the loop never assigns that variable and the comparison reads an
> uninitialized value.
> 
> Track a successful match explicitly, including the empty-mode case.
> 
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
>  drivers/platform/x86/intel/pmc/core.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index 9f77c0716e59..9833df172d4e 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -1147,6 +1147,7 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
>  	struct pmc_dev *pmcdev = s->private;
>  	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
>  	bool clear = false, c10 = false;
> +	bool mode_enabled = false;
>  	unsigned char buf[8];
>  	int mode;
>  	u32 reg;
> @@ -1167,11 +1168,16 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
>  	mode = sysfs_match_string(pmc_lpm_modes, buf);
>

Since you're now checking mode right after assignment remove this empty line to
tie it to the test.

>  	/* Check string matches enabled mode */
> -	pmc_for_each_mode(m, pmc)
> -		if (mode == m)
> -			break;
> +	if (mode >= 0) {
> +		pmc_for_each_mode(m, pmc) {
> +			if (mode == m) {
> +				mode_enabled = true;
> +				break;
> +			}
> +		}
> +	}
>  
> -	if (mode != m || mode < 0) {
> +	if (!mode_enabled) {
>  		if (sysfs_streq(buf, "clear"))
>  			clear = true;
>  		else if (sysfs_streq(buf, "c10"))
> -- 
> 2.54.0
> 

With the above change,

Reviewed-by: David E. Box <david.e.box@linux.intel.com>

Thanks
