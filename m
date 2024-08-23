Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B941946B4
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Aug 2024 14:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724422760; cv=none; b=Fyn+oHpl+TBk3+1DBG0zbT34oaFEKCAVE7efPpdddcts1fLeJji1SIsHNT3esa96XxlD4yShGB7Id4xlwiOsOkHgGHvfiXvKp4yvzNEaCWkyEO+RF1/Rgvzn2dwEDt1uamahIJoNYUoaiRTJwQYO8VWaKyTPi922eUk2Xe8NZOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724422760; c=relaxed/simple;
	bh=6bDqQ/qcKwEg7nlxUAGYGPrf1J53NZZ5yRJghQ0yqMY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bHwnE+3Huoqun816dWEAniRgYX04Wv3AGam5hfi3ltZEca2HuZI/vkJZwGzjT6LGz0BoyQ3afxEV7vMBNF6kbQNjSUjZH00dQV0LVG4OIfMbilck9+Av9mZIDrxShOo9O/sxUleG96G6H2CXftsYeDhJrc4A1/bolUTUBIQcgtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yo8k3OeT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yo8k3OeT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724422759; x=1755958759;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6bDqQ/qcKwEg7nlxUAGYGPrf1J53NZZ5yRJghQ0yqMY=;
  b=Yo8k3OeTRgHWd/K39XCN1Uw2M6pYjTLH5dccK50iArehiAjKjAu7XAx7
   XcYcdd3rU6tJhZmX/X0IuPuhRpA5ya+gmJgxCjyo607GnBBzXp1YFYp40
   OXDH97qyVLLN+VAno+Y8mmY7vO91G4fFFP8OeNsU4AEdB2z1cwxW1QzW0
   EwD68K+zAssVjOnFsmZs4I2NXsRvv7UEUIQmzH0m6XkuqoW9zgCwlYQBh
   gwtFKx/ERPXnEOWC9srMayJ1yaduQtRiR0oruOvB9J1ZPBaycxtN0cDiW
   HctgkG3lfXIWmfDrY6ilJvAvU9vkE6FK1ThevAuLJMFqJt1jyRHESWH+c
   Q==;
X-CSE-ConnectionGUID: TxU47Og7Tmq9oajZwTD0LQ==
X-CSE-MsgGUID: awVy5+BrQNeDdQhRIM0+ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33460917"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="33460917"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:19:19 -0700
X-CSE-ConnectionGUID: wMF1BvWxTEygiMalTAwuOQ==
X-CSE-MsgGUID: 2XQbZwHsTBuOIwD92lu5tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="62109612"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.2])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:19:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 23 Aug 2024 17:19:12 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/2] platform/x86/amd/pmc: Fix SMU command submission
 path on new AMD platform
In-Reply-To: <20240822095357.395808-1-Shyam-sundar.S-k@amd.com>
Message-ID: <f81c0083-b096-cfe5-9137-46a3674bf3d7@linux.intel.com>
References: <20240822095357.395808-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Aug 2024, Shyam Sundar S K wrote:

> The commit 426463d94d45 ("platform/x86/amd/pmc: Send OS_HINT command for
> new AMD platform") was introduced to enable sending mailbox commands to
> PMFW on newer platforms. However, it was later discovered that the commit
> did not configure the correct message port ID (i.e., S2D or PMC). Without
> this configuration, all command submissions to PMFW are treated as
> invalid, leading to command failures.
> 
> To address this issue, the CPU ID association for the new platform needs
> to be added in amd_pmc_get_ip_info(). This ensures that the correct SMU
> port IDs are selected.
> 
> Fixes: 426463d94d45 ("platform/x86/amd/pmc: Send OS_HINT command for new AMD platform")
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---

Hi,

I've applied both of these patches to review-ilpo now. The above doesn't 
inspire much confidence though as that sounded like nothing worked with 
426463d94d45 so it probably wasn't tested at all before sending. :-(

-- 
 i.

> v2:
>  - Split v1 into two patches to address a fix and addition of CPU ID
>    support
> 
>  drivers/platform/x86/amd/pmc/pmc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index c3e51f0a5c33..f0d389cf1ecb 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -359,6 +359,7 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>  		dev->smu_msg = 0x538;
>  		break;
>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>  		dev->num_ips = 22;
>  		dev->s2d_msg_id = 0xDE;
>  		dev->smu_msg = 0x938;
> 

