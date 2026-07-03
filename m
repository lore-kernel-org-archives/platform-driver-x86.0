Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200503C945A;
	Fri,  3 Jul 2026 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783078864; cv=none; b=UbXUg/5sO85mH8SzPgr4WXXjI7+AmZ+FCq60GMum3d6jOwymWndfsfKlyQf7LzoGoJXhURvPt7Nrfd+Ap8ZeZe5vIZspVaQxJpUabtIaEGPb7FRF1CKGjpsjM2DKQg333DpS7eQySducYfOGt/RnywYc2LAH3PXUaIb4eD6+Qwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783078864; c=relaxed/simple;
	bh=0za3h8yIGPQ7RahpbwommmOEI7Qi2bT829FVziRS+yk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ak9Qvw9w60KPZzjI7pCT86fS+NGBkQ3LGG29ypdAMPohSnNuQjsciT4hN6prD31svv/RIsDhcXJNo7F/AYiqyNvEdMAUHIPFPkWh4SHwqIf7RaJZqyjHjdMRxik6Wnio1/v/EnnHttJov572QUyXvNR0YrZM4lUKL24IDmh4nY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nN0Ohsw7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nN0Ohsw7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783078863; x=1814614863;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0za3h8yIGPQ7RahpbwommmOEI7Qi2bT829FVziRS+yk=;
  b=nN0Ohsw7V9xxWJJF2stqEbuplF4fdhE0HaQewbS+SrPljtT5v4qAUuAk
   d62dkbKUHVbwYKsYdwgdEBRyICD5hnNWfSuRw7Y8HNJr0fioyza65wv7W
   FzwNBevQHtOCgNQqfWdGtOAH+l6nRuNfUjzX2xeQZYG2QjFSPBEmUNvF4
   QiYWu03QlbW7Pb7AhwF1PmyITL2Dz9bSyk9T9bQ+HCfP5FdJlMeQHEW3G
   BhI3He97by3EfwNdF+IOBV1toxettpOxPmUwB+zzdTiksPCgwnrcc3ycz
   CQbTW7+nOx3TkKGt1Lnfg5CAeUX6XpDCDJhXlNxVnZnAi7Ekyl5puLew2
   g==;
X-CSE-ConnectionGUID: WoRkg3DCTpCvBNgW8sZpFg==
X-CSE-MsgGUID: jxb8QKRRTR+bjdagZ2CZ8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="106629307"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="106629307"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 04:41:03 -0700
X-CSE-ConnectionGUID: gs3T20KnTACg+cQgOzhKrA==
X-CSE-MsgGUID: oAZoKPaiSoyonLtUIcCSCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="256671587"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 04:41:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 3 Jul 2026 14:40:56 +0300 (EEST)
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
cc: "David E . Box" <david.e.box@linux.intel.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/intel/vsec: free ACPI discovery data on
 early errors
In-Reply-To: <20260629160415.29280-1-alhouseenyousef@gmail.com>
Message-ID: <0a324545-ea70-742b-88a6-3e2338fa8b24@linux.intel.com>
References: <20260629160415.29280-1-alhouseenyousef@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Jun 2026, Yousef Alhouseen wrote:

> intel_vsec_add_dev() may attach an ACPI discovery table copy to the
> intel_vsec_device before passing ownership to intel_vsec_add_aux(). The
> normal auxiliary-device release path frees that copy, but the earliest
> intel_vsec_add_aux() failures free only the outer structure directly.
> 
> Route those direct frees through a common helper so acpi_disc is
> released consistently on the parent, xarray, and ID allocation failure
> paths.
> 
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>

Shouldn't this have a Fixes tag?

--
 i.

> ---
>  drivers/platform/x86/intel/vsec.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> index 3ae4557b32b4..5ab2215fdd7f 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -103,6 +103,12 @@ static void intel_vsec_remove_aux(void *data)
>  	auxiliary_device_uninit(data);
>  }
>  
> +static void intel_vsec_dev_free(struct intel_vsec_device *intel_vsec_dev)
> +{
> +	kfree(intel_vsec_dev->acpi_disc);
> +	kfree(intel_vsec_dev);
> +}
> +
>  static void intel_vsec_dev_release(struct device *dev)
>  {
>  	struct intel_vsec_device *intel_vsec_dev = dev_to_ivdev(dev);
> @@ -111,8 +117,7 @@ static void intel_vsec_dev_release(struct device *dev)
>  
>  	ida_free(intel_vsec_dev->ida, intel_vsec_dev->auxdev.id);
>  
> -	kfree(intel_vsec_dev->acpi_disc);
> -	kfree(intel_vsec_dev);
> +	intel_vsec_dev_free(intel_vsec_dev);
>  }
>  
>  static const struct vsec_feature_dependency *
> @@ -218,20 +223,22 @@ int intel_vsec_add_aux(struct device *parent,
>  	struct auxiliary_device *auxdev = &intel_vsec_dev->auxdev;
>  	int ret, id;
>  
> -	if (!parent)
> +	if (!parent) {
> +		intel_vsec_dev_free(intel_vsec_dev);
>  		return -EINVAL;
> +	}
>  
>  	ret = xa_alloc(&auxdev_array, &intel_vsec_dev->id, intel_vsec_dev,
>  		       PMT_XA_LIMIT, GFP_KERNEL);
>  	if (ret < 0) {
> -		kfree(intel_vsec_dev);
> +		intel_vsec_dev_free(intel_vsec_dev);
>  		return ret;
>  	}
>  
>  	id = ida_alloc(intel_vsec_dev->ida, GFP_KERNEL);
>  	if (id < 0) {
>  		xa_erase(&auxdev_array, intel_vsec_dev->id);
> -		kfree(intel_vsec_dev);
> +		intel_vsec_dev_free(intel_vsec_dev);
>  		return id;
>  	}
>  
> 
