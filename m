Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F59E39E6E3;
	Thu, 15 Jan 2026 13:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768482910; cv=none; b=ebODP8dCIpAfneSPFNamsXChmO3RoLyBGcMWxvWNBkhc7EeiHC44tEQMQvZ1tqEcsPu5GOGQr/8Qf/3QX+7VeXguhwelh+2wCe1lk0JGMWODiIM7BwB3+XPaCY/t8DEk1/otAQDEGq+0McEC9ZVDdfN3Dy0szd7cA+zY5L+pzT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768482910; c=relaxed/simple;
	bh=NAQ/zSg6GXxRikkqlsstfGl2uLu71T/Xx4H5SHFFafo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=urPIRRoVzLkEvjucDnP0aeZeYZBguAfGR4+mRg23+ah05OmBeFWmn1JNHDnHE3+1n7WHSbF8kaEejLuJWjr2RZx6nbwdo1yE0nA8nZM8J51WlHAmeyFMkGLON0tBx0BaPwlF09qm+MfG0xPAITNgs7nRnlFRnrrjkRFGvLcrFY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NSzkwAho; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSzkwAho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768482909; x=1800018909;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NAQ/zSg6GXxRikkqlsstfGl2uLu71T/Xx4H5SHFFafo=;
  b=NSzkwAhoWkQxxhQnVl4VWJFMEmRHmuzgpG4QjXeLA3I8jbBBO+jYXVSe
   3P9BWARiiey38xwDmXBuCuloQy2DLThhtjJqJg8rPoyuWI2TkGzXb4mlz
   0qDmLtRXjCpUWrx3AMD+lscG9iRrfnmbmj6VAYYZAdZ5gTEMLy4DR/koG
   y0W8mRheyTeBK4A2Ye7IivIKyS+bpW6TxcMIYhkWUiPe/L9q+0qfmdzA7
   CFhkW69c6vfp2sH9Q8e5ECr/2sB/10+6enpwoKu9RkyRisgO2hLw+xptQ
   9nvwa1RCNP9urZEs6m/6m50DeQLjLLmzKeNKE6cl1SRdW6pZUZM+uS7C7
   Q==;
X-CSE-ConnectionGUID: TrwNEXaJQB60ntRNLV2Qwg==
X-CSE-MsgGUID: rlNTikitSEixrPP4v1UEEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69685849"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69685849"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 05:15:09 -0800
X-CSE-ConnectionGUID: Tj77cPJuRCOPwXAPgwmE8Q==
X-CSE-MsgGUID: l8iG3PnbQNCJ/xf8Uy+u8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="235662931"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.248])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 05:15:05 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Jan 2026 15:15:01 +0200 (EET)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
    irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
    intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
    xi.pardee@linux.intel.comn, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 4/4] platform/x86/intel/vsec: Plumb ACPI PMT discovery
 tables through vsec
In-Reply-To: <20260107002153.63830-5-david.e.box@linux.intel.com>
Message-ID: <35e7afb6-2aad-1729-bb79-2c56a64c3277@linux.intel.com>
References: <20260107002153.63830-1-david.e.box@linux.intel.com> <20260107002153.63830-5-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Jan 2026, David E. Box wrote:

> Newer platform will optionally expose PMT discovery via ACPI instead of PCI
> BARs. Add a generic discovery source flag and carry ACPI discovery entries
> alongside the existing PCI resource path so PMT clients can consume either.
> 
> Changes:
>   - Add enum intel_vsec_disc_source { _PCI, _ACPI }.
>   - Extend intel_vsec_platform_info and intel_vsec_device with source enum
>     and ACPI discovery table pointer/
>   - When src==ACPI, skip BAR resource setup and copy the ACPI discovery
>     entries into the aux device.
> 
> No user-visible behavior change yet; this only wires ACPI data through vsec
> in preparation for ACPI-enumerated PMT clients.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/platform/x86/intel/vsec.c | 16 ++++++++++++++++
>  include/linux/intel_vsec.h        | 20 +++++++++++++++++++-
>  2 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> index 42471fd609b1..705672dcdd11 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -109,6 +109,7 @@ static void intel_vsec_dev_release(struct device *dev)
>  
>  	ida_free(intel_vsec_dev->ida, intel_vsec_dev->auxdev.id);
>  
> +	kfree(intel_vsec_dev->acpi_disc);
>  	kfree(intel_vsec_dev->resource);
>  	kfree(intel_vsec_dev);
>  }
> @@ -321,6 +322,10 @@ static int intel_vsec_add_dev(struct device *dev, struct intel_vsec_header *head
>  	 * auxiliary device driver.
>  	 */
>  	for (i = 0, tmp = res; i < header->num_entries; i++, tmp++) {
> +		/* This check doesn't apply to ACPI based discovery */

"This check" is somewhat vague, if it doesn't require a novel, it would be 
better to write out what check.

> +		if (info->src == INTEL_VSEC_DISC_ACPI)
> +			break;
> +
>  		tmp->start = base_addr + header->offset + i * (header->entry_size * sizeof(u32));
>  		tmp->end = tmp->start + (header->entry_size * sizeof(u32)) - 1;
>  		tmp->flags = IORESOURCE_MEM;
> @@ -339,6 +344,17 @@ static int intel_vsec_add_dev(struct device *dev, struct intel_vsec_header *head
>  	intel_vsec_dev->base_addr = info->base_addr;
>  	intel_vsec_dev->priv_data = info->priv_data;
>  	intel_vsec_dev->cap_id = cap_id;
> +	intel_vsec_dev->src = info->src;
> +
> +	if (info->src == INTEL_VSEC_DISC_ACPI) {
> +		size_t bytes;
> +
> +		bytes = intel_vsec_dev->num_resources * sizeof(info->acpi_disc[0]);

Should this use some overflow.h helper?

> +
> +		intel_vsec_dev->acpi_disc = kmemdup(info->acpi_disc, bytes, GFP_KERNEL);

include for kmemdup() seems missing.

> +		if (!intel_vsec_dev->acpi_disc)
> +			return -ENOMEM;
> +	}
>  
>  	if (header->id == VSEC_ID_SDSI)
>  		intel_vsec_dev->ida = &intel_vsec_sdsi_ida;
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 931ff42361a9..9d7795480c49 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -32,6 +32,11 @@
>  struct resource;
>  struct pci_dev;
>  
> +enum intel_vsec_disc_source {
> +	INTEL_VSEC_DISC_PCI,	/* PCI, default */
> +	INTEL_VSEC_DISC_ACPI,	/* ACPI */
> +};
> +
>  enum intel_vsec_id {
>  	VSEC_ID_TELEMETRY	= 2,
>  	VSEC_ID_WATCHER		= 3,
> @@ -102,6 +107,10 @@ struct vsec_feature_dependency {
>   * @parent:    parent device in the auxbus chain
>   * @headers:   list of headers to define the PMT client devices to create
>   * @deps:      array of feature dependencies
> + * @acpi_disc: ACPI discovery tables, each entry is two QWORDs
> + *             in little-endian format as defined by the PMT ACPI spec.
> + *             Valid only when @provider == INTEL_VSEC_PROV_ACPI.
> + * @src:       source of discovery table data
>   * @priv_data: private data, usable by parent devices, currently a callback
>   * @caps:      bitmask of PMT capabilities for the given headers
>   * @quirks:    bitmask of VSEC device quirks
> @@ -112,6 +121,8 @@ struct intel_vsec_platform_info {
>  	struct device *parent;
>  	struct intel_vsec_header **headers;
>  	const struct vsec_feature_dependency *deps;
> +	u32 (*acpi_disc)[4];
> +	enum intel_vsec_disc_source src;
>  	void *priv_data;
>  	unsigned long caps;
>  	unsigned long quirks;
> @@ -123,7 +134,12 @@ struct intel_vsec_platform_info {
>   * struct intel_sec_device - Auxbus specific device information
>   * @auxdev:        auxbus device struct for auxbus access
>   * @dev:           struct device associated with the device
> - * @resource:      any resources shared by the parent
> + * @resource:      PCI discovery resources (BAR windows), one per discovery
> + *                 instance. Valid only when @src == INTEL_VSEC_PROV_PCI
> + * @acpi_disc:     ACPI discovery tables, each entry is two QWORDs
> + *                 in little-endian format as defined by the PMT ACPI spec.
> + *                 Valid only when @src == INTEL_VSEC_PROV_ACPI.
> + * @src:           source of discovery table data
>   * @ida:           id reference
>   * @num_resources: number of resources
>   * @id:            xarray id
> @@ -136,6 +152,8 @@ struct intel_vsec_device {
>  	struct auxiliary_device auxdev;
>  	struct device *dev;
>  	struct resource *resource;
> +	u32 (*acpi_disc)[4];
> +	enum intel_vsec_disc_source src;
>  	struct ida *ida;
>  	int num_resources;
>  	int id; /* xa */
> 

-- 
 i.

