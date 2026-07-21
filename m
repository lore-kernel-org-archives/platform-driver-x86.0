Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064FA4071E3;
	Tue, 21 Jul 2026 17:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784654926; cv=none; b=QMsKJKd//+QdRPO0q41eLb9pNedpj1emtofC0nqVGanNgOPTa76BeUNpXv0ghRsWKx/MybszCFLGRj1Hr1Jy3PJDPTE8fsJdR8kp9KULgzlouJOnRibrLr4l5wsyRDijkc33w+XSgXdKRTYXTELsw0JTFHPY/pSDyyKL3ino+kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784654926; c=relaxed/simple;
	bh=i6Og7V6Z+Qj4iLmLXoTNJTdjOFaWk1xk5IzRX+rdDNs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cXZ6bFpeGR8n1STxiS5YVF9E524p15YlYptfCsrfthenUXHRr7p0ui/0FM9IeFeuwCUW1Fj5MxIdzAjgl7iZ6HC190d0xacUuAHC25kkZaaovC8QbAIJbZVVUYGIBQxi0ZrJMy4sCcglKO1jbswMD37qsIGRuTh6/6uGw1Dp5pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2caWF5M; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2caWF5M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784654925; x=1816190925;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=i6Og7V6Z+Qj4iLmLXoTNJTdjOFaWk1xk5IzRX+rdDNs=;
  b=b2caWF5MrVcobepDoBAyUNZDa2OU5epnVbvgdLIGQ2EMguwRVSJhYQbc
   eKyY6iS0yFFhU3623/vnSpl4ntaP+X63JqeLiugYBgf2avxQbmlSn0GXS
   f70O+avdnF1l0Z9iJgNQ7I17rkL/fORhHHMGzT2b1d5ABTjTXErAQ0qeG
   cQ7VTsr4KCbkVdnSsKrzx9PtOQ4vSUkfClK4Y3JqX51xWWMKvcA6B6Mwj
   +58ZBVA4EIKQkms1aG2pZrXznorbSqXc1tmLJUcxqXYOHMWqQ/FgpaSRP
   Ru0toHriP4+jSGOAlbWJth+l4r3PAdIlSg39vXEeKwLyMnt4q9h31gIKe
   g==;
X-CSE-ConnectionGUID: gbv6f1d4QpW4e0iU40IGFg==
X-CSE-MsgGUID: UbruG0mlQgeZ05FtoEWsgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="89158565"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="89158565"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:28:44 -0700
X-CSE-ConnectionGUID: icITKkdrT0GNvqX0LtTBDg==
X-CSE-MsgGUID: B2KP/kOLT1avAwGQywvkKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="251492561"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:28:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jul 2026 20:28:38 +0300 (EEST)
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, 
    Krishna Chomal <krishna.chomal108@gmail.com>, 
    "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: hp-wmi: handle positive BIOS error codes
In-Reply-To: <20260630105234.54638-1-alhouseenyousef@gmail.com>
Message-ID: <24f5be9c-3773-4833-cbad-630a444cc5d4@linux.intel.com>
References: <20260630105234.54638-1-alhouseenyousef@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Jun 2026, Yousef Alhouseen wrote:

> hp_wmi_perform_query() returns firmware BIOS error codes as positive
> values.  The Victus-S profile callers only reject negative errors, then
> consume output fields that are not filled for a positive firmware error.

On which hw you see this? Please add the info.

> Treat every nonzero result from victus_s_gpu_thermal_profile_get()
> as a failed query before using its outputs.
> 
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 8ba286ed8721..50c5a1e152dd 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -1825,7 +1825,7 @@ static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
>  					       &current_ppab_state,
>  					       &current_dstate,
>  					       &current_gpu_slowdown_temp);
> -	if (ret < 0) {
> +	if (ret) {
>  		pr_warn("GPU modes not updated, unable to get slowdown temp\n");
>  		return ret;
>  	}
> @@ -1907,7 +1907,7 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
>  						       &current_ppab_state,
>  						       &current_dstate,
>  						       &current_gpu_slowdown_temp);
> -		if (ret < 0)
> +		if (ret)
>  			return ret;
>  		if (current_ctgp_state == 0 && current_ppab_state == 0)
>  			*profile = PLATFORM_PROFILE_LOW_POWER;
> 

-- 
 i.

