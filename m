Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610B438B14E;
	Thu, 26 Mar 2026 10:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522314; cv=none; b=rpI9oEk4AVASxTRoc99fQ7GSCXUOvxeASVCv/5HsgNsZ0w4rjfiQVwu9gbXK3uqCAy9vyIA+7PjBeXm6AO6WRWfs8fIQ8W993UevaxKevnIbZ27Ij5BbsDrLu+j7PM/TGJOAsDFsOnhLfjn64IfGDW8v8FSOBJ/6bmEuN4PQAKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522314; c=relaxed/simple;
	bh=e0/oRN3Y0DAgxsPAkn1ZYKhip4c15S256EuTbrOtcOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5CPCIDZf1LrF0nRBDTfxQ8Amw5Lu0ezC3cxe9RO6DHC4kjQF1INtOGPfSCANLmZUCUy4+LTnVcuSIZGroX2SLuS0h1Y+mGEteWb1e5vhznliAQVp+CRXpFq3JqsZaSIZ6VR2XLfCLH0894EbY2SmOig0Z5cpGj0W7pVv/KSiKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C1gni26x; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1gni26x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774522313; x=1806058313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=e0/oRN3Y0DAgxsPAkn1ZYKhip4c15S256EuTbrOtcOU=;
  b=C1gni26xdl9H+1n9htl6V3vD4gguGOMZ14npIpS2gDtryUvunsW0mBaw
   Z9j4YflNkurL2Dn32Tg0f4dPcqz0eATDrZw+5838N6MbWNC/1acBucJTY
   p6yZNLyN7xErDWotL9Ifp9sIEEJye7EGNt5Es75bI5O6W2GvGzEQ8qxps
   vlIMCNKcJC005CH4yKm8eLHRYkJkCqX5sSXJll7rWrrdDTEYZNPvl13vG
   8UhzsuOQfjj6vjGfnv+qAb/r2JXABJqjKZ0sM0IHOGZVLO9mi91N2zX4A
   P4GU7eNuZve3VEdmmmACejJDPOboKAIfzfpyQl1LUw41p/xe+99J5izK/
   w==;
X-CSE-ConnectionGUID: KRnNxzu8QFupqPN7az8qDw==
X-CSE-MsgGUID: sfYESgthQuOfBmft4TMG/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75292362"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75292362"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:51:53 -0700
X-CSE-ConnectionGUID: LCl4cZyxS1i/ob94C35JcA==
X-CSE-MsgGUID: LpIM1RpmRTOf8T8LBOg6pA==
X-ExtLoop1: 1
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.216])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:51:51 -0700
Date: Thu, 26 Mar 2026 12:51:48 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Marco Nenciarini <mnencia@kcore.it>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] platform/x86: int3472: Add support for GPIO type
 0x02 (strobe LED)
Message-ID: <acUPxEdQeLFPunoY@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <cover.1774477895.git.mnencia@kcore.it>
 <1834b9729482d629c1d2d28443b88323cbae2764.1774477895.git.mnencia@kcore.it>
 <07897a49-b2f8-0a5a-e653-eaf4a14a1a13@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07897a49-b2f8-0a5a-e653-eaf4a14a1a13@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Mar 26, 2026 at 12:46:08PM +0200, Ilpo Järvinen wrote:
> On Wed, 25 Mar 2026, Marco Nenciarini wrote:
> 
> > Some ACPI INT3472 devices include a GPIO with DSM type 0x02, used for
> > IR flood (strobe) illumination. This GPIO type was previously
> > unhandled, resulting in the following warning during probe:
> > 
> >   int3472-discrete INT3472:00: GPIO type 0x02 is not currently
> >   supported
> > 
> > Add INT3472_GPIO_TYPE_STROBE (0x02) handling that registers the GPIO
> > as an LED class device via skl_int3472_register_led(). An enum
> > int3472_led_type parameter controls both the LED name suffix and
> > whether a lookup is registered for the sensor driver. Unlike the
> > privacy LED, the strobe LED is not consumed by the sensor driver, so
> > no LED lookup is registered.
> > 
> > To support devices that have both a privacy and a strobe LED, the
> > single struct int3472_led member is replaced with an array and the
> > container_of in the brightness callback now references the int3472_led
> > struct directly.

> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Move Cc...

> > Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
> > ---

...to be here as it reduces noise in the commit message.

> > Changes in v3:
> > - Use enum int3472_led_type to control name and lookup behavior
> > - Convert single LED member to array for multi-LED support
> > - Add default: return -EINVAL for safety

...

> > -	ret = led_classdev_register(int3472->dev, &int3472->led.classdev);
> > +	ret = led_classdev_register(int3472->dev, &led->classdev);
> >  	if (ret)
> >  		return ret;
> 
> Could all these int3472->led. => led-> conversion be made in a separate 
> patch as well? I think it would reduce churn making the actual changes in 
> this patch stand out better.

+1.

-- 
With Best Regards,
Andy Shevchenko


