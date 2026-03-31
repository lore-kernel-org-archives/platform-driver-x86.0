Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7843AA4E3;
	Tue, 31 Mar 2026 10:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954520; cv=none; b=nWgCJRprgWT+kz5/HTqoRUdZjYX+ZXPpWqXmuPhWW75qaxuuUPdCopzZdCf/oexM1KpvfjFQe6v2oGRJSVABvOmWTp6plY4yGr2fXPJFK99B47uJgygX9EEUFn9TW4qZSxDlm5cZzB7/5z1h99lrTEuJ0vSkbj1pqdxFuuyEp38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954520; c=relaxed/simple;
	bh=80bEfcbCeCCC2CaHunZ0IKdWVYQAHXPHNwnjo2xxas8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUpJEazt+/VvFkh3S0S6P4jwFmxkPWT2469v1WVmuKe/Th0Rq8TREuHGtY1W4XQYUvIHc21xXThIkf2LLE62i7LKngfQ/2dVPw4CHCXUktf2IZTxaRDt9TDl+ULQIoR6fCZTH0XXffPEkkQrIkt18b+4/nUnWyoKdONm4TnOAss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0EFMKyR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0EFMKyR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774954519; x=1806490519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=80bEfcbCeCCC2CaHunZ0IKdWVYQAHXPHNwnjo2xxas8=;
  b=W0EFMKyRPXLwTL+VD9jUBxAEWJxDmQu6QrPlN4Yw96HqsCHpu7QRQcn6
   gQ7FQgmJw1AGiUjOO9kqFMjMieMgp+OQCi5HOJj9jkIay2mGS4R9ESekq
   x9lxYgs28dUSmEKT/avXz51xaHkt8tSO0t8UwrMKtRs1d0a1QLPJlDGHQ
   mEscDvjBqQdPF3BipVZyS88bdQ76dsWYjSPWw4Xz7aj/YzVtib+cfiyDu
   so4925BdOpezDtI7OAfCMt7DRuP9NYIXg710QOjzkdrzgypZP+VHwWZYr
   PlLTb0RSBd9ZXO0VECtMvSIOz8oCHjENRafMZGTO0sLWO8WGL6LXcYIl7
   w==;
X-CSE-ConnectionGUID: De4uEvwaTMOZ47lvSycTSw==
X-CSE-MsgGUID: J0HqYecMQFe3sq6i1RrL6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="93351184"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="93351184"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:55:19 -0700
X-CSE-ConnectionGUID: owOfEr0SQnydARiyahxl6Q==
X-CSE-MsgGUID: JNEX8LQkQk+e67y5dqN/Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="231155799"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:55:16 -0700
Date: Tue, 31 Mar 2026 13:55:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Marco Nenciarini <mnencia@kcore.it>,
	Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/4] platform/x86: int3472: Add support for GPIO type
 0x02 (IR flood LED)
Message-ID: <acuoEp_aH_su0q2H@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260331075204.1567624-1-mnencia@kcore.it>
 <20260331075204.1567624-5-mnencia@kcore.it>
 <bc5c4cd6-e026-41d6-ad49-aeffb949f7fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc5c4cd6-e026-41d6-ad49-aeffb949f7fb@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 31, 2026 at 12:36:28PM +0200, Hans de Goede wrote:
> On 31-Mar-26 09:52, Marco Nenciarini wrote:
> > Add support for GPIO type 0x02, which controls an IR flood LED used
> > for face authentication on some laptops (e.g. Dell Pro Max 16 Premium).
> > 
> > Without this patch, the kernel logs "GPIO type 0x02 unknown; the sensor
> > may not work" and IR sensors paired with a flood LED cannot function.
> > 
> > The flood LED is registered through the LED subsystem like the existing
> > privacy LED. Unlike the privacy LED, it does not have a lookup entry
> > since there is no consumer driver expecting it via led_get().
> > 
> > To support multiple LEDs per INT3472 device, convert the single led
> > struct member to an array with a counter.

...

> > +			ret = skl_int3472_register_led(int3472, gpio, "privacy", true);
> > +			if (ret)
> > +				err_msg = "Failed to register LED\n";
> > +

> > +			ret = skl_int3472_register_led(int3472, gpio, "ir_flood", false);
> 
> and then here instead of having 2 almost identical cases just pass con_id
> note please already use con_id here in patch 3/4 to avoid churn.
> 
> After changing that in 3/4 you only need to add a single:
> 
> +		case INT3472_GPIO_TYPE_STROBE:
> 
> here to make it also handle the strobe/ir_flood case.

We would also need to recognize need for a lookup. Either keeping
a boolean that needs to be initialised into something like
`type != INT3472_GPIO_TYPE_STROBE` or turning back to switch-case
for that in the callee:

	switch (type) {
	case _PRIVACY:
		lookup = ...
		led_add_lookup(...);
		break;
	case _STROBE: // no lookup for now
	default:
		break;
	}

given the nice and neat caller side I would move to switch-case.

-- 
With Best Regards,
Andy Shevchenko


