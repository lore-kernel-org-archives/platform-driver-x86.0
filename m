Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EA230CD85
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 11:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941834; cv=none; b=em4kRjITSY+GFy36Ypnc0+F1Mmo1VSEFjOcrae8Yjq8bsZK0dFi2n9f66M4TGiGX7Fw6TRXlXAbghKMkIti+6l1Ga7h7i73zjdhTxqKL2i9NkhaUfM8BW0wey8uCAoJbz6TFpQ8juWAwErixuNYGLs04uF3kDD3YHIOrjrn+/ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941834; c=relaxed/simple;
	bh=EHvu/VfxKGepO+Qh+Vi73tMZ89uJq96/m92F9qzdHmw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OgOByd7hwKqWVcUrHnsnF8qZNKNid3iucUGuxHYGFlYEGCh0DWM/dmHcgZbSctmW8kdSj22T6TCxDsweyaLG43yU+agZ7qgQJarZmTy9cPGqZdyK4hKElkkkeU5Ip9ofUgN3BnMG8fdAhiiZE82bFvttIGqCx0beA0zyC1N7iqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DqewrlRS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DqewrlRS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783941832; x=1815477832;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EHvu/VfxKGepO+Qh+Vi73tMZ89uJq96/m92F9qzdHmw=;
  b=DqewrlRSsH0hyAcweT8ztdb+z5MvlMAReQa0r2aIRuibGK6nPKza/Jmu
   9BDLk3AQffFsRCgUXBveLV15a6/R7Z4HnJyhGxukxwP1vqp5JETcvvwLX
   JNqFhNOCSM6m/ltCEIYqqeE/TO8Qtqeu3tQTqOoQz337cVAElx8a50pcH
   u0T7fFs/SW0OXnUPlmf4eXsw8+f1WEAoEd5gYBuOtLo1Wz4q8iVLllaUy
   Uvzono/NQ93jQFPeyHBINjtiLsLdBqXy/4qdThlWTDVC6xQKeYFOJG09A
   MLCJZyVT4uLK5E8QLr38s8TkZEwtuldh2lsSeF6szEkjoHRYAQq2WKCva
   Q==;
X-CSE-ConnectionGUID: uHt3JB5/TMacVV7kTzs0dw==
X-CSE-MsgGUID: TiOkHOpWSY6DwQ0PHlZ8/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83525358"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83525358"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 04:23:52 -0700
X-CSE-ConnectionGUID: Bap8J398THeym1tVe+5T4w==
X-CSE-MsgGUID: Sge1hEn7SIOhsuRDjHOHdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251104350"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.129])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 04:23:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 Jul 2026 14:23:46 +0300 (EEST)
To: yahia <yahia.a.abdrabou@gmail.com>
cc: platform-driver-x86@vger.kernel.org, sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hp-wmi: fix potential integer underflow
In-Reply-To: <20260712191130.41183-3-yahia.a.abdrabou@gmail.com>
Message-ID: <2c2be85b-62e0-8431-9cc5-1cdc48c1c149@linux.intel.com>
References: <20260712191130.41183-1-yahia.a.abdrabou@gmail.com> <20260712191130.41183-3-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 12 Jul 2026, yahia wrote:

> From: yahia ahmed <yahia.a.abdrabou@gmail.com>
> 
> hp_wmi_query_perform() currently calculates the output size of the
> returned buffer by subtracting the size of bios_return from the length
> sent, However if a malicious bios or a new bios not yet tracked or
> handled sends a length smaller than the size of bios_return, the
> calculation will underflow, then the result will be casted to a signed
> integer, as such the min() function will fail to set the size properly
> leading to a huge number to be passed to memcpy.
> 
> Fix this by adding a check to ensure if the length returned by the bios
> is larger than bios_return.
> 
> Reported-by: sashiko-bot@kernel.org
> Link: https://sashiko.dev/#/patchset/20260706143855.35002-1-yahia.a.abdrabou%40gmail.com
> Fixes: d35c9a029a73 ("platform/x86: hp-wmi: Don't log a warning on HPWMI_RET_UNKNOWN_COMMAND errors")
> Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index c924fbb5503f..3235ade2fa98 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -634,6 +634,10 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  	if (!outsize)
>  		return ret;
>  
> +	if (obj->buffer.length < sizeof(*bios_return)) {

This driver is using a deprecated WMI API.

The new WMI API may be able to do size checks for you so you don't need 
to add them to the driver side.

> +		pr_warn("Bios returned invalid data");
> +		return -EINVAL;
> +	}
>  	actual_outsize = min(outsize, (int)(obj->buffer.length - sizeof(*bios_return)));
>  	memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), actual_outsize);
>  	memset(buffer + actual_outsize, 0, outsize - actual_outsize);
> 

-- 
 i.

