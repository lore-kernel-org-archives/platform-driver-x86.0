Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826947;
	b=dHyHl+F/8Eomf5AgKAcpTeFIafRj6z742phTToDTa2N+PwKNn61q+EAv6Uq83TuuFJRO
	 bl71+o3fonhmQVZwDh6I8JwdqK9HDKoWmo7vZx+ShYDQVfElvJ69tXpFXDcVrTfiuKWPW
	 FlpbLdbi0UzSoErKdgMPacmNCji5k8hLmhkJvJ19tvuWxKtd05O1PtXLBvU5n1tkZWVYf
	 04qFYV6f6+LIkTqo22LRlHfdFDjr1n6oHzlfWpl0iwUWVGouMGpfB2NC4Fy6pDv0w5MjZ
	 obYYA6kaXbMoBHRyexRKa+EUEbxHK7g8Xl0US0zJz81Otu1c3c0m1nWt4dHpgJrUb+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826947;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=fbslNd3drHHXdMZ3SmMIJ91FrgxUIwHvL4BXMdGp/Uo=;
	b=pTuxsTOql5cb+s4oYmIbHFfZp2XG1QHQEUdIxew11XTryyC2tvPjdLMKexeC+ZKZOeTe
	 30ET5s24fxZzS/PKtSBGavVwEH2yt7WDPmbGjQOmbzq0L7+gn5CrW2a2huOxmqbSTwAxG
	 dVOuMAB5nLR1Isp6P4nDqzSYmcF+JYDwzSlv5AaPGoPjZMtVeoKUWArMTz8fqTB5y1r+y
	 E/mpriaMsA3kfERUjxiLTDrrEKOiOYdSrC7nM3RCGp8A/uyvv47Yl0VQU7+NafGMCGzJb
	 KY0bnePFYNc6hdi7I9jLID60W0g7DvvJ6f0hC2iu0Br4UxzoGpfhfaFUnUCLZCnCAyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jZOKdi7K;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC58606A323;
	Mon, 16 Nov 2026 11:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC58606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jZOKdi7K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794826947; x=1826362947;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BgQGjvsGetNCeWTgsXLX+2aStyhCeaIaL32CbGMUq5I=;
  b=jZOKdi7KgAJTmZuROUqUURbD5lwCREp2DY9qPfj+8RjVRQyrVDI2Q2Nq
   Cex8reBXpdpyRN6u1WIlqtzDlYtylhhO7gD5Cqd4/uuV30A4ztcQZsnND
   EPvlCYu1FoiroYCbz04/JGBaYqAaPFYfR8WoKt6W0YQGd1bL0V5/Y3SS2
   82wsGGF39uAS40QGH1k7o4I1kFfGz5w8uTk/oKM5910PXy5lYeSxncdqJ
   QthqMO2/p99hptD+XsaB3Iel7d1S9PGpiR1awjrlXHq89VoCsrH4cGbd3
   N9qwCF03IXTQfyeaiyfYlzrl5243LrYM3uAWLKEJDF+b7KNoRjF/7+Wmr
   g==;
X-CSE-ConnectionGUID: ULCfbSXmRYOSsr9WHh6sGw==
X-CSE-MsgGUID: BFC+J1TaQmGjegbVdLkEXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3412272"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3412272"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:02:24 -0800
X-CSE-ConnectionGUID: x18G0ssNTZi+O4LeiyCT1Q==
X-CSE-MsgGUID: LrhFTd4iQnu1GyhO+DCyYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9709628"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:02:21 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 16 Nov 2026 13:02:18 +0200 (EET)
To: lirongqing <lirongqing@baidu.com>
cc: Hans de Goede <hansg@kernel.org>, 
    Kristen Carlson Accardi <kristen.c.accardi@intel.com>, 
    Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
    Tero Kristo <tero.kristo@linux.intel.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86/intel/tpmi: Clean up CPU mappings on
 offline
In-Reply-To: <20261114142914.2595-1-lirongqing@baidu.com>
Message-ID: <d5f8b43f-5d42-62bc-b233-9645a3708472@linux.intel.com>
References: <20261114142914.2595-1-lirongqing@baidu.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 14 Nov 2026, lirongqing wrote:

> From: Li RongQing <lirongqing@baidu.com>
> 
> The driver adds each online CPU to tpmi_cpu_hash and to its power domain
> mask. Neither entry is removed when the CPU goes offline, so the next
> online transition calls hash_add() on an hlist node that is still
> linked, corrupting the hash list.
> 
> Register an offline callback that removes the hash entry and clears the
> CPU from its power domain mask.
> 
> The TPMI feature does not depend on CPU online/offline and can update the
> MMIO area while a CPU is offline. There is currently no consumer that
> reads the mapping data of an offlined CPU; if such a use case appears,
> retaining the offline mapping can be added on top.
> 
> Fixes: 17ca2780458c ("platform/x86/intel: TPMI domain id and CPU mapping")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
> Changes in v2:
> 
> - Add Acked-by from Srinivas Pandruvada
> - Rename the title
> - Add a new line after guard()
> 
>  drivers/platform/x86/intel/tpmi_power_domains.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c b/drivers/platform/x86/intel/tpmi_power_domains.c
> index ebe052c..457abac 100644
> --- a/drivers/platform/x86/intel/tpmi_power_domains.c
> +++ b/drivers/platform/x86/intel/tpmi_power_domains.c
> @@ -220,6 +220,24 @@ static int tpmi_cpu_online(unsigned int cpu)
>  	return 0;
>  }
>  
> +static int tpmi_cpu_offline(unsigned int cpu)
> +{
> +	struct tpmi_cpu_info *info = &per_cpu(tpmi_cpu_info, cpu);
> +	int index;
> +
> +	if (hlist_unhashed(&info->hnode) || !tpmi_domain_is_valid(info))
> +		return 0;
> +
> +	index = info->pkg_id * MAX_POWER_DOMAINS + info->punit_domain_id;

Hi,

I've taken this patch into the review-ilpo-next branch.

...But could you make another patch on top of it which adds a helper for 
this index calculation (from the tpmi_cpu_info struct, the one in 
tpmi_get_linux_die_id() seems to not have it so it can be left as is).
It seems to be repeated a few times and is quite long, online func even 
calculates it twice.

-- 
 i.

> +
> +	guard(mutex)(&tpmi_lock);
> +
> +	cpumask_clear_cpu(cpu, &tpmi_power_domain_mask[index]);
> +	hash_del(&info->hnode);
> +
> +	return 0;
> +}
> +
>  static int __init tpmi_init(void)
>  {
>  	const struct x86_cpu_id *id;
> @@ -249,7 +267,7 @@ static int __init tpmi_init(void)
>  
>  	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>  				"platform/x86/tpmi_power_domains:online",
> -				tpmi_cpu_online, NULL);
> +				tpmi_cpu_online, tpmi_cpu_offline);
>  	if (ret < 0)
>  		goto free_domain_map;
>  
> 

-- 
 i.

