Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9693B223708;
	Mon, 16 Feb 2026 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771233482; cv=none; b=lso8ORioKtCv067kPcwyHA7JlNSfwTrUblG/63a01ljIId/3bhhvOKi3b29x57l7pygEnGuTSsAMRDmUizUtbPACU5tQzL7W9TuABLfcERYm6P/RKW2VLbUz8pziK6uCXN/klmJGSgc8/GNk5qrCaQEL6xeKYxHlR5SOCzyJJg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771233482; c=relaxed/simple;
	bh=c8wud0BOMu16j3cFqCZohOmtRW2RSGYnP6jSFow7g1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ty9KYx2xt4VuZ1twEo1dDVCi78f65OVZhU/atox3UoDAftKAgAhABKoLPTBrAMDs6qW81jFxRoxi+cwXTwhJARxu6VZihX1JWH6UCZegXPk7uVXFBeMvZKHXb/28UsrAxE49LMwtv/qnUpXLWCkUypaEm9+13ZFHkqupPkaCojg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KYAcJv0l; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KYAcJv0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771233482; x=1802769482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=c8wud0BOMu16j3cFqCZohOmtRW2RSGYnP6jSFow7g1c=;
  b=KYAcJv0ljryHTL29wJq0kzMC1p74EPhy6v1K0gi1erd0H75PQhN+R7pP
   838PT2vd8nFtUuXuhMP1KSTKVMH/8YkJwie4q2zuPMWimbbMra9vjx/Wu
   ty/7oi5xmPyETKehNCJvovMWCW2J0X/fMaOFmgpt/f50T26tE+R9GTvQK
   OhpAY2hM2Qr2Y54cnw6gtu4lgst/T3jz0uFsEQ7K37C4d7kIYjoPD/6LI
   KY2SboFECoKENs4dSp6sIPdPcol+2rhLvSzMLqZ0mygE9It5LaMAjvMca
   xZdKaoZXC5J3P0KluqHcs+S/wrw5IHZSMdn0BVRSmAzzc+AwNRlEB454b
   w==;
X-CSE-ConnectionGUID: gwWTn6NbSDOD5a4xJZFHfw==
X-CSE-MsgGUID: GEq2FHIOTX6gs5YfYBL4rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="75930945"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="75930945"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 01:18:01 -0800
X-CSE-ConnectionGUID: 7iNXHMU3Q9ma7GOhymAUoA==
X-CSE-MsgGUID: XlQmqEFmSu6u0AholP5ABA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="217707253"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.188])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 01:17:58 -0800
Date: Mon, 16 Feb 2026 11:17:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Peter Tyser <ptyser@xes-inc.com>, Lee Jones <lee@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] mfd: lpc_ich: expose the GPIO controller cell's
 software node
Message-ID: <aZLgxEZzn_USmlkE@smile.fi.intel.com>
References: <20260213-meraki-swnodes-v1-0-8e032693456c@oss.qualcomm.com>
 <20260213-meraki-swnodes-v1-1-8e032693456c@oss.qualcomm.com>
 <aY7r9qr-ngFSw7MC@smile.fi.intel.com>
 <CAMRc=Md5sPd=20=mM7H3qM8TQm0kqjoRnKdnBipjY7nbWu8Xpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md5sPd=20=mM7H3qM8TQm0kqjoRnKdnBipjY7nbWu8Xpw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Feb 16, 2026 at 09:51:18AM +0100, Bartosz Golaszewski wrote:
> On Fri, Feb 13, 2026 at 10:16 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Feb 13, 2026 at 09:25:24AM +0100, Bartosz Golaszewski wrote:

...

> > > +const struct software_node lpc_ich_gpio_swnode = {
> > > +     .name = "gpio_ich",
> > > +};
> > > +EXPORT_SYMBOL(lpc_ich_gpio_swnode);
> >
> > Can we export in a dedicated namespace? Perhaps "LPC_ICH"?
> 
> I can't test it so I would prefer to reduce the amount of runtime risk
> introduced by this change. We can do it separately later.

I didn't get this, In this patch you use _NS (And in any case this should be _GPL).
In the other you need to add MODULE_IMPORT_NS(). There is nothing which needs a HW
to test.

-- 
With Best Regards,
Andy Shevchenko


