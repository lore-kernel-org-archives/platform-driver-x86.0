Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662601C4A24
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 10:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770891918; cv=none; b=Kkk9sBY47w2Liq4lx9l/lwhYH+mrOeteM45xyc2y9e+pmwi48Ydy4W1zl0n19ErAkhy0SFE7YoBW2Hgg5pkNSK/fUVazs49pVRnEgk3VraNa0fOnhXk6Ld2/nwym8qkWTjVnhbtFwIewCowiylPm6QfOGc1El2XuuxiG8qSzaao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770891918; c=relaxed/simple;
	bh=QdsXjM8zhLq1z7BoSXtfEh1ze4UUSx+AaRaLJ8gxmho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUdy1BD/koVTAmEIyiX7Y/dSvu7GD2/5esBLP/VF6SAD2OQvmbZozk1X1pFWI4+gRKWdFiG7fyh578hy6HnBzq5zQKZnMH3lzxzf0R0ug0fe8BHxbsAeSMoGeRjXXHD9/dRzoog32V4DsuPfbZrSTikgqEddzOmHytMCIKMD0aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZ6b4g97; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZ6b4g97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770891917; x=1802427917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QdsXjM8zhLq1z7BoSXtfEh1ze4UUSx+AaRaLJ8gxmho=;
  b=jZ6b4g97PFmIIiDGSqSTBiBniLOxvJIQkBry8NBrkphPrdnbRAvFC8Mw
   FTnivcFN0kucIBF33FE/+eJzQsa+vtAk3cR+i0dFZ4GJibebAZWnRfwgH
   xPqNU7+X301jLcSKtQnOUpSsO/lYvOhYkmtEf5aR1HaoNUceHoIPp/n/E
   I/FgIxPfDig05nSk9ksN+a+YwrkIeGWJsfWT+o2CaHcB8sMUlZAJA5vzh
   vHlzvJVkMdXH61p/dj4EscBfKPRm7I5UndwUpt2GHPNN076RIytDSKKBB
   DthvVvFb4Jfdm1CsZAXmZgGFmlRXPKZnfPbxtTV8lTGGCpNG7yRBPaMTO
   g==;
X-CSE-ConnectionGUID: 2W0A71AGR32vCiJeT6VVpg==
X-CSE-MsgGUID: bnPAWYbvSJagnIBj1ctvig==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89467744"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="89467744"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:25:16 -0800
X-CSE-ConnectionGUID: 7xI5wNQjSWutW+WjEq4aRg==
X-CSE-MsgGUID: 7yiYjHYzQD6nDz3HCbvNVw==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.145])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:25:13 -0800
Date: Thu, 12 Feb 2026 12:25:11 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aY2qh52RVS04dP-a@smile.fi.intel.com>
References: <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
 <aYnqY4KPq2Gqj3Dv@google.com>
 <CAMRc=McfHM62ZxKdn=QDAmpjExDZwtqhpkLU_=1GE27bbMsirg@mail.gmail.com>
 <aYoOKBMAsTuwHKK0@google.com>
 <CAMRc=MenKFwfT2g2-aUZUsoBdOMaA4m2krJ18Wir=Rwede9JfQ@mail.gmail.com>
 <aYpC_XWNXiRmEdzo@google.com>
 <CAMRc=MecKXHOZSpKfeWzEQLgcddsstbhRQHahD8Hky=3KP4QHA@mail.gmail.com>
 <aY1K7z5oYFmwMy2b@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY1K7z5oYFmwMy2b@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Feb 11, 2026 at 07:44:05PM -0800, Dmitry Torokhov wrote:
> On Tue, Feb 10, 2026 at 01:53:11AM -0800, Bartosz Golaszewski wrote:
> > On Mon, 9 Feb 2026 21:41:49 +0100, Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> said:

...

> > Agreed, I'm not advocating for using lookup tables. I'm advocating for using
> > swnode correctly.
> 
> I am curious how would you approach to fixing
> drivers/platform/x86/meraki-mx100.c ? The GPIOs in question belong to
> "gpio_ich" which is a cell of a MFD PCI device (lpc_ich).
> 
> Maybe it has a standard ACPI HID, Andy, do you know?

For PCI devices the ACPI companion may or may not be present using _ADR()
method. And it's an optional, so some BIOSes might have it, but my gut
feelings that the majority don't provide that. It means there is no associated
firmware node.

To solve this one may think of adding the swnode to the GPIO device by default
at registration, the problem is that fwnode is a single linked list of maximum
two elements, and we have already GPIO drivers that use firmware node _and_
software node (Intel Galileo boards with Synopsys DesignWare GPIO IP).

To me it looks like we again bump into the very old design problem of fwnode.
The roadmap to fix that is:
- make sure we never ever dereference fwnode/of_node of struct device anywhere
except the driver core
- convert fwnode to be a (double linked) list of more than two elements
- decouple of_node/fwnode from struct device, so it will only have a list head
- introduce a simple priority for nodes, the head for the firmware, the tail
for the software nodes
- kill primary/secondary fwnode approach for good


-- 
With Best Regards,
Andy Shevchenko


