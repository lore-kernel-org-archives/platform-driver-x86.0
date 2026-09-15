Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20DE3B42FD;
	Tue, 15 Sep 2026 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477265; cv=none; b=UhsLhWSoHuK8T1SKUhUPJC+5Klp+p27cCIUaBFM+9d3buadyvKJGQgFjNBD63KhWPlebCpMgF5+huiVx9+2fCQtS3tXmzxvHlqi6j274m7/zG+QpF9bZ/jnCrX4YGPKJEm7iG8r9E1YI5FSIhFuY68jOuFTFFYkRTUQ3VJzO9ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477265; c=relaxed/simple;
	bh=IGByr2UJgWlPsOxcnjvNyfAWcgylAJ4qTFeS99ARqRE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=es5tRvzP7tFJUBIYp4QmtjvABeNteeENCn/Rsi1605WqeINoSM6Dsnl+5vkPGq37YPjfMalyvW2DXkn1eVToSy+7wLe8UaC/Z497ZMLp/WpqG+xN+7nXOLfAVRb2jJ987NpbvzqB5RPlepZiB4myATyVI6eaBC89yqM+JfwJeII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vgijo6d8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vgijo6d8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789477264; x=1821013264;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IGByr2UJgWlPsOxcnjvNyfAWcgylAJ4qTFeS99ARqRE=;
  b=Vgijo6d8jbvfL/iHDFVBSeBKL3ndy/QfpR5XTWoTzxB7eQP2yYw+EBvY
   NZg0hEqmsZ118smr+6drD4y/HRDBgw6XFGyNjMa26S4TtPbW/Hirg3hQO
   SW6TUowPsRfpJzB+zHM41qfzawPl36OQ09M/51RtppUgT7zJlL6K15wNL
   EheP97v9xuDiFxZg0hE8h0ZhUC2GR1pefL3/d5H6B/QkseovA30uisjn5
   4/nARcpK88mXpZtIBiGMnbdGuQXP82ALB0HNWbmkCisPrEE+EXags6tUu
   vQBArCtzmXi1QXKgQKfuZdUXRfjzdQmuByQfh8KCT2vDqjV9QZnufrGj/
   Q==;
X-CSE-ConnectionGUID: ZNSVU0OkQJyYouhmsMt/Mg==
X-CSE-MsgGUID: jYhlZ4HvQwqQCD+6g4bwcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89853469"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89853469"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:01:03 -0700
X-CSE-ConnectionGUID: IhWeyKcETJucl2mwpcJC8w==
X-CSE-MsgGUID: k4BfBQ6vRD21aX7TVZOhGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="278268819"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:01:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Sep 2026 16:00:56 +0300 (EEST)
To: Aaron Erhardt <aer@tuxedocomputers.com>
cc: wse@tuxedocomputers.com, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 4/6] platform/x86/tuxedo: Fix keyboard LED map
 ordering
In-Reply-To: <20260826081149.235487-5-aer@tuxedocomputers.com>
Message-ID: <35453b67-df97-a5a6-99a1-9746500796e9@linux.intel.com>
References: <20260826081149.235487-1-aer@tuxedocomputers.com> <20260826081149.235487-5-aer@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Aug 2026, Aaron Erhardt wrote:

> The LED mappings in sirius_16_[iso|ansii]_kbl_map did contain a
> flipped line that caused LEDs to turn on in the wrong order when
> counting up the Lamp ID.
> 
> Cc: stable@vger.kernel.org

And the Fixes tag?

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

