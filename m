Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCFD3E8359
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jun 2026 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780408719; cv=none; b=pmbgslNgJcvockuJw8+bRZkFt0igPQa58YgTRbT6VHt/p+FVzhlQBRhmlWxAkQ1YeQRoaZOC9lKvcAA29gtlYc/BFrJk8MqHzRLy2agZEO/TmaTgRG+d0Zaj3lH5kWsjdsKjMoBaEUPbNC0uE6PkcaqMuZvC08cdW52WNFtWkN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780408719; c=relaxed/simple;
	bh=soWCS+JOoDeH8fw/GwO4z0TMpg41M6zlzj++i4OltEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TMMplvm/fAu8AwLPG4eL4e3IbYwZt5BTZcL8drGZdDvYYRQlo0s/rhjB568R0VnkgamU71nSf1b+jDgAYLSw51+p6wBpr/ehyo/Oz0KJhW93qWUs1BENgDiFVQ662wvokBTnvooz3mn/v1AVeGLghWnmLNk7SAXY5OIp1HqpJKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpal4egp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpal4egp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CAF1F00893;
	Tue,  2 Jun 2026 13:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780408718;
	bh=yOb7b+rhPHP396qSSk+zCTqJFdiiCntf1k3sng1htgc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gpal4egpqVXzA/K18p+eXfvS+zoYmkuyABu7GeAKfON+7t6x1sPAZ+/5YfJkIc2Tu
	 226zSSfiU5pc0bO00djD0J290FYbhEE5/LmaM0CcfZ7j/3mxivFLG9Gg1P3KGyCtiv
	 22E5E2TzLcAEQD1wAsl0xhDa+bPAom33C14CezHDfvoo8xUgnrw/J9CV6JROS0QmwE
	 0cAkTasjd0ZapySSLgToMh2qjcVaoy49eSdoBPSV7Jm+twsYUpx8WLbwaniNu6hgvg
	 ACwDoOVBjfavQkFCl35Bubu2kCdsPKmGoQ45iDCNjjEMjMJt3Pyw5DE5HfI0FyzjUc
	 V2aT80cM0+mmA==
Message-ID: <ec389d15-79ef-4267-b7e1-72b04bbcf84d@kernel.org>
Date: Tue, 2 Jun 2026 08:58:36 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] platform/x86/amd/pmc: Add support for AMD 1Ah
 Family 80h SoC
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Sanket.Goswami@amd.com
References: <20260601112103.1690951-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260601112103.1690951-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/1/26 06:21, Shyam Sundar S K wrote:
> The series introduces the necessary device identification, refactors SMU
> mailbox register handling for better maintainability, and configures the
> SoC-specific register offsets required for SMU communication.
> 
> Patch 1 refactors the per-SoC configuration by introducing amd_pmc_cpu_info
> struct that consolidates SMU register offsets, IP block table, and OS hint.
> The individual smu_msg, num_ips, and ips_ptr fields in amd_pmc_dev are
> replaced with a single cpu_info pointer. Per-SoC instances are embedded
> directly as driver_data in the PCI ID table via PCI_DEVICE_DATA(),
> eliminating the amd_pmc_get_ip_info() and amd_pmc_get_os_hint() switch
> statements. The AMD_CPU_ID_* macros are renamed to
> PCI_DEVICE_ID_AMD_CPU_ID_* with compatibility aliases retained.
> 
> Patch 2 adds support for the AMD 1Ah Family 80h SoC by defining its
> distinct SMU register offsets (msg: 0xA10, arg: 0xA18, rsp: 0xA14), adding
> the amd_1ah_m80_cpu_info instance, and wiring it into the PCI ID table,
> amd_pmc_set_cpu_info(), and amd_pmc_idlemask_read(). The corresponding
> ACPI ID AMDI000C is also added.
> 
> v2:
>   - Consolidate 5-patch series into 2 patches
>   - Use PCI_DEVICE_DATA() and maintain per SoC data.
>   - Address other remarks as per Ilpo comments in v1
> 
> Shyam Sundar S K (2):
>    platform/x86/amd/pmc: Use per-SoC cpu_info struct for SMU mailbox and
>      IP info
>    platform/x86/amd/pmc: Add PMC driver support for AMD 1Ah M80H SoC
> 
>   drivers/platform/x86/amd/pmc/pmc.c | 176 ++++++++++++++++++++---------
>   drivers/platform/x86/amd/pmc/pmc.h |  75 ++++++++----
>   2 files changed, 177 insertions(+), 74 deletions(-)
> 

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

As a general statement though about patch 1:

If there ends up being too many "Special case" blocks in the future it 
may be better to just switch to explicit CPU ID range matching later. 
There are some other drivers that do this like k10temp:

https://github.com/torvalds/linux/blob/6f3ed7fec72fc8979b2a8c7219c0a9fcfc8d07b5/drivers/hwmon/k10temp.c#L490
