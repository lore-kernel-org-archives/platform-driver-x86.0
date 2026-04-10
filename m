Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90725313272;
	Fri, 10 Apr 2026 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839256; cv=none; b=LZ6FZ3FVfxi7jvuPqkDKxpXnGjXRZyRrbLRSM26ZRKaYeZDR07RHF09U+ObqlwXDbmOnICuupxdK5+/IhULJOIl/svxcdJt01rh3ag5Ggi/c633HcgUGap6wYc01jrJhtN+v2svtH91VlpuikkC6bAJknjNNF+Q9M1aY3EUo1p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839256; c=relaxed/simple;
	bh=ba9DkVGtoIsLSgcFS4HrqOVn8sAkT7jR2lUHxvmt78k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sXy8ztBKfRnu0jSkb80TGmmRRuenX2KXy+3Ymol8EgZJL9RAxtB6iraT4PyKShhIeDUk+gqV0e1N9EC3AGDkI+o5/mhw6/0jJMk6gejGN50blNSUoyp/RLwz+2eK9VbrMs7PwO4iE1q7dlPSIllc6M/T8otEpMj1uDJUswgf4+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cKy8x7Ds; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cKy8x7Ds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775839256; x=1807375256;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ba9DkVGtoIsLSgcFS4HrqOVn8sAkT7jR2lUHxvmt78k=;
  b=cKy8x7DsyaJxuvb2Ya0edFr2N+s4txez4FqsbMpizW8kcK0GjFrpNTTl
   aCHvywlIvWq42Vita2ZKZ3kgEAsAfD35A6A3nHJaQIt8cl/PtFFC6gu7V
   Gw4xxxIzmkACk0/w8WGoDfzJi+TQtSEuD2VmsEBKL28vZNno+Jo2ZLAER
   6zUpi+nUMLHkaUBI8J4aCJ/uadB8Xqg71gwtiIRTwm7qa3x2WOU4/FPOc
   VubRxW2sQXj/wRzWB/+EGazxEMJRuDaIWie85hvhfdOcPfZ5Bp8SeUH87
   B1dNVjdAT/4ZMQr4VHHiYXQNPNF5qQDkc67pgXcKDUGNVApeC8PF/6Wbt
   A==;
X-CSE-ConnectionGUID: b/lZ0CvpTc6H+rkqSE+teA==
X-CSE-MsgGUID: ZLdLqz1kSOSh04Jvf1sBMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="79448924"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="79448924"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 09:40:55 -0700
X-CSE-ConnectionGUID: jzasJjc6S6OxmJJjyjCU3A==
X-CSE-MsgGUID: wkxALPQzRnyzwaiLQNascg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="228115036"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.118])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 09:40:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 Apr 2026 19:40:45 +0300 (EEST)
To: Josh Snyder <josh@code406.com>
cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: hp-bioscfg: fix heap buffer overflow in
 security buffer
In-Reply-To: <20260402-hp-bioscfg-overflow-v1-1-6985f8c9e67c@code406.com>
Message-ID: <928a6f5c-6f94-5661-d95c-03e310abf7bb@linux.intel.com>
References: <20260402-hp-bioscfg-overflow-v1-1-6985f8c9e67c@code406.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 2 Apr 2026, Josh Snyder wrote:

> hp_calculate_security_buffer() returns sizeof(u16) * 2 (4 bytes) for
> empty strings via an early return. However, hp_populate_security_buffer()
> always prepends UTF_PREFIX ("<utf-16/>") to non-BEAM authentication
> strings, including empty ones, before converting to UTF-16. This results
> in 20 bytes being written into a 4-byte region of the heap buffer
> allocated in hp_set_attribute().
> 
> The 16-byte overrun corrupts adjacent heap memory. In practice, the
> firmware's own bounds checking rejects the undersized buffer before
> acting on it (returning error 0x04), which masked the overflow.
> 
> Fix by removing the early return for empty strings. The calculation at
> the end of the function already accounts for UTF_PREFIX correctly when
> authlen is zero: sizeof(u16) + 0 + strlen("<utf-16/>") * sizeof(u16)
> = 20 bytes, matching what hp_populate_security_buffer() writes. The
> NULL check is preserved since hp_populate_security_buffer() would

What NULL check this refers to??? For which of the inputs?

> dereference NULL via strstarts().

This entire description is confusing and seems to also contradict with 
itself in multiple places.

> Fixes: b2715aa2e1352 ("platform/x86: hp-bioscfg: spmobj-attributes")
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Josh Snyder <josh@code406.com>
> ---
>  drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
> index 2b00a14792e92..93e0a077e4240 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
> @@ -47,9 +47,6 @@ size_t hp_calculate_security_buffer(const char *authentication)
>  		return sizeof(u16) * 2;
>  
>  	authlen = strlen(authentication);
> -	if (!authlen)
> -		return sizeof(u16) * 2;
> -
>  	size = sizeof(u16) + authlen * sizeof(u16);
>  	if (!strstarts(authentication, BEAM_PREFIX))
>  		size += strlen(UTF_PREFIX) * sizeof(u16);
> 
> ---
> base-commit: cc13002a9f984d37906e9476f3e532a8cdd126f5
> change-id: 20260402-hp-bioscfg-overflow-d58dbe53ecf5
> 
> Best regards,
> --  
> Josh
> 

-- 
 i.

