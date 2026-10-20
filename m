Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792530589;
	b=gmg9JiH6y1zS3SE86OPhtocXrAep/qE9njCkxrHfJCwhJMPOo3zNu1w0quRCWZ1+WE2j
	 gcKRX66zx0vEYT0DQWm8IZ3/MS9K13dEE1meGPqoJm0zGe/OQk0tK8liCjcqBkkntbrm+
	 IDFebSt1AgQdwUBfwNc5uSWY1RO/EQYSzLh0fyEchVkU//vXJCQhf98x7OU878wPqwBO+
	 6c7et+4t5xUCiBvtmg5wjHqgkz/ZETLP6z7XjHeMXDmYsieKi8dklZ+aT+I/yJ7Gb22E7
	 umrmE+JhoUdbmLuhcOYoBUAqOO8jHmuT9rhLbSYDcafptND3CKZCSQZserHEgyD01NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530589;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=983KIpvWAiffJ4U6BD/XY30O0yCXsgt9ZctuhiJY36Q=;
	b=RiX3Hfaf95w1duxPznsCU0y8GBsBmG1ZD8C2EekIgraJyKTuTGsVzCcxmVtNJriJA5Yi
	 eOq97PwtvGIj6EppOGrHCmRxERuSkPylf0XvAXqsmPKzU7Wk5K8GtlLwdUeIfYjWSxhI4
	 X5QSKbsGLbAl2OBu2C4IHQ1clElOWehrqLipoQQE/GqQsmVIZcnUwjDIhRCVR0y5B06eV
	 BKJwQdZXKGCBblSlgktDDW9bNLoLe/EeSErA1n0fwQgG/9/tPVSenbuc4Ak0U1CY6nt/H
	 eriOpbSPF8iwVsX/SHMpdJoeGrgzt6zdm9KU0UcRaF3V4DgcAJLc8DuSdq62VrJZdgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AG3YY6Yd;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57811606A31B;
	Tue, 20 Oct 2026 21:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57811606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AG3YY6Yd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792530589; x=1824066589;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NXy3SPSyeousOUMUouNKNxcsq0MNuenwYbMH/A1px2I=;
  b=AG3YY6YdgFDUGfS2UUTWmxYtEgf+H6F/MWxKedrqB4cGeTgFVc1d+Zr+
   IEfosTWQnR0sCpCxfx6OjZ81/ZgvRZqpA+oWi2H19zehmhHeLbQ+8hRFU
   EUL23iKpwNAiYsoLqihnJBlJfiypvXgnaK5MobRnC8dcSDDprLryCoOAD
   pXSfNsKjHPzmMUGdYPhyKwjvzvCF30AjnVNBaFYqQlCyG+OT7UVpvaWGh
   ppYQcIzR16V6Xv/ybt6Jg17q7/ptsAJcnEKAjv4eXGw5jOH2fndK17Psx
   uzgF0+b+ZuaHfcVRalB+9+cdCaxt/l7C/5+3hPlkTk09D18Zkh5wuhXv7
   Q==;
X-CSE-ConnectionGUID: Jx1xuG7MSVOpBIIzcIGWeQ==
X-CSE-MsgGUID: 5Xymmr6KStKLFTR5VcFb/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1260841"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1260841"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:09:48 -0700
X-CSE-ConnectionGUID: /byT+TJFSCiXLPVw2Py0lw==
X-CSE-MsgGUID: S4zKx1lkQVSZkkBBxFQSxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3252939"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:09:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 Oct 2026 00:09:41 +0300 (EEST)
To: Marco Scardovi <scardracs@disroot.org>
cc: Hans de Goede <hansg@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/6] platform/x86: asus-armoury: add power limits
 quirk for G713QR
In-Reply-To: <20261016130342.69923-2-scardracs@disroot.org>
Message-ID: <f7c8c093-c533-3828-fbcc-ff79da86bd32@linux.intel.com>
References: <20261016130342.69923-1-scardracs@disroot.org> <20261016130342.69923-2-scardracs@disroot.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Oct 2026, Marco Scardovi wrote:

> Add a power limits quirk entry for the ASUS G713QR laptop. The limits
> are extracted from the device's ThrottleGear XML configuration.
> 
> Signed-off-by: Marco Scardovi <scardracs@disroot.org>
> ---
>  drivers/platform/x86/asus-armoury.h | 13 changes(+/-)
>  1 file changed, 13 insertions(+), 0 deletions(-)
> 
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -1130,6 +1130,19 @@
>  			.requires_fan_curve = true,
>  		},
>  	},
> +		{
> +			.matches = {
> +				DMI_MATCH(DMI_BOARD_NAME, "G713QR"),
> +			},

The indentation seems off by one tab in all these patches.

> +			.driver_data = &(struct power_data) {
> +				.ac_data = &(struct power_limits) {
> +					.ppt_pl1_spl_max = 80,
> +					.ppt_pl1_spl_min = 15,
> +					.ppt_pl2_sppt_max = 80,
> +					.ppt_pl2_sppt_min = 15,
> +				},
> +			},
> +		},
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_NAME, "GA401IHR"),
> 

-- 
 i.

