Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635DE31282C
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 16:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780934940; cv=none; b=i+MmjcpLI6C+mQx9dJgVWIw6BtwjSmBscRiotsYlhEgRDL5yQkMHeCE9p7Hj+I0QPKRqLW8jbeA49gBQA9/xFqcbncpxzU4Aeko0Bv4y+U8J7vf5mM0R1sT7GtLtgyxrbIyNa46y3AmPVLgEgzJkApeCqaac3VGCSfi8kDQtABA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780934940; c=relaxed/simple;
	bh=jw+2G0o9vrsz8R4xCOdfE6ezZvqFpjd64y/WKYtBBd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rF+HWqGrQalauOkO8zGbRuh9hbk9ULqRaD+BIHuz/+yxlSS20Of8soZ66/cTvn2erpYjzxoqod4WfBi/ag+TLgNor14mygl52LKqXTsHOfQWSpxkQwSWKJhqv+XsGL4lJ1w3Fao6sHRLCOsrj6D5O6yn4j3jFO8+GcRPWgzFrfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a49eOfaB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a49eOfaB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028A51F00893;
	Mon,  8 Jun 2026 16:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780934939;
	bh=qj18R5yICm0emND8tMfqWcpl/jF4kH3v0NhDqwm1Rj8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=a49eOfaBZKohZxTw54ZMU2LKkS/dNb3Gi1R3kYlrelhPjNFJQtYfvAyHyGpTHjto2
	 b2R4j3pxLtJoWzndvojYhRbBkSei69hdWpJd2kYRc1aV7ha5FzIG6gZB2sFWuFHUJH
	 pceYaBBpT9PC+QAmwGtFlnqgzWznptxGUufDNh6nA11tLi0NkNcJActMmSvNmSU+dV
	 mLbbYs+H20i4NjiKDSsV1rsUwVc3J+9SfdA/Zj7J7v8jPrgpZqn3UUCQ3yI148errq
	 IEIMLRezDEJ4V5WnLD+2dpmFmSc+cNEDNlBMQV1JRWU3ameY/Js4JLMYALuZBm9xtl
	 fzk5egr4DwRlg==
Message-ID: <d9bbe0e0-4f38-41b6-94fd-038b7651ec81@kernel.org>
Date: Mon, 8 Jun 2026 18:08:56 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] platform/x86/amd/pmf: Implement util layer ioctl
 handler
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
 Sanket.Goswami@amd.com
References: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
 <20260527140205.4073335-7-Shyam-sundar.S-k@amd.com>
 <7134f3bf-1e44-47aa-9419-b716ec4bb17a@kernel.org>
 <577687a7-7d77-660e-e0a5-cbd89217fb55@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <577687a7-7d77-660e-e0a5-cbd89217fb55@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On 8-Jun-26 16:33, Ilpo Järvinen wrote:
> On Mon, 8 Jun 2026, Hans de Goede wrote:
>> On 27-May-26 4:02 PM, Shyam Sundar S K wrote:
>>> Implement the ioctl handler for the util layer character device. This
>>> support adds the actual functionality to populate PMF metrics from the
>>> TA shared memory buffer and return them to userspace.
>>>
>>> The implementation includes:
>>> - amd_pmf_populate_data() to extract metrics from TA shared memory
>>> - amd_pmf_set_ioctl() to handle userspace ioctl requests
>>> - Size negotiation for forward/backward compatibility
>>> - Feature-based population of struct fields
>>> - Export amd_pmf_get_ta_custom_bios_inputs()
>>>
>>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>  drivers/platform/x86/amd/pmf/pmf.h  |   1 +
>>>  drivers/platform/x86/amd/pmf/spc.c  |   3 +-
>>>  drivers/platform/x86/amd/pmf/util.c | 105 +++++++++++++++++++++++++++-
>>>  3 files changed, 107 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>>> index 269c0a4b1cae..752fa5dd2267 100644
>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>> @@ -903,6 +903,7 @@ int amd_pmf_smartpc_apply_bios_output(struct amd_pmf_dev *dev, u32 val, u32 preq
>>>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
>>>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
>>>  int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev);
>>> +u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index);
>>>  
>>>  int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid);
>>>  void amd_pmf_tee_deinit(struct amd_pmf_dev *dev);
>>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>>> index 6e33824ccadc..94355b435a66 100644
>>> --- a/drivers/platform/x86/amd/pmf/spc.c
>>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>>> @@ -18,7 +18,7 @@
>>>  #include "pmf.h"
>>>  
>>>  #ifdef CONFIG_AMD_PMF_DEBUG
>>> -static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
>>> +u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
>>>  {
>>>  	switch (index) {
>>>  	case 0 ... 1:
>>> @@ -29,6 +29,7 @@ static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int
>>>  		return 0;
>>>  	}
>>>  }
>>> +EXPORT_SYMBOL(amd_pmf_get_ta_custom_bios_inputs);
>>>  
>>>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>>>  {
>>> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
>>> index f8a283192ffe..30fb5c250362 100644
>>> --- a/drivers/platform/x86/amd/pmf/util.c
>>> +++ b/drivers/platform/x86/amd/pmf/util.c
>>> @@ -9,6 +9,7 @@
>>>   *	    Sanket Goswami <Sanket.Goswami@amd.com>
>>>   */
>>>  
>>> +#include <linux/align.h>
>>>  #include <linux/amd-pmf.h>
>>>  #include <linux/miscdevice.h>
>>>  #include <linux/mutex.h>
>>> @@ -19,9 +20,111 @@
>>>  static struct amd_pmf_dev *pmf_dev_handle;
>>>  static DEFINE_MUTEX(pmf_util_lock);
>>>  
>>> +static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd_pmf_info *info)
>>> +{
>>> +	struct ta_pmf_shared_memory *ta_sm = NULL;
>>> +	struct ta_pmf_enact_table *in = NULL;
>>> +	int idx;
>>> +
>>> +	if (!pdev || !info)
>>> +		return -EINVAL;
>>> +
>>> +	if (!pdev->shbuf)
>>> +		return -EINVAL;
>>> +
>>> +	ta_sm = pdev->shbuf;
>>> +	in = &ta_sm->pmf_input.enact_table;
>>> +
>>> +	/* Set size */
>>> +	info->size = sizeof(*info);
>>> +
>>> +	/* PMF Feature support flags */
>>> +	if (is_apmf_func_supported(pdev, APMF_FUNC_AUTO_MODE))
>>> +		info->features_supported |= AMD_PMF_FEAT_AUTO_MODE;
>>> +	if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
>>> +		info->features_supported |= AMD_PMF_FEAT_STATIC_POWER_SLIDER;
>>> +	if (pdev->smart_pc_enabled)
>>> +		info->features_supported |= AMD_PMF_FEAT_POLICY_BUILDER;
>>> +	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_AC))
>>> +		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC;
>>> +	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_DC))
>>> +		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC;
>>> +
>>> +	/* Device States */
>>> +	info->platform_type = in->ev_info.platform_type;
>>> +	info->laptop_placement = in->ev_info.device_state;
>>> +	info->lid_state = in->ev_info.lid_state;
>>> +	info->user_presence = in->ev_info.user_present;
>>> +	info->slider_position = in->ev_info.power_slider;
>>> +
>>> +	/* Thermal and Power Metrics */
>>> +	info->power_source = in->ev_info.power_source;
>>> +	info->skin_temp = in->ev_info.skin_temperature;
>>> +	info->gfx_busy = in->ev_info.gfx_busy;
>>> +	info->ambient_light = in->ev_info.ambient_light;
>>> +	info->avg_c0_residency = in->ev_info.avg_c0residency;
>>> +	info->max_c0_residency = in->ev_info.max_c0residency;
>>> +	info->socket_power = in->ev_info.socket_power;
>>> +
>>> +	/* Custom BIOS input parameters */
>>> +	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
>>> +		info->bios_input[idx] = amd_pmf_get_ta_custom_bios_inputs(in, idx);
>>> +
>>> +	/* BIOS output parameters */
>>> +	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
>>> +		info->bios_output[idx] = pdev->bios_output[idx];
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>>>  {
>>> -	return -ENOTTY;
>>> +	struct amd_pmf_dev *pdev = filp->private_data;
>>> +	void __user *argp = (void __user *)arg;
>>> +	struct amd_pmf_info info = {};
>>> +	size_t copy_size;
>>> +	__u64 user_size;
>>> +	int ret;
>>> +
>>> +	if (cmd != IOCTL_AMD_PMF_POPULATE_DATA)
>>> +		return -ENOTTY;
>>> +
>>> +	/* First read just the size field from userspace */
>>> +	if (copy_from_user(&user_size, argp, sizeof(user_size)))
>>> +		return -EFAULT;
>>> +
>>> +	if (user_size > sizeof(info))
>>> +		return -EINVAL;
>>
>> Why? If the struct ever gets extended and a newer userspace runs on
>> an older kernel this will now trigger. Instead just clamp to
>> sizeof(info) .
> 
> If this is not here, some of the content userspace wanted will not be 
> there so part of the struct member will not be filled. Userspace needs to 
> be extremely careful which fields it can access in such a case.

Yes, but the whole idea of having the size in the struct is to make
it extensible and that also means allowing a newer userspace which
may ask for more info to run on an older kernel.

And yes that means userspace needs to be careful and check the
returned size value when accessing struct members which are added
in a later extension.

> 
>>> +	if (!IS_ALIGNED(user_size, sizeof(__u64)))
>>> +		return -EINVAL;
>>
>> Why ?  I guess on x86_64 this will always be true, but what about
>> i386 ?
> 
> user_size comes from userspace so it could be anything userspace put 
> there and is unrelated to the arch.

Unless the last member is a u64 or pointer the sizeof() may return
a value which is a multipe of 32 bits on i386 (IIRC).

> It just doesn't look useful to copy 
> partial fields if userspace gives a strange user_size.

It is not useful, but it cannot hurt from a kernel pov, so why add
the extra check ?  Normal userspace will never asks for partial
fields. So we only need to worry about attackers and I don't see
how an attacker can abuse a non aligned size.

> Of course it never 
> happens if userspace uses sizeof() to fill the size in.

Right, which is why we only need to worry about bad actors for this.

>> More specifically this simply seems unnecessary and I believe this
>> entire check can be dropped.
>>
>>> +	if (user_size > sizeof(__u64)) {
>>
>> This should be:
>>
>> if (user_size >= (offsetof(struct amd_pmf_info, features_supported) + sizeof(features_from_user))) {
>>
>>> +		__u32 features_from_user = 0;
>>> +
>>> +		if (copy_from_user(&features_from_user, argp + offsetof(struct
>>> +		    amd_pmf_info, features_supported), sizeof(features_from_user)))
>>> +			return -EFAULT;
>>> +
>>> +		/* Reject non-zero values now */
>>> +		if (features_from_user != 0)
>>> +			return -EINVAL;
>>
>> Looking at amd_pmf_populate_data() features_supported is purely a kernel -> user thing,
>> so why read this from userspace at all ?  And why must it be non 0 ?
>>
>> I believe this entire block can be dropped (instead of fixing the if condition).
> 
> Okay. Perhaps you're right and this should not be added.
> 
> My thinking when suggesting this was that they'll eventually come up 
> something that is every expensive to get and then want to indicate it's 
> not required to get it every time. By checking the feature flags right 
> from the start like this, such an extension would be easy to add later.
> 
> And as per the code says, the non-zero feature values lead to -EINVAL, not 
> the other way around.

Ah I see. This still feels like unnecessary complication. All current fields
are read from cached values so not expensive and if we add expensive fields
later userspace can use the user_size to indicate if it wants those or not,
or we could even add a whole new ioctl cmd value for those.

Regards,

Hans



