Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC0C516170;
	Fri, 18 Sep 2026 17:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751185; cv=none; b=hdhfGCC3/iA8wG4tPmR2MU8RZ68exSkOcr5PZvGB66glm62l+f27Df4yuYblgNv0Abop2IIq/w6cmlJGm7mYF8CHxCdyLsOVPQi8LRdlTMupq1dOcVqA6IL8eTEH+HPOsmvN7l6AwjenxHOUJ3mxMqKUBRHy0aHE3NkyyQt+LUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751185; c=relaxed/simple;
	bh=sbRujBPXUwM3OwTqhImU+UTCNJ7QH59vrVpS4p41HQk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PvVKekiTA5GGGb80IB4HAoeUEt78+sfGxSm5TyOnICigUFynwotwH6spo/uWtfT9bCHmZYjV9Iw9heUrbC3XLkcSYYkUkVlqA9+7hoACc317MlSUqeBSfnYvSUb2ZJHQGdFRaCuOIMoFu+rf+DWLp6c5LKwqhP8NL8uHAGVIuBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4uOk4ko; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4uOk4ko"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789751183; x=1821287183;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=sbRujBPXUwM3OwTqhImU+UTCNJ7QH59vrVpS4p41HQk=;
  b=D4uOk4koy1LwRxlp6VuxD0AWP3WE6Ux27vYUjdodxIf+rgUm+9ysPB4d
   CeeTJbpWjiIBliUs56Pu9N0N5CvCsxNzV4yC2KpMzHurSIeoOG/8cc/hs
   eWP4Oa/ZGVgxJ6+lgNqYDvvd3fJs86k1qFD49013c43u3lWktFs7yiCJV
   9ub9K38DGBuUHZd6RsU3TD5GJEBIQZD/pl2dpHsglQofgcBjqQ67TWZbH
   BkkU+xQtD9YmfeMz0eecS2CyOlc7i2/8uHCnLjqM5csHcidMqNPD7vsd3
   m7ffX75XdmwmWyO8WhDwlY35Q8ANCimPy0c1AeLg0VNNURt8nfexsQ+2m
   A==;
X-CSE-ConnectionGUID: xAyViGNqQN6od0THoXq8uA==
X-CSE-MsgGUID: lUww9Mz6QWWWhMQXGWzEtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90404614"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="90404614"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 10:06:22 -0700
X-CSE-ConnectionGUID: SRzsq25gTA6oTpBrHDWFUw==
X-CSE-MsgGUID: cdHTaC8yQFeEvCF0uUfYoQ==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 10:06:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 18 Sep 2026 20:06:12 +0300 (EEST)
To: Marco Scardovi <scardracs@disroot.org>
cc: corentin.chary@gmail.com, denis.benato@linux.dev, 
    Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    luke@ljones.dev, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: asus-armoury: add power limits quirk for
 G614FM
In-Reply-To: <20260828065904.11355-1-scardracs@disroot.org>
Message-ID: <2ac49a94-be85-1a2f-a43a-a376d2545a01@linux.intel.com>
References: <20260828065904.11355-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 28 Aug 2026, Marco Scardovi wrote:

> add power limits quirk entry for ASUS G614FM laptop.
> The limits are extracted from the device's ThrottleGear XML configuration.
> 
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  drivers/platform/x86/asus-armoury.h | 31 changes(+/-)
>  1 file changed, 31 insertions(+), 0 deletions(-)
> 
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -1056,6 +1056,37 @@
>  			.requires_fan_curve = true,
>  		},
>  	},
> +		{
> +			.matches = {
> +				DMI_EXACT_MATCH(DMI_BOARD_NAME, "G614FM"),

So far, this file has only used DMI_MATCH() ?

The entry seems to be in wrong place.

And indentation level is inconsistent as well.

> +			},
> +			.driver_data = &(struct power_data) {
> +				.ac_data = &(struct power_limits) {
> +					.nv_dynamic_boost_max = 15,
> +					.nv_dynamic_boost_min = 5,
> +					.nv_temp_target_max = 87,
> +					.nv_temp_target_min = 75,
> +					.ppt_pl1_spl_max = 120,
> +					.ppt_pl1_spl_min = 30,
> +					.ppt_pl2_sppt_def = 140,
> +					.ppt_pl2_sppt_max = 165,
> +					.ppt_pl2_sppt_min = 65,
> +					.ppt_pl3_fppt_def = 140,
> +					.ppt_pl3_fppt_max = 165,
> +					.ppt_pl3_fppt_min = 65,
> +				},
> +				.dc_data = &(struct power_limits) {
> +					.nv_temp_target_max = 87,
> +					.nv_temp_target_min = 75,
> +					.ppt_pl1_spl_max = 65,
> +					.ppt_pl1_spl_min = 25,
> +					.ppt_pl2_sppt_max = 65,
> +					.ppt_pl2_sppt_min = 25,
> +					.ppt_pl3_fppt_max = 75,
> +					.ppt_pl3_fppt_min = 35,
> +				},
> +		},
> +	},
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_NAME, "GA401Q"),
> 

-- 
 i.

