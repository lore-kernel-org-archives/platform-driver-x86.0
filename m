Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9BD2B2D7
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Mar 2025 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743165905; cv=none; b=sR1fZrsfkdtcAdAQeQO5K5Y9D4IO7lp9xc/dF4+1sA4v+GZZibrBCQcLzMXA94DGdMf4GoQWRER0lQLZZgi92hBbjRTtXoIOvXIQExyPqXYaTZQEUi3J4q2WIoMB4puK6wJLjV2QHTn9Ul3Mngo2MhlfV8EH09u5Dqt51DybL/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743165905; c=relaxed/simple;
	bh=DiKxHBykkYN+ISZfH6C1V6QnkWKhX5dsQEBoVtUr3XY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=V5ic2yHBPOszS38769oe/IXgPpDlY52MpPbNO/ZzVPBgIvI+PBdFa1pmLSQ/RiEHNysTCJdRwaiTl0KNWO54URxbIB2MfQsJhbRGMbNvCThfYFsvA+nKU415CZyoOzhcdk22E32RnYNHLpyrskkY6AZ92yQoIb8MKGWXp1XClYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AypQkw4b; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AypQkw4b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743165904; x=1774701904;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=DiKxHBykkYN+ISZfH6C1V6QnkWKhX5dsQEBoVtUr3XY=;
  b=AypQkw4b2ZqaMcIb7GjLyKTY+LajG5Y+QI/5sbRvDaZFea5qEP8Nw3V5
   aOiVDQgtQ9R96loTjf9w1KX5ps4shZDrIUfDGIeg+5f0wzjOqudisSTbJ
   dpwNBKlTyjEaBN7gkXVGETi1hlmVx6oQz7xmilnoP9IRxeZ5ATZQENag/
   LargQfE6j7au4cMQz5Nvf191xnv72SO8h00mzkaLMNdfWq9igTbtvM20I
   jZkxQNkBIFv9QD/oGz5lA1M7/cJaGaAi7Ask4fweGky2YLr9UulJG2knD
   5pPVXMMdC/IaEY4UelCjdqx/sfzgx/8KWeuJfrDSvR/LIpVXCk/d/gz9x
   Q==;
X-CSE-ConnectionGUID: fgWQFqCiR42cx+9vYYpCHw==
X-CSE-MsgGUID: Jw3+s8y7QUuXEJmHIS3tiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55185173"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="55185173"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 05:45:00 -0700
X-CSE-ConnectionGUID: z7q1vTJcRgai6aRiu0aP6w==
X-CSE-MsgGUID: VOHWibHiSReXMBHSv854bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="130293111"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.43])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 05:44:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 28 Mar 2025 14:44:54 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, michaelsh@nvidia.com, 
    crajank@nvidia.com, fradensky@nvidia.com, oleksandrs@nvidia.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next v7 1/8] platform/mellanox mlxreg-hotplug:
 Add support for new flavor of capability registers
In-Reply-To: <20250327163855.48294-2-vadimp@nvidia.com>
Message-ID: <beaf923c-c637-aa84-c102-f5a9f2605715@linux.intel.com>
References: <20250327163855.48294-1-vadimp@nvidia.com> <20250327163855.48294-2-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Mar 2025, Vadim Pasternak wrote:

> The hotplug platform data is common across various systems, but the
> hotplug driver should only configure instances relevant to specific
> systems.
> 
> For example, platform hotplug data might contain descriptions for fan1,
> fan2, ..., fan{n}, while some systems are equipped with all 'n' fans,
> others with less. This applies to power controllers, ASICs, and other
> components as well.
> 
> The 'capability' register in 'mlxreg_core_item' structure specifies the
> total number of elements. All registers are 8 bits wide. When the number
> of attributes exceeds 8 bits, they are distributed across multiple
> hotplug register sets. The 'capability' register provides the total
> count across all sets.
> Example for 20 attributes:
> - Set 1: attributes 1-8.
> - Set 2: attributes 9-16.
> - Set 3: attributes 17-20.
> 
> The content of the 'capability' register in 'mlxreg_core_data' structure
> depends on presence of the 'slot' field in this structure:
> - If both 'capability' and 'slot' fields are provided: register contains
>   count of elements.
> - Otherwise: register contains bitmask.
> 
> Use slot parameter to determine whether capability register contains
> bitmask or counter.

Thanks, this is much more understandable now that you updated this, 
however, I still find it in mismatch with the code.

> This change reduces unnecessary duplication of hotplug structures
> between different systems - the same structure can be used for systems
> equipped with 4, 12, or 18 fans.
> 
> Reviewed-by: Felix Radensky <fradensky@nvidia.com>
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> v6->v7
> Revised after comment pointed out by Ilpo:
> - Renove capability_mask field.
> - Modify comments and commit text.
> v5->v6
> Revised after comments pointed out by Ilpo:
> - Drop 'capability_bit' from structure 'mlxreg_core_data', since it is
>   not used.
> ---
>  drivers/platform/mellanox/mlxreg-hotplug.c | 29 +++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index 0ce9fff1f7d4..bec12bc73e67 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -274,7 +274,22 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
>  			if (ret)
>  				return ret;
>  
> -			item->mask = GENMASK((regval & item->mask) - 1, 0);
> +			if (!regval)
> +				continue;
> +
> +			/*
> +			 * The 'regval' contains a bitmask or count of attributes to be handled.
> +			 * When the 'capability' register is configured, for 'item' it specifies the
> +			 * total number of elements. All registers are 8 bits wide. If the number of
> +			 * attributes exceeds 8 bits, they are distributed across multiple hotplug
> +			 * register sets. The 'capability' register provides the total count across
> +			 * all sets.
> +			 * Example for 20 attributes:
> +			 * - Set 1: attributes 1-8.
> +			 * - Set 2: attributes 9-16.
> +			 * - Set 3: attributes 17-20.
> +			 */
> +			item->mask = GENMASK(((regval % 8) & item->mask) - 1, 0);

Okay so this matches the case for Set 3 but what code handles Set 1 & 2 
that should be set to 0xff ?

How does it even determine which of those sets the item belongs to?

I don't see those two things done anywhere in the code so please help me, 
is my understanding of the code lacking or is this code missing something?

Note that I'm also a bit unsure if one iteration of the main for loop 
in this function handles one of those sets on each iteration or if there 
would be additional loop required to handle the multi-set case within this 
if block (you don't call any variable "set" in this function so I'm not 
able to make the connection fully between the description and the code).


(I'm really sorry I feel like I'm just dragging this on and on but I 
cannot shake the feeling something is still wrong with this code).

>  		}
>  
>  		data = item->data;
> @@ -294,7 +309,15 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
>  				if (ret)
>  					return ret;
>  
> -				if (!(regval & data->bit)) {
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
> @@ -611,7 +634,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
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

