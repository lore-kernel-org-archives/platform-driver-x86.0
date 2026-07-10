Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214F2438023;
	Fri, 10 Jul 2026 16:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699981; cv=none; b=HC+5b3GEMs8Qx2b1loq3a5aMUDYHYZRRIogdI7w1gsvGHnnl84lHGnjaK+exTPM1s20tFuvhEQrA7x30NU2/7GmcaMrmX8O4HvsZzjI3A/Mjd0xYUD0Hvl9Z5QBamZ0vHd+RzDpn5/V+PnO5iQnB/yKpFP31rOV1jVEMs1hEV4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699981; c=relaxed/simple;
	bh=VdJ47z8cNJZ2jpSOTnyC8gmcOIoPE0DJFWYKiPPBV7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOqshI0JkMLK9DXhhbYfCRspmtNnZdeySK66N1IB5Tduwhcm+dr5F6cuLg2b5fZppzQsw2pmSzbVFgDsr7NR03JCyf9kkWrdnM9tXIGW8EP8IU4yRZ4jIWWrkDDWE0CJrDXeLE0IMLY8vOIm4e9HvPiMkvCv8WWM+qUolt4ztYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYOe85r0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYOe85r0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783699976; x=1815235976;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VdJ47z8cNJZ2jpSOTnyC8gmcOIoPE0DJFWYKiPPBV7w=;
  b=fYOe85r0VC4F3HP2ZL6eY+iWykYVH222NTd8v1WMjP/wPp+d4PVz+Azn
   G2LMDmvbLQZoQxwJ9PDdTkI2tmwkSuR4gg1uSYjz2db2kHKwQixbHmOSt
   Mb7wlMJl27QCu7eoPIl9EurU1cIjY0i7oKv3lucIXfJZP/tKcO69n1AWK
   uYP37hznOPzWRH1wlDIxv2kGG54GsqVj0Zt0wyiaq+m9CLGNkqlRHp9l3
   c0ccyeNc8Gx7XI3VcSBjWzviukl7uK2DaHHt/s2h0Y7IN0pwIIg3dL+uk
   bfExXhnhCef1aqA5q2yKxUltaFWB1hvtJV4iaekYw37iWZknf+b9c5+sn
   A==;
X-CSE-ConnectionGUID: vVsXXREpR+OQ/48PW/H4pw==
X-CSE-MsgGUID: LmNqM+coQ8GruFAVU8U4lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95048059"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95048059"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 09:12:51 -0700
X-CSE-ConnectionGUID: w3Zh9jfuRKadZb3c/a6zxQ==
X-CSE-MsgGUID: unBvJUAFQJa8Wvu+XDsS3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="248550829"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 09:12:51 -0700
Date: Fri, 10 Jul 2026 09:12:50 -0700
From: David Box <david.e.box@linux.intel.com>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86/intel/pmc: initialize empty PMT read result
Message-ID: <h4ngwuaoamarozwspuja3al3lodhqbh2ge7iq3csmkx7dnslgg@nmelqribxinn>
References: <20260630105101.54016-1-alhouseenyousef@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630105101.54016-1-alhouseenyousef@gmail.com>

On Tue, Jun 30, 2026 at 12:51:01PM +0200, Yousef Alhouseen wrote:
> pmc_core_pmt_get_lpm_req() returns the last telemetry read status. When
> firmware exposes no enabled low-power modes, the loop does not run
> and the function returns an uninitialized stack value.
> 
> Initialize the status to success so an empty mode set is handled
> deterministically.
> 
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
>  drivers/platform/x86/intel/pmc/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index 825ba5fa0bcb..9f77c0716e59 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -1583,7 +1583,7 @@ int pmc_core_pmt_get_lpm_req(struct pmc_dev *pmcdev, struct pmc *pmc, struct tel
>  {
>  	const u8 *lpm_indices;
>  	int num_maps, mode_offset = 0;
> -	int ret, lpm_size;
> +	int ret = 0, lpm_size;
>  	u8 mode;
>  
>  	lpm_indices = pmc->map->lpm_reg_index;
> -- 
> 2.54.0
> 

Reviewed-by: David E. Box <david.e.box@linux.intel.com>

Thanks
