Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E7E2E6126
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jun 2025 10:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749639153; cv=none; b=d0ii1SAj7WD3vYTl1v/9maHxuLLhupsEAQL5D0Dd2NayepQC1WK7H/RXHl8t8Cr1WY//8RLl++2KZdYZk5k5S5pfXx1NC9d0cTVA/nXCXoHOPN/en7If2b4V183m0E4XXDW/8f8yyB35gZMMuHnM2Iw7HQfPYHpSzYO4ZYquIGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749639153; c=relaxed/simple;
	bh=gGMagrCDK3sN1QP+NUuRSNak5emFF1SEvpjfqW/lTX4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uLrHAlvWZ3fCfQG70ZQgNFY7XI6wIQGmIOVXISWYqmeYSPwcBv/JMkMh9Vbi5iqlMG13jJRhc0fU/GuQCsibclzO3tmzkx3ulwb6xCpdg9gtUIsgJpYx5U2h4aiChdchN/YXFojSlaV8YDqnUUgtYXDcBcYIddPb0csSQcctC4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fn5U67lE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fn5U67lE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749639152; x=1781175152;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=gGMagrCDK3sN1QP+NUuRSNak5emFF1SEvpjfqW/lTX4=;
  b=Fn5U67lExvJDNiFYzksolqkamSoXHMzZc7bY7akLKTPKiJSjAsuBLvkv
   k9YHYX5NxXANPPvnDmRqlKsAnQNNjeIB5aksZ+UMQqROyj8GYwS5X+ZRq
   FS1fd+t9K4weBqCYIa1BoICInMqaDBv2gIlny+ADGaQXbgmGJuMl+E6ih
   rvCJbZzcTpF83+4izEmGBdiCGFHHUG6M1Lp8nWQ7Uia/kpB6FC3P3O7hq
   DlUQfSQpoK+oKH9J8ZfyfgecnH3MCgRWpUiWT8xjw800LJhM3//L3VH5W
   xfLoUEXmv9jgvUScoJyF8BktBZlixaurju74mYFVI4P2ldxiqidnY9PSY
   g==;
X-CSE-ConnectionGUID: T2A/91zVS+KsH5FOFiuN/A==
X-CSE-MsgGUID: J8cimHqEReiOaN75Rxt/ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="63186269"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="63186269"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 03:52:32 -0700
X-CSE-ConnectionGUID: X8kzDrbZSSmWKMsjkooWew==
X-CSE-MsgGUID: InIDx2zRQEC8iQ5CX9WUzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="152443572"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.183])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 03:52:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 11 Jun 2025 13:52:24 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
    rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
    airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com
Subject: Re: [PATCH v4 08/10] platform/x86/intel/pmt: add register access
 helpers
In-Reply-To: <20250610211225.1085901-9-michael.j.ruhl@intel.com>
Message-ID: <8baebd44-971f-dd79-cede-1e8fd5965956@linux.intel.com>
References: <20250610211225.1085901-1-michael.j.ruhl@intel.com> <20250610211225.1085901-9-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Jun 2025, Michael J. Ruhl wrote:

> The control register is used in a read/modify/write pattern.
> The status register is used in a read/check bit pattern.
> 
> Add helpers to eliminate common code.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 58 +++++++++++------------
>  1 file changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index 99f0e85f2de6..e11865686f2a 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -63,20 +63,40 @@ struct pmt_crashlog_priv {
>  /*
>   * I/O
>   */
> -static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
> +#define SET	true
> +#define CLEAR	false

There's a risk of namespace collisions if using too generic names.

> +static void read_modify_write(struct intel_pmt_entry *entry, u32 bit, bool set)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> +	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
> +
> +	reg &= ~CRASHLOG_FLAG_TRIGGER_MASK;
> +
> +	if (set)
> +		reg |= bit;
> +	else
> +		reg &= bit;
> +
> +	writel(reg, entry->disc_table + CONTROL_OFFSET);
> +}
> +
> +static bool read_check(struct intel_pmt_entry *entry, u32 bit)

Despite being static, I'd prefer these to have prefixes. With the prefixes 
reading the calling code, it's trivial to discern it's an driver internal 
function whereas generic names likes will not convey the scope 
information.

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
> +	return read_check(entry, CRASHLOG_FLAG_TRIGGER_COMPLETE);
>  }
>  
>  static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
>  {
> -	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> -
>  	/* return current value of the crashlog disabled flag */
> -	return !!(control & CRASHLOG_FLAG_DISABLE);
> +	return read_check(entry, CRASHLOG_FLAG_DISABLE);
>  }
>  
>  static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
> @@ -97,37 +117,17 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
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
> +	read_modify_write(entry, CRASHLOG_FLAG_DISABLE, disable);
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
> +	read_modify_write(entry, CRASHLOG_FLAG_TRIGGER_CLEAR, SET);
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
> +	read_modify_write(entry, CRASHLOG_FLAG_TRIGGER_EXECUTE, SET);
>  }
>  
>  /*
> 

-- 
 i.

