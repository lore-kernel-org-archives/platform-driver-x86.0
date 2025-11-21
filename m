Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3E933B963;
	Fri, 21 Nov 2025 15:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738915; cv=none; b=kSfvBacUAgXnxSGlSqCG68CCewKKhK5aqp23mLpkXzIPAEAxb5FNi3lhUGhDKDwEj7MlfbLTejqAss6aL3a8TCL3lyAT5CG+eLAvdxGj+/l3WYC13uHB9Sqf6Ix1u+0xQndDJYfWjCILDWwEwKT1HA5LpuQ4QeXaQBZd96fgfF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738915; c=relaxed/simple;
	bh=wlTr1Mki35A1MfuvhflF/1xMlioc/TuAwLWpBi2tdzg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZbjJb0azrIRLPpMEq8gaLLE4MszVib6IH78Uq+NIe4I7eCOs290bqLDnHji2/ETuhsY/KZKqJHJAnzMYwCM3hfuoKnLFgPqvZ4/Df1aMfkiGzuWDxNkHq7v6JTzMVb3QAb1bYne5Hrm+tJUvW2oK3hGC2tMuEkgluQtlJTJ+1+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EwJbubRE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EwJbubRE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763738914; x=1795274914;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wlTr1Mki35A1MfuvhflF/1xMlioc/TuAwLWpBi2tdzg=;
  b=EwJbubREqG21JzUYal+IZztb137QPpiOu98UmunKFv1f2nj8YMYylnzM
   IoL6Mn5ZNuk+x4GKH8HoJauP+CTEe2nCgmr4+uVbDiNBYdfbikCuAnL7i
   /+dj2ovJjzIVetMiAbRc896+kl7ofdrsRDaOSOJpvwqovIC7xBW/QKGxZ
   zgd8ttbmRzNyvOG0l5Q98V7TJ+8G/KhepUdQPgkzQ5zFImZJuCVaEX8GC
   04l1iaojVjr7uWZDQwDBZ3D5wuilV51aCLhCwS2Y0FUuySx54CBT8vtkF
   vlmf6hWh9H9Ya2nXM2DScVtAbWKpMxdm1ev5cHiVc7vuqhlQkR4xp9plH
   g==;
X-CSE-ConnectionGUID: IcjEZbxlR1mZVIoOKofpFQ==
X-CSE-MsgGUID: i+0fSLL6TOKB0zQoKzqWMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69699941"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="69699941"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 07:28:31 -0800
X-CSE-ConnectionGUID: bkpjD+V2SWCTQweg6qBeZg==
X-CSE-MsgGUID: +9nDnJJhT1iuOVGiUjm+Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="195884859"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 07:28:27 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 21 Nov 2025 17:28:23 +0200 (EET)
To: Denis Benato <denis.benato@linux.dev>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, 
    "Limonciello, Mario" <mario.limonciello@amd.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Alok Tiwari <alok.a.tiwari@oracle.com>, 
    Derek John Clark <derekjohn.clark@gmail.com>, 
    Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com, 
    Denis Benato <benato.denis96@gmail.com>, 
    Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] platform/x86: asus-armoury: fix mini-led mode show
In-Reply-To: <20251120024059.1341326-1-denis.benato@linux.dev>
Message-ID: <cb77645a-8779-6a91-4fc0-4c4871c643f3@linux.intel.com>
References: <20251120024059.1341326-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Nov 2025, Denis Benato wrote:

> Perform the actual check of the mini-led mode against supported modes and do not return the first one regardless of the WMI devstate.

I've taken this patch but I had to reformat the changelog. Preferrably use 
up to 72 character long lines in the changelog (though I might not nitpick 
from anything up to 75).

-- 
 i.

> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aR1xbxEQyQPEvB9o@stanley.mountain/
> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
>  drivers/platform/x86/asus-armoury.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index d6aba68515e2..c4919f3bf4b2 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -373,7 +373,8 @@ static ssize_t mini_led_mode_current_value_show(struct kobject *kobj,
>  	mode = FIELD_GET(ASUS_MINI_LED_MODE_MASK, 0);
>  
>  	for (i = 0; i < mini_led_mode_map_size; i++)
> -		return sysfs_emit(buf, "%u\n", mini_led_mode_map[i]);
> +		if (mode == mini_led_mode_map[i])
> +			return sysfs_emit(buf, "%u\n", i);
>  
>  	pr_warn("Unrecognized mini-LED mode: %u", mode);
>  	return -EINVAL;
> 

