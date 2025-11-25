Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D96E269B1C;
	Tue, 25 Nov 2025 09:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764062728; cv=none; b=F8XZB1w4nyrKa2YIUR/6ga5ccub/VvoKInhcC/AwgaSM0gInts/aMM+98QO5EzFAGv4lAQgsyi520RTx+FB6GVAH4p+6lnKffQLXFYNZJFH9MFIk41dgTcK4fvPftaap4CNgJtl5RNXflOD1ShE1duh5oXR8F/Gl3/hod3PmAfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764062728; c=relaxed/simple;
	bh=BRYCfMuko/R34zT/a9L2atMQs+A1s5joIFdIQ6YLQwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeVCmgFhCSqU9525Dhq7Rn1nYdjoAzX61Q7XYKB+qek5+8jesDKZ3nglQakFk7YJkVRxZ1yPR1tLNwYX4nBlB7smscj31F2CtIHHI6jms7GYPG1gtO9TkAjz8xopklzZolynWcU3oizRUwsLrSI1LGhzbr5TDj/FcSO6O+cbiEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZkBvJJS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZkBvJJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764062727; x=1795598727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BRYCfMuko/R34zT/a9L2atMQs+A1s5joIFdIQ6YLQwc=;
  b=AZkBvJJS/b0thc1GFvulTdFQ8gByEu59/PB1EIO3J39uYo0xNWR/Puii
   r9c9AL5U9uWGi/GZj0aCiZ+twDvLLRqiiQu4dZ03euD4uR8h6/krddJCK
   /0kCYHurtWaaKFZOxZmpUXcSvma6GW9UjXcpVpvmPeOj3X4M/w33AiIPF
   eBPU54wliRQsVD9M2OEI5xz8DC2/nawdOAG8F9vzngfjaOaBECK0+B/AH
   QbHLVIVHZNl4m3KcpLIGteWJsr9mWHfnlvJtGgmehqUNt1zcJZonY8Kbu
   +iIzA1sdwiA5o8WXSwFPGw8XGX1SAsqRsurM6duMgOiia5lajCC62+IJ+
   A==;
X-CSE-ConnectionGUID: GDrmRRW5SDe6t98U40SEyA==
X-CSE-MsgGUID: q7wF7TKpR+aSAY1PVUrmlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="76399914"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="76399914"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 01:25:17 -0800
X-CSE-ConnectionGUID: 0M4z7QX/S/eKdeyMedQYNw==
X-CSE-MsgGUID: SEBCABU9RLmMdowxH6fdGg==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.152])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 01:25:14 -0800
Date: Tue, 25 Nov 2025 11:25:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	broonie@kernel.org, alsa-devel@alsa-project.org,
	shenghao-ding@ti.com, 13916275206@139.com,
	platform-driver-x86@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, letitia.tsai@hp.com
Subject: Re: [PATCH v2] platform/x86: serial-multi-instantiate:
 IRQ_RESOURCE_AUTO should be compatible with IRQ_RESOURCE_NONE
Message-ID: <aSV190mwCKZ6WOoA@smile.fi.intel.com>
References: <20251125084436.8381-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125084436.8381-1-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 25, 2025 at 04:44:36PM +0800, Baojun Xu wrote:
> The tas2781-hda supports multi-projects, in some projects,
> no irq is required, so the IRQ_RESOURCE_AUTO should be compatible
> with IRQ_RESOURCE_NONE.

TL;DR: NAK.

It will relax the conditions for the devices where IRQ is required.
Probably you need to consider DMI quirks or so.

Also you failed to provide the ACPI DSDT excerpts to show the real use case.
And what the board is that that uses polling mode?

You can also consider this approach (as a compromise between two:

#define IRQ_RESOURCE_OPTIONAL	BIT(2)
...
	switch (inst->flags & IRQ_RESOURCE_TYPE) {
	case IRQ_RESOURCE_AUTO:
		...
		if (inst->flags & IRQ_RESOURCE_OPTIONAL)
			ret = 0;
	break;
	...
	}
...
		{ "tas2781-hda", IRQ_RESOURCE_AUTO | IRQ_RESOURCE_OPTIONAL, 0 },


-- 
With Best Regards,
Andy Shevchenko


