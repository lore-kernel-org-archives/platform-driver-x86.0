Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096649;
	b=1LS4vkRAFJ85KEgoyxkpxbX9s1JdKCXiFGN/rLgk7gkhO3h57glWEs66Ds2d5CQEnsny
	 CQ1WI1tzyxElRlkRKIoMDSx9SoSnrR6CPzm86yIfzKeEpra3tZWQx+zo842QcMJjOTcxh
	 LfbISDh87CdjVDI2LJ9bpxjP86UB7fgJ7IswWLxvBtSVNWlyDkgSPDuoAOl1HW/9ciIrT
	 deFSW330cjSbJO9F8j+9JtutQi82q3w6kqA2y/Mh7Imn6pZYnQaCxS5EhTT3f/jyX1rCe
	 vqhymV1eWvWI0vQJ6ysD6EPFkZ2qFeuLJUA4r1k7oEeilISGGBehZgG23ACYhJ/yMIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096649;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=Np3BFME4m2pMG9jXgvX5SD91SmxHIYSOZUi9HWaNTjc=;
	b=cVf+aWSfeRiVlPRBn0Wg7L834kvToDT4bO7vClMEeqwAEyng7LDRZzoXel1oqHn5Bt1B
	 rgwh3MOSB2ksYIV57N7zCisbmIIaak6m+rdJEyKizGXrc5aqO6ALS9VKggvTpy/dREEKV
	 j30H/FAADSvS5erVnJ3aW1qH87GKXkscS79IGeoiNclEPbKDyLSeO6tbN7PG7Ybh3dTGE
	 2zXhObcVVmWvCfoxE+0ZoH34no2zcdsf6b7m6Piw3bFTGMC57c+SJ14962i51EBce1q41
	 iWVL8mUWDl69jnaxxyUjxw8HfiOzjjyYY5glNuIIb+dtiNyPrstuK3Ctijc+h4Q3zfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MKsSkXpC;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA98606A31A;
	Tue, 27 Oct 2026 10:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FA98606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MKsSkXpC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793096649; x=1824632649;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NyttjD8YuQkTpUUN1sw7oU7a/3gMrQpBOQaht3notjQ=;
  b=MKsSkXpCQPOxNztqsssndbGi732mnTuvydKPA5y1IbaVkfELd7woNOHj
   DfC0kOkVkQ8grOuU46TXVBa7I4v+04dLVQsK3yi43yko9YwlRWMlRNbon
   LU4Q906US/VP3zf9xO8tc6LIpqsZM3DZcTRAUQTNu5LwnEVaUsijT4SXd
   pXcQuBketBHkGsXCiPXWAD97OazN44Gbr4dvd13o/i2uTnFkeJwfMCki1
   fVLnHPKQwEWrN6+kQiAxSivyip2bYdUPwgqgcA/fCghsGBJUSbQ7yKdMt
   6HFm/7jSJ+HZMySuDzoWV029bB8zdB2O5ovwLIvpGdoyglUa/2MiCgN0u
   Q==;
X-CSE-ConnectionGUID: QeW/viLNRrOvoJgOoRFBAw==
X-CSE-MsgGUID: KzXGwR1cQXerYRH9x0xrsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1676334"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1676334"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:24:09 -0700
X-CSE-ConnectionGUID: 1+bnK/JDQXGVR+AjvqNQTQ==
X-CSE-MsgGUID: mfj3CRttQ9uljZqz7ogDpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4590568"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:24:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 27 Oct 2026 12:23:58 +0200 (EET)
To: Mingyou Chen <qby140326@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, 
    Ilya Gladyshev <ilya.gladyshev@linux.dev>, KentoNion <kento@kekto.ru>, 
    platform-driver-x86@vger.kernel.org, ted eric <ericted8810@gmail.com>, 
    Armin Wolf <W_Armin@gmx.de>, LKML <linux-kernel@vger.kernel.org>, 
    Chris Taraszka <chris@miget.com>, 
    Matias Civadda <matias.civadda2342001@gmail.com>, 
    =?ISO-2022-JP?Q?=1B$B9b=1B=28J_=1B$B=3DSJ8=1B=28J?= <btx342@gmail.com>, 
    powerfullz <wleizc7319@gmail.com>, 
    =?GB2312?B?y+8g0/7D+g==?= <wolf109909@outlook.com>, 
    =?ISO-8859-15?Q?Milo=A8_Vlku?= <vlku.milos.fun@gmail.com>, 
    Rsplwe <i@rsplwe.com>, Bozhen Peng <bozhenpeng93@gmail.com>, 
    Anton Karasev <uselessfire@gmail.com>, Jame Jao <jaojame6@gmail.com>, 
    Serhiy Shliapuhin <shlyapugin@gmail.com>
Subject: Re: [PATCH v14 4/6] platform/x86: redmi-wmi: Drop redmi-wmi driver
In-Reply-To: <20261026102101.224568-5-qby140326@gmail.com>
Message-ID: <43db32ea-e8db-fcc3-fbe1-545f8c5fa33a@linux.intel.com>
References: <20261026102101.224568-1-qby140326@gmail.com> <20261026102101.224568-5-qby140326@gmail.com>
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

On Mon, 26 Oct 2026, Mingyou Chen wrote:

> The redmi-wmi driver is no longer needed because its functionality
> has been superseded by the new generic bitland platform driver.
> All supported Redmi laptop models are now handled properly via the
> updated WMI interfaces in bitland-mifs-wmi.
> 
> Remove the obsolete code, Kconfig entries, and Makefile references
> to clean up the platform directory.
> 
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
>  MAINTAINERS                      |   6 --
>  drivers/platform/x86/Kconfig     |  15 +--
>  drivers/platform/x86/Makefile    |   1 -
>  drivers/platform/x86/redmi-wmi.c | 154 -------------------------------
>  4 files changed, 8 insertions(+), 168 deletions(-)
>  delete mode 100644 drivers/platform/x86/redmi-wmi.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 250c471e674d..8ca065eb448f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23038,12 +23038,6 @@ S:	Maintained
>  T:	git https://github.com/pkshih/rtw.git
>  F:	drivers/net/wireless/realtek/rtw89/
>  
> -REDMIBOOK WMI DRIVERS
> -M:	Gladyshev Ilya <foxido@foxido.dev>
> -L:	platform-driver-x86@vger.kernel.org
> -S:	Maintained
> -F:	drivers/platform/x86/redmi-wmi.c
> -
>  BITLAND LAPTOP DRIVER
>  M:	Mingyou Chen <qby140326@gmail.com>
>  M:	Ilya Gladyshev <ilya.gladyshev@linux.dev>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 7ee9ff3879c9..6e561359a91b 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -79,16 +79,17 @@ config XIAOMI_WMI
>  	  be called xiaomi-wmi.
>  
>  config REDMI_WMI
> -	tristate "Redmibook WMI key driver"
> +	tristate "Redmibook WMI key driver (DEPRECATED)"
>  	depends on ACPI_WMI
> +	depends on HWMON
>  	depends on INPUT
> -	select INPUT_SPARSEKMAP
> +	depends on LEDS_CLASS
> +	depends on POWER_SUPPLY
> +	select BITLAND_MIFS_WMI
> +	default BITLAND_MIFS_WMI
>  	help
> -	  Say Y here if you want support for WMI-based hotkey events on
> -	  Xiaomi Redmibook devices.
> -
> -	  To compile this driver as a module, choose M here: the module will
> -	  be called redmi-wmi.
> +	  This option is deprecated and will be removed in a future release.
> +	  Please enable CONFIG_BITLAND_MIFS_WMI directly.

Hi,

I think what you should do instead is use default REDMI_WMI if REDMI_WMI 
on BITLAND side. Though I'm not sure if that's any different from plain 
default REDMI_WMI.

(I'm not always sure of things when it comes to Kconfig, so I don't know 
if it matters to avoid what is effectively default n when REDMI_WMI=n 
with the more complex clause or not, so played safe.)

Since this is only a transitional config symbol, you should drop the help 
text so it isn't user selectable anymore.

-- 
 i.
