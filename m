Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9FD3E6DFF;
	Wed,  1 Jul 2026 08:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895891; cv=none; b=MidNyKvW23RAmiJzrB+vndKlo2DmnMzRETsaAq8Xdvq+oLu/Bdl/hkHQe3daR9fffGad4xqTIkLfgko+MPiymm2KVWF+OhQQP2PqUJN3OQP8xKN2lY6iNy7yiYdbD6Sr55CSVpMNABXQCrue/wQFVnBnbbosgcMf7kkTDmPfplo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895891; c=relaxed/simple;
	bh=PqEqj1IFu4xX6IH2Fe4tq0cDHaLRKNeHhf8Mokc562k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=q/WiBg9AJM3qw/bfD49Tv+0O1zP+l97gYQTc2uo7t3fsWaZ9/ijF461YMpoKC6AHCqy1iJYCtUfQHf5nIxi+e4E0+THR5tikNU85tcgsqG/zsg2SqTTkPcTfmmp5r75y3vfV7rpVkKK/HdIB7099kk69tp6YICzYZHvVR1e3tC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJ8bh//R; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJ8bh//R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782895890; x=1814431890;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PqEqj1IFu4xX6IH2Fe4tq0cDHaLRKNeHhf8Mokc562k=;
  b=aJ8bh//RE+FHOP1z32r9U3dj0q5Tr61lxH1wprTAUUGatApOIL8/chTe
   sFrI6l/aqHJufUa/V4OXOHVFpNZmuIE+cvbXWRPoTK1nprPliWbQc1/z3
   63VmoaSaQv3cjJzCY7a/OO6hWQX48KlUl8WSF6Un351OGNN9rY0shS+vV
   fja+hKmF8tKcAWMsKBp6B/ffuhrd04s4rSnzyDXnliTXqRhS0fFowFz9t
   xMcf6l/Shx+Ql2O03n2yzsuP2nODaKIMsaFxU+jgPGFO3GTHk5k5huGeC
   QjBVsAc01wCGZ4baVak2fqcvEHvFdcrZ1yWiJZWTEovO17fSBN324hzAO
   A==;
X-CSE-ConnectionGUID: eak6tcMkTO2XeeeOsIrNTQ==
X-CSE-MsgGUID: KlBIS9y0R42Jd8ZC5DlGug==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87304362"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="87304362"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 01:51:30 -0700
X-CSE-ConnectionGUID: 6A0ufLUmRWK4Qj6x1XZ5og==
X-CSE-MsgGUID: igs1j9nWS3WMlOrWaNym0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="252637029"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 01:51:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 1 Jul 2026 11:51:22 +0300 (EEST)
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
cc: "Lee, Chun-Yi" <jlee@suse.com>, Armin Wolf <W_Armin@gmx.de>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: acer-wmi: reject missing gaming WMI
 results
In-Reply-To: <20260630204645.18124-1-alhouseenyousef@gmail.com>
Message-ID: <fd4ec476-874a-aaaf-9e0f-7cf000b7a5a1@linux.intel.com>
References: <20260630105033.53967-1-alhouseenyousef@gmail.com> <20260630204645.18124-1-alhouseenyousef@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Jun 2026, Yousef Alhouseen wrote:

> WMI_gaming_execute_u32_u64() returns success when firmware supplies
> no output object, leaving the caller output untouched. Gaming getters
> then inspect an uninitialized result value.
> 
> When the caller requests an output value, return -ENOMSG if firmware
> supplies no object. Preserve a NULL output pointer as the supported way
> for callers to ignore the result.
> 
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>

Should this have a Fixes tag?

> ---
> Changes in v2:
> - Preserve NULL as the supported output-ignore case.
> - Only reject a missing firmware object when output was requested.
> 
>  drivers/platform/x86/acer-wmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index e0eaaefb13d0..61ae622c93d9 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -1581,7 +1581,9 @@ static int WMI_gaming_execute_u32_u64(u32 method_id, u32 in, u64 *out)
>  		return -EIO;
>  
>  	obj = result.pointer;
> -	if (obj && out) {
> +	if (!obj && out) {
> +		ret = -ENOMSG;
> +	} else if (obj && out) {
>  		switch (obj->type) {
>  		case ACPI_TYPE_INTEGER:
>  			*out = obj->integer.value;
> 

-- 
 i.

