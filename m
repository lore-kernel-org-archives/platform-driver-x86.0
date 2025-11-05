Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1669338597
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Nov 2025 16:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762361193; cv=none; b=d4bLlECgODmVPCysLkdtXRwIeISekhaSzwzYndg7vGBU/2Th4zgV5EByNXKssQGPO5xDCHy1Um31XrG1wWlI8zU8J4PSNlMR6XymoeKo80mkS36WJPiiTiOBWo4V73p39IP9w9HbFv5E0qaInH3cIS7FomOV6or00DCYukrX9vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762361193; c=relaxed/simple;
	bh=ZHms0De/3Jq1lnTPJ4ctxoSzt/i9RWiRFsWlmbIJyUE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=E/xZkxViQIo5Ql5TFZXSPRoYP3x3/F9XlLSMwRq59QxjU1a+MWMjSKTxF4Wvfna+XJ5g8vejs1KmDNpeNlINyB7T0rE6B1wc0VMtQxEhQPJXMbPdfYAxbxpA+9ARWwA1MHVzHggqW+nm+FHsCIVdFr5sx75d8PTDTEPQQ+CKHsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8dNeBk9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8dNeBk9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762361191; x=1793897191;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ZHms0De/3Jq1lnTPJ4ctxoSzt/i9RWiRFsWlmbIJyUE=;
  b=I8dNeBk9izqerXn5KX9tJTmzyZ5aG5VMusY09gCsNIkdc2jOeyqkuno8
   Z0A9NX3PEHQrzcTqJAl6YDWJwGzzOdOyLBcFerhaBEDOSkiwt/ws/98Lm
   BVf68o71FCxrQm5Sg6T1I2iW4k/+cYTWwThd9vC46hL2ahp3zUi6vrQ12
   9bY+qBISSr9qOHIsBd/5p+fbv+2ZQg0nTIePGU06fK3kR1GWvpg+OoYIk
   qk+N7EjZiI3Tum64lnBas0SFTC2usnEWHrGwHB/wMf7gskmE72A1ktqCo
   4j5ui7k6JEf+9QlhwxEVqOG+9v5G6BO4114D5l9idGHjL/7IiPw2/Os+0
   g==;
X-CSE-ConnectionGUID: JeXRYJ3RRIG2WGO3F0DmaA==
X-CSE-MsgGUID: vylPhoaLQ7OOC2SNvXWfcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75090736"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="75090736"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 08:46:30 -0800
X-CSE-ConnectionGUID: j0pXf+PqRuGfpDEe3EM2mA==
X-CSE-MsgGUID: ZHW6twUoSyWP2wpZLJJS+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="187448020"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.252])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 08:46:27 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 5 Nov 2025 18:46:24 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@Dell.com
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Use ring buffer to store
 custom BIOS input values
In-Reply-To: <20251015145457.3231583-2-Shyam-sundar.S-k@amd.com>
Message-ID: <b0a559b4-c7fe-90c1-27a2-7dcd5d29e146@linux.intel.com>
References: <20251015145457.3231583-1-Shyam-sundar.S-k@amd.com> <20251015145457.3231583-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Oct 2025, Shyam Sundar S K wrote:

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
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v2:
>  - Add dev_WARN_ONCE()
>  - Change variable name rb_mutex to cbi_mutex
>  - Move tail increment logic above pending request check
> 
>  drivers/platform/x86/amd/pmf/acpi.c   | 41 +++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/core.c   |  2 ++
>  drivers/platform/x86/amd/pmf/pmf.h    | 20 +++++++++++++
>  drivers/platform/x86/amd/pmf/spc.c    | 23 +++++++++------
>  drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
>  5 files changed, 79 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 13c4fec2c7ef..870a56f1fe07 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -331,6 +331,43 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
>  									 req, sizeof(*req));
>  }
>  
> +/* Store custom BIOS inputs data in ring buffer */
> +static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
> +{
> +	struct cbi_ring_buffer *rb = &pmf_dev->cbi_buf;
> +	struct bios_input_entry entry = { };

Too generic struct name.

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

Add include.

> +			entry.val[i] = pmf_dev->req.custom_policy[i];
> +		entry.preq = pmf_dev->req.pending_req;
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	if (CIRC_SPACE(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) > 0) {
> +		rb->data[rb->head] = entry;
> +		rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
> +	} else {
> +		/* Rare case: ensures the newest BIOS input value is kept */
> +		dev_WARN_ONCE(pmf_dev->dev, 1, "Overwriting BIOS input value, data may be lost\n");

Is this really WARN_ONCE thing? That is, does it indicate a bug in the 
kernel code?

Add include.

> +		rb->data[rb->head] = entry;
> +		rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
> +		rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);

Since you're under lock, can you make room separately first and then add
the entry on a common path?

> +	}
> +}
> +
>  static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
>  {
>  	if (!pdev->cb_flag)
> @@ -356,6 +393,8 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
>  	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
>  
>  	amd_pmf_handle_early_preq(pmf_dev);
> +
> +	amd_pmf_custom_bios_inputs_rb(pmf_dev);
>  }
>  
>  static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
> @@ -374,6 +413,8 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
>  	dev_dbg(pmf_dev->dev, "Pending request (preq1): 0x%x\n", pmf_dev->req1.pending_req);
>  
>  	amd_pmf_handle_early_preq(pmf_dev);
> +
> +	amd_pmf_custom_bios_inputs_rb(pmf_dev);
>  }
>  
>  static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index bc544a4a5266..8b97eba00dd3 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -468,6 +468,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	mutex_init(&dev->lock);
>  	mutex_init(&dev->update_mutex);
>  	mutex_init(&dev->cb_mutex);
> +	mutex_init(&dev->cbi_mutex);
>  
>  	apmf_acpi_init(dev);
>  	platform_set_drvdata(pdev, dev);
> @@ -494,6 +495,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
>  	mutex_destroy(&dev->lock);
>  	mutex_destroy(&dev->update_mutex);
>  	mutex_destroy(&dev->cb_mutex);
> +	mutex_destroy(&dev->cbi_mutex);
>  }
>  
>  static const struct attribute_group *amd_pmf_driver_groups[] = {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 2145df4128cd..6cb1e228c48e 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -12,6 +12,7 @@
>  #define PMF_H
>  
>  #include <linux/acpi.h>
> +#include <linux/circ_buf.h>
>  #include <linux/input.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_profile.h>
> @@ -120,6 +121,7 @@ struct cookie_header {
>  #define APTS_MAX_STATES		16
>  #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
>  #define BIOS_INPUTS_MAX		10
> +#define CUSTOM_BIOS_INPUT_RB_SZ	64	/* Must be power of two for CIRC_* macros */

This is not really size but there are n entries. The total size will be 
something else. I'd call it NUM or ENTRIES, or something like that. 
Perhaps CUSTOM_BIOS_INPUT_RING_ENTRIES but that is a bit to the long side 
of things?

>  typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
>  
> @@ -359,6 +361,22 @@ struct pmf_bios_inputs_prev {
>  	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
>  };
>  
> +/**
> + * struct bios_input_entry - Snapshot of custom BIOS input event
> + * @val: Array of custom BIOS input values
> + * @preq: Pending request value associated with this event
> + */
> +struct bios_input_entry {
> +	u32 val[BIOS_INPUTS_MAX];
> +	u32 preq;
> +};
> +
> +struct cbi_ring_buffer {
> +	struct bios_input_entry data[CUSTOM_BIOS_INPUT_RB_SZ];
> +	int head;
> +	int tail;
> +};
> +
>  struct amd_pmf_dev {
>  	void __iomem *regbase;
>  	void __iomem *smu_virt_addr;
> @@ -407,6 +425,8 @@ struct amd_pmf_dev {
>  	struct apmf_sbios_req_v1 req1;
>  	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
>  	bool cb_flag;			     /* To handle first custom BIOS input */
> +	struct cbi_ring_buffer cbi_buf;
> +	struct mutex cbi_mutex;		     /* Protects ring buffer access */

Include missing?

>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 85192c7536b8..669680ce580a 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -150,12 +150,23 @@ static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req
>  static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>  					   struct ta_pmf_enact_table *in)
>  {
> +	struct cbi_ring_buffer *rb = &pdev->cbi_buf;
> +	struct bios_input_entry entry = { };
>  	unsigned int i;
>  
> +	guard(mutex)(&pdev->cbi_mutex);
> +
>  	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>  		amd_pmf_set_ta_custom_bios_input(in, i, pdev->cb_prev.custom_bios_inputs[i]);
>  
> -	if (!(pdev->req.pending_req || pdev->req1.pending_req))
> +	if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) == 0)

Include missing.

As a general comment unrelated to this patch, these files to be missing 
other headers too.

> +		return;	/* return if ring buffer is empty */
> +
> +	entry = rb->data[rb->tail];
> +	rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
> +
> +	/* If no active custom BIOS input pending request, do not consume further work */
> +	if (!entry.preq)
>  		return;
>  
>  	if (!pdev->smart_pc_enabled)
> @@ -165,20 +176,14 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>  	case PMF_IF_V1:
>  		if (!is_apmf_bios_input_notifications_supported(pdev))
>  			return;
> -		amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req, custom_bios_inputs_v1,
> -					   pdev->req1.custom_policy, in);
> +		amd_pmf_update_bios_inputs(pdev, entry.preq, custom_bios_inputs_v1, entry.val, in);
>  		break;
>  	case PMF_IF_V2:
> -		amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req, custom_bios_inputs,
> -					   pdev->req.custom_policy, in);
> +		amd_pmf_update_bios_inputs(pdev, entry.preq, custom_bios_inputs, entry.val, in);

Could we pass the entry instead now?

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

