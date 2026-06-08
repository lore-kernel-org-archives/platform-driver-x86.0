Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBAF3B7757
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929210; cv=none; b=dMu5fA1EvooAk1QFhNttWFt9FYhBu1Dol1+ghVeWYlsDUuOlVfEDBbouR+pLQCnqtIUBwAzYrJwWmjuWi5HCgLtorNDhNxFFwpmJEXNKJxALXybAJQYWvWrg2ZqyR1j57KHhGQCY2/5GhjhkqHR7sgFORcfjtj4QaOgXyLdYZpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929210; c=relaxed/simple;
	bh=w1kxU/VwJDODVF5Pc5jKaZeeJom/gY/GaGlI1R+hkTQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KJRIWqgm6iIZTQrQWu5YsrCRtydxQVg39t4nl6rhJGqFFI+7TVZTmM889C8vwun1Jz0pBmhoVxIAdrDMiEyknNGuZGtzC7NVB3Lm6SKWbTJ/j4Oo8yUdUCnWfFj4BzB83twq6J7iCU0v9I2/W/BQhNoOJlL5WPihFoGm84/msCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AihS+HY/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AihS+HY/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780929208; x=1812465208;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=w1kxU/VwJDODVF5Pc5jKaZeeJom/gY/GaGlI1R+hkTQ=;
  b=AihS+HY/6SfllVqWxOCD7b9OCy34aLR+5p6kweuHL12eZyeinqlLsbnu
   JMKxnwFoh0VpseR6oG0JiV85SwrrK+HkdW6No2iQMjbKgk5Nql6XfxtWS
   oavRkGBfLfs7ffo2VH+UkkWv/ULMnVgfgXGTwCyuPvg9S0qAG09eLk+RW
   IhWDdTNY1MroVw6HwPP+9Yf2BYelJ4+6YhToOzm2IN9vxaWR77eH5gqGs
   luqv/6QEhWDOuODw3QodxZzalM1oAlnfmKMvLA00zjKe8ocgjIzRxs30P
   cDz4IOAcekZHEuWmBZf+Anoe93vzEwYLS1a/xV8zlR1Ze0N9IAvp7FUQ7
   Q==;
X-CSE-ConnectionGUID: 8ZdDNxnrRYeq7W5SbFWiHQ==
X-CSE-MsgGUID: 8bPqrI1BRGm9GJXypKWuDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="104325097"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="104325097"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 07:33:28 -0700
X-CSE-ConnectionGUID: EyLdDoF7SluQZu9f47Z+3g==
X-CSE-MsgGUID: wAyqLM7CTae6UVVg5b4vAA==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 07:33:25 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Jun 2026 17:33:22 +0300 (EEST)
To: Hans de Goede <hansg@kernel.org>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com, 
    Sanket.Goswami@amd.com
Subject: Re: [PATCH v6 6/8] platform/x86/amd/pmf: Implement util layer ioctl
 handler
In-Reply-To: <7134f3bf-1e44-47aa-9419-b716ec4bb17a@kernel.org>
Message-ID: <577687a7-7d77-660e-e0a5-cbd89217fb55@linux.intel.com>
References: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com> <20260527140205.4073335-7-Shyam-sundar.S-k@amd.com> <7134f3bf-1e44-47aa-9419-b716ec4bb17a@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Jun 2026, Hans de Goede wrote:
> On 27-May-26 4:02 PM, Shyam Sundar S K wrote:
> > Implement the ioctl handler for the util layer character device. This
> > support adds the actual functionality to populate PMF metrics from the
> > TA shared memory buffer and return them to userspace.
> > 
> > The implementation includes:
> > - amd_pmf_populate_data() to extract metrics from TA shared memory
> > - amd_pmf_set_ioctl() to handle userspace ioctl requests
> > - Size negotiation for forward/backward compatibility
> > - Feature-based population of struct fields
> > - Export amd_pmf_get_ta_custom_bios_inputs()
> > 
> > Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> > Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> > Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > ---
> >  drivers/platform/x86/amd/pmf/pmf.h  |   1 +
> >  drivers/platform/x86/amd/pmf/spc.c  |   3 +-
> >  drivers/platform/x86/amd/pmf/util.c | 105 +++++++++++++++++++++++++++-
> >  3 files changed, 107 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> > index 269c0a4b1cae..752fa5dd2267 100644
> > --- a/drivers/platform/x86/amd/pmf/pmf.h
> > +++ b/drivers/platform/x86/amd/pmf/pmf.h
> > @@ -903,6 +903,7 @@ int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq
> >  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
> >  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
> >  int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev);
> > +u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index);
> >  
> >  int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid);
> >  void amd_pmf_tee_deinit(struct amd_pmf_dev *dev);
> > diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> > index 6e33824ccadc..94355b435a66 100644
> > --- a/drivers/platform/x86/amd/pmf/spc.c
> > +++ b/drivers/platform/x86/amd/pmf/spc.c
> > @@ -18,7 +18,7 @@
> >  #include "pmf.h"
> >  
> >  #ifdef CONFIG_AMD_PMF_DEBUG
> > -static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
> > +u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
> >  {
> >  	switch (index) {
> >  	case 0 ... 1:
> > @@ -29,6 +29,7 @@ static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int
> >  		return 0;
> >  	}
> >  }
> > +EXPORT_SYMBOL(amd_pmf_get_ta_custom_bios_inputs);
> >  
> >  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> >  {
> > diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
> > index f8a283192ffe..30fb5c250362 100644
> > --- a/drivers/platform/x86/amd/pmf/util.c
> > +++ b/drivers/platform/x86/amd/pmf/util.c
> > @@ -9,6 +9,7 @@
> >   *	    Sanket Goswami <Sanket.Goswami@amd.com>
> >   */
> >  
> > +#include <linux/align.h>
> >  #include <linux/amd-pmf.h>
> >  #include <linux/miscdevice.h>
> >  #include <linux/mutex.h>
> > @@ -19,9 +20,111 @@
> >  static struct amd_pmf_dev *pmf_dev_handle;
> >  static DEFINE_MUTEX(pmf_util_lock);
> >  
> > +static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd_pmf_info *info)
> > +{
> > +	struct ta_pmf_shared_memory *ta_sm = NULL;
> > +	struct ta_pmf_enact_table *in = NULL;
> > +	int idx;
> > +
> > +	if (!pdev || !info)
> > +		return -EINVAL;
> > +
> > +	if (!pdev->shbuf)
> > +		return -EINVAL;
> > +
> > +	ta_sm = pdev->shbuf;
> > +	in = &ta_sm->pmf_input.enact_table;
> > +
> > +	/* Set size */
> > +	info->size = sizeof(*info);
> > +
> > +	/* PMF Feature support flags */
> > +	if (is_apmf_func_supported(pdev, APMF_FUNC_AUTO_MODE))
> > +		info->features_supported |= AMD_PMF_FEAT_AUTO_MODE;
> > +	if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
> > +		info->features_supported |= AMD_PMF_FEAT_STATIC_POWER_SLIDER;
> > +	if (pdev->smart_pc_enabled)
> > +		info->features_supported |= AMD_PMF_FEAT_POLICY_BUILDER;
> > +	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_AC))
> > +		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC;
> > +	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_DC))
> > +		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC;
> > +
> > +	/* Device States */
> > +	info->platform_type = in->ev_info.platform_type;
> > +	info->laptop_placement = in->ev_info.device_state;
> > +	info->lid_state = in->ev_info.lid_state;
> > +	info->user_presence = in->ev_info.user_present;
> > +	info->slider_position = in->ev_info.power_slider;
> > +
> > +	/* Thermal and Power Metrics */
> > +	info->power_source = in->ev_info.power_source;
> > +	info->skin_temp = in->ev_info.skin_temperature;
> > +	info->gfx_busy = in->ev_info.gfx_busy;
> > +	info->ambient_light = in->ev_info.ambient_light;
> > +	info->avg_c0_residency = in->ev_info.avg_c0residency;
> > +	info->max_c0_residency = in->ev_info.max_c0residency;
> > +	info->socket_power = in->ev_info.socket_power;
> > +
> > +	/* Custom BIOS input parameters */
> > +	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
> > +		info->bios_input[idx] = amd_pmf_get_ta_custom_bios_inputs(in, idx);
> > +
> > +	/* BIOS output parameters */
> > +	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
> > +		info->bios_output[idx] = pdev->bios_output[idx];
> > +
> > +	return 0;
> > +}
> > +
> >  static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> >  {
> > -	return -ENOTTY;
> > +	struct amd_pmf_dev *pdev = filp->private_data;
> > +	void __user *argp = (void __user *)arg;
> > +	struct amd_pmf_info info = {};
> > +	size_t copy_size;
> > +	__u64 user_size;
> > +	int ret;
> > +
> > +	if (cmd != IOCTL_AMD_PMF_POPULATE_DATA)
> > +		return -ENOTTY;
> > +
> > +	/* First read just the size field from userspace */
> > +	if (copy_from_user(&user_size, argp, sizeof(user_size)))
> > +		return -EFAULT;
> > +
> > +	if (user_size > sizeof(info))
> > +		return -EINVAL;
> 
> Why? If the struct ever gets extended and a newer userspace runs on
> an older kernel this will now trigger. Instead just clamp to
> sizeof(info) .

If this is not here, some of the content userspace wanted will not be 
there so part of the struct member will not be filled. Userspace needs to 
be extremely careful which fields it can access in such a case.

> > +	if (!IS_ALIGNED(user_size, sizeof(__u64)))
> > +		return -EINVAL;
> 
> Why ?  I guess on x86_64 this will always be true, but what about
> i386 ?

user_size comes from userspace so it could be anything userspace put 
there and is unrelated to the arch. It just doesn't look useful to copy 
partial fields if userspace gives a strange user_size. Of course it never 
happens if userspace uses sizeof() to fill the size in.

> More specifically this simply seems unnecessary and I believe this
> entire check can be dropped.
>
> > +	if (user_size > sizeof(__u64)) {
> 
> This should be:
> 
> if (user_size >= (offsetof(struct amd_pmf_info, features_supported) + sizeof(features_from_user))) {
> 
> > +		__u32 features_from_user = 0;
> > +
> > +		if (copy_from_user(&features_from_user, argp + offsetof(struct
> > +		    amd_pmf_info, features_supported), sizeof(features_from_user)))
> > +			return -EFAULT;
> > +
> > +		/* Reject non-zero values now */
> > +		if (features_from_user != 0)
> > +			return -EINVAL;
> 
> Looking at amd_pmf_populate_data() features_supported is purely a kernel -> user thing,
> so why read this from userspace at all ?  And why must it be non 0 ?
>
> I believe this entire block can be dropped (instead of fixing the if condition).

Okay. Perhaps you're right and this should not be added.

My thinking when suggesting this was that they'll eventually come up 
something that is every expensive to get and then want to indicate it's 
not required to get it every time. By checking the feature flags right 
from the start like this, such an extension would be easy to add later.

And as per the code says, the non-zero feature values lead to -EINVAL, not 
the other way around.


-- 
 i.

