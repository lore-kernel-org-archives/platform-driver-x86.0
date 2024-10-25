Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B4C13B787
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Oct 2024 14:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868154; cv=none; b=UHrrHjJ0HrUATZGmdXyWkmU/95lxOtEdzDTwTJx2cYagFRa6kODsfq8wa0iC8lyDlEEy8TKTfG7S2wukAnnZo4ZnH+UUsL+XdhyG+NyC4EMF0k/O5rrwXjqMnKot+C7gbfB70Ps8xHvWHGW5EQ55LvAKFJzvv4VcE2XjzvYgov8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868154; c=relaxed/simple;
	bh=tArzs6qjeMwBDnE9rD8fjmD2YvRTkyznBI/EPCGMtk8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ucvImjfrScauvMv8UJIEII/S2xYIkc9f2B0ylHaCD2vRY9XLdXoTQkiqN+pwt9g5PlpGdsNLW7eTRy1yg7kebcS9N8C7XsAcAtBk31bbIPDJNWO5e4zm3gOoIWHjx1X3pBH97cq2r1rljILEWfQyfhyyHZ7kUfgCp8wDE1n/5SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXSTViTg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXSTViTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729868153; x=1761404153;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tArzs6qjeMwBDnE9rD8fjmD2YvRTkyznBI/EPCGMtk8=;
  b=TXSTViTgSurInAm08ZMf8iyduC2tSvW+zyEj+3kiBYpnVuaa1KkDhBfT
   A5u/6gXsxrWpWJvY5W8RUVU+E1uUXrjOMvGS4m6gM7Da5jOo1vimqM8Yh
   ueGgTCApzGuZ0SilXi9Bi0h/Fp3EnREik9FOZHiukJF6TRp4dnaeXxYkF
   4dAXw7CNjUZMqvd9si+3oBf9OwfNr0hwOeZOsKe+xcBrbhK/Qn3ry6A2n
   RwzWv/VoE5dXIzFR0jtOQFi00SnV9NhoS/xoD1R35MrNEBqxpwlThH+W0
   Q7TKsC5LhUbd3hgx3/IOhCYVlDIrX85xTGYJnUCQdYqbS5raFIUKYuXwk
   g==;
X-CSE-ConnectionGUID: +w3YGgAYS9qQ1XeNnapkHg==
X-CSE-MsgGUID: 7Y7sV0//RD2zH4CyJPqLgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29716026"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29716026"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 07:55:52 -0700
X-CSE-ConnectionGUID: Bc1RvCbwRb+PlTeOOyc+pg==
X-CSE-MsgGUID: LNijlu8vR3aiwDq/SOum3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="80852458"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 07:55:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 25 Oct 2024 17:55:47 +0300 (EEST)
To: Corey Hickey <bugfood-ml@fatooh.org>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86/amd/pmc: Detect when STB is not available
In-Reply-To: <20241025051141.924760-1-bugfood-ml@fatooh.org>
Message-ID: <d8734a53-23d7-65b8-d632-1884814f181f@linux.intel.com>
References: <20241025051141.924760-1-bugfood-ml@fatooh.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 24 Oct 2024, Corey Hickey wrote:

> From: Corey Hickey <bugfood-c@fatooh.org>
> 
> Loading the amd_pmc module as:
> 
>     amd_pmc enable_stb=1
> 
> ...can result in the following messages in the kernel ring buffer:
> 
>     amd_pmc AMDI0009:00: SMU cmd failed. err: 0xff
>     ioremap on RAM at 0x0000000000000000 - 0x0000000000ffffff
>     WARNING: CPU: 10 PID: 2151 at arch/x86/mm/ioremap.c:217 __ioremap_caller+0x2cd/0x340
> 
> Additional debug shows that this happens when the calls to obtain
> S2D_PHYS_ADDR_LOW and S2D_PHYS_ADDR_HIGH return 0.
> 
> Per discussion on platform-driver-x86@vger.kernel.org, this condition
> indicates that the STB is not available.

If you want to refer to discussion, add it into a Link: tag. Only write 
the conclusion into the commit message (the part you have there after 
comma).

> In order to avoid the ioremap warning, and to help the user understand
> the situation, catch the invalid address and print an error.
> 
> Signed-off-by: Corey Hickey <bugfood-c@fatooh.org>

Isn't Fixes tag appropriate for this change?

> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index bbb8edb62e00..72b1dfc64bf1 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -998,6 +998,11 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
>  	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
>  
> +	if (!phys_addr_hi && !phys_addr_low) {
> +		dev_err(dev->dev, "amd_pmc: STB is not enabled on the system; disable enable_stb or contact system vendor\n");

Won't that end up duplicating the prefix if you put one into the string? 
The prefix is handled for you by pr_fmt() which is already provided in 
this file.

-- 
 i.

> +		return -EINVAL;
> +	}
> +
>  	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>  
>  	/* Clear msg_port for other SMU operation */
> 

