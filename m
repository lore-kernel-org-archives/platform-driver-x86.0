Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9AE51C36;
	Mon, 18 Dec 2023 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KH2iKdE3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702901321; x=1734437321;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Fsbhkm0WhCqBZSO9ER+vHQLpTu9zm9tiGz8nMwgYe/w=;
  b=KH2iKdE3CVcw9eUHoItF7fM9oK6fsAZfJZBu9fQmotkEmjQFK+hA72gH
   jCNAYUzi7RfjjnjLChvsDInZ6sb418qP57hj5+fQWV7pSr9wmSHYzTX56
   jV/QcZ7MeJwDg57XMEtJKLa/x0JIzf+QPNw9kO2oKThrIuO12gs3r+ND3
   e5gzDrd1dsTq7XSKwL1/K0elGC4Z/JV3bjyq13ZKRPtDkqzgl3o5EBmUB
   8nihh58mrQ2+nvkDDPN1MK7JfewgpI13nXIfBgb7eFJetOT8nxh0B79Nx
   AgUoA8y0Gp8v6j7ovDLcBfoPT+4cMdjcmqcjmLbrUKLDGTDAsXvkFZYQN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="2324237"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="2324237"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 04:08:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="775558218"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="775558218"
Received: from gmarin-mobl1.ger.corp.intel.com ([10.252.34.78])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 04:08:36 -0800
Date: Mon, 18 Dec 2023 14:08:34 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: rjingar <rajvi.jingar@linux.intel.com>
cc: irenic.rajneesh@gmail.com, david.e.box@intel.com, 
    Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] platform/x86/intel/pmc: Fix in
 pmc_core_ssram_get_pmc()
In-Reply-To: <20231216011702.1976408-1-rajvi.jingar@linux.intel.com>
Message-ID: <292ed49e-cb34-7ca8-dbb5-a25857c75ef2@linux.intel.com>
References: <20231216011702.1976408-1-rajvi.jingar@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-179285463-1702901318=:2348"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-179285463-1702901318=:2348
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Fri, 15 Dec 2023, rjingar wrote:

> From: Rajvi Jingar <rajvi.jingar@linux.intel.com>
> 
> Passing PMC_IDX_MAIN in pmc_core_pmc_add() adds only primary pmc to pmcdev.
> Use pmc_idx instead to add all available pmcs.
> 
> Fixes: a01486dc4bb1 ("platform/x86/intel/pmc: Cleanup SSRAM discovery")
> Signed-off-by: Rajvi Jingar <rajvi.jingar@linux.intel.com>
> ---
>  drivers/platform/x86/intel/pmc/core_ssram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core_ssram.c b/drivers/platform/x86/intel/pmc/core_ssram.c
> index 3501c7bd6b33..55e54207987c 100644
> --- a/drivers/platform/x86/intel/pmc/core_ssram.c
> +++ b/drivers/platform/x86/intel/pmc/core_ssram.c
> @@ -287,7 +287,7 @@ pmc_core_ssram_get_pmc(struct pmc_dev *pmcdev, int pmc_idx, u32 offset)
>  	if (!map)
>  		return -ENODEV;
>  
> -	return pmc_core_pmc_add(pmcdev, pwrm_base, map, PMC_IDX_MAIN);
> +	return pmc_core_pmc_add(pmcdev, pwrm_base, map, pmc_idx);

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-179285463-1702901318=:2348--
