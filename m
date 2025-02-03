Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4C1205512
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Feb 2025 13:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590436; cv=none; b=MQEVWCSOSacOGcM7uBozM0E3HCGaxXzLdp/aehMf9wAAx0w1nu5/22RExMA2UlgZqsdVRCCbq7cqlfvXHFAgbmK5bfiUYfcgdLtPsMo6eVrf0IYw0Xbbw86CBKYgJyPoBJEpcP7Zi29OvVhPY393BarlIivAVY6ajdnzWQTUtYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590436; c=relaxed/simple;
	bh=Wd6+VC0ciAs4N7cWVllPN/AingsyNLOlbmMwWvUctcY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TEC3GHL2c8Qv+STML5pvSZVbtAknH7SZkPXt6IRIaxSD2tXdlouVNzAhj+vlv4zz09ByG4QoIojZgD+W97hj4iyq8x692Cj1q7XdaJADk3L2fLVh9QGVzpeTSGbXpCbniAdCPntNulTrjQYfAs5ij2OCif+sZPdF4GICStjPwhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huLTiGQ2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huLTiGQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738590435; x=1770126435;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Wd6+VC0ciAs4N7cWVllPN/AingsyNLOlbmMwWvUctcY=;
  b=huLTiGQ2DEQj3vLsZt3G5f5rmTEIUiy3pk2DD+HlKySb63q8Lb4Sep/p
   Ui34aMb0UJIxRWZYkfD1K3KFPrU5JzG6g1fQH4NhxxeMRQeigQZ47k7ri
   g9WP7zhr4JNWXRG+MwEiiiz7GCg88QbfohzadokR1h3sBwdqmoFilobrk
   Vo62PBRZbJ3XarHEsPtHBCeuIMPxq3B2muoRGLrTlBuswprW27CiR/J17
   vwp4Mvd8droMxD5CPqJhIZ9s1/wA8DClVDJkxWSd4iFDZG5aLfcXh6AKU
   JUyBQ62lcDGjoS4mgX7Og1l6XXNuePvN5evaUkK9OLyuH3gilbnKp1Ju9
   w==;
X-CSE-ConnectionGUID: ugxnsgeBQ2q+UGT9wmrmhA==
X-CSE-MsgGUID: kJ4NNSbHSpKl3Z/RZDmH5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="38316384"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="38316384"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:47:14 -0800
X-CSE-ConnectionGUID: OldxdmLbQuu4ETDx8v34Ow==
X-CSE-MsgGUID: mqDhzJdzSMmDe1w9y1IZJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114324593"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.194])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:47:11 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Feb 2025 15:47:08 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v5 05/12] platform/mellanox: mlxreg-hotplug: Add support
 for new flavor of capability registers
In-Reply-To: <20250124172632.22437-6-vadimp@nvidia.com>
Message-ID: <13c4d945-a9e3-05ec-a805-573980505f3f@linux.intel.com>
References: <20250124172632.22437-1-vadimp@nvidia.com> <20250124172632.22437-6-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Jan 2025, Vadim Pasternak wrote:

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

Hi,

Don't leave non-full lines in middle of a paragraph.

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
> v2->v3
> Comments pointed out by Ilpo:
> - Change rol32() to shift left.
> ---
>  drivers/platform/mellanox/mlxreg-hotplug.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index 0ce9fff1f7d4..c525b8754d48 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -274,6 +274,12 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
>  			if (ret)
>  				return ret;
>  
> +			if (!regval)
> +				continue;
> +
> +			/* Remove non-relevant bits. */
> +			if (item->capability_mask)
> +				regval = (regval & item->capability_mask) << item->capability_bit;

What's in regval at this point? What it was before this patch?

>  			item->mask = GENMASK((regval & item->mask) - 1, 0);

I'm sorry but that comment didn't really help me understand what's going 
on here with the double field mask generation.

Is the code correct both before the addition of the extra step and after 
it? Because I cannot wrap my head around what this code attempts to do and 
how could it be correct both pre and post this change.

FYI, I've taken patches 1-3 of this series into review-ilpo-next as they 
seemed trivial changes.

-- 
 i.

>  		}
>  
> @@ -294,7 +300,19 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
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
> +					regval = (regval & item->capability_mask) <<
> +						 item->capability_bit;
> +				if (data->slot > regval) {
> +					break;
> +				} else if (!(regval & data->bit) && !data->slot) {
>  					data++;
>  					continue;
>  				}
> @@ -611,7 +629,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
>  				if (ret)
>  					goto out;
>  
> -				if (!(regval & data->bit))
> +				if (!(regval & data->bit) && !data->slot)
>  					item->mask &= ~BIT(j);
>  			}
>  		}
> 
