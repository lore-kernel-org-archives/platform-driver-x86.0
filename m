Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1126620AF71
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 16:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736785512; cv=none; b=SfLDJL7iOjM4aGM697eIcddPNSr5lx2Y6E7IaKXi/pSLJRqI6SqtJrMSZjeVD0G8N1aRz7bMt0+VM+dXxdOeCEuzzF0D+fsetAnxp5wG8As65fUZE66e9070ChAhcSKyuRZe8B2N/r3aDLT6idXG2rNxFzB5tLbAA0R11wiNFMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736785512; c=relaxed/simple;
	bh=CMw0Lx6USALvSvZ5fFesZeOXHUUlVMm024mKlG8HH6c=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ApU9fJ7lhhT20UCIPPNkzYYTYZpiXcTqbNSONLDgb8RjZ4EhEiMWs9DzI8I8kYkFgfSRQ5QWfRpJPgDTGFFQPGu4wYuqU4rLyrKVHyx8EPT0wwN1jwWvAY5izDCy5lLmbWBCdU+cmDa/Zkpmgcn05cbTXhEnqgodlm+LWensb6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zej0cRKc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zej0cRKc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736785511; x=1768321511;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CMw0Lx6USALvSvZ5fFesZeOXHUUlVMm024mKlG8HH6c=;
  b=Zej0cRKcUeCBPeE4U4Lk77FNWxmirX2fvowtQkIB0yGpIyY6JsL25Q1w
   aL/2onupbH8e69cON7AUe84Io1cnCWySpIrTJB+WvtSE5zcSP288J6XAf
   yTUWabBG5B4veiyTCYg9vxtryPvjyR0MR610e22BGJRffg56aQUZZzW5+
   p9LFpvOdXptWUJTeDj/blItp9gY5qLpuTvjhS/edim8lqPIlyOX3azysq
   qaec8UmHyQKr0/Euz+xnr0YvZ4OAm04Wm0GCayhO6OIVRyAVAh1iLBvvx
   IEBgIzOqTSiXL+QxYTxIazKRIVjgajutHtJnuqwhK1b+xRO+Lc+ySFVu3
   w==;
X-CSE-ConnectionGUID: crP6wPwcQESxWtcGhCaGCQ==
X-CSE-MsgGUID: PzM6t4lvQ7SBsEZpBPRsdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48059717"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48059717"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 08:25:11 -0800
X-CSE-ConnectionGUID: mDep+QOWSiWwxarr5NbBIw==
X-CSE-MsgGUID: +CXiMpkcQfu0ZuX/q8siLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105402575"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.121])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 08:25:08 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 Jan 2025 18:25:05 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next v2 05/10] platform/mellanox: mlxreg-hotplug:
 Add support for new flavor of capability registers
In-Reply-To: <20250113084337.24763-6-vadimp@nvidia.com>
Message-ID: <afc22280-ec2f-619e-77a6-78a9b4f472b7@linux.intel.com>
References: <20250113084337.24763-1-vadimp@nvidia.com> <20250113084337.24763-6-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Vadim,

I was no longer among the receipients despite being marked as M: for this 
file. Also lkml is not there despite,

scripts/get_maintainer.pl -f drivers/platform/mellanox/mlxreg-hotplug.c

returning both so there's still something wrong in the way the receipients 
are selected.

On Mon, 13 Jan 2025, Vadim Pasternak wrote:

> Hotplug platform data is common across the various systems, while
> hotplug driver should be able to configure only the instances relevant
> to specific system.
> 
> For example, platform hoptplug data might contain descriptions for fan1,
> fan2, ..., fan{n}, while some systems equipped with all 'n' fans,
> others with less.
> Same for power units, power controllers, ASICs and so on.
> 
> For detection of the real number of equipped devices capability
> registers are used.
> These registers used to indicate presence of hotplug devices through
> the bitmap.
> 
> For some new big modular systems, these registers will provide presence
> by counters.
> 
> Use slot parameter to determine whether capability register contains
> bitmask or counter.
> 
> Some 'capability' registers can be shared between different resources.
> Use fields 'capability_bit' and 'capability_mask' for getting only
> relevant capability bits.
> 
> Reviewed-by: Felix Radensky <fradensky@nvidia.com>
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  drivers/platform/mellanox/mlxreg-hotplug.c | 23 ++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index 0ce9fff1f7d4..3e480c322353 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -274,6 +274,13 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
>  			if (ret)
>  				return ret;
>  
> +			if (!regval)
> +				continue;
> +
> +			/* Remove non-relevant bits. */
> +			if (item->capability_mask)
> +				regval = rol32(regval & item->capability_mask,
> +					       item->capability_bit);

Is the intention here to really do _rotate_ bits or is it just normal 
shifting going on? It might be the bits might never rotate past 32-bit 
boundary so it is effectively just shifting but labeling it as rotate is
still wrong if bit rotate is not intended.

I see there are also two pre-existing rol32() calls inside 
drivers/platform/mellanox/ with one of them talking about "shift" so I 
suspect they might be also wrongly using rol32() that does rotate

>  			item->mask = GENMASK((regval & item->mask) - 1, 0);
>  		}
>  
> @@ -294,7 +301,19 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
>  				if (ret)
>  					return ret;
>  
> -				if (!(regval & data->bit)) {
> +				/*
> +				 * In case slot field is provided, capability
> +				 * register contains counter, otherwise bitmask.
> +				 * Skip non-relevant entries if slot set and
> +				 * exceeds counter. Othewise validate entry by
> +				 * matching bitmask.
> +				 */
> +				if (data->capability_mask)
> +					regval = rol32(regval & data->capability_mask,
> +						       data->capability_bit);

Another rol32() here?

> +				if (data->slot > regval) {
> +					break;
> +				} else if (!(regval & data->bit) && !data->slot) {
>  					data++;
>  					continue;
>  				}
> @@ -611,7 +630,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
>  				if (ret)
>  					goto out;
>  
> -				if (!(regval & data->bit))
> +				if (!(regval & data->bit) && !data->slot)
>  					item->mask &= ~BIT(j);
>  			}
>  		}
> 

-- 
 i.

