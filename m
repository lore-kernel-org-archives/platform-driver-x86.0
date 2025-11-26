Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9703242D5;
	Wed, 26 Nov 2025 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764157425; cv=none; b=aMP3GBwlbcg82p635nlaHlwClUsm/S2MjOFUTLAHeCfWYiIVevwNRA0JEbQJ3C6biKzl3+GDjSwkZxi8YcFz2LH6TA2heNpPX8RI9PfByG+rTDlMF4hMF3qthTopk4sHScBR0pKjO3v4Ppwb4f70XzyMiaYmgQ7NX60lSaM1dcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764157425; c=relaxed/simple;
	bh=m5OALvI1QMR/zeo454RPq7TI+EJs8f9FBD6RwvET0JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AS7pgCdY+dLIjB38JH7h05SOypjA6nAEjL1oLvJwp7Xks6KUBzWyiTxqePUbfiqID+8+x276Ukeq+Md/4wYoLHB2f7+YI5KF6NIQS3DGITIhtc9Ab4LqfOJBZaXmPwv1Bpj5+wTMlFqU6AuIZIzFitwVtirQvIPixnaGVJr/kvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WY8J9RH1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WY8J9RH1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764157423; x=1795693423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m5OALvI1QMR/zeo454RPq7TI+EJs8f9FBD6RwvET0JM=;
  b=WY8J9RH1kAQUw0SclDaqGLx9Cb+jdf2Cnr87ft9+j2UwXkWhTUEfgVjS
   0WIcEfyMsF+FD/XD3TyS4MzK1zXagkXC5ZfYexLKnXPcq9ROIXfyWxtLj
   Y7d1cl2QwtR7UTvW1X8cCoZ1MV59LdrDoYdeeMRa+USaATc5H7RJAYKkm
   qREEUekn/l4IasCAlTrR/ft0UQlkIdjaCVKJxtKoEHbQWIz+vG99+8D/c
   DOjhhuGV3jeisfFIYHbhZJvWXaFl0fGk75AjNm9+LubnoEqJEpJphPXo2
   SitBqAJnTI8nH0LDHZ/ul+x3+NaDKn18/vSBfRHgibgNE9xGhBmLet5/P
   g==;
X-CSE-ConnectionGUID: 4WFD+p6vS9enzxz6Nz8bKQ==
X-CSE-MsgGUID: SIqMAhJeTJqNubVweQkrTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="70055302"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="70055302"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 03:43:42 -0800
X-CSE-ConnectionGUID: kuseI7STShSSIl428EGbWw==
X-CSE-MsgGUID: P9jok9XKS+6b5AsroJAFNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="223638426"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 03:43:37 -0800
Date: Wed, 26 Nov 2025 13:43:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	broonie@kernel.org, alsa-devel@alsa-project.org,
	shenghao-ding@ti.com, 13916275206@139.com,
	platform-driver-x86@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, letitia.tsai@hp.com
Subject: Re: [PATCH v3 0/1] platform/x86: serial-multi-instantiate: ACPI
 example code
Message-ID: <aSbn52j-CJp9gHzM@smile.fi.intel.com>
References: <20251126081741.10588-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126081741.10588-1-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 04:17:40PM +0800, Baojun Xu wrote:
> The tas2781-hda supports multi-projects, In some projects,
> GpioInt was dropped due to no IRQ connection.

GpioInt()

> See the example code below:
> 
> But in smi_i2c_probe(), smi_spi_probe() (serial-multi-instantiate.c),
> if looking for IRQ by smi_get_irq() fails, it will return an error,
> will not add new device, and cause smi_probe to fail.

smi_probe()

> So need to add an exception case for these situations.
> BTW, this patch will take effect on both I2C and SPI devices.
> 
> Device (SPKR)
> {
>     Name (_ADR, One)
>     Name (_HID, "TXNW2781")
>     Method (_CRS, 0, NotSerialized)
>     {
>         Name (RBUF, ResourceTemplate ()
>         {
>             I2cSerialBusV2 (0x0038, ...)
>             I2cSerialBusV2 (0x0039, ...)
>             // GpioInt (Edge, ...) { 0x0000 }
>             //"GpioInt (...) {}" was commented out due to no IRQ connection.
>         })
>         Return (RBUF)
>     }
> }

And as Hans said, please fold this into the patch as part of the commit message.

-- 
With Best Regards,
Andy Shevchenko


