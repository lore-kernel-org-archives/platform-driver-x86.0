Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DD03C3C14
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 22:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017299; cv=none; b=IPs7nIfF8/jnTPvGDKnnZpJ3iTMeGwAJjYIZhoFMwq83W2o/UJ32s6OaDXfyE5RX+4WBA+d1l6nvRs54gJcmrfbtKEOqa+FS9ZvAjOeBLhiCr0yEqqRRRS7mTB+Nt/la3JRkOIH/ci23FrVaosgKJNbD8CSDhEN2VLyCT3W9164=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017299; c=relaxed/simple;
	bh=5a+04yPNR4cPN6EbCrWf4MO0vs4ksVCn/cHzIiN6KHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0g8AE38UyydELMATt3MsIHNxk7iomovKaxYKCSgmY9Sq3+iyhcm9C02h3hHeS3FYAtKTbYM+GCAk6lltDc3i/bFLF+nMV1tkv3lSq9hWCr+tGlWGyvlaZdaORwJmtl5/TK5Z9d+u5dc91LDZjyd5zxzeTzib8DB4U9EV/zLsZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQDnMu+1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQDnMu+1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792017295; x=1823553295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5a+04yPNR4cPN6EbCrWf4MO0vs4ksVCn/cHzIiN6KHE=;
  b=iQDnMu+1P/s8MVK/8drUDiSn8Q4xGQtQkGPa3AbD0ekjI6Bv/d3FQV3C
   2pLRpcxRgns/bj+c60tUgZirzj+joGL9TfhiCNa56t+h6N6EYtjtXZob4
   CHkPHQ7nxWyjmtI/6Qj4hY905GCLh960hKWIgwcKxCdSv4HyMt7+faiCM
   zR1V1KrfTWdtCtr7+A/AQe1JE8HFZNJDwmVKZeY36V2kFJbK0i4jMHgGf
   rgRnC5nS90xpAoZ6nVkGjpl2NPBHH4FpVr8PsOhq9Sdsp4IDJaAbP6ilx
   fTsnpXLoLtMObjDyy7eQeluyiEhTivmW8OPCI8eP+iCtojsxd3YGzwk/a
   Q==;
X-CSE-ConnectionGUID: ZDsTo96oReOUcCFbe+3fqA==
X-CSE-MsgGUID: 0D5oGOuyQKuKE0P3+pDp7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="666480"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="666480"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 15:34:54 -0700
X-CSE-ConnectionGUID: V+ses/X+Rui/10tlQKab7w==
X-CSE-MsgGUID: WFBJzqtCTYebiLvlSzu91A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1565657"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 15:34:54 -0700
Date: Wed, 14 Oct 2026 15:34:53 -0700
From: David Box <david.e.box@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com, 
	rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, airlied@gmail.com, 
	simona@ffwll.ch, anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
	matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v12 01/21] platform/x86/intel/pmt: complete pcidev to
 device update
Message-ID: <a2ce6kxrcpuk7qytfrl5hfhtxqi2w475qkmixlylffa6kx7lny@guqekbmhjyl6>
References: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
 <20261013214655.3502964-24-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013214655.3502964-24-michael.j.ruhl@intel.com>

On Tue, Oct 13, 2026 at 02:46:54PM -0700, Michael J. Ruhl wrote:
> The update that moved struct pci_dev usage to struct device is
> incomplete. Only telemetry endpoints are covered.
> 
> Other PMT features (crashlog) are now blocked from using the callback
> mechanism.
> 
> Change struct intel_pmt_entry pci_dev member to device.
> 
> Update callback usage to use the intel_pmt_entry rather than the
> telemetry endpoint.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Fixes: 353042d54d82 ("platform/x86/intel/vsec: Switch exported helpers from pci_dev to device")
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Thanks for this change. Your fix is preferable to mine, so I'll drop
"platform/x86/intel/pmt: Fix NULL dereference when reading crashlog
data" from my crashlog uevent series.
  
If you do a v13, please make it clear in the commit message that this
fixes a NULL pointer dereference when reading crashlog data, and add
Cc: stable@vger.kernel.org since the regression is in v7.1. Otherwise,

Reviewed-by: David E. Box <david.e.box@linux.intel.com>

> ---
>  drivers/platform/x86/intel/pmt/class.c     | 5 ++---
>  drivers/platform/x86/intel/pmt/class.h     | 3 +--
>  drivers/platform/x86/intel/pmt/discovery.c | 2 +-
>  3 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index d0ab8e33c62a..402d51df834a 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -100,7 +100,7 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
>  	if (count > entry->size - off)
>  		count = entry->size - off;
>  
> -	count = pmt_telem_read_mmio(entry->ep->dev, entry->cb, entry->header.guid, buf,
> +	count = pmt_telem_read_mmio(entry->dev, entry->cb, entry->header.guid, buf,
>  				    entry->base, off, count);
>  
>  	return count;
> @@ -286,8 +286,6 @@ static int pmt_resolve_access_pci(struct intel_pmt_entry *entry,
>  		return -EINVAL;
>  	}
>  
> -	entry->pcidev = pci_dev;
> -
>  	return 0;
>  }
>  
> @@ -365,6 +363,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
>  	entry->guid = header->guid;
>  	entry->size = header->size;
>  	entry->cb = ivdev->priv_data;
> +	entry->dev = ivdev->dev;
>  
>  	return 0;
>  }
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
> index a0ece4fc3837..258cb460e61c 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -20,7 +20,6 @@
>  #define GET_ADDRESS(v)		((v) & GENMASK(31, 3))
>  
>  struct device;
> -struct pci_dev;
>  extern struct class intel_pmt_class;
>  
>  struct telem_endpoint {
> @@ -42,7 +41,7 @@ struct intel_pmt_header {
>  
>  struct intel_pmt_entry {
>  	struct telem_endpoint	*ep;
> -	struct pci_dev		*pcidev;
> +	struct device		*dev;
>  	struct intel_pmt_header	header;
>  	u32			disc_header[PMT_DISC_DWORDS];
>  	struct bin_attribute	pmt_bin_attr;
> diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platform/x86/intel/pmt/discovery.c
> index c482368bfaae..f4203d240f54 100644
> --- a/drivers/platform/x86/intel/pmt/discovery.c
> +++ b/drivers/platform/x86/intel/pmt/discovery.c
> @@ -609,7 +609,7 @@ void intel_pmt_get_features(struct intel_pmt_entry *entry)
>  
>  	mutex_lock(&feature_list_lock);
>  	list_for_each_entry(feature, &pmt_feature_list, list) {
> -		if (feature->priv->parent != entry->ep->dev)
> +		if (feature->priv->parent != entry->dev)
>  			continue;
>  
>  		pmt_get_features(entry, feature);
> -- 
> 2.43.0
> 
