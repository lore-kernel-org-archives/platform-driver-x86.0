Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01B9258CCC;
	Wed, 27 May 2026 09:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779874933; cv=none; b=A/vliHi8UPN4CAPYmwVsZAQcJoW4jKoMmknHMrg+wr4ygQKbZJau++9rh0p/3jacE/ndmqx0Ah2RRY5ZcYe2sZRDncT2EqQ1fJy1sPbtuoIv4vBljKPdu4U8nXFAP/CkR6QWZ+nlC06MPN0lpl5u5tMNGKJjJLIP2mTrCTtGgL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779874933; c=relaxed/simple;
	bh=23TRn9/g+05L3zYwvuJSOU2QkKWZemlW6MbMJlcsVdY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mV6Cnt+r6ml3jupR3VdfIgqnKWtGSK1bUwejSW0odMOjErVIuu851BEm8ErZZSPnzh+s07jHmVbKR1Rr4pUJoFFbw5ufsk2W3fH/sno9BNz3wak2Aw9E/8oml4pkpv7UDamquWHPNHHBWMYGrpAVVpg0veWuTtSF0MgAG90nA+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQ3k42EE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQ3k42EE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779874932; x=1811410932;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=23TRn9/g+05L3zYwvuJSOU2QkKWZemlW6MbMJlcsVdY=;
  b=lQ3k42EEIM9Gv20UA+59Dt/8/13w3fhr4dqUaCwcSCfUD0c/R53O+1Rv
   /gg1giOw9UPhaaNq8SIFWA0ZxSDqwnutrfH/zY+Rel/YOXw7fW2+nf+7D
   Tab9zB/xnpaAXzI+G3PlHFsTAS4uXhxClLdTtgavnvr0WvjA8YBT1pH1i
   X206N/+GssYUtsX6oxyoudp2vf5W4x8REo7nyWixnzfjShmiCmLYu2WRS
   oX7KdouM22R2ZVbMz/xXncPMz365a+qIYojrlMKZt/iO/SbB1FCaPYusG
   RurSYaJmwvcxsAB4Mcm0PvRED7yAs/sG30nFfsyenmYmkVmzAZj+M7erE
   Q==;
X-CSE-ConnectionGUID: 2OKEfg8lSAyob38qVcADug==
X-CSE-MsgGUID: EJ/9GcO9S/a29TWr4jk8jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="92087551"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="92087551"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 02:42:11 -0700
X-CSE-ConnectionGUID: 84ph6qltRq+TScwif5VJww==
X-CSE-MsgGUID: o3l6Abr7SzuRqt+4xXFedw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="242351833"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.51])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 02:42:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 27 May 2026 12:42:05 +0300 (EEST)
To: Luis de Carlos <reskoldo73@gmail.com>
cc: teackot@gmail.com, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: msi-ec.c: Add support for MSI Pulse GL66
 12UEK (12th Gen)
In-Reply-To: <20260527084905.17964-1-reskoldo73@gmail.com>
Message-ID: <a8e3c0d0-9be3-466b-5605-81988f5ffd6e@linux.intel.com>
References: <20260527084905.17964-1-reskoldo73@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 May 2026, Luis de Carlos wrote:

Hi,

Thanks for your submission.

Please don't put ".c" into shortlog (in Subject) prefixes.

You need to also add a changelog here even if the change is simple. The 
changelog text should be readable on it's own (without any reference to 
shortlog). Thus, for simple patches changelog largely duplicating the 
information that is in shortlog but should be written fully compliant to 
English rules (and may be more verbose if needed).

> Signed-off-by: Luis de Carlos <reskoldo73@gmail.com>
> ---
>  drivers/platform/x86/msi-ec.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
> index f19504dbf164..1ce7963a207e 100644
> --- a/drivers/platform/x86/msi-ec.c
> +++ b/drivers/platform/x86/msi-ec.c
> @@ -823,6 +823,7 @@ static struct msi_ec_conf CONF9 __initdata = {
>  
>  static const char * const ALLOWED_FW_10[] __initconst = {
>  	"1582EMS1.107", // GF66 11UC
> +	"1583EMS1.109", // Pulse GL66 12UEK 
>  	NULL
>  };
>  
> 

-- 
 i.

