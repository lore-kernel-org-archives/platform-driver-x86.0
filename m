Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6BC430B94;
	Mon,  2 Mar 2026 11:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449845; cv=none; b=TugKzMUSdAGZXNtY2q2kyKttTATZmb/ejEvCFhy2gqnyGCMWCjRO/iHP9UBYBhBQKPDUr+pPKfQgkK1wajl6xmIsFOAj7V51KBKOTjkuhOG/wT8P2thBlPE+COd5LkjibrjhGdKsrAor/FLAOGjnRn2CkxsQPP44yt5nrKzxAKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449845; c=relaxed/simple;
	bh=9rpzBFkLq43CW6z63B2PR+fVkTd4uRH2OklE6u+Nwps=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lQ1cHOW/xRYu4E2PPfp/9n5kTM2Ckn+Ls6NmyaKBfEKH0ZdbSXHIAE68KITrdMyXSKfIGehlyRKg3/a3b2TYYvD1Vz2WuiWh4xefQNsIdcXNoRRvCPK5MXNVzwj4R1SgcqP8ccN1SJ2m+fmgumCdYqlocJu8wu2q4EzX8WYMRBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSfDCIDh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSfDCIDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772449844; x=1803985844;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9rpzBFkLq43CW6z63B2PR+fVkTd4uRH2OklE6u+Nwps=;
  b=DSfDCIDhzGeg81flHbro8OYp866JSVK9ElU96aCtC4ytQSxn5Xp4AhC0
   Xd4BiOOYpq5Pir7lDdDm0tpu1hbiUcWFfnrxHK2eAO0Tt9ZVlF9JUUZi5
   RWYsht4hzxM1h+j3w9n03e3R6Qa4N0JGlUWZ213RJip/n5jDlNpM167O2
   EJv77lzMLBSno54AXZY5ptblvaKoiBuZpVy67XBgsEFbG3UpYmwj122L1
   jHXLfwyCUkOh76A5WARvrGEMjRH0FPNfDDS2tbiigPCOTFeBoE2IdQ85J
   EB7k7S6xcoTQZwhJQDMh4SMYQ/yMozwrVxf9fC8nXZJ+BI4xQsMaXGJPu
   A==;
X-CSE-ConnectionGUID: kSHb/sRkRjmHVLby+adjfg==
X-CSE-MsgGUID: ATz/5TTRRuWfza1csLYDxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73356088"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="73356088"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 03:10:44 -0800
X-CSE-ConnectionGUID: qky5wcxqShWnPo7PmWiPGw==
X-CSE-MsgGUID: wgMFxtCzQcaYXeVZGZrTOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="214850685"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 03:10:41 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 2 Mar 2026 13:10:37 +0200 (EET)
To: Edip Hazuri <edip@medip.dev>
cc: Hans de Goede <hansg@kernel.org>, kuba@kernel.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] platform/x86: hp-wmi: Add missing LED Kconfig
 dependencies
In-Reply-To: <20260228122143.119571-4-edip@medip.dev>
Message-ID: <aff14f68-0bdf-ce5b-6d04-03198e3390ab@linux.intel.com>
References: <20260228122143.119571-2-edip@medip.dev> <20260228122143.119571-4-edip@medip.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 28 Feb 2026, edip@medip.dev wrote:

> From: Edip Hazuri <edip@medip.dev>
> 
> Add depends on LEDS_CLASS and LEDS_CLASS_MULTICOLOR for the
> multicolor keyboard backlight support.
> 
> Signed-off-by: Edip Hazuri <edip@medip.dev>
> ---
>  drivers/platform/x86/hp/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/Kconfig
> index dd51491b9bcd..02668ebc3020 100644
> --- a/drivers/platform/x86/hp/Kconfig
> +++ b/drivers/platform/x86/hp/Kconfig
> @@ -40,6 +40,8 @@ config HP_WMI
>  	depends on ACPI_EC
>  	depends on ACPI_WMI
>  	depends on INPUT
> +	depends on LEDS_CLASS
> +	depends on LEDS_CLASS_MULTICOLOR
>  	depends on RFKILL || RFKILL = n
>  	select POWER_SUPPLY
>  	select INPUT_SPARSEKMAP

Doesn't this lead to a build failure if only 1/2 is applied but 2/2 is not 
(which can happen e.g. during git bisect)? It's never acceptable to cause 
a build failure if only a part of the series is applied.

-- 
 i.

