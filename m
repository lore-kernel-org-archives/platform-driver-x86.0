Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339BA4052C3;
	Tue, 13 Oct 2026 09:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882897; cv=none; b=bX3Jtsm2bg8ZUj1XH0xyA5nXBuVB9XXhzoKOe+FGhjdJOozp0/itUJ1ZymzoiLzH5Jeo4aHo4hgZTkc1l9TO4BKhN4Q3U7aqH4GZ7h5am49HMkiW5Oum1YrqfiBH1bpuQpkiEsrFxR5JFh3RyDQ0OzJM9ofZ5DhdlO6bZWwJn3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882897; c=relaxed/simple;
	bh=yq1DW4B98q3ykUVmxx7VhPNPveKqVufbEQJS2l2Rgac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6Bs8MMVvJUND7RR+EA92Bp+d1xhZqiUi06iWaCO6YfqosdZbJKMT6Hv1rrKAV26aFvi0RNxcQwfGpx/GcPBdkiU1/jdfpkRnr5WCXdqe5QoIuqREusN5roFkA1aw7MX6ZBE1bu3FvjGoHdCL1rXAmw8Pcrch7/2/aqeaxNVDHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTn979i0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTn979i0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791882896; x=1823418896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yq1DW4B98q3ykUVmxx7VhPNPveKqVufbEQJS2l2Rgac=;
  b=hTn979i0m3GpbIsDHYg5/U+wb022sHP2Rifhp+pbw7aB23nKbIYkNdH5
   yH6WwTzXEoS21Q/4ESae66Xp4TWy8PXX8yX852pIJhjc8miticJf4FuiI
   nZtCh9jQ6zsvUKfYf6N1VYPDWEAljpWUPUfCcZOT0/Um7gSTRd/fMXku5
   ViqcFcfHAjTFSCU9sf26dv0HM0Mpnz9QMMw7U3Z9GFccMA6pwB49r3qx4
   q1R+x0Rb3Xz00j4MTeaQROEeS9yDAuy8Z0+woRQkecfA6B5IIZ+2dOy3P
   EBXWVDnZv5gevlTJC9EdhOSIhjvoiiP/GA9he8zNBdJ4SC254W/+Chd71
   Q==;
X-CSE-ConnectionGUID: VQIFFCxlR0S74VCBMsXgNw==
X-CSE-MsgGUID: KYeanXggQgCSXCDUapONpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="595066"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="595066"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 02:14:55 -0700
X-CSE-ConnectionGUID: CPECFWMgTNSg6V1rkc8ZYg==
X-CSE-MsgGUID: TJBctzN1TqG0w+AK2af23g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1442850"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 02:14:54 -0700
Date: Tue, 13 Oct 2026 12:14:51 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	David E Box <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 17/20] platform/x86/intel/tpmi: Use scnprintf() to
 build the debugfs names
Message-ID: <as32iyeK1okylcYI@ashevche-desk.local>
References: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20261006183037.1507007-18-sathyanarayanan.kuppuswamy@linux.intel.com>
 <as0-s6JyjfA2zY-B@ashevche-desk.local>
 <24aaf825-ae8b-b19d-4f7f-d5fedc5bcd44@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24aaf825-ae8b-b19d-4f7f-d5fedc5bcd44@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 13, 2026 at 11:42:00AM +0300, Ilpo Järvinen wrote:
> On Mon, 12 Oct 2026, Andy Shevchenko wrote:
> > On Tue, Oct 06, 2026 at 11:30:34AM -0700, Kuppuswamy Sathyanarayanan wrote:
> > > snprintf() is on its way out in favour of scnprintf(). Neither of the two
> > > callers in tpmi_dbgfs_register() looks at the return value, so the
> > > difference in what the two return does not matter here.
> > 
> > I believe I asked it already: Why do we care? Do you get any compilation
> > warning (assuming `make W=1`)?
> 
> I do care that we've two functions for essentially the same thing and 
> would prefer to have just one that remains (and obviously that would be 
> the c variant).

I see, thanks for the hint, but it's not clear from the commit message.

-- 
With Best Regards,
Andy Shevchenko


