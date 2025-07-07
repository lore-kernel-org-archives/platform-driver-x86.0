Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6EA27587D
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Jul 2025 13:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751894593; cv=none; b=egXxQkf53GFDH0vlmjWRVvwTvcsOWC0EhXstpYCVdZ/tYFkJGO6qVdz0DMZpuRieWIk846G1hLa//d+WQ8ojx/TOr39oC+9L5bxpBKENBWlfQ7toQNro3BmEBJ7Q5p/F9uvuy5fD3Fb5VtnAjcZU08PIm2NxBaTsUxarAKA+llQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751894593; c=relaxed/simple;
	bh=eSxTCGlSePRm7+fzYz5cp12bRZV3u77/8EPaTqsw0Sc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aqIWUwSRtNScdk58p5Bgs4J3C3kd/5OIhrR8+tIyYn5AIN+vJSrLEs7+aEsjwyX2+8cVE7IP6akvvOYX7XoJDhLl/1mbwRJcFY6S9Ybz6HCnV5AckYGEEvTB9AifXW3SP3R9uqBhNupKD9SVvIHtFa0t8o92DHXhw2ol4hW4Tag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ghcem5Da; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ghcem5Da"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751894592; x=1783430592;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=eSxTCGlSePRm7+fzYz5cp12bRZV3u77/8EPaTqsw0Sc=;
  b=Ghcem5DaU1QbrabIu/sL9Md9+Yzdv/oq+qK0UaOMIQIFKeQ437AMWLjz
   2K0qoTwxMSx1nLpA5p0NX8hCON9wumkTAoi1ceh67ZGwN6qHe1OfxaJPT
   /LK7KyWwqJe0WrRnsRSrWTLKYPNR0io6Zq6hJWm0LsJfR45zOF4JvmzN7
   VdYjnzqofbZ/0ujpeD8ccDf9arPtIc9BttY18zWuI8gerU78WMxClmf+Z
   0SUn91FRXwBY54LdGzhOSCa3rpPUfjNRtNA6xFNjDbhPfpt9WA4ZOJINt
   ukm3Y+2uDwIcNSYqOkC927YZzWZrXFAFA9rgHJZtyndPsjxtF/2pKedhm
   w==;
X-CSE-ConnectionGUID: MMLSSS4fTUicVvNOEWWNWA==
X-CSE-MsgGUID: JaL80uyCSuCCXuVrDOtYRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54207392"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="54207392"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 06:23:10 -0700
X-CSE-ConnectionGUID: IABJmHuHTFiiLbbP9Ud/xA==
X-CSE-MsgGUID: ZVZD5f/eTKWxBFNtWkYifw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="159758275"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.104])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 06:23:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 7 Jul 2025 16:23:04 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH v6 09/12] platform/x86/intel/pmt: add register access
 helpers
In-Reply-To: <20250703211150.135320-10-michael.j.ruhl@intel.com>
Message-ID: <800f3860-1cad-d5c3-803c-3b0f7d93fb90@linux.intel.com>
References: <20250703211150.135320-1-michael.j.ruhl@intel.com> <20250703211150.135320-10-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Jul 2025, Michael J. Ruhl wrote:

> The control register is used in a read/modify/write pattern.
> The status register is used in a read/check bit pattern.
> 
> Add helpers to eliminate common code.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 60 ++++++++++++-----------
>  1 file changed, 31 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index 23b3971da40a..888946a8ba46 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -64,20 +64,42 @@ struct pmt_crashlog_priv {
>  /*
>   * I/O
>   */
> -static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
> +#define CRASHLOG_SET_BIT	true
> +#define CRASHLOG_CLEAR_BIT	false

These defines look overkill to me. IMO it is just as simple to use 
true/false directly when calling.

> +/* read/modify/write */

As is, this comment doesn't add value over the function name.

It would be more useful to explain this function sets or clears @bit based 
on @set.

-- 
 i.

> +static void pmt_crashlog_rmw(struct intel_pmt_entry *entry, u32 bit, bool set)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> +	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
> +
> +	reg &= ~CRASHLOG_FLAG_TRIGGER_MASK;
> +
> +	if (set)
> +		reg |= bit;
> +	else
> +		reg &= ~bit;
> +
> +	writel(reg, entry->disc_table + CONTROL_OFFSET);
> +}
> +
> +/* read/check */
> +static bool pmt_crashlog_rc(struct intel_pmt_entry *entry, u32 bit)
> +{
> +	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
> +
> +	return !!(reg & bit);
> +}
>  
> +static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
> +{
>  	/* return current value of the crashlog complete flag */
> -	return !!(control & CRASHLOG_FLAG_TRIGGER_COMPLETE);
> +	return pmt_crashlog_rc(entry, CRASHLOG_FLAG_TRIGGER_COMPLETE);
>  }
>  
>  static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> -
>  	/* return current value of the crashlog disabled flag */
> -	return !!(control & CRASHLOG_FLAG_DISABLE);
> +	return pmt_crashlog_rc(entry, CRASHLOG_FLAG_DISABLE);
>  }
>  
>  static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
> @@ -98,37 +120,17 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
>  static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
>  				     bool disable)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> -
> -	/* clear trigger bits so we are only modifying disable flag */
> -	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
> -
> -	if (disable)
> -		control |= CRASHLOG_FLAG_DISABLE;
> -	else
> -		control &= ~CRASHLOG_FLAG_DISABLE;
> -
> -	writel(control, entry->disc_table + CONTROL_OFFSET);
> +	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_DISABLE, disable);
>  }
>  
>  static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> -
> -	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
> -	control |= CRASHLOG_FLAG_TRIGGER_CLEAR;
> -
> -	writel(control, entry->disc_table + CONTROL_OFFSET);
> +	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_TRIGGER_CLEAR, CRASHLOG_SET_BIT);
>  }
>  
>  static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> -
> -	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
> -	control |= CRASHLOG_FLAG_TRIGGER_EXECUTE;
> -
> -	writel(control, entry->disc_table + CONTROL_OFFSET);
> +	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_TRIGGER_EXECUTE, CRASHLOG_SET_BIT);
>  }
>  
>  /*
> 

