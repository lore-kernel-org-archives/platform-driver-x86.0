Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB92535203E;
	Wed, 12 Aug 2026 06:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786515552; cv=none; b=moZzG66hycMKoG836E79N4echX4ab2LQ7luob6s95tkK3lW96bXuk6E0dVw19jHZLRCj3u3h3tGLxPVz3qmyUCjuQtO3fW7ibzdR6NfZx2fr9vES6XR6aNnu4xV0i3BBRbgy6BJ3JCdX0ZuG9y6qvbe/pGqvBxMpbo76ToNzcCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786515552; c=relaxed/simple;
	bh=ozBjwoHpsAkybW8l4CYUZ9oO8dWezdpbv+kEVigIpvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9q8AdFlRYSu1YKlhRXs1S/Wqz4vQsvgJMPwCe1/KC3keXx0vLyb0VlUrIZRGFz7aPvj1HIbBGwn3kfbYK1vZ/6r8jeTKLQszkl/rOPp59SKu3HTRZ7wlAfOWekVDMNof90xQjnAzJDY9YgoIgbwgaowPIDxgc/yK6GWXhJIADw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nna9Eby5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nna9Eby5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786515550; x=1818051550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ozBjwoHpsAkybW8l4CYUZ9oO8dWezdpbv+kEVigIpvA=;
  b=Nna9Eby57Le52jGMpYdp1sQeA8Htkm3MecXxr6IYoSjKLl5TufquKXph
   2xiSKx39iwB+TFrvKHIc7rqZRZWNFRRxSBlBOObwpxOFrMHQiRGEeolNs
   J8CaXB3F4ce8THY+LHAMVqbzp0EXYuVFnUjS9fL1wUtDtr/SZ416RhiF0
   2Mfv0FBuxjpCX8NVZwuo/6TahZ/TtoycKdpW3NYgLzFAFUYZdd1u33BQu
   gvGWqLES0pZY6LA2ml8G9YLuj8wC5pgqvH540e5z1OC0IrJIOWTTlh7z2
   DTDMLjlpRGHs0IJ4sLdl6vrQ28o7kAASyGO7G4yB1uFPtl2lb+hRGwABz
   Q==;
X-CSE-ConnectionGUID: S9c7QS1ZSVSsBcHEBq7ASw==
X-CSE-MsgGUID: 035hy0RTQ4uhnNLeHA1NOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="109847473"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="109847473"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 23:19:08 -0700
X-CSE-ConnectionGUID: G/LekmdcRfy6DA5qx3KBBg==
X-CSE-MsgGUID: +aFVOVKsR3aIvCBzpHaM9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="288275042"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.92])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 23:19:05 -0700
Date: Wed, 12 Aug 2026 09:18:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Eric Piel <eric.piel@tremplin-utc.net>,
	Hans de Goede <hansg@kernel.org>, ilpo.jarvinen@linux.intel.com,
	Zha Qipeng <qipeng.zha@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] platform/x86: intel: punit_ipc: Propagate errors
 from optional IRQ lookup
Message-ID: <anwQUfWEGK2AvsZ9@ashevche-desk.local>
References: <20260810052625.27614-1-phucduc.bui@gmail.com>
 <20260810052625.27614-2-phucduc.bui@gmail.com>
 <CAHp75VeCWatCnsWnzRe3mVM3bDCJkqJTOh8vYyY=GoFgqg18hQ@mail.gmail.com>
 <CAABR9nGwD6Qy7e-XxcamsDFZh0d=06SR=mAHNLGdVt_uEi71gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABR9nGwD6Qy7e-XxcamsDFZh0d=06SR=mAHNLGdVt_uEi71gw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Aug 11, 2026 at 10:30:53AM +0700, Bui Duc Phuc wrote:

...

> > >         irq = platform_get_irq_optional(pdev, 0);
> > >         if (irq < 0) {
> > > +               if (irq != -ENXIO)
> > > +                       return irq;
> > >                 dev_warn(&pdev->dev, "Invalid IRQ, using polling mode\n");
> >
> > I can admit that the warning message is not comprehensive, but after
> > this patch it obviously makes a regression. A previously working
> > driver for even some Linux failures (besides deferred probe) now
> > becomes unusable. Have you studied the possible error codes returned
> > by platform_get_irq_optional()? What are they? Perhaps you need to
> > improve the documentation of that API?
> 
> So I understand you'd prefer to keep the current behavior of the function,
> to make sure existing systems keep working fine?

Keeping the current behaviour. Which means that probably only deferred probe is
the error we may return.

> However, I think if this IRQs is truly meant to be optional, then any error
> other than -ENXIO should be captured and returned
> so that developers can actually investigate and fix the underlying issue.
> Silently swallowing an error and falling back to polling doesn't
> really guarantee
> the system is working correctly or safely either, does it?
> 
> That said, if you'd rather keep the current implementation as-is,
> then I think it would make more sense to switch to platform_get_irq() instead.

But then the (additional in this case) warning will be printed each time the
device is probed without proper IRQ.

> That would more accurately reflect that this driver doesn't actually
> treat the IRQ
> as optional, rather than using an "optional" lookup function while implementing
> it as if it weren't optional.

Hmm... It says it will use polling mode, to me it means that IRQ is optional.

> https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/base/platform.c#L301

-- 
With Best Regards,
Andy Shevchenko


