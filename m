Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA13A3F411D;
	Wed, 10 Jun 2026 11:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089558; cv=none; b=YGAlzMdUXybAHVg/4rAo8m/m5VT8JQSoRVMjw2GIvOUrf4LX4+Wm7alPH3eQAJuygVkgSFeKVFIQJT03uTvLpnq90xzQ0m8pAzfJ4YSeBeSFjtqcY4+7A3bV3Wvs/zjlxBTtGI6bE2R5ccCXwMeqw2QseWqrCQ72Kd4S2xJgBfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089558; c=relaxed/simple;
	bh=+u/x4XOwKddda6YppjswvkKD1+1S9ubwqvcgp9ad7UU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gqrUNu5k1cMGVcRTNLe4QMzMZWTzC2Ymsk/tGJ72whUm6WVaC4tLS8KZCsO3FbINBlwwY3JZAEB30iYlflaCZe0TAx3tJx9B/+mj/AjkzC35tj4sGWCCU8vmdJyxpx/LOg4+OIZudyIIS2OGjRnp2B6990QwJ0Mt/BNqjuEr6Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJAjDr0q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJAjDr0q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781089555; x=1812625555;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+u/x4XOwKddda6YppjswvkKD1+1S9ubwqvcgp9ad7UU=;
  b=mJAjDr0qXGFIFBktztc5nINHfv8mN/Q1TyufIiV0KcXkhPkMuKacUFHv
   nRDONJS+5Xybq/TPRhWwopoTBopc1jTQ8rardZ5uV20nTFnwyBWBUPZwB
   7/3FVod9fTdZs6Df3JwQem5+xeoBKOIyXxfEPdyhpZHb8EG2tr6kVOd8B
   TRPyn2XTB4aMvzmyFPRe1iGcZnCJJ+lyRRxS7objUAnT9Wa3qD7sFNEJt
   7opzCo31vlZPrv9ySj7vgxypKvs6kfuQ1A0zutG/XNmY0lVkjdI6Llknm
   /oULtzV/W0k2/wXqtwvJg88Bou7R+4GjdKcR6Bg05+TTxzfz7cS4ePtsL
   A==;
X-CSE-ConnectionGUID: 8DhCq5CZTbCES8qfh6OalA==
X-CSE-MsgGUID: myRcfELYQUOfLoZU6gYiNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85505470"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="85505470"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:05:54 -0700
X-CSE-ConnectionGUID: ny7lrNxeRbqfm59NOYVMcQ==
X-CSE-MsgGUID: HwPE92HqTPGsjPlBt/WTQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="246235793"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:05:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Jun 2026 14:05:47 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: Re: [PATCH v4 4/7] platform/x86/amd/hsmp: Source metric-table size
 from firmware
In-Reply-To: <20260528093954.2461272-5-muralidhara.mk@amd.com>
Message-ID: <3ccdf8eb-861a-970a-5c05-96c1ec54b473@linux.intel.com>
References: <20260528093954.2461272-1-muralidhara.mk@amd.com> <20260528093954.2461272-5-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 May 2026, Muralidhara M K wrote:

> The driver hard-codes the metric-table region size to
> sizeof(struct hsmp_metric_table). That is correct for HSMP protocol
> version 6 but mis-sizes the ioremap of the SMU DRAM region on newer
> platforms: Family 1Ah Model 50h-5Fh exposes a ~13 KB
> hsmp_metric_table_zen6, and the table is expected to keep growing
> on future firmware. The same hard-coded value also forces
> hsmp_metric_tbl_read() to reject any read that follows the actual
> firmware layout.
> 
> Pick up the table size from firmware instead. SMU on Family 1Ah
> Model 50h and later populates HSMP_GET_METRIC_TABLE_DRAM_ADDR's
> args[2] with the DRAM region size in bytes; older firmware leaves
> it 0. Bump the descriptor's response_sz to 3 so the field is read,
> store the value in hsmp_pdev.hsmp_table_size at probe time, and
> fall back to sizeof(struct hsmp_metric_table) when firmware reports
> 0. Use hsmp_table_size both for the devm_ioremap() of the region
> and as the upper bound for hsmp_metric_tbl_read().
> 
> Behaviour on existing protocol-version-6 hardware is unchanged:
> firmware returns 0, the fallback yields the same value as the
> previous hard-coded one, and both the ioremap and the size check
> produce the same result as before.
> 
> The ioctl interface added later in this series uses the same
> hsmp_table_size to validate the userspace request and to copy out
> the full firmware-reported region.
> 
> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>  arch/x86/include/uapi/asm/amd_hsmp.h |  5 +++--
>  drivers/platform/x86/amd/hsmp/hsmp.c | 11 ++++++++---
>  drivers/platform/x86/amd/hsmp/hsmp.h |  1 +
>  3 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
> index fce271282348..438ac38d0dc8 100644
> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
> @@ -365,11 +365,12 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
>  	{0, 0, HSMP_GET},
>  
>  	/*
> -	 * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz = 2
> +	 * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz = 3
>  	 * output: args[0] = lower 32 bits of the address
>  	 * output: args[1] = upper 32 bits of the address
> +	 * output: args[2] = DRAM region size in bytes
>  	 */
> -	{0, 2, HSMP_GET},
> +	{0, 3, HSMP_GET},
>  
>  	/*
>  	 * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 9bad58fef304..cf9392f99298 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -356,8 +356,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>  		return -ENOMEM;
>  	}
>  
> -	/* Do not support lseek(), also don't allow more than the size of metric table */
> -	if (size != sizeof(struct hsmp_metric_table)) {
> +	if (size != hsmp_pdev.hsmp_table_size) {
>  		dev_err(sock->dev, "Wrong buffer size\n");
>  		return -EINVAL;
>  	}
> @@ -398,8 +397,14 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>  		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
>  		return -ENOMEM;
>  	}
> +	/* SMU returns table size from Family 1Ah Model 50h and forward */
> +	if (msg.args[2])
> +		hsmp_pdev.hsmp_table_size = msg.args[2];
> +	else
> +		hsmp_pdev.hsmp_table_size = sizeof(struct hsmp_metric_table);
> +
>  	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
> -					     sizeof(struct hsmp_metric_table));
> +					     hsmp_pdev.hsmp_table_size);
>  	if (!sock->metric_tbl_addr) {
>  		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
>  		return -ENOMEM;
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index b153527e0a0d..e7f051475728 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -55,6 +55,7 @@ struct hsmp_plat_device {
>  	u32 proto_ver;
>  	u16 num_sockets;
>  	bool is_probed;
> +	size_t hsmp_table_size;

Please add types.h include.

>  };
>  
>  int hsmp_cache_proto_ver(u16 sock_ind);
> 

-- 
 i.

