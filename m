Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100961;
	b=eNYeZr6hU3CJ+muEk0FjoV5K+bpH++46WQludJEqWTDROtGiURJpVgwok6Y3buuRFt/G
	 W6/OfRfPzLd+r+rB49Mj11n3dxamCRneB52Ovr2fjlsBqdz7BwB5eYqiixZkh8o2lS/0f
	 Et/A+ibFBneE7DUS4Ra9gkR4d4xH1bUNk5l4Ie5knTzVnXRRjsgnVHaxiRpJXRDaTq30U
	 AFPwG+MplWoERhefvD57CXT78j29Jt/t+FUm0jEulFiQGESDQiXGPOqMqBGwmThgYPSvu
	 NQBrNWcsA0iBoNtfUlTMLb6vh/z2i6XZqM0i3dvaK9KCdjiWI1mCroxgShJOFmNUeeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100961;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=rpa94wK+0QmN+L81RInTUhKXDRdv7h0+R2KOxAcie74=;
	b=VcCD/Mj+4arg5ZsQ3j6+VslqfZr8DOZGk0EAfaAeCjZQeC+FNX4CZYcpgGvzxhIl8Gue
	 zylDZQCo5DVoculVv2Tl5/rpJNdw7jHl539HDILIb++Q2VaLKDeT4kX0EQkk6WhlnrBNb
	 9py0zyV6tqU3zkNPMTrtVKMkti46wfBbxvPmUai2H0oe7iKmZLOiG1PbRD4lb6zyyvzbv
	 RRyg51AYm0p6MHI1eQ+PCb8fpTtCNzd8LL+lMT/G2SHusGr1kNcHzXyffg2VHlzto3OVk
	 axm6TD0xk2xm1KsP2sovjsroN6qI6C4nzki6gBbRgJ3IhCPf60YDHnUU7rs2SG8OqRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C9XaL9PT;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42257606A324;
	Thu, 19 Nov 2026 15:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42257606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C9XaL9PT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795100961; x=1826636961;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jJ5Dnu7wtCgAsgA0TVMzs5S7E0Bj/BCfRZZyRrd1Uyg=;
  b=C9XaL9PTqn0wkgnpeV9/XUtWu47FO9qnXQoHVy7LS8lVmEzXXPWXxJ1F
   9iOoiapjmOMBcm3xlfdvXSEM3dKxEx5dBOKX3LQBbIJdVi8z6mcxC+KWH
   1QoMnj1+6f8usW93mKLju9Dm4HSqyqh3JES3jleoGnL6M3LVWELUlRgKu
   O+FJPyJBf3yAguZzY7D+UURgG4fzko+Ulb59QZZi43ATo910mE7Iycny3
   iFD5uQ2zTpc0VXfdA4RwAD+5oyV1M9PByvd8rxdu1+3pMy3nAd3qh3qCi
   DoBk5Q9A7japWccL5boNo8wbN06VPzPsCHAaLslRH5RPmqTkJ2bHouPT2
   g==;
X-CSE-ConnectionGUID: AKhf+Ma0QIeqPrW88WMTMQ==
X-CSE-MsgGUID: rXRFTR/WQWWZwBtYdr8lsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3959725"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3959725"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:09:20 -0800
X-CSE-ConnectionGUID: 9+OXTWjBRmG2fsflHIeUqA==
X-CSE-MsgGUID: c/1iAF3kSgyUU7qV5/N/2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10797425"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:09:18 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 19 Nov 2026 17:09:14 +0200 (EET)
To: Aaron Erhardt <aer@tuxedocomputers.com>
cc: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/tuxedo: Handle LampUpdateFlags in
 LampRangeUpdateReport
In-Reply-To: <20261029-nb04-fixes-v1-1-614da83bd60f@tuxedocomputers.com>
Message-ID: <dd592477-6f29-6d13-20b4-1c92d804866b@linux.intel.com>
References: <20261029-nb04-fixes-v1-1-614da83bd60f@tuxedocomputers.com>
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

On Thu, 29 Oct 2026, Aaron Erhardt wrote:

> According to HID Usage Tables v1.7 "Lighting And Illumination Page", the
> LampUpdateComplete flag marks an update report as the last of a batch. A
> device must apply all prior changes at once when it receives a report
> with this flag set.
> 
> The handler for LampMultiUpdateReport already honors LampUpdateFlags,
> but the handler for LampRangeUpdateReport did not. It always set
> LampUpdateComplete on the final chunk, so every range update flushed the
> internal color state regardless of what the host requested. This reduced
> efficiency and caused unwanted intermediate states for software that
> batches updates using the flag.
> 
> While splitting the update into several LampMultiUpdateReports, forward
> the flags from the range report on the final chunk. Intermediate chunks
> continue to carry no flags.
> 
> Fixes: cfd84b3f419b ("platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
> ---
> Tested userspace software:
> - OpenRGB (aac7e55114)
> - lampctl (https://github.com/tuxedo-aer/lampctl 5da2aff)
> ---
>  drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> index 3e5ba524fe58..300af12e5f8a 100644
> --- a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> +++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> @@ -724,7 +724,7 @@ static int handle_lamp_range_update_report(struct hid_device *hdev,
>  		lamp_multi_update_report.lamp_update_flags =
>  			i + LAMP_MULTI_UPDATE_REPORT_LAMP_COUNT_MAX >=
>  			rep->lamp_id_end + 1 ?
> -				LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE : 0;
> +				rep->lamp_update_flags : 0;

Fits to previous line.

-- 
 i.

