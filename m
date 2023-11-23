Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgALf7NX"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 996DA19D;
	Thu, 23 Nov 2023 03:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700738992; x=1732274992;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PzOs9RB9syyjScUbFTKb+4Hn+6cSUNDGPYqCzqbe+8c=;
  b=EgALf7NXYPH+SqMjyo3h6j5Coli6X8UqkLz+LRJ9GOe6iHs2uvFx1Jrs
   EnaT0DalLCDOU3ObHRbvJk5oHBfxTt4rFmFMM8m3c9XXCKsH+fAwcu8sj
   0K1TOMDplnqSpelkdj25CnFJOpklCais3PlCrNzUb5LpICAT4TMFJ1bBF
   Pikwzl87IYUcK3p4Q3KUmATB+XXxPj8wJkj3SPzT2OgegTURrcGhD/X4x
   x8k+xFOR15QmU2HY/dIyNzdq3kvZ6ZXRBKYU92a5roP9lCMI/9aU3avs3
   eWf91DNBvz11QWkz/TvLVFBb9K+q67iic+qO5G0BmxUlJTnP/t1OC+j8m
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13805425"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="13805425"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 03:29:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="717029985"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="717029985"
Received: from mstrobel-mobl.ger.corp.intel.com ([10.252.40.70])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 03:29:34 -0800
Date: Thu, 23 Nov 2023 13:29:32 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    rajvi.jingar@linux.intel.com
Subject: Re: [PATCH V5 05/20] platform/x86/intel/vsec: Assign auxdev parent
 by argument
In-Reply-To: <20231123040355.82139-6-david.e.box@linux.intel.com>
Message-ID: <f296720-2ed-72c3-3944-7649ba19ae3@linux.intel.com>
References: <20231123040355.82139-1-david.e.box@linux.intel.com> <20231123040355.82139-6-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1384371482-1700738975=:1676"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1384371482-1700738975=:1676
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Wed, 22 Nov 2023, David E. Box wrote:

> Instead of checking for a NULL parent argument in intel_vsec_add_aux() and
> then assigning it to the probed device, remove this check and just pass the
> device in the call. Since this function is exported, return -EINVAL if the
> parent is not specified.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
> V5 - New patch
> 
>  drivers/platform/x86/intel/vsec.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> index 7dc3650f2757..7a717183c58b 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -103,6 +103,9 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
>  	struct auxiliary_device *auxdev = &intel_vsec_dev->auxdev;
>  	int ret, id;
>  
> +	if (!parent)
> +		return -EINVAL;
> +
>  	mutex_lock(&vsec_ida_lock);
>  	id = ida_alloc(intel_vsec_dev->ida, GFP_KERNEL);
>  	mutex_unlock(&vsec_ida_lock);
> @@ -124,9 +127,6 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
>  		return ret;
>  	}
>  
> -	if (!parent)
> -		parent = &pdev->dev;
> -
>  	auxdev->id = id;
>  	auxdev->name = name;
>  	auxdev->dev.parent = parent;
> @@ -212,7 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
>  	 * Pass the ownership of intel_vsec_dev and resource within it to
>  	 * intel_vsec_add_aux()
>  	 */
> -	return intel_vsec_add_aux(pdev, NULL, no_free_ptr(intel_vsec_dev),
> +	return intel_vsec_add_aux(pdev, &pdev->dev, no_free_ptr(intel_vsec_dev),
>  				  intel_vsec_name(header->id));
>  }

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-1384371482-1700738975=:1676--
