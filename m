Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A9A200BBA
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731425280; cv=none; b=sTbhDM+91q+raVoEKe+mw0alEd6fh/BAiQJ5v8hsxxpjArX4xt1v+TDfKVEyWWSZLhtInwuk0tcoDwNdil1e2JVZOlaA9kjBookgIXkCZJ3qbhNLHGICLpYmGI87HhOrhLcwJ2Y2p/Jb4YEKk2IxjFX27jqVAar3xRlDA6JQ1Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731425280; c=relaxed/simple;
	bh=kix+tDXd/OHa3nrcLUpos2J4yobEUJHVLRoofvoqD+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIw+uXtwNmxXDpC47Cl76NIs8NsvpxVMd6Nj3+vl0f8HE0/lk1kIYqUFa0lKVi8osvD20V2XGBzeMNq42CTNhKu2E0MON7iHq6Z7Vb4j/UA78D87MBvRToLLX6LQnUR9/0TKdYT7/CY/ta2G6sB9fr2pjLWEIubIwDnpJiEoLEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtJP0Uly; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtJP0Uly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731425279; x=1762961279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kix+tDXd/OHa3nrcLUpos2J4yobEUJHVLRoofvoqD+4=;
  b=YtJP0UlyRRrrWRAk6wscQqsTxKkIYJTJ5JVN68BHpDteyzUg7RvTLoK7
   GTaUJrSjLyroyeQtNLcFN+e3F9S5l+5PH58G40IQVqDV1ahB8yPQkrA4S
   JM96ijXFHlDpsFdpU8NxVML3ipoijMiN5OATYcRa3DGr+juRlCB9zV3Oa
   fYhQL8/51GotFasYkfLzt5sDuM1J6CpZ2MN9KdO1qkEki9vzP8FUUbTJV
   iCxmWDVV2o6Ew+50K1QypaoR6PRK1ZNvlLwT6ADdHRXINllmbIoj2+kt6
   0qBC5+kql/XcbqpGkoUWDpOCdjslebA0752vYfkxVFxUKo9C4XMx4jO6w
   w==;
X-CSE-ConnectionGUID: NOcksUztSbS5SgYJ0tGTvg==
X-CSE-MsgGUID: 9i/lmyoVQry8KufCjBGZ8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31227977"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31227977"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 07:27:58 -0800
X-CSE-ConnectionGUID: YiOyrTEVTJeVJ7mZQ64pYg==
X-CSE-MsgGUID: X0pDeDitQs61A1hjAIETeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="87931761"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 07:27:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAso5-0000000E2ey-3ZM1;
	Tue, 12 Nov 2024 17:27:53 +0200
Date: Tue, 12 Nov 2024 17:27:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] platform/x86/intel/pmt: allow user offset for PMT
 callbacks
Message-ID: <ZzNz-ckhzRSCezRD@smile.fi.intel.com>
References: <20241108201955.2048085-1-michael.j.ruhl@intel.com>
 <ZzHBhsJ_J3ARhLu9@smile.fi.intel.com>
 <IA1PR11MB64184E52DA33ABC36329A2FDC1592@IA1PR11MB6418.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR11MB64184E52DA33ABC36329A2FDC1592@IA1PR11MB6418.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 12, 2024 at 02:38:06PM +0000, Ruhl, Michael J wrote:
> > -----Original Message-----
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Monday, November 11, 2024 3:34 AM
> > To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; platform-driver-x86@vger.kernel.org;
> > david.e.box@linux.intel.com; ilpo.jarvinen@linux.intel.com;
> > hdegoede@redhat.com; Vivi, Rodrigo <rodrigo.vivi@intel.com>; De Marchi,
> > Lucas <lucas.demarchi@intel.com>
> > Subject: Re: [PATCH 1/2] platform/x86/intel/pmt: allow user offset for PMT
> > callbacks
> > 
> > On Fri, Nov 08, 2024 at 03:19:53PM -0500, Michael J. Ruhl wrote:
> > > Usage of the telem sysfs file allows for partial reads at an offset.
> > >
> > > The current callback method returns the buffer starting from offset 0
> > > only.
> > >
> > > Include the requested offset in the callback.
> > > Update the necsessary address calculations with the offset.
> > 
> > ...
> > 
> > > -	memcpy_fromio(buf, addr, count);
> > > +	memcpy_fromio(buf, addr + off, count);
> 
> Hi Andy,
> 
> > This will give an unaligned IO access in some cases. Is it a problem?
> 
> That is a good question.
> 
> I moved this value from the caller to this location.
> 
> So essentially it is "unchanged" from the current usage.  Does that answer
> the question?

Probably. Please, mention this in the commit message.

-- 
With Best Regards,
Andy Shevchenko


