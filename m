Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA9C3DB964
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 17:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790702333; cv=none; b=DgDPXojNAxEQwOdhFwH4gcqP6DC8mnfdu+WUNw8FjtqQzT97w9hT6ZsbsPg82eR09agsq7R26MBa1IeuVVHB65YJ8wLuWyLFWz9lfPKEoBxa40BEFDKj6c9DdZvRhS+d0wDMLBQCjeMbLcd5aX/VfBfRW39udoxNJ4EwgWexVes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790702333; c=relaxed/simple;
	bh=FNdN6VeaQli+RgfPF1iGMNMylUpCz7QJ8qCQLy+DafA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eymw7afHZn3zbdn/o/dzJHsrxDxvFitM0Qk3GoLsi5/Dx46RKWsy302rwNAEDJHbPE8vxsYjjzkNRDsE4BE2jL8N63g8/PzGwIcz2oLvt2ieYBHz4UsydOjIYTl07Ybvbrt3hA9+/mH2Foj70fMV0zXPsZAZ0cFNDnR1MSlA7Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2yid/td; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2yid/td"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CDAF1F000FF;
	Tue, 29 Sep 2026 17:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790702332;
	bh=KvRqxvqQV8Hh/huVWVrIVTD1EGkv2SWVqPA/MQ+UaPE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=A2yid/tddDFY8RimaG8wEoipueaubpmHQs/QtIp7tReQyrHVoB0zceqFOrhT/+bAe
	 OrSGHlejempbRPQG+BcdvrAL2AUBLy7/wMYhhROnn/RLYnZwRNoU9Fy18VtpPW3ysL
	 S49qq2i5mNEryly/UkrCeKNNnbOW+MY3WroeC7N2khhNvifYlzVlisS+tok9S/bTpB
	 tTQRiCP+D4q/e9kH0okwP9x4MbBCeFyuCUBRdtLopHWOcFXoEf3elmC7A0kvompOad
	 LsUvs94spIxiCSmOGXFV14DCMb0XGmCabacpJcGv2Dumc7Ab4OoeY7zuVwbGYcjMKd
	 MHus7AtTL5+cw==
Message-ID: <30219778-799e-4867-a37f-ceb67b69ab0d@kernel.org>
Date: Tue, 29 Sep 2026 12:18:50 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmc: Add PMC driver support for AMD 1Ah
 Family DCh SoC
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20260929155317.1710272-1-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260929155317.1710272-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/29/26 10:53, Shyam Sundar S K wrote:
> Add the PCI root complex device ID (0x1b20) for AMD Family 1Ah model DCh
> to the PMC driver. This new model shares the same PMC configuration as
> the existing Family 1Ah model 80h, so reuse amd_1ah_m80_cpu_info for the
> device data.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   drivers/platform/x86/amd/pmc/pmc.c | 1 +
>   drivers/platform/x86/amd/pmc/pmc.h | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index e384b56d6755..7ccc2caa0f2c 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -199,6 +199,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
>   	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, NULL) },
>   	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, NULL) },
>   	{ PCI_DEVICE_DATA(AMD, 1AH_M80H_ROOT, &amd_1ah_m80_cpu_info) },
> +	{ PCI_DEVICE_DATA(AMD, 1AH_MDCH_ROOT, &amd_1ah_m80_cpu_info) },
>   	{ }
>   };
>   
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index 6973a639d7e3..4633abf2cca1 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -194,6 +194,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>   #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT		0x1507
>   #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT		0x1122
>   #define PCI_DEVICE_ID_AMD_1AH_M80H_ROOT		0x115b
> +#define PCI_DEVICE_ID_AMD_1AH_MDCH_ROOT		0x1b20
>   #define PCI_DEVICE_ID_AMD_MP2_STB		0x172c
>   
>   int amd_stb_s2d_init(struct amd_pmc_dev *dev);

