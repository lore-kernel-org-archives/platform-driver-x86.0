Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80A53CB2C7;
	Fri,  9 Oct 2026 22:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791585374; cv=none; b=Vh8Igz5bYxiO8DL4BBcfv00KnPQQzZPNBWd+g2cKJuJsJy05eaoLXU3352weGnop5940Dk5NykV+8TEvJHOKoH2vQ9PEGNd52tjVFw6bicYodgMMtKQZobrqHAvfZcyGeXm7h5BgE8q1m8Dg2xVa31CSxWUBv8wNJ6r4dCVqQG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791585374; c=relaxed/simple;
	bh=p8cTBhPTdPCdJgzHXv2ZyhGjohkPjgdsmUNvY2mYcW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sc3CRbZ703RBKe1oaknxXHI4Hs2UzqCWh6hxhLYvJ+wIMMUrdmB1D739ZO9ygC/f0flyrEH0GovI84As2IxA3fzHpEhLX+NED6VhYybwnHUgEiUE1fXaOCmsm9EM9XSXjGOw0U7yNIWg4oDtWtJcj2jn3bpxj2TDsHFrmpcEKfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwbP9Gzl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwbP9Gzl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791585373; x=1823121373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=p8cTBhPTdPCdJgzHXv2ZyhGjohkPjgdsmUNvY2mYcW4=;
  b=PwbP9Gzle9SJ8xIhy0RCBx3URLzv5fNN5T+yunw+Zgekh8TzChZp/l07
   LnPTzbPWT4LH9iAZKtr5N1O8+imLxqFpi3fYTsJ+sW+GWPsaf3bYFH8vU
   +nSiXQFqAWle3RQ9T9IppQgKSWV8hy6h2e/eD9/ZjIpIKaT+E1fAKp7U5
   eee24FsMHxo5Zhv0jg2Z8gy9FrhZ5+mCkdHbreR/X537MRnHL6yJwpUMo
   ZYPZFN1fFyBCbkePyY0LhLZLF1YT7DLBtEYhr/ZPxpguDG3zd/Yyicj8A
   BHvrUh3gzIUiPx1VrDIgRGS4a48avqFi+1flW91NhHxkzQfL+TmQttU6m
   A==;
X-CSE-ConnectionGUID: t6gTibEXRHCNY+YhPXsiQA==
X-CSE-MsgGUID: xj8FR8qgQDC1SulCMHQqXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="268308"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="268308"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 15:36:12 -0700
X-CSE-ConnectionGUID: ZgP6JbHMRZK2okIwaAEOYQ==
X-CSE-MsgGUID: 2gDh92PdRii/R2KGpu0W0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="773843"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.86])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 15:36:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D8CB0121B8C;
	Sat, 10 Oct 2026 01:36:12 +0300 (EEST)
Date: Sat, 10 Oct 2026 01:36:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alexander Patrakov <patrakov@gmail.com>
Cc: Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Leif Skunberg <diamondback@cohunt.app>,
	Sahan Nissanka <adee.sahan@gmail.com>
Subject: Re: int3472: GPIO type names disagree with Intel's Windows driver
Message-ID: <aslsXPVJIuYRrgKv@kekkonen.localdomain>
References: <CAN_LGv0qkxARw4bxO8K-1hUkWNg2ts6q50dooCB5UM5en=bo0w@mail.gmail.com>
 <d9a37aff-3b4d-467c-825d-5473b4c1bbb4@ideasonboard.com>
 <CAN_LGv0nBTkVmxbuK+_O1v5Z_OZqQz5LgEZdL1_37otsei36fQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN_LGv0nBTkVmxbuK+_O1v5Z_OZqQz5LgEZdL1_37otsei36fQ@mail.gmail.com>

Hi Alexander, Dan,

On Fri, Oct 09, 2026 at 07:25:07PM +0800, Alexander Patrakov wrote:
> On Fri, Oct 9, 2026 at 6:03 PM Dan Scally <dan.scally@ideasonboard.com> wrote:
> > On 09/10/2026 04:06, Alexander Patrakov wrote:
> > > Hi,
> > > Why I am not sending a patch
> > > ----------------------------
> > >
> > > Giving 0x0f, 0x10 and 0x11 their proper names, while 0x0b and 0x12 keep
> > > the ones they have, means two names end up on two types each:
> > >
> > >    avdd   0x0b (PowerEn) and 0x10 (Avdd)
> > >    dvdd   0x11 (Core) and 0x12 (Handshake)
> > >
> > > A system whose INT3472 declares both members of a pair for one sensor
> > > would ask for two regulators supplying the same name, and the second
> > > regulator_register() fails with -EBUSY. No type shares a default name
> > > with another in mainline today. I do not know whether such a system
> > > exists; Intel's 2021 build handles Core and Handshake as separate steps,
> > > so the firmware vocabulary at least allows it.
> > >
> > > The ov5675 driver asks for avdd, dovdd and dvdd, and all three are
> > > already the default names of 0x0b, 0x10 and 0x12. So I see no way to add
> > > 0x0f and 0x11 as general types without reusing a name, whatever is done
> > > about 0x10.
> >
> > Does the situation need amending? The handshake pin being modelled as a regulator named dvdd is a
> > deliberate situation; see Hans' commit message in c5d0393272048 ("platform/x86: int3472: Add
> > handshake pin support") for the explanation. I would think the same applies for PowerEnable (though
> > I suppose it could also be legitimately modeled as a GPIO, but sensor driver handling of those is
> > less consistent).
> >
> > Is there some sensor case you're aware of that's not working because of this problem?
> 
> 
> My sensor does not work without a patch that maps 0x0f and 0x11 to
> something that the ov5675 driver tries to enable. The INT3472 of the
> Lenovo Yoga Duet 7 13ITL6 declares types 0x0f, 0x10 and 0x11, plus a
> reset and a privacy LED, and neither 0x0b nor 0x12. But I am reluctant to
> send a patch that knowingly gives a GPIO type the wrong supply name, thus
> spreading the mistake.

The GPIO naming in Windows drivers is also an abstraction while Linux
drivers typically use datasheet names of regulators, which are sensor
specific. The handshake GPIO shouldn't exist with the regulators so it
should be possible to map the rest independently of that. Changing the
default mapping would also be possible, in principle, but that'd still
require ensuring all sensor drivers still get the required regulators. I'm
not sure it's worth it.

-- 
Regards,

Sakari Ailus
