Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBF226FD9B
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 10:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764151585; cv=none; b=lPjrX9wnjrXzwfc5z1E/yZifCl7to4wRghxXu4Sij/U//F6m2/j3cprBX71FFlifXv4P6TkPO/HSs2rXNhLlopDOkD0q7wtovxxC+qUgmdTvVJ/EYFn1Rzpg9Zq3oxLx0GoymIrh5EmLPQDpa9dnZK+rKwciVg22BwtNsnHYANw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764151585; c=relaxed/simple;
	bh=lAjikU5HbuHdv9U+rebWQE4rtVnLx2JlTp3GX9j+j10=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=i3ORzWB2QhisnDFkbGjxhNisY8C8Jm+jhiIvzxp5cuoY7CPTdzwLOReKtRS2dXtfknK0e5u7IStbvXFMI4PUCekZZRLg78X1Fkc46YU6zuYN3+VBjbYgAwXEw82WQ8y4ZA386mKQQ7+ee9bhLeT1sPan6SYz2SN5f19Ep2WbeHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZLLFg4r; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZLLFg4r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764151584; x=1795687584;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lAjikU5HbuHdv9U+rebWQE4rtVnLx2JlTp3GX9j+j10=;
  b=JZLLFg4r3tzE6USN+kk4Jjlg9MH1aesSTMm10yx5+F9B53vpq6oRG185
   pCa5NWwR92dYZPov1wbnNZ5MmsNb9KVCNQo/zBASyQVcbFG3F+YMMrGrk
   I/aPDW9J4V7F4zEyPvdyHKqdl7O2+7mkImfgjChDd7OrpkdeMuCjizubg
   SlWrwzWAUslAQoLwOlRRgiIJAsdieSkQyHZ3bAOAcsPVf511Abkiae5CQ
   Z3NO8TSNXFNSRIMuTAUuCLpRGK+aSwxw3TMpI+4RvUvGmoL31UKWp9xMz
   oP5I93zJc7fMYjLqwglawQmLZ0VvOYFK5WK9tXL5ldekX27skHBQ7YLej
   w==;
X-CSE-ConnectionGUID: BxQVN3Z+SOSFpm8y8zzxvA==
X-CSE-MsgGUID: ChTvR20fSMKbzalWmAznRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="70047631"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="70047631"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 02:06:23 -0800
X-CSE-ConnectionGUID: 04Hstn2PT4ajKg300L4kUw==
X-CSE-MsgGUID: N7qclG4dRke3Fh3vr633Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="198009016"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 02:06:21 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 26 Nov 2025 12:06:16 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com
Subject: Re: [PATCH v2] platform/x86/amd/pmf: Refactor repetitive BIOS output
 handling
In-Reply-To: <20251126094340.4042742-1-Shyam-sundar.S-k@amd.com>
Message-ID: <122618f2-f39e-240f-c229-8fea02b2b0fc@linux.intel.com>
References: <20251126094340.4042742-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Nov 2025, Shyam Sundar S K wrote:

> Replace repetitive switch-case statements for PMF_POLICY_BIOS_OUTPUT_*
> with a helper function and consolidated case handling. This reduces code
> duplication and improves maintainability.
> 
> The 10 BIOS output policies (PMF_POLICY_BIOS_OUTPUT_1 through
> PMF_POLICY_BIOS_OUTPUT_10) previously each had individual case statements
> with identical logic. This patch introduces
> pmf_policy_to_bios_output_index() to map policy values to array indices,
> consolidating the handling into a single case block with fallthrough.
> 
> This approach handles non-sequential policy enum values gracefully and
> makes future additions easier to implement.
> 
> No functional changes.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v2:
>  - Drop if() check for bios_idx
> 
> Note: This patch can be applied on ilpo-next
> 
>  drivers/platform/x86/amd/pmf/tee-if.c | 61 +++++++++++++++------------
>  1 file changed, 33 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 2c74ba2a0b51..e4562caf98fe 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -73,6 +73,34 @@ static void amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
>  	input_sync(dev->pmf_idev);
>  }
>  
> +static int amd_pmf_policy_to_bios_output_index(u32 action_idx)
> +{
> +	switch (action_idx) {
> +	case PMF_POLICY_BIOS_OUTPUT_1:
> +		return 0;
> +	case PMF_POLICY_BIOS_OUTPUT_2:
> +		return 1;
> +	case PMF_POLICY_BIOS_OUTPUT_3:
> +		return 2;
> +	case PMF_POLICY_BIOS_OUTPUT_4:
> +		return 3;
> +	case PMF_POLICY_BIOS_OUTPUT_5:
> +		return 4;
> +	case PMF_POLICY_BIOS_OUTPUT_6:
> +		return 5;
> +	case PMF_POLICY_BIOS_OUTPUT_7:
> +		return 6;
> +	case PMF_POLICY_BIOS_OUTPUT_8:
> +		return 7;
> +	case PMF_POLICY_BIOS_OUTPUT_9:
> +		return 8;
> +	case PMF_POLICY_BIOS_OUTPUT_10:
> +		return 9;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>  {
>  	u32 val;
> @@ -183,45 +211,22 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  			break;
>  
>  		case PMF_POLICY_BIOS_OUTPUT_1:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(0), 0);
> -			break;
> -
>  		case PMF_POLICY_BIOS_OUTPUT_2:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(1), 1);
> -			break;
> -
>  		case PMF_POLICY_BIOS_OUTPUT_3:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(2), 2);
> -			break;
> -
>  		case PMF_POLICY_BIOS_OUTPUT_4:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(3), 3);
> -			break;
> -
>  		case PMF_POLICY_BIOS_OUTPUT_5:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(4), 4);
> -			break;
> -
>  		case PMF_POLICY_BIOS_OUTPUT_6:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(5), 5);
> -			break;
> -
>  		case PMF_POLICY_BIOS_OUTPUT_7:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(6), 6);
> -			break;
> -
>  		case PMF_POLICY_BIOS_OUTPUT_8:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(7), 7);
> -			break;
> -
>  		case PMF_POLICY_BIOS_OUTPUT_9:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(8), 8);
> -			break;
> -
>  		case PMF_POLICY_BIOS_OUTPUT_10:
> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(9), 9);
> +		{
> +			u32 bios_idx = amd_pmf_policy_to_bios_output_index(out->actions_list[idx]
> +					.action_index);

You probably realized yourself too this is a bit too long line. :-)

There are multiple things that could be done to alleviate it (not a list 
of requirements, just ideas where to pick from):

- Create a local var for out->actions_list[idx] in the loop (with a 
  relatively short name).

- Try to make the function's name slightly shorter though I'm not sure 
  it's easy beyond "index" -> "idx".

- Place .action_index to a local var before the call or before the 
  switch ().

- Call some function and put this code there.

I don't necessarily know which results in the best experience from code 
reading PoV but something needs to be done.

> +			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(bios_idx), bios_idx);
>  			break;
>  		}
> +		}
>  	}
>  }
>  
> 

-- 
 i.

