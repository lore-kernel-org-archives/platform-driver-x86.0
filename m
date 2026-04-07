Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947B83B4EAB;
	Tue,  7 Apr 2026 12:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566624; cv=none; b=Fj61hOmH/9xcmtzsCaQ/eLbvG9zeRCS4hbWrgd+ajbXTQsVn+lI6FC/i0tjZKeUHJR2eyi//fxi9CXuKAixN54T9So4Qo8v24iFqogILVKLwMc8LdOwM9PNH7o2fAKiT/7ohVDOf/hC2PCFqhkUzXziE30bBzLRN9tXLX9jEUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566624; c=relaxed/simple;
	bh=fbmPmQRCD/WXQOQgEJgEAl99iZmcr1tQ36O/9bYsOI0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fX0BNAXCbuquR4Dihy3JjvcwoVlGrHpzSXhUwxGvSNhLEZGtSq5yFiFPlFlXVlsjZWhon8RcrGUEzmjTG/mIysYaKDrSd+wSnri4dqa1lZUA3HBCNVYYT2UQp2qRf31XdGXuyMIcerq3jBhGjWmOgSrsx0Jz0Uzxas7u2VQHxts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFz38/Nb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFz38/Nb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775566622; x=1807102622;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fbmPmQRCD/WXQOQgEJgEAl99iZmcr1tQ36O/9bYsOI0=;
  b=BFz38/NbirT/FXCMTg0sxrzXpQX2hFc3kvHJAfrmYiWPe4/BVAo+Jbn8
   1WuNhvOZ66KI1pkfJdliFpOl/diYTxWj91wnz5OGLyF098nz9Y0mGTT2y
   zEZCKmrkKOUipnP6vksSZLOB6Ode290XJuulGLZlVBAgVhsXrLvg+ssMF
   a29SHf7YlFa9VoG0a0Ar5D7AytuQSHR0bYEoazNbfWpWWwtnHh01E5X3F
   3CRavWJ0W6RFCXoYIrN2942oz75BI98u7Jef21O3VtkxABqwtYIjgJSml
   zBi8+A9AIYg8WUXsCBfhmPaXXgs/AhGr55StbUYR4kVd5P8nbhJCdcSxO
   A==;
X-CSE-ConnectionGUID: VarJSSLcSruJVfPy0lekxA==
X-CSE-MsgGUID: UM9DUoCnSE62btyvA6B1NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80415989"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="80415989"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 05:57:02 -0700
X-CSE-ConnectionGUID: +MctmK9ITkCcUr4I2kEbhw==
X-CSE-MsgGUID: YGaV5eMeQ12s3NGE7WUOVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="266141966"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 05:56:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Apr 2026 15:56:55 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
    xi.pardee@linux.intel.com, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH V2 08/17] platform/x86/intel/pmc: Add ACPI PWRM telemetry
 driver for Nova Lake S
In-Reply-To: <20260325014819.1283566-9-david.e.box@linux.intel.com>
Message-ID: <858f469b-9009-4858-feec-82fee3ab29cd@linux.intel.com>
References: <20260325014819.1283566-1-david.e.box@linux.intel.com> <20260325014819.1283566-9-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Mar 2026, David E. Box wrote:

> Add an ACPI-based PMC PWRM telemetry driver for Nova Lake S. The driver
> locates PMT discovery data in _DSD under the Intel VSEC UUID, parses it,
> and registers telemetry regions with the PMT/VSEC framework so PMC
> telemetry is exposed via existing PMT interfaces.
> 
> Export pmc_parse_telem_dsd() and pmc_find_telem_guid() to support ACPI
> discovery in other PMC drivers (e.g., ssram_telemetry) without duplicating
> ACPI parsing logic. Also export acpi_disc_t typedef from core.h for callers
> to properly declare discovery table arrays.
> 
> Selected by INTEL_PMC_CORE. Existing PCI functionality is preserved.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
> 
> V2 changes:
> - Added explicit <linux/uuid.h> include for guid_t type availability in
>   core.h
> - Added explicit <linux/bits.h> include in pwrm_telemetry.c for GENMASK()
> - Added <linux/cleanup.h> and converted goto based cleanup to __free()
>   attributes per Ilpo's feedback
> - Combined u64 hdr0 and u64 hdr1 into single declaration
> - Converted pmc_parse_telem_dsd() to return acpi_disc directly with
>   ERR_PTR() for failures
> - Added braces around _DSD evaluation failure path
> 
>  drivers/platform/x86/intel/pmc/Kconfig        |  14 ++
>  drivers/platform/x86/intel/pmc/Makefile       |   2 +
>  drivers/platform/x86/intel/pmc/core.h         |  15 ++
>  .../platform/x86/intel/pmc/pwrm_telemetry.c   | 214 ++++++++++++++++++
>  4 files changed, 245 insertions(+)
>  create mode 100644 drivers/platform/x86/intel/pmc/pwrm_telemetry.c
> 
> diff --git a/drivers/platform/x86/intel/pmc/Kconfig b/drivers/platform/x86/intel/pmc/Kconfig
> index 0f19dc7edcf9..937186b0b5dd 100644
> --- a/drivers/platform/x86/intel/pmc/Kconfig
> +++ b/drivers/platform/x86/intel/pmc/Kconfig
> @@ -9,6 +9,7 @@ config INTEL_PMC_CORE
>  	depends on ACPI
>  	depends on INTEL_PMT_TELEMETRY
>  	select INTEL_PMC_SSRAM_TELEMETRY
> +	select INTEL_PMC_PWRM_TELEMETRY
>  	help
>  	  The Intel Platform Controller Hub for Intel Core SoCs provides access
>  	  to Power Management Controller registers via various interfaces. This
> @@ -39,3 +40,16 @@ config INTEL_PMC_SSRAM_TELEMETRY
>  	  (including sysfs).
>  
>  	  This option is selected by INTEL_PMC_CORE.
> +
> +config INTEL_PMC_PWRM_TELEMETRY
> +	tristate
> +	help
> +	  This driver discovers PMC PWRM telemetry regions described in ACPI
> +	  _DSD and registers them with the Intel VSEC framework as Intel PMT
> +	  telemetry devices.
> +
> +	  It validates the ACPI discovery data and publishes the discovered
> +	  regions so they can be accessed through the Intel PMT telemetry
> +	  interfaces (including sysfs).
> +
> +	  This option is selected by INTEL_PMC_CORE.
> diff --git a/drivers/platform/x86/intel/pmc/Makefile b/drivers/platform/x86/intel/pmc/Makefile
> index bb960c8721d7..fdbb768f7b09 100644
> --- a/drivers/platform/x86/intel/pmc/Makefile
> +++ b/drivers/platform/x86/intel/pmc/Makefile
> @@ -12,3 +12,5 @@ obj-$(CONFIG_INTEL_PMC_CORE)		+= intel_pmc_core_pltdrv.o
>  # Intel PMC SSRAM driver
>  intel_pmc_ssram_telemetry-y		+= ssram_telemetry.o
>  obj-$(CONFIG_INTEL_PMC_SSRAM_TELEMETRY)	+= intel_pmc_ssram_telemetry.o
> +intel_pmc_pwrm_telemetry-y		+= pwrm_telemetry.o
> +obj-$(CONFIG_INTEL_PMC_PWRM_TELEMETRY)	+= intel_pmc_pwrm_telemetry.o
> diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
> index 118c8740ad3a..37ea1caf1817 100644
> --- a/drivers/platform/x86/intel/pmc/core.h
> +++ b/drivers/platform/x86/intel/pmc/core.h
> @@ -14,10 +14,14 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/bits.h>
> +#include <linux/cleanup.h>
>  #include <linux/platform_device.h>
> +#include <linux/uuid.h>
>  
>  struct telem_endpoint;
>  
> +DEFINE_FREE(pmc_acpi_free, void *, if (_T) ACPI_FREE(_T))
> +
>  #define SLP_S0_RES_COUNTER_MASK			GENMASK(31, 0)
>  
>  #define PMC_BASE_ADDR_DEFAULT			0xFE000000
> @@ -562,6 +566,8 @@ int pmc_core_pmt_get_blk_sub_req(struct pmc_dev *pmcdev, struct pmc *pmc,
>  extern const struct file_operations pmc_core_substate_req_regs_fops;
>  extern const struct file_operations pmc_core_substate_blk_req_fops;
>  
> +extern const guid_t intel_vsec_guid;
> +
>  #define pmc_for_each_mode(mode, pmc)						\
>  	for (unsigned int __i = 0, __cond;					\
>  	     __cond = __i < (pmc)->num_lpm_modes,				\
> @@ -583,4 +589,13 @@ static const struct file_operations __name ## _fops = {			\
>  	.release	= single_release,				\
>  }
>  
> +struct intel_vsec_header;
> +union acpi_object;
> +
> +/* Avoid checkpatch warning */
> +typedef u32 (*acpi_disc_t)[4];
> +
> + acpi_disc_t pmc_parse_telem_dsd(union acpi_object *obj,

Remove extra space.

> +			 struct intel_vsec_header *header);

This doesn't seem to align to (.

> +union acpi_object *pmc_find_telem_guid(union acpi_object *dsd);
>  #endif /* PMC_CORE_H */
> diff --git a/drivers/platform/x86/intel/pmc/pwrm_telemetry.c b/drivers/platform/x86/intel/pmc/pwrm_telemetry.c
> new file mode 100644
> index 000000000000..e852ee2d6d9f
> --- /dev/null
> +++ b/drivers/platform/x86/intel/pmc/pwrm_telemetry.c
> @@ -0,0 +1,214 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Intel PMC PWRM ACPI driver
> + *
> + * Copyright (C) 2025, Intel Corporation
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/intel_vsec.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/resource.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/uuid.h>
> +
> +#include "core.h"
> +
> +#define ENTRY_LEN		5
> +
> +/* DWORD2 */
> +#define DVSEC_ID_MASK		GENMASK(15, 0)
> +#define NUM_ENTRIES_MASK	GENMASK(23, 16)
> +#define ENTRY_SIZE_MASK		GENMASK(31, 24)
> +
> +/* DWORD3 */
> +#define TBIR_MASK		GENMASK(2, 0)
> +#define DISC_TBL_OFF_MASK	GENMASK(31, 3)
> +
> +const guid_t intel_vsec_guid =
> +	GUID_INIT(0x294903fb, 0x634d, 0x4fc7, 0xaf, 0x1f, 0x0f, 0xb9,
> +		  0x56, 0xb0, 0x4f, 0xc1);
> +
> +static bool is_valid_entry(union acpi_object *pkg)
> +{
> +	int i;
> +
> +	if (!pkg || pkg->type != ACPI_TYPE_PACKAGE || pkg->package.count != ENTRY_LEN)
> +		return false;
> +
> +	if (pkg->package.elements[0].type != ACPI_TYPE_STRING)
> +		return false;
> +
> +	for (i = 1; i < ENTRY_LEN; i++)
> +		if (pkg->package.elements[i].type != ACPI_TYPE_INTEGER)
> +			return false;
> +
> +	return true;
> +}
> +
> +u32 (*pmc_parse_telem_dsd(union acpi_object *obj,
> +			  struct intel_vsec_header *header))[4]

Can't you use acpi_disc_t here as well?

> +{
> +	acpi_disc_t disc __free(kfree) = NULL;

This should not be indendepent but at the site of allocation (__free() = 
NULL; is trappy pattern so better avoid it).

> +	union acpi_object *vsec_pkg;
> +	union acpi_object *disc_pkg;
> +	u64 hdr0, hdr1;
> +	int num_regions;
> +	int i;
> +
> +	if (!header)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!obj || obj->type != ACPI_TYPE_PACKAGE || obj->package.count != 2)
> +		return ERR_PTR(-EINVAL);
> +
> +	/* First Package is DVSEC info */
> +	vsec_pkg = &obj->package.elements[0];
> +	if (!is_valid_entry(vsec_pkg))
> +		return ERR_PTR(-EINVAL);
> +
> +	hdr0 = vsec_pkg->package.elements[3].integer.value;
> +	hdr1 = vsec_pkg->package.elements[4].integer.value;
> +
> +	header->id          = FIELD_GET(DVSEC_ID_MASK, hdr0);
> +	header->num_entries = FIELD_GET(NUM_ENTRIES_MASK, hdr0);
> +	header->entry_size  = FIELD_GET(ENTRY_SIZE_MASK, hdr0);
> +	header->tbir        = FIELD_GET(TBIR_MASK, hdr1);
> +	header->offset      = FIELD_GET(DISC_TBL_OFF_MASK, hdr1);
> +
> +	/* Second Package contains the discovery tables */
> +	disc_pkg = &obj->package.elements[1];
> +	if (disc_pkg->type != ACPI_TYPE_PACKAGE || disc_pkg->package.count < 1)
> +		return ERR_PTR(-EINVAL);
> +
> +	num_regions = disc_pkg->package.count;
> +	if (header->num_entries != num_regions)
> +		return ERR_PTR(-EINVAL);
> +
> +	disc = kmalloc_array(num_regions, sizeof(*disc), GFP_KERNEL);
> +	if (!disc)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < num_regions; i++) {
> +		union acpi_object *pkg;
> +		u64 value;
> +		int j;
> +
> +		pkg = &disc_pkg->package.elements[i];
> +		if (!is_valid_entry(pkg))
> +			return ERR_PTR(-EINVAL);
> +
> +		/* Element 0 is a descriptive string; DWORD values start at index 1. */
> +		for (j = 1; j < ENTRY_LEN; j++) {
> +			value = pkg->package.elements[j].integer.value;
> +			if (value > U32_MAX)
> +				return ERR_PTR(-ERANGE);
> +
> +			disc[i][j - 1] = value;
> +		}
> +	}
> +
> +	return no_free_ptr(disc);
> +}
> +EXPORT_SYMBOL_NS_GPL(pmc_parse_telem_dsd, "INTEL_PMC_CORE");


-- 
 i.

