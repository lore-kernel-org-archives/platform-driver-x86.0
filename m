Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EF8285CAD
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jan 2026 12:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769604146; cv=none; b=oALibsCGWMu3BqjD9dfQl8JrPjmj0liaTH/XEbgB4hpPKI5nuuPRcxkcmXWRhw6wQNRpcya8TGin3UUpEu9gGyaYMXBZicipE3kHMYwB1Iz/oz6TifJNRFtv8v0yvKTb1UwyasFqZrOis8cFP+mv3+V2PpoWgt0EqbiMaNaIm8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769604146; c=relaxed/simple;
	bh=TCkCR6CMzah7og+OIuj7A3fhvqQK0va0N6QTGtS5OTA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jNnmPJn54Qowc7rE/Hy8C1I01zQY8GArFZOLjaMgu8ZDkF5Zk9mrWWrr4FREeCvZcqYGGD5xZy8zQktJ0QPK7smiypr09GImhe/+utlA4FIBtMTjPJR/7aeFUy7Bz8WUSO5GTtSGQcSXtTzKaEi8jfVDZLeuRVfU1ck5pZIc134=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=At3dCMaD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="At3dCMaD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769604145; x=1801140145;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=TCkCR6CMzah7og+OIuj7A3fhvqQK0va0N6QTGtS5OTA=;
  b=At3dCMaDM7p9XIAV18/HiuyVfsmxD2piKYZx1UnC65XwFqqGhf1dQnO+
   1v2FFUBuH6xyQt+XUYXrqID92qIwimNrHVO4vHAbsgJczF3SyM60cBSDL
   UruM0AavmPHWKmn3WyiT/qr58Y4qXBPbAGrBHNUnRLDGAX226u73Z13i1
   LT+FKdVe1HBn2gcqpQ7NGbUtcUxoHZJp8FuHS0Uh9jdOzsRUotT1sKqbd
   94F9jhylGO7Rvq1glMGE2HJ1lSlZmmJbx2opwV35AKXAG5bwm6KSTbrlH
   qKJytoRlqlT9Q//7B9m+F0O9I+0ZrM/ikDj34lwVG1O4hFNpshk97NImo
   w==;
X-CSE-ConnectionGUID: N3+yNhP7RX2HzgZM4ne5qg==
X-CSE-MsgGUID: fHlK2N+wR1ykRFmxu0cTGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81446765"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81446765"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:42:25 -0800
X-CSE-ConnectionGUID: giDsuR+vTo+3XVKo0WwXjQ==
X-CSE-MsgGUID: +t9nQ5ZFTPuRipiuorzxZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="212743248"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.14])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:42:21 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 28 Jan 2026 14:42:17 +0200 (EET)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH 2/5] drm/xe/vsec: Use correct pm state get
In-Reply-To: <20260127182418.640701-9-michael.j.ruhl@intel.com>
Message-ID: <3f8ecbc2-e5bd-37d7-faf9-f5e090845243@linux.intel.com>
References: <20260127182418.640701-7-michael.j.ruhl@intel.com> <20260127182418.640701-9-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Jan 2026, Michael J. Ruhl wrote:

> Crashlog needs to be collected at all times.  The current pm
> check assumes telemetry only.
> 
> Update read path to enable device for crashlog instances.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 4ebb4dbe1c9b..44607f1eaa88 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -145,6 +145,7 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
>  {
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
> +	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
>  	u32 mem_region;
>  	u32 offset;
>  	int ret;
> @@ -160,9 +161,18 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
>  	if (!xe->soc_remapper.set_telem_region)
>  		return -ENODEV;
>  
> -	/* indicate that we are not at an appropriate power level */
> -	if (!xe_pm_runtime_get_if_active(xe))
> -		return -ENODATA;
> +	/* make sure that we are not at an inappropriate power level */
> +	switch (cap_type) {
> +	case CRASHLOG:
> +		xe_pm_runtime_get(xe);

While this is xe code so I don't know much about it, it feels odd to me to 
just add a get without put or explanation in the changelog why this change 
doesn't result in imbalance.

-- 
 i.


> +		break;
> +	case TELEMETRY:
> +		if (!xe_pm_runtime_get_if_active(xe))
> +			return -ENODATA;
> +		break;
> +	case WATCHER:
> +		return -EINVAL;
> +	}
>  
>  	/* set SoC re-mapper index register based on GUID memory region */
>  	xe->soc_remapper.set_telem_region(xe, mem_region);
> 
