Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B652F5A2D
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jan 2026 12:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769604387; cv=none; b=eFQC6krJYOSrTCb/ShyIxdu3zbcud31MB575s8+p0tDHWOE6D+vZr+cehYyfLVI+LnHrUhSqRJSzx5QBEcOcIiPLPMGPSPN6uCfzoyxBcV51U6vzBnMs+mF5AnqEp3lJTG/SzPsb/h6/c+eNvfPU0YvNyjhUPLjJRSVjbMp8qec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769604387; c=relaxed/simple;
	bh=6CPKl2PvI60opOwMyW7igGwa0tk/bmTYWDlH99u8B7Q=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rfcVAOtUVZhjHq3MtFTs9uICI4GQ0OC+MtNoD6Kt/vzCwVQTByo2JLn1Y0YS/vSKuzohLM+/yFfutRpYXWa4mHRy4e/rGubGfXYDbMxNOFltJw8Y647eTFI32gkgYyby0QOiuCXCW3XhrbPW6r3BUMLl5wB7cV8DmK8wzpsAHgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axGJV/Fk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axGJV/Fk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769604386; x=1801140386;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6CPKl2PvI60opOwMyW7igGwa0tk/bmTYWDlH99u8B7Q=;
  b=axGJV/Fk9fz6xuMeCXBwzoVL2N4T4CC39JkgRiiuG4LMi50FRzKP0icp
   I/8giOgdmq4GPOobHlyxkpPMxXbFU7+8FZZiRCMuhbe/IxgXfyb9Pp+VO
   UqS8ChZYBNDOwiqz/7hfpiWZLQQB/KTXgtwEdghI+aKXF8KXpD1GsXaEh
   sHRt9pjziDYzBAWGEjg0xg+5M/pNFw2L752wGXn6nsdAc38L0K9+kcJRX
   QYB6nXCJrE4uQMzpqUN8pM58+l/6TRuzl9mipQecwsL79B8PkOmC309lD
   0oHmsbqxbTk4wKo1Y8e3ryjB5d46de2h7sdn2lujkkrWibIbH3/Jb9l+q
   g==;
X-CSE-ConnectionGUID: GJdzxKqnRLKNv2gw9uwFOA==
X-CSE-MsgGUID: +X4klRGPRJSZCpLB8GGZ3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81537711"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81537711"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:46:25 -0800
X-CSE-ConnectionGUID: 2tbQYFFDTzqbr0ChkLTeFQ==
X-CSE-MsgGUID: uuPjY4FbTruDqfviNzCPOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="245865398"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.14])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 04:46:21 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 28 Jan 2026 14:46:17 +0200 (EET)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH 5/5] drm/xe/vsec: Crescent Island PMT callbacks
In-Reply-To: <20260127182418.640701-12-michael.j.ruhl@intel.com>
Message-ID: <4d9d416c-5aa3-1d65-f2bb-4159efd343c4@linux.intel.com>
References: <20260127182418.640701-7-michael.j.ruhl@intel.com> <20260127182418.640701-12-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Jan 2026, Michael J. Ruhl wrote:

> CRI PMT support requires callbacks to access the discovery status
> and control areas.  Access is a common MMIO area that requires an
> index to be set before access is allowed.
> 
> Introduce the necessary callbacks to get the status and control
> information for CRI PMT usage.
> 
> Add the glue logic to register the CRI PMT functionality.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 84 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 81 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 4bddc22d86c7..c5b0c16f23be 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -300,17 +300,89 @@ int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, loff_t user_off
>  	return count;
>  }
>  
> -static struct pmt_callbacks xe_pmt_cb = {
> +/**
> + * xe_pmt_read_reg() - read a crashlog register
> + * @pdev: the pcie device that register the callback
> + * @guid: PMT guid of the crashlog instance
> + * @reg: data read from the PMT data structure
> + * @offset: which data to read from the PMT data structure
> + *
> + * Read the requested PMT register based on the pcie device and guid.  The
> + * supported struct is the Crashlog Type1 Version2.
> + *
> + * Currently this is for CRI only.
> + *

An extra empty line.

-- 
 i.

> + */
> +static int xe_pmt_read_reg(struct pci_dev *pdev, u32 guid, u32 *reg, u32 offset)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	void __iomem *disc_addr = xe->mmio.regs;
> +	u32 inst;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
> +		return -EINVAL;
> +
> +	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ? PUNIT_DISC_OFFSET : OOBMSM_DISC_OFFSET;
> +	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
> +
> +	guard(mutex)(&xe->pmt.lock);
> +
> +	xe_pm_runtime_get(xe);
> +
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	memcpy_fromio(reg, disc_addr, sizeof(*reg));
> +
> +	xe_pm_runtime_put(xe);
> +
> +	return 0;
> +}
> +
> +static int xe_pmt_write_reg(struct pci_dev *pdev, u32 guid, u32 reg, u32 offset)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	void __iomem *disc_addr = xe->mmio.regs;
> +	u32 inst;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) != CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) != CRASHLOG)
> +		return -EINVAL;
> +
> +	inst = FIELD_GET(GUID_RECORD_ID, guid) == PUNIT ? PUNIT_DISC_OFFSET : OOBMSM_DISC_OFFSET;
> +	disc_addr += CRI_DISCOVERY_OFFSET + inst + offset;
> +
> +	guard(mutex)(&xe->pmt.lock);
> +
> +	xe_pm_runtime_get(xe);
> +
> +	xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +	memcpy_toio(disc_addr, &reg, sizeof(reg));
> +
> +	xe_pm_runtime_put(xe);
> +
> +	return 0;
> +}
> +
> +static struct pmt_callbacks xe_bmg_pmt_cb = {
> +	.read_telem = xe_pmt_telem_read,
> +};
> +
> +static struct pmt_callbacks xe_cri_pmt_cb = {
>  	.read_telem = xe_pmt_telem_read,
> +	.read_reg = xe_pmt_read_reg,
> +	.write_reg = xe_pmt_write_reg,
>  };
>  
>  static const int vsec_platforms[] = {
>  	[XE_BATTLEMAGE] = XE_VSEC_BMG,
> +	[XE_CRESCENTISLAND] = XE_VSEC_CRI,
>  };
>  
>  static enum xe_vsec get_platform_info(struct xe_device *xe)
>  {
> -	if (xe->info.platform > XE_BATTLEMAGE)
> +	if (xe->info.platform > XE_CRESCENTISLAND)
>  		return XE_VSEC_UNKNOWN;
>  
>  	return vsec_platforms[xe->info.platform];
> @@ -338,8 +410,14 @@ void xe_vsec_init(struct xe_device *xe)
>  
>  	switch (platform) {
>  	case XE_VSEC_BMG:
> -		info->priv_data = &xe_pmt_cb;
> +		info->priv_data = &xe_bmg_pmt_cb;
>  		break;
> +
> +	case XE_VSEC_CRI:
> +		info->priv_data = &xe_cri_pmt_cb;
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		break;
> +
>  	default:
>  		break;
>  	}
> 

