Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF818189F3F
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jan 2025 16:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737132039; cv=none; b=QLPATlfCe/dzkBgLCxBdVZMpZNbpEkJ2jpj1Rp5T7MHPuR8jO6HYROhlnb/YzxycZSukzUVwwsv5yIN4ug5MzRvKGLpXabGqMCAA6aicIAyO5QaUPkyhZDCSHL/4fj7sE+YjdCWee4SuA0O4SUVN95rInfwvnI1CqWaRidLq0dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737132039; c=relaxed/simple;
	bh=ztbtKnyQDeoMIPIKJbB3Ojsh2WuzIWB9x3OWxTuuN8Y=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JJWkqzj8/0sU5OcjEB7DJj6e+u1oHMw7M5U4xy7i2g19RgEv0BZy9vqOpQZogSWX1N1WtCglj/MwURPQ/h+l8dyLe4aH6yPQEVrCJQ7dya+SCjEHm5R8yvbt/2njxzS28knHtnHqQLWKIiPeLS+ODXN7bqgp0FiB2NqnQa7mojQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JS80yxKE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JS80yxKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737132038; x=1768668038;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ztbtKnyQDeoMIPIKJbB3Ojsh2WuzIWB9x3OWxTuuN8Y=;
  b=JS80yxKEgPi+wF8oUkVWWKjNTXk3iPJEJRcyrvRvU5VINwAJH/cBwqZ/
   16cy3vD/UVDlPlAfod7kUM1gakoPPp2eKJXlSFJf0USkZkjHU87Oi/XF9
   upFItuPbsb7K5X6K4VstmlUopvuy+IdSdRmHr4JE014Zl3+yVI8ltskdK
   81JehIj+4FElZbZTBvAn7lIE2mf3sRRCK3Y0jXjFuB4qObUCktLNmA2Zu
   FoZUIHMR81ksbTLh+tJX8VZuZxlFK+p+FcGW+h0Aex9ctRjDAnetyJmEV
   2pOxN9JPWJCA6f1lYc6agRf+ugtkAHueFCp5Xv93kV0tps983Fq5qJJ3F
   A==;
X-CSE-ConnectionGUID: eUWVEQdCSmyrbnItGeEuUw==
X-CSE-MsgGUID: mbtk2uGHSJ6moaL5diX/hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48231409"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="48231409"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 08:40:37 -0800
X-CSE-ConnectionGUID: /8zyDwXRRgiHyy/JwEY8pg==
X-CSE-MsgGUID: jNWXIUz1SgOHQn09HXoaZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="110840517"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.76])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 08:40:35 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 17 Jan 2025 18:40:31 +0200 (EET)
To: Matheus Polkorny <mpolkorny@gmail.com>
cc: ike.pan@canonical.com, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] Fix unnecessary braces warning in ideapad-laptop.c
In-Reply-To: <20250115221751.233111-1-mpolkorny@gmail.com>
Message-ID: <546c64e6-8914-11a8-7808-3de820f883a0@linux.intel.com>
References: <20250115221751.233111-1-mpolkorny@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Jan 2025, Matheus Polkorny wrote:

> Address checkpatch warning: "braces {} are not necessary
> for any arm of this statement" in ideapad-laptop.c:1858
> 
> Signed-off-by: Matheus Polkorny <mpolkorny@gmail.com>

This too is lacking the correct prefixes in the subject.

Please don't use "fix" for non-fixes such as this (in the subject).
"prefixes: Remove unnecessary braces" works as a good replacement.

Checkpatch is useful too for many things but running it over the codebase 
existing within the tree may return "issues" / "warnings" which are of 
minor importance such as this. While I can take this patch once the 
prefixes are corrected, I hope you don't end up spending most of your time 
on trivial changes such as this as in large numbers they will likely start 
to become a burden.

If checkpatch, on the other hand, finds a real logic problem or 
something that is truly misleading (e.g. misleading indentation), such 
patches would be much preferred over this kind of changes. So please don't 
take the above as "never use checkpatch for the in-tree code".

> ---
>  drivers/platform/x86/ideapad-laptop.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index e980dd18e5f6..408e7d1cfcb0 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1633,11 +1633,10 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
>  	if (WARN_ON(priv->kbd_bl.initialized))
>  		return -EEXIST;
>  
> -	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type)) {
> +	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type))
>  		priv->kbd_bl.led.max_brightness = 2;
> -	} else {
> +	else
>  		priv->kbd_bl.led.max_brightness = 1;
> -	}
>  
>  	brightness = ideapad_kbd_bl_brightness_get(priv);
>  	if (brightness < 0)
> 

-- 
 i.

