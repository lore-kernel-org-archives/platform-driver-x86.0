Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109943EDAA3
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Aug 2026 09:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787649919; cv=none; b=ixcJ9bEhtJPFRKeePzffkFulSTPYBWHvXyC8DvpFpfGl1dsO5oiJEzOnELFZ+yRePFUxY6ShFSX2OqS6IUbK+1F3m1ozcIGAGi08/AFFU3Wr0WGqJmVahWh1UTINJYDEfZtxtBUdqHW9QDgv3mzU4LXAt9KUT4viqVSUzkvArDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787649919; c=relaxed/simple;
	bh=pJeY+IDZoxUUAM+treuSd8yyFD+N+Azac6t1yMoNIok=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VSjZ66XsjMKqY0WPMkkxfcjeQb6tMI+t1dhycu1I5e72i5Niu1yVWDPawSBNYbTnxQoe5yrRHv046UERW5uJTrI8+hFuiiFzPb0uS1hZiL0cJ+unkFwNte5lqG0JlA1DBCUW5U3TQSaNPJiAUkwXxM9ntl3VM9uqNYn0qQD/v6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2dwk8rW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2dwk8rW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787649918; x=1819185918;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pJeY+IDZoxUUAM+treuSd8yyFD+N+Azac6t1yMoNIok=;
  b=l2dwk8rWI+VmJQk67Eax90fDQRL82KzRO4yPBu5utpjXLFdgQHaVU4uJ
   PcPcuLKLowvmyJslbnZcsHjtGND8j+ehMPliBIGj4gq2TcY66UqqWMz+m
   72uGLlOrJrMfWzmEx5v5vfnR1nFZUkJ7zx1394MFdx4bUAHNE6JTmWZ3h
   fwPGv3ikmd7L8XBjMlNQ4UDSvRwPentwhf5dQApy/T79vd9RJETKl7y7N
   AATdSAjA/2EoU9FupwneCKU2FgKGbxxSTXxv/VyZbBz6VUoNuokvXaCun
   HJ4tvpz9DZrqetK0VgrJs7Qr3rtaJvQHq2hJzRrmQ7Yfklw2psNP1AzTc
   A==;
X-CSE-ConnectionGUID: 9JH0lH9ETGaqkx2+iCzRrQ==
X-CSE-MsgGUID: LEGSsrX4QaaWy1NGTXbx2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98700041"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="98700041"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 02:25:17 -0700
X-CSE-ConnectionGUID: ZWe0VgYaR/WDd/Rj8AbWsA==
X-CSE-MsgGUID: nHg48yhSS7etBShLlOVfsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="264613797"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 02:25:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 25 Aug 2026 12:25:07 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
    anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
    matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v3 01/10] platform/x86/intel/pmt: complete pcidev to
 device update
In-Reply-To: <20260824162317.2450380-13-michael.j.ruhl@intel.com>
Message-ID: <02945d33-f4cb-faaf-9d68-f2a84177a02d@linux.intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com> <20260824162317.2450380-13-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Aug 2026, Michael J. Ruhl wrote:

> Previously the pcidev usage was moved to the struct device.
> The struct device is set for only the telemetry endpoints.

I fail to understand any of this (1st sentence has even broken grammar 
afaict, and we don't set struct x but variables pointing to them). Please 
rephrase.

> This usage prevents other PMT features (crashlog) from using

What "this usage". Perhaps try to avoid using "this" as it often results 
in very vague references.

> the callback mechanism.
> 
> Use struct device in the intel_pmt_entry.

Don't leave lines short like this in middle of a paragraph.

> Update callback usage to os the pmt entry rather than the
> telemetry endpoint.
>
> Fixes: 353042d54d82 ("platform/x86/intel/vsec: Switch exported helpers from pci_dev to device")

With no changelog understandable for mere mortals like me, my assumptions 
is 353042d54d82 was incomplete, is that what you tried to say?

> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
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
> 

-- 
 i.

