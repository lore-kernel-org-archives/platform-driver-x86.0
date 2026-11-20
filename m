Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185544;
	b=Gm5Fb+A6u53o4kW+oZ8csLKbg0SCKLHSB8xP8XOMMT0cFUmzuoYJtQkHO2HUxtEC21X2
	 tuIJFMCVcocAQgpYGRnFTtzm6/gimXVrbBW1aN7wlVEBam+NNkfdMQ/6Vr0rKw+OaMRfY
	 ZpH0AQV+CVh1WsyZCuPL2jufwWK1TGvwCoKpDnrOMVWjqK6ZAHNTRm42BYHHflP0TcKZO
	 r7LnWZDDXr+i36X8CFgMFS333DSo26F49s48vXZhetAKItBjYEaXj5kLnERNUuG8WZQA5
	 QxLdUrODdnOugUFTaJGzINwVxaTVc4fC7u+P9dOwD2t4KpJbFuGVwEDJcEX2gEIda+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185544;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=17LJ33bx0URngkm04W634BFUoP2hVNtL/9I5Gmqqe/A=;
	b=oyB4gJdjh1Ew5emLZPjNsxt0YGoSXWjcNLHEjEJgtnQ95TuO20NhlU5Vd6cADPc8W0ao
	 97AlNrQerUS7ykTs0PZ5f1KPaAK7rkuV5RzV4bo53H8bo+JWKrEStnh2neLj9vw/xLcFh
	 /68jSP4Yq7IK/ccaUhggeEbGV7Mgnqoqw0i6Os9hMfPbGkq0SuHSToc5rAso7PyUDtAB7
	 rws0wnpHZuo4txwE4TGQ7DaZ2ZQkMbyzHVIY90hf1He5fZNRJ1RtI+k7MkiCoiFG+l43R
	 loQyktL1QCloJsjCAlPRR219DwoyklI79Iz8E3VYnWlhqVdH2bGXQ+mynxRWK7tYoFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZmLsw7kA;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E640606A325
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 14:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E640606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZmLsw7kA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795185543; x=1826721543;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PwN4pJFkIv4ay6R0Jq0r5N8mlwgTxVcgjlWlpaNH10w=;
  b=ZmLsw7kAzKoQgsGSGciCjZ7bHDnmyfzaQ22HbcmSko/ZrIoRn6T9F6E6
   Pn/kosNDyggX9M5jB6jf2swkg7TqO7NszZIyW+G4VY2eilp0i7ohBFQ3g
   W7cSCcqYRe/Il7gdJqRcf74HLZtUp9hgxi5dX1ESBGZbdJIPQD6R4uHZX
   Hgb0KK31PHSyXgxaXkhs0Fd5RyhL49z/X3SHU+1bZANxZp8ZK0gC3eeno
   JGDkJfE05eIrgXBrtGv8zKj1/FYfWavvGHHPXXsYnGKQ+eQYI/Ru+jHZr
   RjaDa0xZ+F+A2x26bQmw68Wss/woPOGpCia7ZrExCz5CYQQnGTUorex3L
   Q==;
X-CSE-ConnectionGUID: saa4/E5tRzyf4JjRtAtqlA==
X-CSE-MsgGUID: LUIPhGfGSf2XGymGM5S3TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3953726"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3953726"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 06:39:03 -0800
X-CSE-ConnectionGUID: /Q2fVdyJQ8W5fVUdwdHGMQ==
X-CSE-MsgGUID: GqxPPw3aSvmCetoKnZfoIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="12423935"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 06:39:01 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 20 Nov 2026 16:38:57 +0200 (EET)
To: Thorsten Blum <blum@kernel.org>
cc: Hans de Goede <hansg@kernel.org>, Seth Forshee <sforshee@kernel.org>, 
    Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: apple-gmux: Fix max_brightness limit check
 in gmux_probe()
In-Reply-To: <20261120142914.825047-2-blum@kernel.org>
Message-ID: <9fa07231-6bb4-86d5-451f-f5a18d33d967@linux.intel.com>
References: <20261120142914.825047-2-blum@kernel.org>
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

On Fri, 20 Nov 2026, Thorsten Blum wrote:

> gmux_read32() returns a u32, but the maximum brightness is stored in the
> signed ->max_brightness field. Large values can thus become negative and
> bypass the GMUX_MAX_BRIGHTNESS check.
> 
> Cast props.max_brightness to u32 for the check so that these values also
> trigger the warning and are capped at GMUX_MAX_BRIGHTNESS.
> 
> Fixes: 917ee75a5916 ("platform/x86: Add driver for Apple gmux device")
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
> Found by code inspection; not reproduced on hardware.
> 
>  drivers/platform/x86/apple-gmux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index 9c728ac4e045..4d3a6d2393f7 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -881,7 +881,7 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
>  		 * brightness at this value, but print a warning if the hardware
>  		 * reports something higher so that it can be fixed.
>  		 */
> -		if (WARN_ON(props.max_brightness > GMUX_MAX_BRIGHTNESS))
> +		if (WARN_ON((u32)props.max_brightness > GMUX_MAX_BRIGHTNESS))

???

This looks very wrong way to fix the problem (using int as proxy to 
carry it until it's bounds checked).

And why is it using WARN_ON()? Is it an indication of programming error 
that gmux_read32() returns a too large value??

-- 
 i.

