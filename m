Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6201204012
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731524353; cv=none; b=Xcixje+Jju3Fbg9KXvizkp8/g0x+nkErRRReAQNF+70up35BBasr64mV2ZYvEybE/nUzufG0VfzGTI7gLfzF1RNFNsB6DqWUJvgd8qWPmEP1OlHr1jQe6zOJBjlqdE7bwPOwRsfWmkMXyT4sobKiFyJMmB46AkXizwlPiaTk94I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731524353; c=relaxed/simple;
	bh=2TCZS2kT/4xRMhlbLXb6MTvMySCGK/8FMg1LpclUHrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsSYCWyCBZ2/GZhor//56Seueq91I7kvk53wCdhPqt2XWMpErIFly3+/8Nw+VJEgagka+IJU+rzXusnCgfLCx5IjlQZW0GA9M9wX0houD9zuUDuAsNwqo0VBqS+XRDCCpv7UUP7jRw7Tsp4mjZcyO01g7fvRRU/vr/OnnQG1W/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVOoErsw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVOoErsw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731524352; x=1763060352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2TCZS2kT/4xRMhlbLXb6MTvMySCGK/8FMg1LpclUHrc=;
  b=kVOoErsw9lkokjIuwGG6AK8BXWnKsLpFM5DshJ+XqiEHnGVtYx3Xhb0Z
   LpVVi23AANlzPsT/WXWijROLNyz8fTf5N+I97ohByl25QQTjbOwRz8jc6
   VSyv1Tl6dqQHWoHb9fhQ1D2pn9ILwSc5shaM2IWWTqFAjFtZ+1m2qPaky
   hF6edDmmSfpOA4mNCHFNVDgPEke2GbprqiaaZgACv+e9tmmfODDonhYe0
   oQBJjvohaMGXy8CXam4bo2wgTrt/JaPFiQ4M7Aye/7ciUd1KvISBqAocv
   MrbR4/jNlqHErRTRdtN7d/4g+9L+KVFmzf/lv8M6ty64MMoj170MvrVXH
   w==;
X-CSE-ConnectionGUID: VK7YwDBOS4iGWNjohw8Vug==
X-CSE-MsgGUID: wwgoH2ACQ166yFICEsOg7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="48940613"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="48940613"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 10:59:10 -0800
X-CSE-ConnectionGUID: Xre2VOCSQs6wmcbA+YeALg==
X-CSE-MsgGUID: 192EfGiBRV+rK3lQRvWQgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="88766710"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 10:59:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tBIa1-0000000ERrU-1WMj;
	Wed, 13 Nov 2024 20:59:05 +0200
Date: Wed, 13 Nov 2024 20:59:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, rodrigo.vivi@intel.com,
	lucas.demarchi@intel.com
Subject: Re: [PATCH v2 0/2] Support BMG PMT features for Xe
Message-ID: <ZzT2-R2uiXn_cHRT@smile.fi.intel.com>
References: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
 <ZzSBpq2IakMrvV6h@smile.fi.intel.com>
 <23fe9eca-ebd3-4098-22ab-d21434026273@linux.intel.com>
 <7e22fc28bd8d81d42c75166b8792eaf0d856a413.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e22fc28bd8d81d42c75166b8792eaf0d856a413.camel@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 13, 2024 at 10:40:42AM -0800, David E. Box wrote:
> On Wed, 2024-11-13 at 15:52 +0200, Ilpo Järvinen wrote:
> > On Wed, 13 Nov 2024, Andy Shevchenko wrote:
> > > On Tue, Nov 12, 2024 at 11:30:33AM -0500, Michael J. Ruhl wrote:
> > > > Updates for PMT to support user offsets from the sysfs API.
> > > > 
> > > > Addressed review comments for the Xe driver udpates.
> > > 
> > > FWIW,
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > 
> > > If you have wish and time, there are problems with the drivers of different
> > > severities (from "fine as is" to "good to be fixed, but okay as is") I have
> > > noticed so far:
> > > - it uses s*printf() instead of sysfs_emit*()
> > > - it most likely never tested the corner cases. e.g.,
> > > 
> > > 	if (disc_res->start >= pci_resource_start(pci_dev, i) &&
> > > 	    (disc_res->start <= pci_resource_end(pci_dev, i))) {
> > > 
> > >   what is this supposed to mean? Probably someone wanted resource_contains()
> > > or
> > >   alike to be called here.
> 
> This is a corner case that occurs for devices that are non-compliant, in this
> case meaning devices that don't follow our PMT spec convention of specifying
> which BAR an address belongs to. Without this information, we have to deduce the
> BAR manually to access other needed registers that are offset from the base of
> that BAR.

What I am pointing out is that we compare start address (and only start!) to
both, start _and_ end of the given resource. So currently the second check is
redundant and that looks suspicious. I believe one wanted to have

	if (disc_res->start >= pci_resource_start(pci_dev, i) &&
	    (disc_res->end <= pci_resource_end(pci_dev, i))) {

(note end!) and if using helpers, this would never happened :-)

> I can change this to use resource_contains().

Please, will clarify the above confusion..

> > > - slightly above the above piece the for-loop
> > > 
> > > 	for (i = 0; i < 6; i++)
> > > 
> > >   which probably want to use PCI_STD_RESOURCE_END)
> > 
> > While both work, in practice PCI_STD_NUM_BARS is way more common than 
> > PCI_STD_RESOURCE_END.
> 
> Will change this too. Thanks.

You are welcome!

-- 
With Best Regards,
Andy Shevchenko


