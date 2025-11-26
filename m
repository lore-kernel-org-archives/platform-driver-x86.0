Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1FD2DFA48;
	Wed, 26 Nov 2025 17:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764179255; cv=none; b=jh/o3AnjM/jmThpL9hmP20A2vMKnoZl3275W7oMYFjaM8GOxzFH/wJKGIyAA5UVYf+Fp2+1mkmPTZ2NEa8lQ2RDiYSFkDFPOToYAIq1sF8n+6XJ/brm3fDnbkaCJPYdQXh5v480a5u1klQoVV+xhHRAtFZMWOBJ7VnkGgqICDgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764179255; c=relaxed/simple;
	bh=CREXnS7WogomLb2RYobjD6Y/Z7X01LZZcskfhg30vMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohF3TlSMg7VAwJPySPF7BuS4m2f1/GTvvKFf/tp/aR49JANKVakm9+KjM0dt7S8Y/m5BWYSCRF8dXIngJUWYXU4FfgcoVrIzGdJS//JeiWbgQXY0e0a4gDwGMaSdWrcb65Vb0Gi7bRnBP+GxpkJGtN/7YT838xvFcJSKaOrQd/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LceMRuD7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LceMRuD7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764179253; x=1795715253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CREXnS7WogomLb2RYobjD6Y/Z7X01LZZcskfhg30vMY=;
  b=LceMRuD7o8zhwcIgzNzkxGkBz+mh6+dCa+iwPVqv01n2VmHGjx2rdL2+
   +X4jKcYwFrxHDLBYubTs5Jwjz3/LI5MJpWejltNM/ZfiM4HXkG3ZUivSC
   u5mld1nHPjqlQEeYw3RvdcvVimf3/lgkAUuVat0zP8EzXIVgJPaAEjkby
   XFqZHeYBOdWdNSxZaaEdtQM9Q10ghkL2gNsehqvtENkYZL9BW5dfrdNBs
   AUlDYC4dyDz8c0/FzBNZAJRnrKo/ivUPI5LYOTVDbofyoJa6gRp21Hh+R
   jMAd+NsTkzve1BhCdc8xeuOI54b3i2wGNkNSRAk5OatihVHV4n8RRjnp7
   Q==;
X-CSE-ConnectionGUID: NjZYZ5vST1qoikG1pUhnSg==
X-CSE-MsgGUID: lVxvo3SIQ26dtRCD0mgF9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66114361"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="66114361"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 09:47:32 -0800
X-CSE-ConnectionGUID: 3namkLD0QZCVEqJ9Nxrqfw==
X-CSE-MsgGUID: Qitg+UGHRs6gUU8YfEERcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192885691"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 09:47:29 -0800
Date: Wed, 26 Nov 2025 19:47:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	broonie@kernel.org, alsa-devel@alsa-project.org,
	shenghao-ding@ti.com, 13916275206@139.com,
	platform-driver-x86@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, letitia.tsai@hp.com
Subject: Re: [PATCH v5] platform/x86: serial-multi-instantiate: Add
 IRQ_RESOURCE_OPT for IRQ missing projects
Message-ID: <aSc9L6KXG6oQubwF@smile.fi.intel.com>
References: <20251126141434.11110-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126141434.11110-1-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 10:14:33PM +0800, Baojun Xu wrote:
> The tas2781-hda supports multi-projects. In some projects, GpioInt() was
> dropped due to no IRQ connection. See the example code below:
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
> 
> But in smi_i2c_probe(), smi_spi_probe() (serial-multi-instantiate.c), if
> looking for IRQ by smi_get_irq() fails, it will return an error, will not add
> new device, and cause smi_probe() to fail:
> 
> [    2.356546] Serial bus multi instantiate pseudo device driver TXNW2781:00:
> error -ENXIO: IRQ index 0 not found
> [    2.356561] Serial bus multi instantiate pseudo device driver TXNW2781:00:
> error -ENXIO: Error requesting irq at index 0
> 
> So, we need to add an exception case for these situations. BTW, this patch
> will take effect on both I2C and SPI devices.

Thanks, excellent!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


