Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6CB2C11CF
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 20:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779308543; cv=none; b=KtKGWmVvMYDoyqhN7clm6EoaZ3ejwQl00VjQGnNU1jKWRE1kAtYk2EV2WBug89sIuUj/r63Cife+wK2eas70gdcgNVkR18tMLhq+aOTDTcW6R2mWlSNhK9HBAnWjHIZBn/XJxi2+jV9upTufbcl0elv5FLGiJ0FcyulrT/wHjPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779308543; c=relaxed/simple;
	bh=Qt4/UmdTWxtWKPrlOgucgjGQXUl6gfjIDw5AOmICTfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qv0TjfoYmo4UfBEgWfwVtOhHzs1pVROR8+/r4FOI1vXZTFGgrjT7mFo4fjYQuYwSpdmV3kM6h1F71gIL9ZJJ1wHW6AaVKHhpMmzf/wdlOr1tcrHEZmr3f8AG4xDqy3RmpHIjqiH3MdVf9T0dCl85KNhNZ4CzgvWWPUhw++r6CN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7zVwwLh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7zVwwLh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD901F000E9;
	Wed, 20 May 2026 20:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779308542;
	bh=ZXaS5YrpFQOefNN5DnPRWZaZ8KfRQewTpJMQwHzf/DY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=V7zVwwLhkmXYBS659uQ+eWMtx+uNTN8yaBgDK0fAeh9+j5h0lSUH/Szzqd3YFy80d
	 lJk3AZKTpfeqfQxzOBTpw05ys9ug5iq+YUbYTFIsW04N16wM4e7zew/4jztNqITsT6
	 0zKs0iQ2lV7oGW1bOI1DZKVaOeb0Htg4fB+7QBtJDBk6zxXo4ElR5boq2V6xCqXmFC
	 qWhJ0MNalaUZkH/5BQ87CUbUeFxMJMF08JFmdBjWfxr0Du287yhjWiPEj110XkOE3N
	 3TFf2yrSwHyKBBx7QstX5rnt/Zo2+dYd+8mJ0ZBeGA3OhAadEuzdNPZ1k1oftgMy0/
	 3AHwLxiiSPMqw==
Message-ID: <5d76237c-e993-4b95-ba3e-e5eadda23ce5@kernel.org>
Date: Wed, 20 May 2026 15:22:19 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] platform/x86/amd/pmc: Add support for AMD 1Ah Family
 80h SoC
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Sanket.Goswami@amd.com
References: <20260520191149.773196-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260520191149.773196-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/20/26 14:11, Shyam Sundar S K wrote:
> The series introduces the necessary device identification, refactors SMU
> mailbox register handling for better maintainability, and configures the
> SoC-specific register offsets required for SMU communication.
> 
> Patch 1 adds the ACPI and PCI device IDs for the new SoC variant.
> 
> Patch 2 refactors SMU mailbox offset initialization into a dedicated helper
> function to improve code organization as the number of supported SoCs grows.
> 
> Patch 3 extends the SMU register refactoring to store all three SMU registers
> (message, argument, response) in the device structure, replacing hardcoded
> register addresses.
> 
> Patch 4 adds the SoC-specific SMU register addresses for the 1Ah Family 80h,
> completing the register configuration needed for SMU communication.
> 
> Patch 5 enables s0i3 support for the new SoC by adding it to the OS_HINT
> and idle mask handling code paths.
> 
> This series has been tested on AMD 1Ah Family 80h hardware to verify proper
> driver binding, SMU communication, and s2idle functionality.
> 
> Shyam Sundar S K (5):
>    platform/x86/amd/pmc: Add ACPI ID AMDI000C for AMD 1Ah Family SoC
>    platform/x86/amd/pmc: Add SMU mailbox offset retrieval for different
>      CPU families
>    platform/x86/amd/pmc: Refactor SMU register handling to be
>      device-specific
>    platform/x86/amd/pmc: Add SMU register support for 1Ah 80h SoC
>    platform/x86/amd/pmc: Add OS_HINT command for AMD Family 1Ah Model 80h
> 
>   drivers/platform/x86/amd/pmc/pmc.c | 45 +++++++++++++++++++++++++-----
>   drivers/platform/x86/amd/pmc/pmc.h | 12 ++++++++
>   2 files changed, 50 insertions(+), 7 deletions(-)
> 

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
