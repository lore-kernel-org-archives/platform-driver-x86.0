Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE301AED23
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Aug 2024 13:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723643788; cv=none; b=L7koW0iByK3YrIlmazQI/NOGmDewtJJ2yvs4l5EPziaQW2v63wGs7uCJnnvy2wKxUO87dlTZ9a5/fC5o9An20dq3PoDjxDsFNE+tmJ4yRt+JFIDmplyif/cP8ZdvgJuBQPIx9XBMwef4jc4j4v31jdWBTaMSzyJBJNHPdZr7jjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723643788; c=relaxed/simple;
	bh=C37OoDdd1gzVMoFMiBQNgrjuyFWgYuDQxb7yZDxfzws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZBNF9nrZkaHSStopqaSA8565jVtShGgHCMU3IwZDb9uKvAIlXkXvNQzF/claiBnoYTJyaCVAaYmfMwCX/9Qeej1dbwQ7EijeYsutKPjtmEZ9snQmV1gUYIol0BFexwRKhjeym92e8TvVcx0NykMvdldYbD5OgRml4QvUcZUp/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqrOE1GM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqrOE1GM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723643787; x=1755179787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C37OoDdd1gzVMoFMiBQNgrjuyFWgYuDQxb7yZDxfzws=;
  b=CqrOE1GMeuA+PgKh+6oIe37wdPEn5FJi2SLshAaFW73C6RgRWtOCat33
   wKZkAQkZf5jeTi3jAkej9KEVX9BOTi0wCtKo01Bss/SIMpXWjUkg/jSJa
   Lr5xda8zOyMx8Cnurg8SHYyKBqe/fjPca+OT1OeVVdWFzSXTnMk2CzRT7
   Uoz0Q1kbGqlgs53AVPUjTo3wDvNpE/swvnH863uVcIKxrwptGnT03O3zL
   8yTHbqHNYoiGBoQBopDTN81NqL0KqMsowqX1HCiKqtaoJFn+D+kWrQy6H
   VH7WNrVvCGX/v+iVYREdcG4C43ipx+lSE9tDg/63Gj2Pk7BFd24O/0z2j
   A==;
X-CSE-ConnectionGUID: VWeCu8kdSPqWkApqrbzRsg==
X-CSE-MsgGUID: 635FFH7JS3y3iC62k/z5cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="39368596"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="39368596"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 06:56:26 -0700
X-CSE-ConnectionGUID: 9Ro7xBblTQWDeWDH3tSr8w==
X-CSE-MsgGUID: BYri71D2SpCLdviTezlyyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="63963632"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 06:56:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1seEU9-0000000FCIt-0WkO;
	Wed, 14 Aug 2024 16:56:21 +0300
Date: Wed, 14 Aug 2024 16:56:20 +0300
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
Message-ID: <Zry3hOBb_fHbvlIN@smile.fi.intel.com>
References: <20240812200422.444078-1-michael.j.ruhl@intel.com>
 <Zrtpd_WwougszltH@smile.fi.intel.com>
 <IA1PR11MB6418FAAD8AC5104D6F8FDE33C1862@IA1PR11MB6418.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR11MB6418FAAD8AC5104D6F8FDE33C1862@IA1PR11MB6418.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Aug 13, 2024 at 02:29:27PM +0000, Ruhl, Michael J wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Tuesday, August 13, 2024 10:11 AM
> > On Mon, Aug 12, 2024 at 04:04:22PM -0400, Michael J. Ruhl wrote:

...

> > > +#define SOC_BASE		0x280000
> > > +
> > > +#define BMG_PMT_BASE		0xDB000
> > > +#define BMG_DISCOVERY_OFFSET	(SOC_BASE + BMG_PMT_BASE)
> > 
> > > +#define BMG_TELEMETRY_BASE	0xE0000
> > > +#define BMG_TELEMETRY_OFFSET	(SOC_BASE + BMG_TELEMETRY_BASE)
> > 
> > This looks like double indirection.
> > Wouldn't suffix _BASE_OFFSET be better for PMT and TELEMETRY cases?
> 
> I am not sure I understand.
> 
> Are  you saying rename BMG_PMT_BASE to BMG_PMT_BASE_OFFSET?

Yes. Same for BMG_TELEMETRY_.

...

> > > +#define BMG_DEVICE_ID 0xE2F8
> > 
> > Is this defined in any specification? I mean is the format the same as PCI device
> > ID?
> 
> I think that this is defined in BMG PMT yaml definition.  It is provide in
> the PMT discovery data, so it is defined by the specific device. 

Is there any documentation / specification about this?
Can it be UUID or 64-bit number or other format?
_Where_ is this being specified?

...

> > > +	switch (record_id) {
> > > +	case PUNIT:
> > > +		*index = 0;
> > > +		if (cap_type == TELEMETRY)
> > > +			*offset = PUNIT_TELEMETRY_OFFSET;
> > > +		else
> > > +			*offset = PUNIT_WATCHER_OFFSET;
> > > +		break;
> > > +
> > > +	case OOBMSM_0:
> > > +		*index = 1;
> > > +		if (cap_type == WATCHER)
> > > +			*offset = OOBMSM_0_WATCHER_OFFSET;
> > > +		break;
> > > +
> > > +	case OOBMSM_1:
> > > +		*index = 1;
> > > +		if (cap_type == TELEMETRY)
> > > +			*offset = OOBMSM_1_TELEMETRY_OFFSET;
> > > +		break;
> > 
> > default case?
> 
> I validate the record_id and cap_type values at the beginning of the function,
> so default would be redundant.
> 
> The goal was to validate, then set data.
> 
> So adding the default will remove the record_id check from the if.  Do you prefer
> that path?

Yes.

> > > +	}

-- 
With Best Regards,
Andy Shevchenko


