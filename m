Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43833A544D;
	Thu,  2 Apr 2026 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775124400; cv=none; b=VMgCoXfsT+96X2WhQh5bcVjsLgB8qhUQTIGdGROM5HbhUhQYEuiK5pW98Nzv0WH3PY3tjFmMwReE0Gx26Wuwin9SrRp6HahgfpEvo6YIhM+Mb5E87/EA+PAxZqs2tfzqtVGpL4NWCDGcCn/5CGD42GzoDs7JuF4RBvfSztqN+DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775124400; c=relaxed/simple;
	bh=SiMI7LRImQA5vrlzkfg8JrjdbDvFzFk+MVw41oq4XJM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=d0Z0fUfz9vstn0lEX3cmKfa4BISLOZNkzmSvEWHaszBXoaJJEYlQwOz4L2OUBcSe3uxEmtu5PQMdu28fVcgal8OZ6f0WqeKd43P1XgM9EzuasPd03U9Y0uVUCZJ0PlUWZoxveRpyoulj44nu9BHhSrXJVUhwo0sQ+DpenXxwmHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fa+JH8A7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fa+JH8A7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775124398; x=1806660398;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SiMI7LRImQA5vrlzkfg8JrjdbDvFzFk+MVw41oq4XJM=;
  b=fa+JH8A7YJ4P5wPTy/SwSYArEOjn0VCs/CHl+ZoquZNPu1aYQIBdEKpx
   Vc3MKTyyE2hBDdzF6kLg9li0kdD8gMZ+17WezCFKANdlXp7B0CacgwEIn
   g+rdrCJDkc4LIeAynxpoWcXvenhwSMhYvoR45pvvkRE/jfB4YtOsa3b+C
   h1mPl9DtnAx3QeLD0drGucHi/cdUiH1rzfxIulxW5FJRgOIS+6NURq48n
   HoxF2I7kM6PTeHJcPMIwdXsk5RxtyvbjUjq91v1hTAuusUVzGlb1rIf8T
   IgiZemiSX1Fq5+VT0H63wc0Ok8SzyaW/Q4fmUSbUr2kpXinkQsfRyz4Vl
   w==;
X-CSE-ConnectionGUID: qiOA99Q+QKKQJwATNGI5Lw==
X-CSE-MsgGUID: ODQ8NWNHS/aIQ8u/KFNwJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="87639010"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="87639010"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 03:06:37 -0700
X-CSE-ConnectionGUID: wOd5QWhmQMqS11WcYxyvGg==
X-CSE-MsgGUID: Dc23DyLRRgyt9SwoEeWHvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="231344094"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.76])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 03:06:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 2 Apr 2026 13:06:30 +0300 (EEST)
To: Rong Zhang <i@rong.moe>
cc: "Derek J . Clark" <derekjohn.clark@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
    Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] platform/x86: lenovo-wmi-helpers: Fix memory leak
 in lwmi_dev_evaluate_int()
In-Reply-To: <20260401190221.1595264-1-i@rong.moe>
Message-ID: <d1fe81a6-9814-d070-fbdf-66bd5e647a80@linux.intel.com>
References: <499fa3efd5be054ffdda77dd00ad4d8d3391e073.camel@rong.moe> <20260401190221.1595264-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 Apr 2026, Rong Zhang wrote:

> lwmi_dev_evaluate_int() leaks output.pointer when retval == NULL (found
> by sashiko.dev [1]).
> 
> Fix it by moving `ret_obj = output.pointer' outside of the `if (retval)'
> block so that it is always freed by the __free cleanup callback.
> 
> No functional change intended.
> 
> Fixes: e521d16e76cd ("platform/x86: Add lenovo-wmi-helpers")
> Cc: stable@vger.kernel.org
> Link: https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.clark%40gmail.com [1]
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/platform/x86/lenovo/wmi-helpers.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/x86/lenovo/wmi-helpers.c
> index 7379defac500..80021f59d1ef 100644
> --- a/drivers/platform/x86/lenovo/wmi-helpers.c
> +++ b/drivers/platform/x86/lenovo/wmi-helpers.c
> @@ -55,8 +55,9 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
>  	if (ACPI_FAILURE(status))
>  		return -EIO;
>  
> +	ret_obj = output.pointer;

To follow the best practice, could you please also place the variable 
declaration here as well so there's no separate ret_obj = NULL line.

> +
>  	if (retval) {
> -		ret_obj = output.pointer;
>  		if (!ret_obj)
>  			return -ENODATA;

-- 
 i.

