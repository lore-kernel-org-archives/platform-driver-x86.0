Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D024938757D
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Aug 2026 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653177; cv=none; b=BxnjqCExTr4qii0ryzA0zVcjqhBVjQWKu/Bo2Bq+fR2mDgcaKDylZRCqbcamZ/sv7cvifzn3MBcUppG3F/kJseF5ry8bgUoRtPgC9aF1V4R7cUIzV8VcOB8ueo8kKi1EpOe3+aWO9FTdPkoJ9+GykL/AQTl/q3SL5aUn5ziyTqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653177; c=relaxed/simple;
	bh=bWOowctcCp6GhNZ893fwpkgqH/8kVhScoG1gUhzStHM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DyXHpSxhAArDiVwYMjqraDJQfMgIeDL3Z8OTsLyYzChMfBf6nCuFrUUVFZR7JK5h3CuI6o6/yoVqAQrp6ForZ3WjJqLjEeBqHNwK9ba1OGQQ6udOirFQSwP0hNjP/T4t8Fu4SHaCCDatgT1r7yNBTjdRyjX8dxSHZb3Ga+BYzIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgha+sWw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgha+sWw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787653176; x=1819189176;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bWOowctcCp6GhNZ893fwpkgqH/8kVhScoG1gUhzStHM=;
  b=hgha+sWwRY1IDOjLY6qfqMe0Jj8i46Id66iDl3rMPtybu6qbLFtIYrv9
   0KhAbzBM5C7GHVotK5PPmdeU1vfqzICFaRhc3SD7E2NYxTCw9d0miRGRI
   OPeKFh4C3EE3EcCcnDDqmqCUoplLyMiS4ShwtPjXoQMZXsFo/4W1H1TD/
   wBUOYRwX4BUHwIEmmxRSKsnB6IYXF8DpMK1X/Q6feM1DbsNprvEJaw4Zl
   8W53KLI+P49ptOdzs1c+FKiKWvXeJ4FmkdOyPzet+UnEX1Z8hp/1va/kc
   RAwgnqVHWy5gkTVwMYhS//yC1a+0tbT9qgXnM8WFVnk4wsrRVXD/f4iaR
   A==;
X-CSE-ConnectionGUID: ywi+ntlXQjyaHAlVjU66Fg==
X-CSE-MsgGUID: B+uivgzLQSWE0VDm0QuceQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="99639357"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="99639357"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 03:19:35 -0700
X-CSE-ConnectionGUID: EOzRqqrXTUCPDz2FwEXUcQ==
X-CSE-MsgGUID: 7tQjZTwRRXO2wlXpLFsIpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="292099565"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 03:19:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 25 Aug 2026 13:19:21 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
    anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
    matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v3 06/10] drm/xe/vsec: Support Crescent Island PMT
In-Reply-To: <20260824162317.2450380-18-michael.j.ruhl@intel.com>
Message-ID: <4246052e-8308-70bb-baed-22d6ff18ba83@linux.intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com> <20260824162317.2450380-18-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Aug 2026, Michael J. Ruhl wrote:

> Crescent Island (CRI) supports PMT telemetry and crashlog.
> 
> Add Crescent Island (CRI) discovery structure (DVSEC)
> information to allow for Xe registration.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_pmt.h |  5 ++++
>  drivers/gpu/drm/xe/xe_vsec.c     | 46 ++++++++++++++++++++++++++++++--
>  2 files changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index a62ab05c6b4c..fc9c9cb6a830 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -20,6 +20,11 @@
>  #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>  #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
>  
> +#define CRI_TELEMETRY_BASE_OFFSET	0xE0000
> +/* for CRI discovery and telemetry are in an indexed window */
> +#define CRI_DISCOVERY_OFFSET		(SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)
> +#define CRI_TELEMETRY_OFFSET		(SOC_BASE + CRI_TELEMETRY_BASE_OFFSET)
> +
>  #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
>  #define BMG_G2_RESIDENCY_OFFSET		(0x530)
>  #define BMG_G6_RESIDENCY_OFFSET		(0x538)
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 8abe11e6312f..6345b0b4b26b 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -21,8 +21,19 @@
>  
>  #include "regs/xe_pmt.h"
>  
> -/* PMT GUID value for BMG devices.  NOTE: this is NOT a PCI id */
> +/* PMT GUID value for BMG and CRI devices.  NOTE: this is NOT a PCI id */
>  #define BMG_DEVICE_ID 0xE2F8
> +#define CRI_DEVICE_ID 0xE2FA
> +
> +/*
> + * sizeof(Crashlog Type1 Version2) = 0x18 (24) bytes
> + * For BMG and CRI PUNIT and OOBMSMS crashlogs are consecutive.
> + */
> +#define BMG_CRASHLOG_PUNIT_DISC_OFFSET (0x60)
> +#define BMG_CRASHLOG_OOBMSM_DISC_OFFSET (BMG_CRASHLOG_PUNIT_DISC_OFFSET + 0x18)
> +
> +#define CRI_CRASHLOG_PUNIT_DISC_OFFSET (0x80)
> +#define CRI_CRASHLOG_OOBMSM_DISC_OFFSET (CRI_CRASHLOG_PUNIT_DISC_OFFSET + 0x18)
>  
>  static struct intel_vsec_header bmg_telemetry = {
>  	.rev = 1,
> @@ -41,7 +52,7 @@ static struct intel_vsec_header bmg_crashlog = {
>  	.num_entries = 2,
>  	.entry_size = 6,
>  	.tbir = 0,
> -	.offset = BMG_DISCOVERY_OFFSET + 0x60,
> +	.offset = BMG_DISCOVERY_OFFSET + BMG_CRASHLOG_PUNIT_DISC_OFFSET,
>  };
>  
>  static struct intel_vsec_header *bmg_capabilities[] = {
> @@ -50,9 +61,36 @@ static struct intel_vsec_header *bmg_capabilities[] = {
>  	NULL
>  };
>  
> +static struct intel_vsec_header cri_telemetry = {
> +	.rev = 1,
> +	.length = 0x10,

...

> +static struct intel_vsec_header cri_crashlog = {
> +	.rev = 1,
> +	.length = 0x10,

One could consider using SZ_x for these (if you do, make sure you've the 
header for it).

> +	.id = VSEC_ID_CRASHLOG,
> +	.num_entries = 2,
> +	.entry_size = 6,
> +	.tbir = 0,
> +	.offset = CRI_DISCOVERY_OFFSET + CRI_CRASHLOG_PUNIT_DISC_OFFSET,
> +};
> +
> +static struct intel_vsec_header *cri_capabilities[] = {
> +	&cri_telemetry,
> +	&cri_crashlog,
> +	NULL
> +};
> +
>  enum xe_vsec {
>  	XE_VSEC_UNKNOWN = 0,
>  	XE_VSEC_BMG,
> +	XE_VSEC_CRI,
>  };
>  
>  static struct intel_vsec_platform_info xe_vsec_info[] = {
> @@ -60,6 +98,10 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
>  		.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
>  		.headers = bmg_capabilities,
>  	},
> +	[XE_VSEC_CRI] = {
> +		.caps = VSEC_CAP_TELEMETRY | VSEC_CAP_CRASHLOG,
> +		.headers = cri_capabilities,
> +	},
>  	{ }
>  };
>  
> 

-- 
 i.

