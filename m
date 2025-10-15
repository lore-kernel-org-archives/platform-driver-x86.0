Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1656A1DF26A
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540611; cv=none; b=oItFmyKTFTq6zNwP/CxMSBxxHFxxQ697fyla7wMtvJ7cvmVHAIBZJm4WbvAdC1f6sHP++rUrI7oqy4IFg84HqHjXbXrfxeZdLGQMJDWWBSG/TSfsjYoQbvkvyCFb7QCUJa+5zzupp5PNLXa55iXFTPlwha5h2GJOgsC7mJrDV7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540611; c=relaxed/simple;
	bh=Zb4ZoytV7dMoi2I8ss3veog9a+YTmxW/otO4c53MhYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QryIWeirBFp/PbhYK0WEifRh5DtZxIPC8D095whTXZiVSNvEd1i35SvnSjoSsp6dup2FzqqfeNJwjIuqllhf+Ma/JcxV0y+qNtuu0jXm8vaSFv0u2PUvcDpYzd3YyyeFfv+ajQq2rTrtYq+wiSyTYcCRemlLtcvOxUolN5noGLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9wj27WJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9wj27WJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E640C4CEF8;
	Wed, 15 Oct 2025 15:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760540610;
	bh=Zb4ZoytV7dMoi2I8ss3veog9a+YTmxW/otO4c53MhYg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D9wj27WJ52DMt2357ABCNtGgZcFFldN/9f9UV7QgkW2qNREHwxb7rgXM1bgSEaT4U
	 JUOcnhS3Y8MRNwegEeZStpvxcAhbr/V4/bg3KEISgKMpOc+foPaxnWF1CRHn2RPQJz
	 mJWRvB+Xw1zdSKa9SQ0n0XEGvGaU977tB1MVglTHGrSspwNmQ6qAUb4u5F3tP1LduL
	 3fyuJrieBIwQGOnEMJLtStdx7njhB0jeBpCHsWUYAZeTtvy+vlTqaJd+fMku9nwQJa
	 L845ohZnEDQENfOFCKyS+E7TwzPW9oon36xK7EXqxzvvI9QyX0i8HZa62Wxp951Qsr
	 4FC99nR9Z15pA==
Message-ID: <1bd026df-65df-4365-bd59-6d64c0cd65ef@kernel.org>
Date: Wed, 15 Oct 2025 10:03:29 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Use ring buffer to store
 custom BIOS input values
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 Yijun.Shen@Dell.com
References: <20251015145457.3231583-1-Shyam-sundar.S-k@amd.com>
 <20251015145457.3231583-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20251015145457.3231583-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 9:54 AM, Shyam Sundar S K wrote:
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

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
> v2:
>   - Add dev_WARN_ONCE()
>   - Change variable name rb_mutex to cbi_mutex
>   - Move tail increment logic above pending request check
> 
>   drivers/platform/x86/amd/pmf/acpi.c   | 41 +++++++++++++++++++++++++++
>   drivers/platform/x86/amd/pmf/core.c   |  2 ++
>   drivers/platform/x86/amd/pmf/pmf.h    | 20 +++++++++++++
>   drivers/platform/x86/amd/pmf/spc.c    | 23 +++++++++------
>   drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
>   5 files changed, 79 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 13c4fec2c7ef..870a56f1fe07 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -331,6 +331,43 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
>   									 req, sizeof(*req));
>   }
>   
> +/* Store custom BIOS inputs data in ring buffer */
> +static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
> +{
> +	struct cbi_ring_buffer *rb = &pmf_dev->cbi_buf;
> +	struct bios_input_entry entry = { };
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
> +	if (CIRC_SPACE(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) > 0) {
> +		rb->data[rb->head] = entry;
> +		rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
> +	} else {
> +		/* Rare case: ensures the newest BIOS input value is kept */
> +		dev_WARN_ONCE(pmf_dev->dev, 1, "Overwriting BIOS input value, data may be lost\n");
> +		rb->data[rb->head] = entry;
> +		rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
> +		rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
> +	}
> +}
> +
>   static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
>   {
>   	if (!pdev->cb_flag)
> @@ -356,6 +393,8 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
>   	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
>   
>   	amd_pmf_handle_early_preq(pmf_dev);
> +
> +	amd_pmf_custom_bios_inputs_rb(pmf_dev);
>   }
>   
>   static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
> @@ -374,6 +413,8 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
>   	dev_dbg(pmf_dev->dev, "Pending request (preq1): 0x%x\n", pmf_dev->req1.pending_req);
>   
>   	amd_pmf_handle_early_preq(pmf_dev);
> +
> +	amd_pmf_custom_bios_inputs_rb(pmf_dev);
>   }
>   
>   static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index bc544a4a5266..8b97eba00dd3 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -468,6 +468,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>   	mutex_init(&dev->lock);
>   	mutex_init(&dev->update_mutex);
>   	mutex_init(&dev->cb_mutex);
> +	mutex_init(&dev->cbi_mutex);
>   
>   	apmf_acpi_init(dev);
>   	platform_set_drvdata(pdev, dev);
> @@ -494,6 +495,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
>   	mutex_destroy(&dev->lock);
>   	mutex_destroy(&dev->update_mutex);
>   	mutex_destroy(&dev->cb_mutex);
> +	mutex_destroy(&dev->cbi_mutex);
>   }
>   
>   static const struct attribute_group *amd_pmf_driver_groups[] = {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 2145df4128cd..6cb1e228c48e 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -12,6 +12,7 @@
>   #define PMF_H
>   
>   #include <linux/acpi.h>
> +#include <linux/circ_buf.h>
>   #include <linux/input.h>
>   #include <linux/platform_device.h>
>   #include <linux/platform_profile.h>
> @@ -120,6 +121,7 @@ struct cookie_header {
>   #define APTS_MAX_STATES		16
>   #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
>   #define BIOS_INPUTS_MAX		10
> +#define CUSTOM_BIOS_INPUT_RB_SZ	64	/* Must be power of two for CIRC_* macros */
>   
>   typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
>   
> @@ -359,6 +361,22 @@ struct pmf_bios_inputs_prev {
>   	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
>   };
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
>   struct amd_pmf_dev {
>   	void __iomem *regbase;
>   	void __iomem *smu_virt_addr;
> @@ -407,6 +425,8 @@ struct amd_pmf_dev {
>   	struct apmf_sbios_req_v1 req1;
>   	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
>   	bool cb_flag;			     /* To handle first custom BIOS input */
> +	struct cbi_ring_buffer cbi_buf;
> +	struct mutex cbi_mutex;		     /* Protects ring buffer access */
>   };
>   
>   struct apmf_sps_prop_granular_v2 {
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 85192c7536b8..669680ce580a 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -150,12 +150,23 @@ static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req
>   static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>   					   struct ta_pmf_enact_table *in)
>   {
> +	struct cbi_ring_buffer *rb = &pdev->cbi_buf;
> +	struct bios_input_entry entry = { };
>   	unsigned int i;
>   
> +	guard(mutex)(&pdev->cbi_mutex);
> +
>   	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>   		amd_pmf_set_ta_custom_bios_input(in, i, pdev->cb_prev.custom_bios_inputs[i]);
>   
> -	if (!(pdev->req.pending_req || pdev->req1.pending_req))
> +	if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) == 0)
> +		return;	/* return if ring buffer is empty */
> +
> +	entry = rb->data[rb->tail];
> +	rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
> +
> +	/* If no active custom BIOS input pending request, do not consume further work */
> +	if (!entry.preq)
>   		return;
>   
>   	if (!pdev->smart_pc_enabled)
> @@ -165,20 +176,14 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>   	case PMF_IF_V1:
>   		if (!is_apmf_bios_input_notifications_supported(pdev))
>   			return;
> -		amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req, custom_bios_inputs_v1,
> -					   pdev->req1.custom_policy, in);
> +		amd_pmf_update_bios_inputs(pdev, entry.preq, custom_bios_inputs_v1, entry.val, in);
>   		break;
>   	case PMF_IF_V2:
> -		amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req, custom_bios_inputs,
> -					   pdev->req.custom_policy, in);
> +		amd_pmf_update_bios_inputs(pdev, entry.preq, custom_bios_inputs, entry.val, in);
>   		break;
>   	default:
>   		break;
>   	}
> -
> -	/* Clear pending requests after handling */
> -	memset(&pdev->req, 0, sizeof(pdev->req));
> -	memset(&pdev->req1, 0, sizeof(pdev->req1));
>   }
>   
>   static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 6e8116bef4f6..add742e33e1e 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -579,6 +579,8 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>   		status = ret == TA_PMF_TYPE_SUCCESS;
>   		if (status) {
>   			dev->cb_flag = true;
> +			dev->cbi_buf.head = 0;
> +			dev->cbi_buf.tail = 0;
>   			break;
>   		}
>   		amd_pmf_tee_deinit(dev);

