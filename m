Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2473B3A29F
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Aug 2024 18:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723660894; cv=none; b=Yn1ofYYgNvOqHHCcjJZ2UzfTAYO3PcNpTSBBM51mbjF4T76DQa2nuKlWTkxSHlhUq4/KtrUbiOD6C6ndJx5y0fl+qIlR4rBpCTKpyDoDr1Bb92nzwwAl+dUIsRSB2xR0JB2YmK9EZutOjyuo3dkvpQzx8GqpPfsVNuEvrLs6PZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723660894; c=relaxed/simple;
	bh=O/aHEkLNJilD3c9IPwuyc+N0ZIZA4Uevrm9gYgmpUhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIX9LijDPLWdlsnsIhtMD56ZLeBhoUtxqCKRnim0TToBfdy5w6BWJA/6+WFIjsS/Ps/CwM2BbUsSUyRix9XFS/Mb/sc3tLI1WuxzfrwQHzI5pUiCz1o/vZaZX3ryuW8DTrDtCnF+GsRJ9p1Xm7VMIB1hcbeZod61h9NzW0Zo/x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqGGUWqf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqGGUWqf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723660893; x=1755196893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O/aHEkLNJilD3c9IPwuyc+N0ZIZA4Uevrm9gYgmpUhs=;
  b=gqGGUWqfDIn8BA8R9xLfer7sZ51wXuBbFCFYV5TxNqvYjqZcGHEOWYUy
   2/Fnem/yYViafDtZn8WOXPipkmCs9mvpuJIgPjc76PMlT+RBiWf0IkCso
   MGcHBaJnzJlgSP2iTNH4VNnK8l7Gf1OCatA2HH3uEGTnlFRkz1d0uxnrA
   +Guo0i7ZT2X+jxtguBmoZ8zke2LQ1aqSW2BBsDO0a/8hs0FwD/TjT2uBe
   8h0jxLrPbAJ0om/0pkT8tXBrU1UyPY18uuVk3wf4te1yaQzCmhBW/SgiG
   Wt3FgQuuOqItEvrzGdG1seTLnLt5RE7/ZJXo3lQsepKH9+0oysqVMdT+P
   w==;
X-CSE-ConnectionGUID: ZPxtCmZKSV2dxobpLioEwA==
X-CSE-MsgGUID: 7zoo2BUMRTKGygl7hzJMvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="25700074"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="25700074"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 11:41:33 -0700
X-CSE-ConnectionGUID: OxNrXsiMQwWHy8G0wRFg2g==
X-CSE-MsgGUID: evjWjApoTBeY+mU46rFG8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="59684910"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 11:41:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1seIw3-0000000FI1r-3Wdj;
	Wed, 14 Aug 2024 21:41:27 +0300
Date: Wed, 14 Aug 2024 21:41:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"Brost, Matthew" <matthew.brost@intel.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v11] drm/xe/vsec: Support BMG devices
Message-ID: <Zrz6V7iLFtnunMju@smile.fi.intel.com>
References: <20240812200422.444078-1-michael.j.ruhl@intel.com>
 <Zrtpd_WwougszltH@smile.fi.intel.com>
 <IA1PR11MB6418FAAD8AC5104D6F8FDE33C1862@IA1PR11MB6418.namprd11.prod.outlook.com>
 <Zry3hOBb_fHbvlIN@smile.fi.intel.com>
 <IA1PR11MB64182DD2B8D803A48D592D62C1872@IA1PR11MB6418.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR11MB64182DD2B8D803A48D592D62C1872@IA1PR11MB6418.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 14, 2024 at 04:49:05PM +0000, Ruhl, Michael J wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Wednesday, August 14, 2024 9:56 AM
> > On Tue, Aug 13, 2024 at 02:29:27PM +0000, Ruhl, Michael J wrote:
> > > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > Sent: Tuesday, August 13, 2024 10:11 AM On Mon, Aug 12, 2024 at
> > > > 04:04:22PM -0400, Michael J. Ruhl wrote:

...

> > > > > +#define BMG_DEVICE_ID 0xE2F8
> > > >
> > > > Is this defined in any specification? I mean is the format the same
> > > > as PCI device ID?
> > >
> > > I think that this is defined in BMG PMT yaml definition.  It is
> > > provide in the PMT discovery data, so it is defined by the specific device.
> > 
> > Is there any documentation / specification about this?
> > Can it be UUID or 64-bit number or other format?
> > _Where_ is this being specified?
> 
> The GUID is defined by the YAML file associated with the PMT device.  In this
> case 16 bits are a device ID.
> 
> From the cover letter of the PMT patch set (Intel Platform Monitoring Technology):
> 
> -
> The GUID uniquely identifies the register space of any monitor data exposed
> by the capability. The GUID is associated with an XML file from the vendor
> that describes the mapping of the register space along with properties of the
> monitor data.
> --
> 
> I was told that this was the value to use for this specific device/feature.
> 
> It is specified internally.  Not sure if there is any "documentation" available beyond
> that.

The YAML is *not* the specification. Do we have one that I can access to?
And I asked not about GUID, I asked about ID.

-- 
With Best Regards,
Andy Shevchenko


