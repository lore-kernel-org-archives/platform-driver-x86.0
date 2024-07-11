Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD5F12C489
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 11:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698281; cv=none; b=A7cDx2GbCQCabfqox9rYlSSA8hFGgFAa2NWQWcnSj7RRb/gk1PQ3kaLDbHyhSIbblpvmw8HiBa35+mP5q/dVINCkKEqfMoBkQbvdfwEpQHay7196CFcueVSYwRVZUDr0Ezq+EXtZwRRzG5zemTZs/IXUGRRDmKEBXKPqqhpjRc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698281; c=relaxed/simple;
	bh=8GCgu0IoTPi1B5Rkc4JxZdX9C06g0PN0ojcJOy9qs8M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MC0JZvsqkSXHexFiufsDOFrE9VachIsX8/JTxuZMHxLX8CM5k+yxIwKCdiCLrdot11VaE0Ey61uhmMaBIW+RdCDXK9eKaVZkQUBxGou72Y6KEGjDRrh7UGH+1syRJ1TSB16FMjEQMo/0MoeXZRF2fECZs5NFQ3XPbCUq86zlncQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UU6yQt90; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UU6yQt90"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720698280; x=1752234280;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8GCgu0IoTPi1B5Rkc4JxZdX9C06g0PN0ojcJOy9qs8M=;
  b=UU6yQt90GkZalIohZlQQGK1NxGUl6MCG3blNWf5chykrHL+NAZmC0uPt
   mnAuuZvGF6vFywVmWWzOV8KJtuTEc+888WxAopJtHCMhrQOX6MyiSFsjs
   xHh6OLfqQ/YVBu4P2tpV1Ysy4b4axVyCqFy1Z9xG57+A8VyXiIKqD3J7q
   ieUi21NqNsbWXvbyJ+vPQzoa2u3S6Qv81NGpghyuCFBy5Hy4v9A74uJOt
   rbPo3P/EzvIk3QKZQa7UknfU8xNhShKPAbhbGfJkJJSu2TRXXhcIsGmMc
   fJYNkkk8kl79q0QtPDQbvb41xZYh9PWvp/V0L3CGol3L23zeyEDo3P0CQ
   Q==;
X-CSE-ConnectionGUID: +Opfx7Z2SIGTIpeerit5VA==
X-CSE-MsgGUID: kU1/9/I3Q6GjKbhFAs2AMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17887323"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="17887323"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 04:44:39 -0700
X-CSE-ConnectionGUID: HLw3daF6Re+3vp9yzTlwQw==
X-CSE-MsgGUID: jNTJYawrRE6ObxTceshZnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="53707003"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.127])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 04:44:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 11 Jul 2024 14:44:33 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
    david.e.box@linux.intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v6 6/6] drm/xe/vsec: Add support for DG2
In-Reply-To: <20240710192249.3915396-7-michael.j.ruhl@intel.com>
Message-ID: <c3a26fdd-ebb7-a5d1-38b3-0832c7e92652@linux.intel.com>
References: <20240710192249.3915396-1-michael.j.ruhl@intel.com> <20240710192249.3915396-7-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Jul 2024, Michael J. Ruhl wrote:

> DG2 needs to adjust the discovery offset WRT the GT BAR not the

WRT = w.r.t. ?

> P2SB bar so add the base_adjust value to allow for the difference
> to be used.

Could you please try to write out the problem in clearer terms. Currently 
the reasonale given in patch 5 doesn't even match the one given here or 
it is written in so unclear terms I cannot make the connection.

> Update xe_vsec.c to include DG2 header information.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 81 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 98999d467db1..531ddd32a1a6 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -19,6 +19,16 @@
>  
>  #define SOC_BASE		0x280000
>  
> +/* from drivers/platform/x86/intel/pmt/telemetry.c */
> +#define TELEM_BASE_OFFSET	0x8
> +
> +#define DG2_PMT_BASE		0xE8000
> +#define DG2_DISCOVERY_START	0x6000
> +#define DG2_TELEM_START		0x4000
> +
> +#define DG2_DISCOVERY_OFFSET	(SOC_BASE + DG2_PMT_BASE + DG2_DISCOVERY_START)
> +#define DG2_TELEM_OFFSET	(SOC_BASE + DG2_PMT_BASE + DG2_TELEM_START)
> +
>  #define BMG_PMT_BASE		0xDB000
>  #define BMG_DISCOVERY_OFFSET	(SOC_BASE + BMG_PMT_BASE)
>  
> @@ -32,6 +42,20 @@
>  #define SG_REMAP_INDEX1		XE_REG(SOC_BASE + 0x08)
>  #define SG_REMAP_BITS		GENMASK(31, 24)
>  
> +static struct intel_vsec_header dg2_telemetry = {
> +	.length = 0x10,
> +	.id = VSEC_ID_TELEMETRY,
> +	.num_entries = 1,
> +	.entry_size = 3,
> +	.tbir = GFX_BAR,
> +	.offset = DG2_DISCOVERY_OFFSET,
> +};
> +
> +static struct intel_vsec_header *dg2_capabilities[] = {
> +	&dg2_telemetry,
> +	NULL
> +};
> +
>  static struct intel_vsec_header bmg_telemetry = {
>  	.length = 0x10,
>  	.id = VSEC_ID_TELEMETRY,
> @@ -48,10 +72,16 @@ static struct intel_vsec_header *bmg_capabilities[] = {
>  
>  enum xe_vsec {
>  	XE_VSEC_UNKNOWN = 0,
> +	XE_VSEC_DG2,
>  	XE_VSEC_BMG,
>  };
>  
>  static struct intel_vsec_platform_info xe_vsec_info[] = {
> +	[XE_VSEC_DG2] = {
> +		.caps = VSEC_CAP_TELEMETRY,
> +		.headers = dg2_capabilities,
> +		.quirks = VSEC_QUIRK_EARLY_HW,
> +	},
>  	[XE_VSEC_BMG] = {
>  		.caps = VSEC_CAP_TELEMETRY,
>  		.headers = bmg_capabilities,
> @@ -174,6 +204,7 @@ struct pmt_callbacks xe_pmt_cb = {
>  };
>  
>  static const int vsec_platforms[] = {
> +	[XE_DG2] = XE_VSEC_DG2,
>  	[XE_BATTLEMAGE] = XE_VSEC_BMG,
>  };
>  
> @@ -185,6 +216,49 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
>  	return vsec_platforms[xe->info.platform];
>  }
>  
> +/*
> + * Access the DG2 PMT MMIO discovery table
> + *
> + * The intel_vsec driver does not typically access the discovery table.
> + * Instead, it creates a memory resource for the table and passes it
> + * to the PMT telemetry driver. Each discovery table contains 3 items,
> + *    - GUID
> + *    - Telemetry size
> + *    - Telemetry offset (offset from P2SB BAR, not GT)
> + *
> + * For DG2 we know what the telemetry offset is, but we still need to
> + * use the discovery table to pass the GUID and the size. So figure
> + * out the difference between the P2SB offset and the GT offset and
> + * save this so that the telemetry driver can use it to adjust the
> + * value.
> + */
> +static int dg2_adjust_offset(struct pci_dev *pdev, struct device *dev,
> +			     struct intel_vsec_platform_info *info)
> +{
> +	void __iomem *base;
> +	u32 telem_offset;
> +	u64 addr;
> +
> +	/* compile check to verify that quirk has P2SB quirk added */

I don't know what "quirk" the first instance refers to (I think I 
probably know what the P2SB quirk is).

What is the purpose/meaning of this comment? Is it some leftover for 
code that no longer exists as it talks about "compile check"??

-- 
 i.

> +
> +	addr = pci_resource_start(pdev, GFX_BAR) + info->headers[0]->offset;
> +	base = ioremap_wc(addr, 16);
> +	if (!base)
> +		return -ENOMEM;
> +
> +	telem_offset = readl(base + TELEM_BASE_OFFSET);
> +
> +	/* Use the base_addr + P2SB quirk to pass this info */
> +	if (telem_offset < DG2_TELEM_OFFSET)
> +		info->base_adjust = -(DG2_TELEM_OFFSET - telem_offset);
> +	else
> +		info->base_adjust = -(telem_offset - DG2_TELEM_OFFSET);
> +
> +	iounmap(base);
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>   * interface
> @@ -196,6 +270,7 @@ void xe_vsec_init(struct xe_device *xe)
>  	struct device *dev = xe->drm.dev;
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	enum xe_vsec platform;
> +	u32 ret;
>  
>  	platform = get_platform_info(xe);
>  	if (platform == XE_VSEC_UNKNOWN)
> @@ -206,6 +281,12 @@ void xe_vsec_init(struct xe_device *xe)
>  		return;
>  
>  	switch (platform) {
> +	case XE_VSEC_DG2:
> +		ret = dg2_adjust_offset(pdev, dev, info);
> +		if (ret)
> +			return;
> +		break;
> +
>  	case XE_VSEC_BMG:
>  		info->priv_data = &xe_pmt_cb;
>  		break;
> 
