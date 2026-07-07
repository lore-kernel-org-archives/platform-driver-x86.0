Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6CF428498
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 14:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783434910; cv=none; b=tZWGcnC9hCtd0P841085D3Mdbg/gnYioGdbZFF23cJnIZIyPYhJtUP4Y4ugVJqqWib3N7Aakxy3UiF8FKj+7TJLDDjQNA2H35LGevIuUiz2QDpLvx1DXa+eW8inO4OJ8zsj/jG/U1qWKyNdt60K77fTGrr1pwmgMrjDT+K6o9e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783434910; c=relaxed/simple;
	bh=nG/vyXBflYWqPmAhpYxImMM0rbNJmnVm6wnNh4Ikq7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Up87N0J4H+N9OXO/ur7J7zH6CgSWrSB6BszNedUOEUIZ1wZXhI5ul3+Zh99JxPRI0kXbIzXyo+YNNYo75iPU3iKHHWKagbOub9KgetTbDT3bznV6FhaW8N0A6LWkvAgzzqHr07HuQhR1OULusyO4nTCBF9kHbNftdZBOMxw76eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NduVkJ7s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NduVkJ7s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F20F1F000E9;
	Tue,  7 Jul 2026 14:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783434908;
	bh=LVrEMVT9kZ+wwL+W1yjs+xCRezD+LAadm10p9D3TJAc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NduVkJ7sru+/xeEQaCPfaualhsEVAeYEmh5lV1JrbGPaxG9EMasuoUbb2YHPMRYIL
	 hKtdj6f6uMtFF+K7ButRYZQIzQkfM3iJz+pr5kK2ESjV8M09YsD+Pb1CZuDkrZ1i95
	 ph9ksrBPhNY/LMi+VW8gSLxGXaWfPTH1u3jVxyXMdg/uqMOYWQT6xVA1xq6Xto2SQv
	 2TS2qGQ+hq0TICOGXZpatQqnVIt0RiNIx2iiHFHvbu6s1Y8HMXaH1cTFkRs2MQPpu7
	 nqNjmOR0na7kYmpe5nE5+HeIoLIBr2e0lFKgNT7Dh/rTyV5ozt8iYWRVucjeddVO7M
	 FhypiiOFAze4g==
Message-ID: <c8db120a-8a67-48f3-a97c-2a687346e225@kernel.org>
Date: Tue, 7 Jul 2026 09:35:07 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: amd-pmc: Use correct IP block table for
 AMD 1Ah M80H SoC
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20260707122852.2066987-1-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260707122852.2066987-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/7/26 07:28, Shyam Sundar S K wrote:
> PMFW reports the S0i3 subsystem accounting per SoC, and the set of IP
> blocks and their bit ordering differ across SoC generations. Family
> 1Ah, Model 80h accounts for a distinct set of 19 IP blocks, which does
> not match the ordering in soc15_ip_blk[].
> 
> Commit 043af31c8d30 ("platform/x86/amd/pmc: Add PMC driver support for
> AMD 1Ah M80H SoC") wired amd_1ah_m80_cpu_info to soc15_ip_blk[], so
> M80H has been reporting incorrect S0i3 accounting via debugfs.
> 
> Add soc15_ip_blk_v3[] with the correct ordering and point
> amd_1ah_m80_cpu_info at it.
> 
> Fixes: 043af31c8d30 ("platform/x86/amd/pmc: Add PMC driver support for AMD 1Ah M80H SoC")
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
> v2:
> - Clarified the commit message: the IP block layout is tied to the
>    SoC, not to a firmware version (v1 wording "latest firmware" was
>    misleading). [Ilpo]
> - Reframed as a fix for the wrong table wired up in 043af31c8d30 and
>    added the Fixes: tag. [Ilpo]
> - No functional change from v1 in the code; only the changelog and
>    Fixes: tag are updated.
> 
>   drivers/platform/x86/amd/pmc/pmc.c | 26 ++++++++++++++++++++++++--
>   1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index d50ea62fa2f3..4a5650f1a3a8 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -33,6 +33,28 @@
>   
>   #include "pmc.h"
>   
> +static const struct amd_pmc_bit_map soc15_ip_blk_v3[] = {
> +	{"VDDCR",	BIT(0)},
> +	{"VDDCR_LP",	BIT(1)},
> +	{"LSOCV",	BIT(2)},
> +	{"DISPLAY",	BIT(3)},
> +	{"VCN",		BIT(4)},
> +	{"JPEG",	BIT(5)},
> +	{"UMSCH",	BIT(6)},
> +	{"VPE",		BIT(7)},
> +	{"MPM",		BIT(8)},
> +	{"NPU",		BIT(9)},
> +	{"USB_HC0",	BIT(10)},
> +	{"eUSB_HC0",	BIT(11)},
> +	{"RT0_ADP_HC1", BIT(12)},
> +	{"RT1_ADP_HC1", BIT(13)},
> +	{"RT2_ADP_HC2", BIT(14)},
> +	{"USB4_RT0",	BIT(15)},
> +	{"USB4_RT1",	BIT(16)},
> +	{"USB4-RT2",	BIT(17)},
> +	{"LAPIC",	BIT(18)},
> +};
> +
>   static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
>   	{"DISPLAY",     BIT(0)},
>   	{"CPU",         BIT(1)},
> @@ -159,9 +181,9 @@ static const struct amd_pmc_cpu_info amd_1ah_m80_cpu_info = {
>   	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_80H,
>   	.smu_arg	= AMD_PMC_REGISTER_ARG_1AH_80H,
>   	.smu_rsp	= AMD_PMC_REGISTER_RSP_1AH_80H,
> -	.num_ips	= ARRAY_SIZE(soc15_ip_blk),
> +	.num_ips	= ARRAY_SIZE(soc15_ip_blk_v3),
>   	.scratch_reg	= AMD_PMC_SCRATCH_REG_1AH,
> -	.ips_ptr	= soc15_ip_blk,
> +	.ips_ptr	= soc15_ip_blk_v3,
>   	.os_hint	= MSG_OS_HINT_RN,
>   };
>   

