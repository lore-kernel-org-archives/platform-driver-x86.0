Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8A8FBF0
	for <platform-driver-x86@vger.kernel.org>; Sat, 31 May 2025 05:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748668662; cv=none; b=AWx5ou4U4WvkOcSYT/MOHN+K9brozYW9pU8zTpB7mtnyPazsq+gw80iGGxEqpTxGvT7wRdu+8T2syCUBJuRkLKPgO+ti15E1uYFljsvmKzRCbqmjNYiUDuRnKhoQvMDmZ48QDLajvnI2/R4M4p1VqicVQ/78vbdt/FR3sJq9ZtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748668662; c=relaxed/simple;
	bh=HRjAgjX9OMrZ6XyjtzmRyfPAuthhgzjW3dRGd5Xv4JI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pCt5fR4GfMZcZmPiEFDZwkw6RKl+e9oEmMUG1xeMNiZyP1F5oXX60T0abVdY4U7HoqtqI+L7SwJrIRQlMpYuxcypvFv2qFOilFXjBi2+DnJOVrcXub7FqTockdCDjxi/v6cidpmax+bNo77/OoD8fntSCagf4qEcmUvNkmjGOdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQZb4Hv/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQZb4Hv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748668661; x=1780204661;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HRjAgjX9OMrZ6XyjtzmRyfPAuthhgzjW3dRGd5Xv4JI=;
  b=BQZb4Hv/F1jAZiJU4FbvFzeidj1FgNkx5zMJ37kKJgttqrdhkac0teLc
   8kaZ7pYfHeqZqihWNDslnbKBJScqJxh9OXnYNjsxU+uAQE8NCx4nxdBma
   v1ikHx+gceoJkNc1hE1ySQdXBEJxUUrrhc5VZiF39RUsr2mJmGrKUrk5N
   gt41egafW69vWVTXnp+3kkFGQDJoVe6n0KANjCxwGlxQt7zAnwqZfTD4y
   P7xDoA/DioZCpmEvMjpV/merLgnF4ZDf5WOy/jsxrc7cBgZ4H0ujKYtM5
   DjIP0W1IP4AAJ3FNeq2Gy8roPFzlsZgDEcdUNa/jV3NlYgvjrrOSQM4pK
   g==;
X-CSE-ConnectionGUID: olKnfVk5Rb6foQTAH88ZBA==
X-CSE-MsgGUID: xlW7ewP4QqGOrR8xqIOlww==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50631042"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="50631042"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 22:17:40 -0700
X-CSE-ConnectionGUID: IPgwE5d4T2K6khq5OCrv4w==
X-CSE-MsgGUID: KfnJe80cTB+EHrTZqu8Ssg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="175058407"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 22:17:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 31 May 2025 08:17:33 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
    Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
    rodrigo.vivi@intel.com
Subject: Re: [PATCH 01/10] drm/xe: Correct BMG VSEC header sizing
In-Reply-To: <20250530203356.190234-1-michael.j.ruhl@intel.com>
Message-ID: <72b57d0f-c4e6-3515-bd46-062f159c4456@linux.intel.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Michael J. Ruhl wrote:

> The intel_vsec_header information for the crashlog feature
> is incorrect.
>
> Update the VSEC header with correct sizing and count.

Does this warrant a Fixes tag?
 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vsec.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 3e573b0b7ebd..67238fc57a4d 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -32,28 +32,18 @@ static struct intel_vsec_header bmg_telemetry = {
>  	.offset = BMG_DISCOVERY_OFFSET,
>  };
>  
> -static struct intel_vsec_header bmg_punit_crashlog = {
> -	.length = 0x10,
> +static struct intel_vsec_header bmg_crashlog = {
> +	.length = 0x18,
>  	.id = VSEC_ID_CRASHLOG,
> -	.num_entries = 1,
> -	.entry_size = 4,
> +	.num_entries = 2,
> +	.entry_size = 6,
>  	.tbir = 0,
>  	.offset = BMG_DISCOVERY_OFFSET + 0x60,
>  };
>  
> -static struct intel_vsec_header bmg_oobmsm_crashlog = {
> -	.length = 0x10,
> -	.id = VSEC_ID_CRASHLOG,
> -	.num_entries = 1,
> -	.entry_size = 4,
> -	.tbir = 0,
> -	.offset = BMG_DISCOVERY_OFFSET + 0x78,
> -};
> -
>  static struct intel_vsec_header *bmg_capabilities[] = {
>  	&bmg_telemetry,
> -	&bmg_punit_crashlog,
> -	&bmg_oobmsm_crashlog,
> +	&bmg_crashlog,

Eh, this change goes way beyond what you said in the changelog, was that 
intentional? If yes, please describe and justify all the changes (and 
consider if some of them belong to a separate patch as it sounds like 
there are two or more changes mixed up into this patch).

>  	NULL
>  };
>  
> 

-- 
 i.

