Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524944968F0;
	Mon,  5 Oct 2026 14:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791209225; cv=none; b=i2DGJH/9FkFcUwKRwtZS8MruCw0rL8XoeAxVyjfRQPyyr6ZtRYB6DJ4cjziewubwFn4Y2VjrmKc92siM01QOn51orI57wY/Vm1vVniNMEvltEbUVkBzlIwmBfo6XmsN4ncPTBc5YZwh1AaUQpW3P68K7KUxbB5oTD81rovv/hwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791209225; c=relaxed/simple;
	bh=K0C7ZRKkYc5oZdVRs/GKc0PcrqSunya3jpm+B/s738A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AgCtIZToCPJpWmmROLnKjeZ1trHTbpeIV3rRoy2Mzwkl+mxO3DhKTllhFb+A7eyQqjk4IhL8+Zk2ZkBHX7PDJ3Zeyzp4LMJOWcciX28c3qCJVs4ZWSphMOhhnnk3D/ESL4rBSat8A4dpLnwhgP8Q64frhRGwN2gtiWtn5hVOPns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODx0X0Wd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODx0X0Wd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791209223; x=1822745223;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=K0C7ZRKkYc5oZdVRs/GKc0PcrqSunya3jpm+B/s738A=;
  b=ODx0X0WdaA06D6MFnWeBIukY2F49/IRcniZMryPY+wsggNBtRkXWxrmA
   uvV8sav3pSmifP5KR6g6k6b0UewO1TWv1tncd4QFzN6yu3WZgQWdRvRQS
   p4MuYEV16P2tDXv9nJVZZukOo3GTDFsLKQxaqYf0X8v5J8MVS4ecInvm1
   01uU6Xuv5/JAiZi0dm4/AcTAFBuS6gtyLcx1xdEvHSZQIb34yKXtnpebn
   wUN0kijx0UKgnW3sb8hapafgO0XvfPRWDYa9U9TvsYzd8BORdHMNKxduq
   MGEAm1/UR0ikFjIasJqQjBJSD89kmG9WGrMSk0Zdet8eqfNvSEXnTy8j5
   Q==;
X-CSE-ConnectionGUID: N5rKgR2IStO2uAhwU4w92g==
X-CSE-MsgGUID: eySDoEL8TRepIKEVMZ8XoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="108258378"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="108258378"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 07:07:02 -0700
X-CSE-ConnectionGUID: vJIhLKHiQUegmUG9SptLAQ==
X-CSE-MsgGUID: k1YgWq2ASWeeSeSx6XJYfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="275471331"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 07:07:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 5 Oct 2026 17:06:57 +0300 (EEST)
To: Aaron Erhardt <aer@tuxedocomputers.com>
cc: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 4/6] platform/x86/tuxedo: Fix keyboard LED map
 ordering
In-Reply-To: <20260928085448.9024-5-aer@tuxedocomputers.com>
Message-ID: <c6592aba-a3af-f012-361f-52e29b070459@linux.intel.com>
References: <20260928085448.9024-1-aer@tuxedocomputers.com> <20260928085448.9024-5-aer@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Sep 2026, Aaron Erhardt wrote:

> The LED mappings in sirius_16_[iso|ansii]_kbl_map did contain a
> flipped line that caused LEDs to turn on in the wrong order when
> counting up the Lamp ID.
> 
> Fixes: cfd84b3f419b

Please see Documentation/process/submitting-patches.rst how to format 
the Fixes tag properly.

You seem to also have not carried over Werner's Reviewed-by tags to a new 
version. Whenever you're submitting a new version of the series, collect 
the tags given to the previous version. (Only if you've done very major
changes to the patches, it may be warranted to not include tags given 
earlier.)

Generally, maintainer tools will only pick tags for the current version of 
the series (err'ing to the side of caution) which is why submitters are 
expected to do that when a new version gets posted.

> Cc: stable@vger.kernel.org
> Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
> ---
>  drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> index 8f1ffca0430d..2b985b030197 100644
> --- a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> +++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> @@ -232,8 +232,8 @@ static const struct tux_kbl_map_entry_t sirius_16_ansii_kbl_map[] = {
>  	{ 0x2e, { 246000,  67500, 5250 } },
>  	{ 0x2a, { 269500,  67500, 5250 } },
>  	{ 0x53, { 294500,  67500, 5250 } },
> -	{ 0x55, { 311200,  67500, 5250 } },
> -	{ 0x54, { 327900,  67500, 5250 } },
> +	{ 0x54, { 311200,  67500, 5250 } },
> +	{ 0x55, { 327900,  67500, 5250 } },
>  	{ 0x56, { 344600,  67500, 5250 } },
>  	{ 0x2b, {  31000,  85500, 5500 } },
>  	{ 0x14, {  51500,  85500, 5500 } },
> @@ -337,8 +337,8 @@ static const struct tux_kbl_map_entry_t sirius_16_iso_kbl_map[] = {
>  	{ 0x2e, { 246000,  67500, 5250 } },
>  	{ 0x2a, { 269500,  67500, 5250 } },
>  	{ 0x53, { 294500,  67500, 5250 } },
> -	{ 0x55, { 311200,  67500, 5250 } },
> -	{ 0x54, { 327900,  67500, 5250 } },
> +	{ 0x54, { 311200,  67500, 5250 } },
> +	{ 0x55, { 327900,  67500, 5250 } },
>  	{ 0x56, { 344600,  67500, 5250 } },
>  	{ 0x2b, {  31000,  85500, 5500 } },
>  	{ 0x14, {  51500,  85500, 5500 } },
> 

-- 
 i.

