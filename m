Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213D0430787;
	Fri, 10 Jul 2026 15:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783697828; cv=none; b=rdeCAJs64lpev/MhedRSvOppEm+YFHUkyV23MXxR/1xDxoc7cHpZZP1FM/O1dqzkLcpUjz2NmtLpOTGApEinN6C6AuMHClmP9YDxHk9f9LN2e3RV45a1ZMpHXzqKJfEUNRBOE+H8R/gDIo2c3Q81WDgXGoaZx4l7tW+INCLumAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783697828; c=relaxed/simple;
	bh=XQPQSPjv+CZhAcEel0fyepDCa+E+dIbPZlmDaX3hZl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5TwOPdx5a98ZTmLsQ0SZwOWZ/ijFCrT1THgQofHBq33+4WVfJxfZKOcGh6H57YuVCzG9IUbhuNx7yHekqB0ydsVavKdEhmrBxPea8Of0/wzryQti2MeeN3Yi/rZHz0SPh1LhKxtBGoar8GXrNofI8VqLYTRSkYwcAShfeyi86A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=daN53ywr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="daN53ywr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783697823; x=1815233823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XQPQSPjv+CZhAcEel0fyepDCa+E+dIbPZlmDaX3hZl8=;
  b=daN53ywr40rkivMbJM4aWqEQPJ+gmtqvZyNu8GCQIIut3hXv9n6vO2wJ
   PyoM1Ei9FE6LOuj7LvybvzuqTgg1IdKia+DbxHaPifPSCSi772RxOd+gq
   XIqf2ABaHFCR4O/6FoppOVP3355SFEe7RS3/wEq/QOTtd8iT6ybME5o73
   FJ8YlJd80QW3prq544BnsQKnhmod7X0ptUYQyll/M6EXLfPbKtjKgrne7
   3zqy7nSCMjxAWSe+RXdbJO9AFpwn1AzS6jbAo+6GJvxSU0amsKZfx7/l4
   vVWNO2p7tXhQaVmIXW8bzazP+3BuTVUX73rzJ90216WtUJgM+rixPXXg5
   A==;
X-CSE-ConnectionGUID: 5lP16lKbRA65f4uCPA3OzQ==
X-CSE-MsgGUID: Bj44DuGHSZytkx3LXNnHrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84276652"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84276652"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 08:37:00 -0700
X-CSE-ConnectionGUID: XQEEDbtsTa6UO4DutX7piQ==
X-CSE-MsgGUID: eFdM3j0sQxqvD6kvXGPaEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250492684"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 08:37:00 -0700
Date: Fri, 10 Jul 2026 08:36:59 -0700
From: David Box <david.e.box@linux.intel.com>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86/intel/vsec: free ACPI discovery data on
 early errors
Message-ID: <kj4qa6r527kksja4aza6jqquebs57tqdzimhgbp35jiy2rdhjz@5sqrkbg6cth3>
References: <CAMuQ4bUtJtYNTguKoiXngROJw0QQQcrvW3=3_B0-hpMQOFqvCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuQ4bUtJtYNTguKoiXngROJw0QQQcrvW3=3_B0-hpMQOFqvCQ@mail.gmail.com>

On Mon, Jul 06, 2026 at 09:13:39AM -0400, Yousef Alhouseen wrote:
> intel_vsec_add_dev() may attach an ACPI discovery table copy to the
> intel_vsec_device before passing ownership to intel_vsec_add_aux(). The
> normal auxiliary-device release path frees that copy, but the earliest
> intel_vsec_add_aux() failures free only the outer structure directly.
> 
> Route those direct frees through a common helper so acpi_disc is
> released consistently on the parent, xarray, and ID allocation failure
> paths.
> 
> Fixes: 22fa2ebc11a1 ("platform/x86/intel/vsec: Plumb ACPI PMT
> discovery tables through vsec")
> 
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>

Reviewed-by: David E. Box <david.e.box@linux.intel.com>

Thanks

> ---
> Changes in v2:
> - Add the Fixes tag requested by Ilpo Järvinen.
> 
>  drivers/platform/x86/intel/vsec.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/vsec.c
> b/drivers/platform/x86/intel/vsec.c
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
> -- 
> 2.55.0
