Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283462DE6F3
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 10:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770892128; cv=none; b=PsGlWolKfxSTJWWyl06Nysp4DxnN+LoBFpydmh2gbtVOYVpUqSAXlC0IxkrJ0eFa/ZN8oM/3NKh80CkVz9V2MP9xQmt+z3IoEXEpJJ/mRGdF1oh3j+v0kjLwGE6yqC+KnasLEs7JZkyUK3wo0vKBrO5OEqp0dk62WpcMmQzwB4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770892128; c=relaxed/simple;
	bh=B4yyeF8V2KZ9bhLGAUY3kf9QO37Kt8jdJS1mC+yNMk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BleCasorv0EDRv63iTDtVaILcLr7ywy24lNOgOP3m7Z0rzt4SBSCNT55a38/t/QqJzsk35NZEkYVvp+AIkQMx4qWNiKJkxFkXfWkY17VrA1HxZ0ryW0rsmQFScIoObZ1MbU6Ol+bDyP82LE2ZwbXQNu/jDhuhCTu7ZdcxeKRpoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HIm+k+aY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HIm+k+aY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770892127; x=1802428127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B4yyeF8V2KZ9bhLGAUY3kf9QO37Kt8jdJS1mC+yNMk0=;
  b=HIm+k+aYP9VBgFkvfNuO1D0DCKCvafB1JRlIvqap0tWQ4MjbevmF1dSD
   hlOp2hb4Bnhm2G97JuLh5x7Smim9DwdqMF6fnEzBkUATh1HnNcvCUr//H
   JQtNBkOSi3DGltb6Wd+8VTxO6KbOClAeiF3FS+K2kaY8fZvJUn0HVZmVT
   f+hWXVVAnlUgpry+wI844nxdYccrJGtATLX59350VcFqfz/go8J5ELa6x
   5Y8Sexnar9nN1Rx4OIzPDQ3mVpeU3kgfa4y3576og1hWkPKhnjXMtwP9X
   /qQBjlzWq2pTIYAS9SQ/svaSpa6G37U76OoN++945mWtdrm+apZicfiVW
   w==;
X-CSE-ConnectionGUID: cG6Ni0KeTIGjTY9mas3kzQ==
X-CSE-MsgGUID: tRioZVimR/K3WZDDOrAmqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="72133310"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="72133310"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:28:46 -0800
X-CSE-ConnectionGUID: XvOVRElnTaeDo0vDQbF6Sw==
X-CSE-MsgGUID: PsSN6zizS/inj1Y7Cwy77Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="211391277"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.145])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:28:44 -0800
Date: Thu, 12 Feb 2026 12:28:41 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aY2rWc4bfeWqw1Zu@smile.fi.intel.com>
References: <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
 <aYnqY4KPq2Gqj3Dv@google.com>
 <CAMRc=McfHM62ZxKdn=QDAmpjExDZwtqhpkLU_=1GE27bbMsirg@mail.gmail.com>
 <aYoOKBMAsTuwHKK0@google.com>
 <CAMRc=MenKFwfT2g2-aUZUsoBdOMaA4m2krJ18Wir=Rwede9JfQ@mail.gmail.com>
 <aYpC_XWNXiRmEdzo@google.com>
 <CAMRc=MecKXHOZSpKfeWzEQLgcddsstbhRQHahD8Hky=3KP4QHA@mail.gmail.com>
 <aY1K7z5oYFmwMy2b@google.com>
 <CAMRc=MfdeQhgQd9FzUt5JtynerzR52yWndbVJ5Xu-eVUwtvgJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfdeQhgQd9FzUt5JtynerzR52yWndbVJ5Xu-eVUwtvgJg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Feb 12, 2026 at 02:01:02AM -0800, Bartosz Golaszewski wrote:
> On Thu, 12 Feb 2026 04:44:05 +0100, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> said:
> >>
> >> Agreed, I'm not advocating for using lookup tables. I'm advocating for using
> >> swnode correctly.
> >
> > I am curious how would you approach to fixing
> > drivers/platform/x86/meraki-mx100.c ? The GPIOs in question belong to
> > "gpio_ich" which is a cell of a MFD PCI device (lpc_ich).
> 
> Something like this (compile tested only):

So, as I understand the idea is to provide a reference to a standalone software
node that is not connected to the chain of fwnodes for the device? It might work,
but can't we do the same for any GPIO controller automatically at the time of
GPIO device registration?

...

> +const struct software_node lpc_ich_gpio_swnode = { };

(With name, please!)

-- 
With Best Regards,
Andy Shevchenko


