Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322862;
	b=sR2tf1oJ3OHDA30KxPPYyRIn0h4yIcEcIBZIPeMa3nTwZ0s7s6nMrLdknyluzckorXuI
	 5IGoNTcqrDjQY6Q1jKZtrHUGIENKHoxeHu/Tfl3caWKAP9ADfS5UirMXUg3dTaxNoO2hO
	 tIiql2JpOz2KnZo4Neti5lKP/vRdvOU+NnIsqEymK21yGjfDfBvLCRkwklxROOt2HTBVm
	 REEPFrVHc1QI9GGlcqNwQnoDuxfNW0zIVRJYLDH+hphLCgLVWTT36+6m1sHPom7tRuA4N
	 yBrvAZSo1uvuojCmLHX+bI5NgysDm4ba1wfNMlOPX6xMTygNpmrFQyQi5aaqkKKCWRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322862;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=ubYYcNbEK/GuSiutt2HOhQIAkSJORbiIRUFMnHJbgVs=;
	b=UhrVpDy1EJn2n2KcRidZs2CCdwlaCdG+Bw0LklYF3wBUXGddKsvCyn9+kQbpsajcqG43
	 bL7Ra7lfDJNT47bxzDqwUZ5cEchnR5NrhH0Q3crVR4PhKlwLmIgZyKgQKW0czvm/ckhL0
	 ZQyf5oLp1Z4O6tMTBuQjw4wH8NEaj0pOTJIApT6mgIGJzmiW7+C2Iy3TbO+hweWgxve7Q
	 CHqhlDITAmgfuXdMvYOpCqryt2CkjCy+eYntqHtbrL/9/K6jzKXE1ywQVTE88nQZu1ghT
	 vIBL1Z1+UuEEdCs738hZiPALM1TiQHh5ltsXV75CbdJnqzDrnKIMZCFBGwXxQxLPQ5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OpJ5Lebf;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C604660A6F48;
	Tue, 10 Nov 2026 15:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C604660A6F48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OpJ5Lebf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794322862; x=1825858862;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SAvjfpCgoB7tOWF+pZouDr5eEUsxhVDG6E9CdDWBaG0=;
  b=OpJ5Lebftkw3uWuuHANIy2yRADuShivB+i3XjvtpsY27a/SH+v8hdU+2
   qFVq7QWexALYehf6SyW0xAG2vNW5PinM6F/p0Enwqd/55xacdlq3fFuU6
   H+osJr36JcraDCP4ShiqGnYI9OXOXRnY2erNMuscguavTTL+8HJmxfCHX
   YTyI5MusTbbpddmOnvZeodlIiMFHOaPcTLcxkX5JbNnCAACtPDj8FbLLg
   iQ9GjGvXclSnRYXmveAY+TDckqPhN3UHMH45avmhwHwE0nOFWta/QWCJ+
   kBIdGYHptFdQOxPMKJ4HamLg11ey60YwcrdtiX/gkpBarn9bZMxyLGgjY
   Q==;
X-CSE-ConnectionGUID: LPhJvoQ5Rde2Hf2K4jWiAA==
X-CSE-MsgGUID: vaeUC7RZRIaCbrU4ofgmUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3171923"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3171923"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 07:00:55 -0800
X-CSE-ConnectionGUID: n2bh9NRcRi2qglaV294cqg==
X-CSE-MsgGUID: GqSv2yaBQDKEbwGxmDIrqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8502138"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 07:00:51 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 10 Nov 2026 17:00:47 +0200 (EET)
To: Denis Benato <denis.benato@linux.dev>
cc: Chipang Kao <prozac2734@gmail.com>, W_Armin@gmx.de, chipang_kao@asus.com, 
    corentin.chary@gmail.com, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, luke@ljones.dev, 
    platform-driver-x86@vger.kernel.org, scardracs@disroot.org
Subject: Re: [PATCH v6] platform/asus: Move ASUS platform drivers out of
 drivers/platform/x86
In-Reply-To: <e91e759b-d9ff-403c-a968-6fd19ca8707d@linux.dev>
Message-ID: <a93dc80c-617a-b44c-4efe-f0b08dbcd520@linux.intel.com>
References: <20261110065630.270276-1-chipang_kao@asus.com> <179432207917.2180.5316107179972885113.b4-ty@b4> <e91e759b-d9ff-403c-a968-6fd19ca8707d@linux.dev>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1395278430-1794322847=:1229"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1395278430-1794322847=:1229
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 10 Nov 2026, Denis Benato wrote:

> 10 nov 2026 15:48:16 Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>:
>=20
> > On Tue, 10 Nov 2026 14:56:28 +0800, Chipang Kao wrote:
> >
> >> ASUS WMI and related platform drivers currently reside under
> >> drivers/platform/x86/. However, with the emergence of ARM64 devices
> >> utilizing ACPI WMI interfaces, maintaining these drivers exclusively
> >> under x86 creates unnecessary architectural restrictions and Kconfig
> >> duplications.
> >>
> >> To allow non-x86 architectures (such as ARM64) to select and build
> >> the applicable ASUS platform drivers:
> >> 1. Relocate all ASUS platform drivers and headers from
> >> =C2=A0=C2=A0 drivers/platform/x86/ to drivers/platform/asus/.
> >> 2. Create dedicated Kconfig and Makefile under drivers/platform/asus/.
> >> 3. Update drivers/platform/x86/Kconfig to remove duplicated entries.
> >>
> >> [...]
> >
> > Thank you for your contribution, it has been applied to my local
> > review-ilpo-next branch. Note it will show up in the public
> > platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> > local branch there, which might take a while.
> >
> > FYI [if applicable to your patch], as per Linus' policy change, also
> > fixes are mostly routed through for-next unless the fix is for a
> > commit introduced in the most recent cycle or is clearly a regression
> > fix.
> >
>=20
> Hi Ilpo,
>=20
> v5 was resent without my reviewed-by, can you please add it back? Thank y=
ou.

Thanks for spotting. I've now put the tag there.


Chipang,

Generally the Reviewed-by and Tested-by tags should be collected from=20
previous version(s) when preparing to send a new version as maintainer=20
tools only automatically pick them from the current version thread=20
(err'ing to the side caution).

Only if you make really major changes, it might be warranted to drop tags=
=20
but those cases are truly rare.


--=20
 i.

--8323328-1395278430-1794322847=:1229--
