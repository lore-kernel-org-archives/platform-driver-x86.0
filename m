Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A436F336EFE
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 10:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460950; cv=none; b=O975TT7VvnELarg8V24gTmeSst8ogHQPeUZ9C2rdAeaWAEjWlBHkR7zkjNM5emz2v8eFU1ttUpO9/Xjs/p7BYvtkKF/KUDcEXYO+KGiIlqhhi2guEDQaCgD8Ue9iVMNN8iLD3pppuAjInYenlju/YjXmzt8bMzZeK4VEf3b69p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460950; c=relaxed/simple;
	bh=068F/9Gf+jDxB1vttFNZcJCHfFqqs9wzml3+fQ/vFRE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CiRL3JPiD88WfNfPbBkEfFKNpDvAFL5u5vrm4DMI2hqroPKomuv2S1vPgQZCuyFcsroD+VnLkVMe/qjyqA2AvaWqGjlpywOqI3jQCNaHLwmQJVEENpEiGsA2SjRTdetWwn2+r0VhaIKL7p41sCs8dSmy8OTNPx+YIteqiYnOnIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fb8Jjh3x; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fb8Jjh3x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763460947; x=1794996947;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=068F/9Gf+jDxB1vttFNZcJCHfFqqs9wzml3+fQ/vFRE=;
  b=fb8Jjh3xVSWbZFGqkQ5uoCsDb63xn3RZiibi5xFG88G5By+QJikDxLKL
   HJajVPtve98gJKQ1Hs8pLUUVjIvrWRCjdrkO1l7PXNhjwUwtB1SBlMoZ9
   ZnPL6jm04X9wd3aC6UB8X3pfxpWCRXnY+armcVQhe0nHCZUgsv1mIBcLq
   uyWRJUGmA852btEyKVyFmTC4dShM/UhLc0l1rFVe3gDR7zTPM62HUOP6I
   EtC4NJPVl896psMHJw46KD18qbfU6ItKBWsJGRLdttU5vE/Crttv4GOtE
   ZwYuDQE9/Toziq4+G5uPjm7MX//AKcCVLt1givZscykYsmqrckVhKOpaI
   A==;
X-CSE-ConnectionGUID: /6bYGrR4Stesi4W26AMEGQ==
X-CSE-MsgGUID: r8TjLkZTSsO8oQqgklSc1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76078360"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76078360"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 02:15:43 -0800
X-CSE-ConnectionGUID: 3aeo2N5VSLCdOBpbg6eQiw==
X-CSE-MsgGUID: QrCfagbzQNy+Qzk5D5KCuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190880652"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 02:15:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Nov 2025 12:15:36 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, Mario Limonciello <superm1@kernel.org>, 
    Yijun Shen <Yijun.Shen@Dell.com>
Subject: Re: [PATCH v3 2/2] platform/x86/amd/pmf: Use ring buffer to store
 custom BIOS input values
In-Reply-To: <20251107110105.4010694-2-Shyam-sundar.S-k@amd.com>
Message-ID: <73a254aa-465c-f6c8-c51e-e462da9acba6@linux.intel.com>
References: <20251107110105.4010694-1-Shyam-sundar.S-k@amd.com> <20251107110105.4010694-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Nov 2025, Shyam Sundar S K wrote:

> Custom BIOS input values can be updated by multiple sources, such as power
> mode changes and sensor events, each triggering a custom BIOS input event.
> When these events occur in rapid succession, new data may overwrite
> previous values before they are processed, resulting in lost updates.
>
> To address this, introduce a fixed-size, power-of-two ring buffer to
> capture every custom BIOS input event, storing both the pending request
> and its associated input values. Access to the ring buffer is synchronized
> using a mutex.
> 
> The previous use of memset() to clear the pending request structure after
> each event is removed, as each BIOS input value is now copied into the
> buffer as a snapshot. Consumers now process entries directly from the ring
> buffer, making explicit clearing of the pending request structure
> unnecessary.
> 
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v3:
>  - include headers wherever missing
>  - use dev_warn() instead of dev_WARN_ONCE()
>  - remove generic struct names
>  - enhance ringbuffer mechanism to handle common path
>  - other cosmetic remarks
> 
> v2:
>  - Add dev_WARN_ONCE()
>  - Change variable name rb_mutex to cbi_mutex
>  - Move tail increment logic above pending request check
> 
>  drivers/platform/x86/amd/pmf/acpi.c   | 42 +++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/core.c   |  3 ++
>  drivers/platform/x86/amd/pmf/pmf.h    | 21 ++++++++++++++
>  drivers/platform/x86/amd/pmf/spc.c    | 36 +++++++++++++----------
>  drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
>  5 files changed, 89 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 13c4fec2c7ef..4750ae6d70b0 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -9,6 +9,9 @@
>   */
>  
>  #include <linux/acpi.h>
> +#include <linux/array_size.h>
> +#include <linux/cleanup.h>
> +#include <linux/dev_printk.h>
>  #include "pmf.h"
>  
>  #define APMF_CQL_NOTIFICATION  2
> @@ -331,6 +334,41 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
>  									 req, sizeof(*req));
>  }
>  
> +/* Store custom BIOS inputs data in ring buffer */
> +static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
> +{
> +	struct pmf_cbi_ring_buffer *rb = &pmf_dev->cbi_buf;
> +	struct pmf_bios_input_entry entry = { };
> +	int i;
> +
> +	guard(mutex)(&pmf_dev->cbi_mutex);
> +
> +	switch (pmf_dev->cpu_id) {
> +	case AMD_CPU_ID_PS:
> +		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_v1); i++)
> +			entry.val[i] = pmf_dev->req1.custom_policy[i];
> +		entry.preq = pmf_dev->req1.pending_req;
> +		break;
> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> +		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
> +			entry.val[i] = pmf_dev->req.custom_policy[i];
> +		entry.preq = pmf_dev->req.pending_req;
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	if (CIRC_SPACE(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) == 0) {
> +		/* Rare case: ensures the newest BIOS input value is kept */
> +		dev_warn(pmf_dev->dev, "Overwriting BIOS input value, data may be lost\n");
> +		rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
> +	}
> +
> +	rb->data[rb->head] = entry;

I'd prefer the entry is construct in place.

> +	rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
> +}
> +
>  static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
>  {
>  	if (!pdev->cb_flag)
> @@ -356,6 +394,8 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
>  	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
>  
>  	amd_pmf_handle_early_preq(pmf_dev);
> +
> +	amd_pmf_custom_bios_inputs_rb(pmf_dev);
>  }
>  
>  static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
> @@ -374,6 +414,8 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
>  	dev_dbg(pmf_dev->dev, "Pending request (preq1): 0x%x\n", pmf_dev->req1.pending_req);
>  
>  	amd_pmf_handle_early_preq(pmf_dev);
> +
> +	amd_pmf_custom_bios_inputs_rb(pmf_dev);
>  }
>  
>  static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index bc544a4a5266..8d5ac84ae025 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -11,6 +11,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/power_supply.h>
> @@ -468,6 +469,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	mutex_init(&dev->lock);
>  	mutex_init(&dev->update_mutex);
>  	mutex_init(&dev->cb_mutex);
> +	mutex_init(&dev->cbi_mutex);

devm_mutex_init() + add a patch to convert the existing once to use it 
too. And don't forget the error handling as devm_*() can fail.

>  	apmf_acpi_init(dev);
>  	platform_set_drvdata(pdev, dev);
> @@ -494,6 +496,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
>  	mutex_destroy(&dev->lock);
>  	mutex_destroy(&dev->update_mutex);
>  	mutex_destroy(&dev->cb_mutex);
> +	mutex_destroy(&dev->cbi_mutex);
>  }
>  
>  static const struct attribute_group *amd_pmf_driver_groups[] = {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 2145df4128cd..5a18b3604b6e 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -12,7 +12,9 @@
>  #define PMF_H
>  
>  #include <linux/acpi.h>
> +#include <linux/circ_buf.h>
>  #include <linux/input.h>
> +#include <linux/mutex_types.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_profile.h>
>  
> @@ -120,6 +122,7 @@ struct cookie_header {
>  #define APTS_MAX_STATES		16
>  #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
>  #define BIOS_INPUTS_MAX		10
> +#define CUSTOM_BIOS_INPUT_RING_ENTRIES	64	/* Must be power of two for CIRC_* macros */
>  
>  typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
>  
> @@ -359,6 +362,22 @@ struct pmf_bios_inputs_prev {
>  	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
>  };
>  
> +/**
> + * struct pmf_bios_input_entry - Snapshot of custom BIOS input event
> + * @val: Array of custom BIOS input values
> + * @preq: Pending request value associated with this event
> + */
> +struct pmf_bios_input_entry {
> +	u32 val[BIOS_INPUTS_MAX];
> +	u32 preq;
> +};
> +
> +struct pmf_cbi_ring_buffer {
> +	struct pmf_bios_input_entry data[CUSTOM_BIOS_INPUT_RING_ENTRIES];
> +	int head;
> +	int tail;
> +};
> +
>  struct amd_pmf_dev {
>  	void __iomem *regbase;
>  	void __iomem *smu_virt_addr;
> @@ -407,6 +426,8 @@ struct amd_pmf_dev {
>  	struct apmf_sbios_req_v1 req1;
>  	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
>  	bool cb_flag;			     /* To handle first custom BIOS input */
> +	struct pmf_cbi_ring_buffer cbi_buf;
> +	struct mutex cbi_mutex;		     /* Protects ring buffer access */
>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 85192c7536b8..7c6bbfaa785a 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -11,6 +11,7 @@
>  
>  #include <acpi/button.h>
>  #include <linux/amd-pmf-io.h>
> +#include <linux/cleanup.h>
>  #include <linux/power_supply.h>
>  #include <linux/units.h>
>  #include "pmf.h"
> @@ -132,30 +133,41 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
>  	}
>  }
>  
> -static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req,
> +static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, struct pmf_bios_input_entry *data,
>  				       const struct amd_pmf_pb_bitmap *inputs,
> -				       const u32 *custom_policy, struct ta_pmf_enact_table *in)
> +				       struct ta_pmf_enact_table *in)
>  {
>  	unsigned int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
> -		if (!(pending_req & inputs[i].bit_mask))
> +		if (!(data->preq & inputs[i].bit_mask))
>  			continue;
> -		amd_pmf_set_ta_custom_bios_input(in, i, custom_policy[i]);
> -		pdev->cb_prev.custom_bios_inputs[i] = custom_policy[i];
> -		dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, custom_policy[i]);
> +		amd_pmf_set_ta_custom_bios_input(in, i, data->val[i]);
> +		pdev->cb_prev.custom_bios_inputs[i] = data->val[i];
> +		dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, data->val[i]);
>  	}
>  }
>  
>  static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>  					   struct ta_pmf_enact_table *in)
>  {
> +	struct pmf_cbi_ring_buffer *rb = &pdev->cbi_buf;
> +	struct pmf_bios_input_entry entry = { };
>  	unsigned int i;
>  
> +	guard(mutex)(&pdev->cbi_mutex);
> +
>  	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>  		amd_pmf_set_ta_custom_bios_input(in, i, pdev->cb_prev.custom_bios_inputs[i]);
>  
> -	if (!(pdev->req.pending_req || pdev->req1.pending_req))
> +	if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) == 0)
> +		return;	/* return if ring buffer is empty */
> +
> +	entry = rb->data[rb->tail];
> +	rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
> +
> +	/* If no active custom BIOS input pending request, do not consume further work */
> +	if (!entry.preq)
>  		return;

Should this function empty the whole ring, not just process one entry?

>  	if (!pdev->smart_pc_enabled)
> @@ -165,20 +177,14 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>  	case PMF_IF_V1:
>  		if (!is_apmf_bios_input_notifications_supported(pdev))
>  			return;
> -		amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req, custom_bios_inputs_v1,
> -					   pdev->req1.custom_policy, in);
> +		amd_pmf_update_bios_inputs(pdev, &entry, custom_bios_inputs_v1, in);
>  		break;
>  	case PMF_IF_V2:
> -		amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req, custom_bios_inputs,
> -					   pdev->req.custom_policy, in);
> +		amd_pmf_update_bios_inputs(pdev, &entry, custom_bios_inputs, in);
>  		break;
>  	default:
>  		break;
>  	}
> -
> -	/* Clear pending requests after handling */
> -	memset(&pdev->req, 0, sizeof(pdev->req));
> -	memset(&pdev->req1, 0, sizeof(pdev->req1));
>  }
>  
>  static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 6e8116bef4f6..add742e33e1e 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -579,6 +579,8 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  		status = ret == TA_PMF_TYPE_SUCCESS;
>  		if (status) {
>  			dev->cb_flag = true;
> +			dev->cbi_buf.head = 0;
> +			dev->cbi_buf.tail = 0;
>  			break;
>  		}
>  		amd_pmf_tee_deinit(dev);
> 

-- 
 i.

