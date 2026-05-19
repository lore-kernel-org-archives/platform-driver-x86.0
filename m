Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABDB4DD6D5;
	Tue, 19 May 2026 12:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195004; cv=none; b=SnbXM4xiGgShBUbrlwDz0uYdzzFVfsdjMKBr5msyOhji8GUTKRfUCkIiZ1U9IfohdQZsrAZTXqSv9R9t7xe7dTxxx5s0DuwLzzX1GJijem9TcPGWbqj36Jj+G9c5btfKzoDOzLiLsoG+CinZS0WtrJFrvSrwsoWACA3aXti1otg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195004; c=relaxed/simple;
	bh=EWZKcivIolQjEqauTqv0MRAm5w2W9lMN6f8PoctHzMw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CCNSxsoLUWaq4ZW6Ki6/feTcd5M4bsEI6bk35vp/4Ny1KqoSAxB2hevGtjN2Ohzxk88eUrSIZjKkHmACjBFgwHoyj52j3wKmQGRG+PlOfuCa3a/glrb7IPK+YBBWsFqDsfpuuF+ncAxn7UwuRze7NFII4q1EqLR+VO6VHovzAuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9J+PuB5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9J+PuB5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779195003; x=1810731003;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EWZKcivIolQjEqauTqv0MRAm5w2W9lMN6f8PoctHzMw=;
  b=N9J+PuB5WguZFq8zJyoBhAy2VNRxEWrX5c/qKY1agYfsC031LR56UJxM
   FaxIIM8mYNMul6Kc2DCbMQGgLZFPY6hoLlNimUaI53iPAS4VHGihgOIP6
   /ohGpCpBxtUJFzwppPZ0E3ZQxTjoa3dG9gI52L/r9cxU0k9lv4uQ8I7Cv
   Mpqtjwfz+Z0syx9equZge8wKq/j6NocWl6GQ8fCBGLCq3GGd6Q6Khqh+o
   f75efRbaTE6wkGFRoQ6eCtu7iamnR4/B9mAEhFjnC4WAH9vDn3el9/iO+
   yf+R03j1N7/wBdSuyKt2iClaHrbC+ouZPRA5qXdJFK07SaMGPEw9saNdb
   A==;
X-CSE-ConnectionGUID: KJaJNYvWQoeB51q/REHVhg==
X-CSE-MsgGUID: zSuXrHyySUalV17tR9fb0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79790514"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79790514"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:50:03 -0700
X-CSE-ConnectionGUID: tX4US6zITI6NyHgDZxhhJw==
X-CSE-MsgGUID: dqjmyp4HTvaltc7RrUo6tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="240016487"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:49:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 May 2026 15:49:55 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: y@linux.intel.com, Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Xi Pardee <xi.pardee@linux.intel.com>, 
    Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH v4 08/16] platform/x86/intel/pmc: Add ACPI PWRM telemetry
 driver for Nova Lake S
In-Reply-To: <20260515002130.701457-9-david.e.box@linux.intel.com>
Message-ID: <2f82b190-e5f1-6263-1c16-039f84c54193@linux.intel.com>
References: <20260515002130.701457-1-david.e.box@linux.intel.com> <20260515002130.701457-9-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 May 2026, David E. Box wrote:

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
> V4 changes:
>   - These changes were supposed to be in V3
>   - Updated pmc_parse_telem_dsd() in pwrm_telemetry.c to use acpi_disc_t
>     in the function return type for consistency with the exported typedef
>   - In pmc_parse_telem_dsd(), change acpi_disc declaration to happen at the
>     allocation site as specified by cleanup.h
>   - Style, readability and cleanup-path refinement based on review
>     feedback
> 
> V2 changes:
>   - Added explicit <linux/uuid.h> include for guid_t type availability in
>     core.h
>   - Added explicit <linux/bits.h> include in pwrm_telemetry.c for GENMASK()
>   - Added <linux/cleanup.h> and converted goto based cleanup to __free()
>     attributes per Ilpo's feedback
>   - Combined u64 hdr0 and u64 hdr1 into single declaration
>   - Converted pmc_parse_telem_dsd() to return acpi_disc directly with
>     ERR_PTR() for failures
>   - Added braces around _DSD evaluation failure path
> 
>  drivers/platform/x86/intel/pmc/Kconfig        |  14 ++
>  drivers/platform/x86/intel/pmc/Makefile       |   2 +
>  drivers/platform/x86/intel/pmc/core.h         |  16 ++
>  .../platform/x86/intel/pmc/pwrm_telemetry.c   | 214 ++++++++++++++++++
>  4 files changed, 246 insertions(+)
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
> index 118c8740ad3a..f458eb908c07 100644
> --- a/drivers/platform/x86/intel/pmc/core.h
> +++ b/drivers/platform/x86/intel/pmc/core.h
> @@ -14,10 +14,15 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/intel_vsec.h>
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
> @@ -562,6 +567,8 @@ int pmc_core_pmt_get_blk_sub_req(struct pmc_dev *pmcdev, struct pmc *pmc,
>  extern const struct file_operations pmc_core_substate_req_regs_fops;
>  extern const struct file_operations pmc_core_substate_blk_req_fops;
>  
> +extern const guid_t intel_vsec_guid;
> +
>  #define pmc_for_each_mode(mode, pmc)						\
>  	for (unsigned int __i = 0, __cond;					\
>  	     __cond = __i < (pmc)->num_lpm_modes,				\
> @@ -583,4 +590,13 @@ static const struct file_operations __name ## _fops = {			\
>  	.release	= single_release,				\
>  }
>  
> +struct intel_vsec_header;
> +union acpi_object;
> +
> +/* Avoid checkpatch warning */
> +typedef u32 (*acpi_disc_t)[INTEL_VSEC_ACPI_DISC_DWORDS];
> +
> +acpi_disc_t pmc_parse_telem_dsd(union acpi_object *obj,
> +				struct intel_vsec_header *header);
> +union acpi_object *pmc_find_telem_guid(union acpi_object *dsd);
>  #endif /* PMC_CORE_H */
> diff --git a/drivers/platform/x86/intel/pmc/pwrm_telemetry.c b/drivers/platform/x86/intel/pmc/pwrm_telemetry.c
> new file mode 100644
> index 000000000000..246256801f93
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
> +acpi_disc_t pmc_parse_telem_dsd(union acpi_object *obj,
> +			struct intel_vsec_header *header)
> +{
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
> +	acpi_disc_t disc __free(kfree) = kmalloc_array(num_regions, sizeof(*disc),
> +						      GFP_KERNEL);
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

Please add limits.h.

> +				return ERR_PTR(-ERANGE);
> +
> +			disc[i][j - 1] = value;
> +		}
> +	}
> +
> +	return no_free_ptr(disc);
> +}
> +EXPORT_SYMBOL_NS_GPL(pmc_parse_telem_dsd, "INTEL_PMC_CORE");
> +
> +union acpi_object *pmc_find_telem_guid(union acpi_object *dsd)
> +{
> +	int i;
> +
> +	if (!dsd || dsd->type != ACPI_TYPE_PACKAGE)
> +		return NULL;
> +
> +	for (i = 0; i + 1 < dsd->package.count; i += 2) {
> +		union acpi_object *uuid_obj, *data_obj;
> +		guid_t uuid;
> +
> +		uuid_obj = &dsd->package.elements[i];
> +		data_obj = &dsd->package.elements[i + 1];
> +
> +		if (uuid_obj->type != ACPI_TYPE_BUFFER ||
> +		    uuid_obj->buffer.length != 16)
> +			continue;
> +
> +		memcpy(&uuid, uuid_obj->buffer.pointer, 16);
> +		if (guid_equal(&uuid, &intel_vsec_guid))
> +			return data_obj;
> +	}
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_NS_GPL(pmc_find_telem_guid, "INTEL_PMC_CORE");
> +
> +static int pmc_pwrm_acpi_probe(struct platform_device *pdev)
> +{
> +	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
> +	acpi_handle handle = ACPI_HANDLE(&pdev->dev);

Move the assignment next to !handle check.

> +	struct intel_vsec_header header;
> +	struct intel_vsec_header *headers[2] = { &header, NULL };
> +	struct intel_vsec_platform_info info = { };
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	union acpi_object *dsd;
> +	acpi_status status;

Please try to rearrange these to the reverse xmas-tree order to the extent 
possible (the same comment is relevant for patch 14 too once you make 
the handle line shorter).

> +
> +	if (!handle)
> +		return -ENODEV;
> +
> +	status = acpi_evaluate_object(handle, "_DSD", NULL, &buf);
> +	if (ACPI_FAILURE(status)) {
> +		return dev_err_probe(dev, -ENODEV, "Could not evaluate _DSD: %s\n",
> +				     acpi_format_exception(status));
> +	}
> +
> +	void *dsd_buf __free(pmc_acpi_free) = buf.pointer;
> +
> +	dsd = pmc_find_telem_guid(dsd_buf);
> +	if (!dsd)
> +		return -ENODEV;
> +
> +	acpi_disc_t acpi_disc __free(kfree) = pmc_parse_telem_dsd(dsd, &header);
> +	if (IS_ERR(acpi_disc))
> +		return PTR_ERR(acpi_disc);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, header.tbir);
> +	if (!res)
> +		return -EINVAL;
> +
> +	info.headers = headers;
> +	info.caps = VSEC_CAP_TELEMETRY;
> +	info.acpi_disc = acpi_disc;
> +	info.src = INTEL_VSEC_DISC_ACPI;
> +	info.base_addr = res->start;
> +
> +	return intel_vsec_register(&pdev->dev, &info);
> +}
> +
> +static const struct acpi_device_id pmc_pwrm_acpi_ids[] = {
> +	{ "INTC1122", 0 }, /* Nova Lake */
> +	{ "INTC1129", 0 }, /* Nova Lake */
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, pmc_pwrm_acpi_ids);
> +
> +static struct platform_driver pmc_pwrm_acpi_driver = {
> +	.probe = pmc_pwrm_acpi_probe,
> +	.driver = {
> +		.name = "intel_pmc_pwrm_acpi",
> +		.acpi_match_table = ACPI_PTR(pmc_pwrm_acpi_ids),
> +	},
> +};
> +module_platform_driver(pmc_pwrm_acpi_driver);
> +
> +MODULE_AUTHOR("David E. Box <david.e.box@linux.intel.com>");
> +MODULE_DESCRIPTION("Intel PMC PWRM ACPI driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("INTEL_VSEC");
> 

-- 
 i.

