Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039031;
	b=BolUxvDIUkobp6NfbqFVCh6KjYB0oRyTuRiUUBQ66JQ2yr+lJbMMdZg3sg6dRDPZs8Oi
	 +zu3X6FcaOK6Vuhxn78OKOTOjXUEsWx7+HYtELsdMeINSKlpknrww/9m1keDasOWpo1yi
	 hvRZdN023s2s3OhUy3eCO9KfzVRWjYMW97561X5hRl1HcVkZxpfC74AwzkAnEDpmvf3Uk
	 fojriJb5DEVSy71llpAKv4aANbpfBepTyj7NXg3du/OiU7Yln6d7cUTSyY0c/jY5NN9kY
	 cLDEYOy0MTeL0WVkw2v9K9OQ53vMbwjXN1F6hZZqMazpklp5Min+YSvWDQ8l3aLEQlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039031;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=u5BcdrHYOd/i+en6NqXAm0wQveaKiSDAAtt+2cj/lvE=;
	b=lYAQKoC/vi+7Sku2AoOpePHq9ByWeWvooZuEVqENPsFliCMQAJHJpte4kTtNx9tH+IZn
	 JYSjO1hBY5wuBQKczwhPP8PUbCuwfTkKm4XcNmo1kZ0gF3oqH9vNzj7y2LHu2c3QgJYbZ
	 BmO+eXgqSXSeOIh6ZGBBIGzfJ9KWiWIW049d4qYXheKr8gV0H34Zv5kLGcFVI7pwCz/3o
	 kFka5av2opIAgpwUC/1gTa35p/rtDC/9MzpPnIWkp09Sw0cLZY3tsvZZPP2tT1pglOoF+
	 Osetof02dwCkWw3iiRhdWitO9oyHTHMegvVmcoFGEhLR9i4kc+nQVq4IKuVj1TzjPJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jzMr5pte;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69621606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 18:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69621606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jzMr5pte
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793039031; x=1824575031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NzoD18srXcYNRTVGH00flkqvaTGPhFmmiM+65xgUbuo=;
  b=jzMr5pteyAZZTThG0QqR2lNm+tZf4zQmX+S7fRcIfEhGr1kXapfDG0d9
   eId89uVVJSs+IMOS9ifEtuegOsp2buAhCooI577zIofktkVmZJmlAjMoa
   SHQUjqzqu++eIhlzO46rh5qMWKhsSp31nnIk79MsatFJPszmsPx2h6b2M
   T8lZ5df3tOVwyS9H0WTxHc1M/6rkcwnQFMsIg0gXEdylNszLDB3gmVzG+
   L6+/HjpI+6JFTDSBlNVEnkgZorVV2Pdclw6uCwc1uEU0dDJfKyY1dONIc
   JDlh0NIFrvPg9wNIwsZMZwAscvBBp0VYYuf7YyzoboafUoR+DTbpE6+VF
   A==;
X-CSE-ConnectionGUID: Mqe/zWaqROSGKe/wYsQ1dg==
X-CSE-MsgGUID: QMRmEc3rTUCtNlZnEh4a6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1600612"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1600612"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 11:23:50 -0700
X-CSE-ConnectionGUID: UiblGlbPQFubmRY9vA1VbA==
X-CSE-MsgGUID: XnkshNkJRO6IeUjMOmQ65Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4719588"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 11:23:48 -0700
Date: Mon, 26 Oct 2026 20:23:46 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Chris Simpson <chris@nilk.net>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>,
	Hans de Goede <hansg@kernel.org>, janussss@163.com,
	luzmaximilian@gmail.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] surface: aggregator: propagate -EPROBE_DEFER from
 ssam_irq_setup()
Message-ID: <at-asiHmTW4F8ZkP@ashevche-desk.local>
References: <7d51f80e-9552-957f-f32c-1d608042b647@linux.intel.com>
 <d0bb21cc-6d3c-4526-8204-2511da51a6ac@nilk.net>
 <2faa9857-9d55-a607-bd46-588598b64ca4@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2faa9857-9d55-a607-bd46-588598b64ca4@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 26, 2026 at 12:42:01PM +0200, Ilpo Järvinen wrote:
> On Fri, 23 Oct 2026, Chris Simpson wrote:

> > Same failure here on a Surface Pro 9 (Tiger Lake, INTC1055 driven by
> > pinctrl_tigerlake as a module): whenever surface_aggregator is loaded from
> > the initramfs about 30 ms after /init, before udev has bound the GPIO
> > controller, probe ends with
> > 
> >   surface_serial_hub serial0-0: error -EINVAL: failed to setup IRQ
> > 
> > and is never retried, so Type Cover, battery and tablet-mode switch are
> > gone until a manual rebind. linux-surface has several reports of this
> > since v6.12 (linux-surface/linux-surface#2219, #1645, #2064, #2039), and
> > it is a regression from b27622f13172 ("platform/surface: Add OF support"),
> > which used to propagate the gpiod_get() error.
> > 
> > Janus, are you planning a v2? If not, below is a variant that follows
> > Ilpo's comment by using gpiod_get_optional(): only "no GPIO described"
> > falls back to fwnode_irq_get(), every other error including
> > -EPROBE_DEFER is passed on. I'm happy to send it properly (Fixes:
> > b27622f13172, Cc: stable, your patch credited), or to test your v2 on
> > the Pro 9 instead, whichever you prefer.
> > 
> > I've tested it on the Pro 9 (Fedora 43, 7.2.12 with the linux-surface
> > patches), with surface_aggregator forced into the initramfs. Unpatched,
> > the probe fails with the -EINVAL above and the Type Cover, battery and
> > tablet-mode switch are missing. Patched, the probe defers three times
> > and completes about 0.2 s later, with all of them present and the
> > device no longer listed in devices_deferred. Suspend/resume behaves as
> > on an unpatched kernel. The analysis and the diff were produced with an
> > AI coding assistant (Claude Code), and reviewed and tested by me.
> > 
> > Chris Simpson
> > 
> > --- a/drivers/platform/surface/aggregator/controller.c
> > +++ b/drivers/platform/surface/aggregator/controller.c
> > @@ -2753,12 +2753,20 @@
> >  	 */
> >  	const int irqf = IRQF_ONESHOT | IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN;
> >  
> > -	gpiod = gpiod_get(dev, "ssam_wakeup-int", GPIOD_ASIS);
> > -	if (IS_ERR(gpiod)) {
> > -		irq = fwnode_irq_get(dev_fwnode(dev), 0);
> > -	} else {
> > +	/*
> > +	 * Only fall back to the fwnode IRQ if no wakeup GPIO is described
> > +	 * at all. Any other error, in particular -EPROBE_DEFER while the
> > +	 * GPIO controller has not been registered yet, must reach the probe.
> > +	 */
> > +	gpiod = gpiod_get_optional(dev, "ssam_wakeup-int", GPIOD_ASIS);
> > +	if (IS_ERR(gpiod))
> > +		return PTR_ERR(gpiod);
> > +
> > +	if (gpiod) {
> >  		irq = gpiod_to_irq(gpiod);
> >  		gpiod_put(gpiod);
> > +	} else {
> > +		irq = fwnode_irq_get(dev_fwnode(dev), 0);
> 
> I have to admit this was not exactly what I meant (I only meant to not 
> use -Exx literal in the return statement), but now that I see this v2, 
> I'm not saying your approach is wrong either (I'm left unsure).
> 
> Are there some legimate cases where error other than -EDEFER_PROBE should 
> end up into this else like it previously did? The return on error was 
> removed by b27622f13172 ("platform/surface: Add OF support") so I assume 
> there was some good reason for that but the commit message isn't helpful 
> at all... :-(
> 
> Konrad, you did that change, can you explain the reason why the return was 
> removed from the error path?

Looking from the code perspective I agree that the patch above seems relevant
and correct, we need to propagate all error codes in case GPIO is present,
but can't be retrieved for some reason. I would implement it a bit differently,
but it's another story.

-- 
With Best Regards,
Andy Shevchenko


