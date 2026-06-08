Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C076C2EEE61
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 09:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911157; cv=none; b=Brw8a//em3XoB6ms3Ls1mRwQg6H7SQ5J5wBKNiPxPQjf8f8wZitAvPunh8/Vw2dJ36iHoMP5ORva30ns8R+oZN5tA5tiI3duzRUdA3pNXvhC34MMjU+uq/gJwrX5npIMHDB6/Ipgcq59aT2OduQl/hatCAKM4GBuIiiz+2/m9d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911157; c=relaxed/simple;
	bh=jFExqGeGlE4qcpJxdJsGZbzHP4/E8FNZYIwa2KfJVfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NxeiP/RkI20ZlRgQ1ZCzXFUoHPANMMuVM4cOTVP5jKU1Mci/9xt5TGlW1ymofUw/LFOxd7X0c/RGX2ZCbQ5k+NcvNPktxfKHVQRoWn7NLsecgN9WQnqc7f5dly86F1pePxcK+fRgTQG75jo2hXJsBcu3rWbG68zCk6cffJy39g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPmLJ4TE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPmLJ4TE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742CF1F00893;
	Mon,  8 Jun 2026 09:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780911156;
	bh=YEWUi0MzGwTEIf6IFT/x8eC9N5/hfmicJJ172f0A+WE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jPmLJ4TEDMyL4hdQTJKeu1gs1b4IwWNUmCVHataD0r23mmd8QSyMuuV4recXyQYmL
	 Er23vj/2JeTeUAowXwuYbp4xyOrBW75UcMFXKExGwfQRfWJWHonO0l3SgMAQB707e9
	 x5Qzb422t5ZnIlYisCr0QTuBzMn6076HRsXHQ3b2EaOSPzIYOKEXzp/QuYEYLvUwkh
	 WpffupZT0poGdWDI+kbsuCBN0DNmH7X2nwbo6ioaTmdi7CeXM3Z3W8m4K32mQhXqJo
	 deXBG3GJ2L3RwqE9tFaMvlw9dM32rVJAiyqjusKsMVem+f1wJcJqRVeJvktwOKcHvV
	 K9vw4yMQuIcwg==
Message-ID: <7134f3bf-1e44-47aa-9419-b716ec4bb17a@kernel.org>
Date: Mon, 8 Jun 2026 11:32:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] platform/x86/amd/pmf: Implement util layer ioctl
 handler
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
 Sanket.Goswami@amd.com
References: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
 <20260527140205.4073335-7-Shyam-sundar.S-k@amd.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260527140205.4073335-7-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 27-May-26 4:02 PM, Shyam Sundar S K wrote:
> Implement the ioctl handler for the util layer character device. This
> support adds the actual functionality to populate PMF metrics from the
> TA shared memory buffer and return them to userspace.
> 
> The implementation includes:
> - amd_pmf_populate_data() to extract metrics from TA shared memory
> - amd_pmf_set_ioctl() to handle userspace ioctl requests
> - Size negotiation for forward/backward compatibility
> - Feature-based population of struct fields
> - Export amd_pmf_get_ta_custom_bios_inputs()
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h  |   1 +
>  drivers/platform/x86/amd/pmf/spc.c  |   3 +-
>  drivers/platform/x86/amd/pmf/util.c | 105 +++++++++++++++++++++++++++-
>  3 files changed, 107 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 269c0a4b1cae..752fa5dd2267 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -903,6 +903,7 @@ int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq
>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
>  int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev);
> +u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index);
>  
>  int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid);
>  void amd_pmf_tee_deinit(struct amd_pmf_dev *dev);
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 6e33824ccadc..94355b435a66 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -18,7 +18,7 @@
>  #include "pmf.h"
>  
>  #ifdef CONFIG_AMD_PMF_DEBUG
> -static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
> +u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
>  {
>  	switch (index) {
>  	case 0 ... 1:
> @@ -29,6 +29,7 @@ static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int
>  		return 0;
>  	}
>  }
> +EXPORT_SYMBOL(amd_pmf_get_ta_custom_bios_inputs);
>  
>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>  {
> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
> index f8a283192ffe..30fb5c250362 100644
> --- a/drivers/platform/x86/amd/pmf/util.c
> +++ b/drivers/platform/x86/amd/pmf/util.c
> @@ -9,6 +9,7 @@
>   *	    Sanket Goswami <Sanket.Goswami@amd.com>
>   */
>  
> +#include <linux/align.h>
>  #include <linux/amd-pmf.h>
>  #include <linux/miscdevice.h>
>  #include <linux/mutex.h>
> @@ -19,9 +20,111 @@
>  static struct amd_pmf_dev *pmf_dev_handle;
>  static DEFINE_MUTEX(pmf_util_lock);
>  
> +static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd_pmf_info *info)
> +{
> +	struct ta_pmf_shared_memory *ta_sm = NULL;
> +	struct ta_pmf_enact_table *in = NULL;
> +	int idx;
> +
> +	if (!pdev || !info)
> +		return -EINVAL;
> +
> +	if (!pdev->shbuf)
> +		return -EINVAL;
> +
> +	ta_sm = pdev->shbuf;
> +	in = &ta_sm->pmf_input.enact_table;
> +
> +	/* Set size */
> +	info->size = sizeof(*info);
> +
> +	/* PMF Feature support flags */
> +	if (is_apmf_func_supported(pdev, APMF_FUNC_AUTO_MODE))
> +		info->features_supported |= AMD_PMF_FEAT_AUTO_MODE;
> +	if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
> +		info->features_supported |= AMD_PMF_FEAT_STATIC_POWER_SLIDER;
> +	if (pdev->smart_pc_enabled)
> +		info->features_supported |= AMD_PMF_FEAT_POLICY_BUILDER;
> +	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_AC))
> +		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC;
> +	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_DC))
> +		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC;
> +
> +	/* Device States */
> +	info->platform_type = in->ev_info.platform_type;
> +	info->laptop_placement = in->ev_info.device_state;
> +	info->lid_state = in->ev_info.lid_state;
> +	info->user_presence = in->ev_info.user_present;
> +	info->slider_position = in->ev_info.power_slider;
> +
> +	/* Thermal and Power Metrics */
> +	info->power_source = in->ev_info.power_source;
> +	info->skin_temp = in->ev_info.skin_temperature;
> +	info->gfx_busy = in->ev_info.gfx_busy;
> +	info->ambient_light = in->ev_info.ambient_light;
> +	info->avg_c0_residency = in->ev_info.avg_c0residency;
> +	info->max_c0_residency = in->ev_info.max_c0residency;
> +	info->socket_power = in->ev_info.socket_power;
> +
> +	/* Custom BIOS input parameters */
> +	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
> +		info->bios_input[idx] = amd_pmf_get_ta_custom_bios_inputs(in, idx);
> +
> +	/* BIOS output parameters */
> +	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
> +		info->bios_output[idx] = pdev->bios_output[idx];
> +
> +	return 0;
> +}
> +
>  static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
> -	return -ENOTTY;
> +	struct amd_pmf_dev *pdev = filp->private_data;
> +	void __user *argp = (void __user *)arg;
> +	struct amd_pmf_info info = {};
> +	size_t copy_size;
> +	__u64 user_size;
> +	int ret;
> +
> +	if (cmd != IOCTL_AMD_PMF_POPULATE_DATA)
> +		return -ENOTTY;
> +
> +	/* First read just the size field from userspace */
> +	if (copy_from_user(&user_size, argp, sizeof(user_size)))
> +		return -EFAULT;
> +
> +	if (user_size > sizeof(info))
> +		return -EINVAL;

Why? If the struct ever gets extended and a newer userspace runs on
an older kernel this will now trigger. Instead just clamp to
sizeof(info) .

> +
> +	if (!IS_ALIGNED(user_size, sizeof(__u64)))
> +		return -EINVAL;

Why ?  I guess on x86_64 this will always be true, but what about
i386 ?   More specifically this simply seems unnecessary and I believe this
entire check can be dropped.

> +
> +	if (user_size > sizeof(__u64)) {

This should be:

if (user_size >= (offsetof(struct amd_pmf_info, features_supported) + sizeof(features_from_user))) {

> +		__u32 features_from_user = 0;
> +
> +		if (copy_from_user(&features_from_user, argp + offsetof(struct
> +		    amd_pmf_info, features_supported), sizeof(features_from_user)))
> +			return -EFAULT;
> +
> +		/* Reject non-zero values now */
> +		if (features_from_user != 0)
> +			return -EINVAL;

Looking at amd_pmf_populate_data() features_supported is purely a kernel -> user thing,
so why read this from userspace at all ?  And why must it be non 0 ?

I believe this entire block can be dropped (instead of fixing the if condition).


> +	}
> +
> +	guard(mutex)(&pmf_util_lock);
> +	ret = amd_pmf_populate_data(pdev, &info);
> +	if (ret)
> +		return ret;
> +
> +	copy_size = min_t(size_t, user_size, sizeof(info));

So here you're clamping which means the earlier user_size > sizeof(info) above
can just be dropped.

Regards,

Hans



> +
> +	/* Set actual size being copied */
> +	info.size = copy_size;
> +
> +	if (copy_to_user(argp, &info, copy_size))
> +		return -EFAULT;
> +
> +	return 0;
>  }
>  
>  static int amd_pmf_open(struct inode *inode, struct file *filp)

