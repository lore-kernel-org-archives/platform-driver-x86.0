Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB33F33B94A;
	Thu, 15 Jan 2026 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768470613; cv=none; b=K/oOm0F/3s1koP8EeaNGW3x1ajEijhoZoNOSFJnGaEjIg7o+2UiSJjKnjJJPRhWAKgUCwaQIx29IqoHEjrSqB71eyS+vITswcSIsNUHHvzfN27SDP0fFUHdH2tYQc4lj8sq2rDYb2q8ixTsrJN/TIMmcRUsq2GfKYascu+k+JAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768470613; c=relaxed/simple;
	bh=PLmybabc8oOgIMMPz2cu7v6muPfVYZSQB3ZUj9GT3nY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=s7I6wTAj2H6XsEilQgDGAZBj75eEn+Y/omhm3w6cSpCnF4/pDKMQPRR0bvNzXrPNJxpvRTTLd5K9t3mMnn0clzAxuJ87Bp2PsKLrfW8G8EOPMQRba7nu8UOLprsLMmYgctb6GmzMJDMNwJLk4IoVNcSqGroxEmlgt8b98kq7Gcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eX84eL7+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eX84eL7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768470613; x=1800006613;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PLmybabc8oOgIMMPz2cu7v6muPfVYZSQB3ZUj9GT3nY=;
  b=eX84eL7+QM4hMwoOE9PeIy7uUrafBSE44Ew87J3Zm/txzj9/Di1lIUAy
   gnMeos453rp107litoi4VNouw+h+PPHlYuvh2t1BC/X34z1wXJQLm0253
   8AAQUtKv3Oo9rI035wIuS+riRTty1acb4SLLYECl/8xSjzr3TtltoeLnp
   XGXeQjmpi0aonzot5aT0lBiddOeb2C4h9EJN+wGarAQUJ53dF4yp53bzZ
   mFp60qLGediXTtl0OtL7bMFYfk1ApUel57LcRqL/AhwvhafepDZJWTqTG
   23G1qzM1f/nkwGsVJKgO2m+x0Z3KgO4GPw/2v62RoPMh0fXra7zcE8/CJ
   A==;
X-CSE-ConnectionGUID: L+tGoqQGRVihO/VWgkApHw==
X-CSE-MsgGUID: gNuVcmq/SGyeXINy0duTtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80885279"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="80885279"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 01:50:12 -0800
X-CSE-ConnectionGUID: EXp0czF9Q66AXWiSPisqXw==
X-CSE-MsgGUID: y/dEKkEMSy+xuCl+FMhr+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="209066493"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.248])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 01:50:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Jan 2026 11:50:05 +0200 (EET)
To: Chen Ni <nichen@iscas.ac.cn>
cc: hmh@hmh.eng.br, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    derekjohn.clark@gmail.com, Hans de Goede <hansg@kernel.org>, 
    ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Remove unneeded semicolon
In-Reply-To: <20260115081636.164041-1-nichen@iscas.ac.cn>
Message-ID: <19a1325c-692c-3d1e-2a1d-1fcf31fb1dcd@linux.intel.com>
References: <20260115081636.164041-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Jan 2026, Chen Ni wrote:

> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index a272f27e6227..6b0e4b4c485e 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -11164,7 +11164,7 @@ static bool display_damage(char *buf, int *count, char *type, unsigned int dmg_s
>  			break;
>  		default:
>  			pr_err("Unexpected value %d in switch statement\n", pos_status);
> -		};
> +		}
>  
>  		switch (panel_status) {
>  		case POS_LEFT:
> @@ -11179,7 +11179,7 @@ static bool display_damage(char *buf, int *count, char *type, unsigned int dmg_s
>  		default:
>  			*count += sysfs_emit_at(buf, *count, "Undefined\n");
>  			break;
> -		};
> +		}
>  		damage_detected = true;
>  	}
>  	return damage_detected;
> 

Thanks, I've folded this into the original change.

-- 
 i.

