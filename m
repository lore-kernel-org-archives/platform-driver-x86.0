Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B06617C203
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015069; cv=none; b=LDZg/ZicsoYVIYn6L8/RR83ScLsRdaSlUCa9iTeER4qtodqS8qUVbDqEZ0ASlkBFgUFncr8IqSEOUdlt2LlaMuDFRtRXYu+yw9B5TsPf9pQzwHpzHXULz/J3a6PdoxEx3AeNgUwtjmH/rkabgukPAFtUuxyGgu6dm/jJXM2mM9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015069; c=relaxed/simple;
	bh=rTId9zxBfWvcUpeRT/ZLLBv51wkE9SGFgj+58tPqYaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kxp/LzOGo2GsWZAxxjc2KnOzswy13tcoe0Yb8m39CUfiLvedMhTF+ZTZJd4GlqUQEgO4swYcwoRE0ZhrLNZncE0892iYrmUmvFYSKMBQtuwK4iNziVXIoSmocaHROiJp/H/83+uB4wmUWGAZSAEMQqMYWGt+0j8wmPrwvmhZx20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBQi/Iu6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBQi/Iu6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B331F00893;
	Tue,  9 Jun 2026 14:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781015068;
	bh=KQ6JBHXPqDEDphQ8fdIpNkShZihsP8DkrAj4rU8fsaI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fBQi/Iu6aSrKl6wr3pCR6XFiif9QtfL1GzNVRGnQxLx5o9qhpTwzSa02zffSdPngT
	 Z4aQJU+L+ZDPRRcKcMZKJT73brLA866sYWLAszq6IUBGwurMUiLcek9jTo8fDLbByw
	 efSKBzd+V991p5vTXK9y/MQY4BO5BtMTYny4fKwFTrUwdCaiiGiAgAKVml28AeuEDu
	 BYYdXFzCd6WJVnNDjr57zvkPnrV43IqtCFbi5MZGyvyb7CNERTbcfdKYhH/ZwMOjqm
	 jSugc1r7ELDCT5jYWr4GFMTCnjDxkQJ0OK9oE8mLkFVc3h3DDQfEF+TMMTPFyRPFmM
	 FzBHqmgGblgVg==
Message-ID: <bf740c6e-2319-4553-a2c5-0129d771ffcb@kernel.org>
Date: Tue, 9 Jun 2026 09:24:26 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] platform/x86/amd/pmc: Add PMC driver support for
 AMD 1Ah M80H SoC
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Sanket.Goswami@amd.com
References: <20260609073543.2388987-1-Shyam-sundar.S-k@amd.com>
 <20260609073543.2388987-3-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260609073543.2388987-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/9/26 02:35, Shyam Sundar S K wrote:
> The 1Ah M80H SoC uses a different set of SMU mailbox register offsets
> compared to the existing 1Ah variants: message at 0xA10, argument at
> 0xA18, and response at 0xA14.
> 
> Add amd_1ah_m80_cpu_info with these offsets, wire it into the PCI ID
> table via PCI_DEVICE_DATA(), populate scratch_reg field with
> AMD_PMC_SCRATCH_REG_1AH and add the corresponding ACPI ID AMDI000C.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/platform/x86/amd/pmc/pmc.c | 12 ++++++++++++
>   drivers/platform/x86/amd/pmc/pmc.h |  6 ++++++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 3ba50ebcc431..5a43f8179bd5 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -146,6 +146,16 @@ static const struct amd_pmc_cpu_info amd_1ah_m70_cpu_info = {
>   	.os_hint	= MSG_OS_HINT_RN,
>   };
>   
> +static const struct amd_pmc_cpu_info amd_1ah_m80_cpu_info = {
> +	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_80H,
> +	.smu_arg	= AMD_PMC_REGISTER_ARG_1AH_80H,
> +	.smu_rsp	= AMD_PMC_REGISTER_RSP_1AH_80H,
> +	.num_ips	= ARRAY_SIZE(soc15_ip_blk),
> +	.scratch_reg	= AMD_PMC_SCRATCH_REG_1AH,
> +	.ips_ptr	= soc15_ip_blk,
> +	.os_hint	= MSG_OS_HINT_RN,
> +};
> +
>   static const struct pci_device_id pmc_pci_ids[] = {
>   	{ PCI_DEVICE_DATA(AMD, CPU_ID_PCO, &amd_pco_cpu_info) },
>   	{ PCI_DEVICE_DATA(AMD, CPU_ID_RV, &amd_pco_cpu_info) },
> @@ -159,6 +169,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
>   	{ PCI_DEVICE_DATA(AMD, CPU_ID_SHP, NULL) },
>   	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, NULL) },
>   	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, NULL) },
> +	{ PCI_DEVICE_DATA(AMD, 1AH_M80H_ROOT, &amd_1ah_m80_cpu_info) },
>   	{ }
>   };
>   
> @@ -855,6 +866,7 @@ static const struct acpi_device_id amd_pmc_acpi_ids[] = {
>   	{"AMDI0009", 0},
>   	{"AMDI000A", 0},
>   	{"AMDI000B", 0},
> +	{"AMDI000C", 0},
>   	{"AMD0004", 0},
>   	{"AMD0005", 0},
>   	{ }
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index 4c3a4410790e..b8e75b5004de 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -22,6 +22,11 @@
>   /* SMU communication registers for 1Ah 20h SoC */
>   #define AMD_PMC_REGISTER_MSG_1AH_20H	0x938
>   
> +/* SMU communication registers for 1Ah 80h SoC */
> +#define AMD_PMC_REGISTER_MSG_1AH_80H	0xA10
> +#define AMD_PMC_REGISTER_ARG_1AH_80H	0xA18
> +#define AMD_PMC_REGISTER_RSP_1AH_80H	0xA14
> +
>   /* PMC Scratch Registers */
>   #define AMD_PMC_SCRATCH_REG_CZN		0x94
>   #define AMD_PMC_SCRATCH_REG_YC		0xD14
> @@ -190,6 +195,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>   
>   #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT		0x1507
>   #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT		0x1122
> +#define PCI_DEVICE_ID_AMD_1AH_M80H_ROOT		0x115b
>   #define PCI_DEVICE_ID_AMD_MP2_STB		0x172c
>   
>   int amd_stb_s2d_init(struct amd_pmc_dev *dev);

