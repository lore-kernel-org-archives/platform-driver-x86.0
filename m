Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CE8204864
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Mar 2025 13:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741094746; cv=none; b=QQSnD5zzcNYglq00oMxf4jwAnFoh4woLyUKXXAd1VwN0ZOOrQZYzJJTXSlSrSDITSgt/3daJWmPbfECptIWqqn6OW5drtdSUrAduDIhJTBoRg97pH0gyeolqvjnyRHhP+7HYzYGhu840V2QJIrnMPorkM41YN9kG/1nixDWFHJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741094746; c=relaxed/simple;
	bh=wndK1zKi+3XDT2v26WQC6fPZFWjKzHJnM+7C9N8b7HI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=o3grUHcPDegN8sjtC6whi6D1rksZLS/gfaCp9bH03QgxGWkCN+KPTnnxhfA9cqKof/BDjv2+W1HUEOqW9PL8zlrziCbTN0G22j+g+neCGVrKR08escVWycIjDeuBuGNfnMBc1tIdFfDgGBk0MQ8rZNzVaUCD61Ecs95vthxL4RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Opwtj9GX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Opwtj9GX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741094745; x=1772630745;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wndK1zKi+3XDT2v26WQC6fPZFWjKzHJnM+7C9N8b7HI=;
  b=Opwtj9GXoTpTIsbNwZXZ5NEa4DrxlB6ei02ZjqI3sVfNvrBQa4dlrBoZ
   Jdq26x2aGEXuGqn4Dw5oG5HCT9A7ixqvGoaJaqL0BE/7i9siw/P/uY93U
   XfnCxkAFZMdbW6NABE9qS6w3gjIF1EvmRt5cVxa8ntnD8wm8KBwDyODo0
   eQ1r/vDPHJMNza7KvhhNLfjNwFgI79RpmbAg+gEM2gSupvBCGq3R77qk6
   eRGBJ9LdkGXCdobpUujle2c27QU+uDloGYFB3ZHIp/U2R+/QguCKaIcaP
   sIw4hiYPhcJjhUTbBYRTltJwo8kOju2vHZIXv5g//fPOIDK2K2TxkW/dz
   g==;
X-CSE-ConnectionGUID: Aqo2njxuTzCw+v1uCloXHg==
X-CSE-MsgGUID: UD0MTwcmTeKa8zQkQzE7Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41868118"
X-IronPort-AV: E=Sophos;i="6.14,331,1736841600"; 
   d="scan'208";a="41868118"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 05:25:44 -0800
X-CSE-ConnectionGUID: GuTIJiVtTtem3GmC051zPg==
X-CSE-MsgGUID: yMLUxs2OSi+wGrSbqD1Wmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="119055256"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.220])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 05:25:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 4 Mar 2025 15:25:37 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v6 2/9] platform/mellanox mlxreg-hotplug: Add support
 for new flavor of capability registers
In-Reply-To: <20250211091912.36787-3-vadimp@nvidia.com>
Message-ID: <ba50e0b6-dbb5-4444-e291-0259b23f64ab@linux.intel.com>
References: <20250211091912.36787-1-vadimp@nvidia.com> <20250211091912.36787-3-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Feb 2025, Vadim Pasternak wrote:

Hi Vadim,

> Hotplug platform data is common across the various systems, while
> hotplug driver should be able to configure only the instances relevant
> to specific system.
> 
> For example, platform hoptplug data might contain descriptions for fan1,

hotplug

> fan2, ..., fan{n}, while some systems equipped with all 'n' fans,
> others with less. Same for power units, power controllers, ASICs and so
> on.
> 
> New 'capability_mask' is introduced to allow sharing of same hoptplug
> structure between different systems, equipped with different number of
> hotplug devices. It contains superset mask for all systems sharing the
> same configuration.
> 
> The purpose is to reduce unnecessary duplication of hoptplug structures

hotplug

> between different systems - same structure is to be used for example for
> system equipped fir for 4, 6 or 8 fans.
> 
> For detection of the real number of equipped devices capability
> registers are used. These registers used to indicate presence of
> hotplug devices. On some systems presence is porvided through the

provided

> bitmap. For some new big modular systems, these registers will provide
> presence by counters. Use slot parameter to determine whether
> capability register contains bitmask or counter.
> 
> Reviewed-by: Felix Radensky <fradensky@nvidia.com>
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> v5->v6
> Revised after comments pointed out by Ilpo:
> - Drop 'capability_bit' from structure 'mlxreg_core_data', since it is
>   not used.
> ---
>  drivers/platform/mellanox/mlxreg-hotplug.c | 25 ++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index 0ce9fff1f7d4..93bdd20fd71a 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -274,6 +274,16 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
>  			if (ret)
>  				return ret;
>  
> +			if (!regval)
> +				continue;
> +
> +			/*
> +			 * Remove non-relevant bits: 'regval' contains bitmask of attributes or
> +			 * number of attributtes, which should be handled. While 'capability mask'

attributes

> +			 * is superset mask.
> +			 */
> +			if (item->capability_mask)
> +				regval = (regval & item->capability_mask);
>  			item->mask = GENMASK((regval & item->mask) - 1, 0);

I still don't understand how this can be correct.

As a last step, the code here is taking GENMASK(<num_of_bits>-1, 0) I 
assume. That would mean regval has a field that is indicated by item->mask 
that the number of bits (or "number of attributes" as mentioned in the 
comment). Is that correct?

Now, in your comment and the commit message, you also say 'regval' 
might contain "bitmask of attributes' and you mask part of the bits away
from what I assume is a bitmask in the newly introduced code. A bitmask, 
however, is not something that seems directly compatible with GENMASK() 
that inputs bit _indexes_, so how can that be passed directly into GENMASK 
without anything to convert it into number of bits/bit index first???

-- 
 i.

>  		}
>  
> @@ -294,7 +304,18 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
>  				if (ret)
>  					return ret;
>  
> -				if (!(regval & data->bit)) {
> +				if (data->capability_mask)
> +					regval = (regval & data->capability_mask);
> +
> +				/*
> +				 * In case slot field is provided, capability register contains
> +				 * counter, otherwise bitmask. Skip non-relevant entries if slot
> +				 * is set and exceeds counter. Othewise validate entry by matching
> +				 * bitmask.
> +				 */
> +				if (data->slot > regval)
> +					break;
> +				if (!(regval & data->bit) && !data->slot) {
>  					data++;
>  					continue;
>  				}
> @@ -611,7 +632,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
>  				if (ret)
>  					goto out;
>  
> -				if (!(regval & data->bit))
> +				if (!(regval & data->bit) && !data->slot)
>  					item->mask &= ~BIT(j);
>  			}
>  		}
> 
