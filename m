Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000C24D9F67;
	Mon, 21 Sep 2026 17:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790011387; cv=none; b=r+r1gzltwNlQEAWTeA6J1wBybTOykkJXtyTzaK+bmhvcZE9o1IRQJQvqVp1j+qIiesivNm0/TBLObFEqJcJileKeRGl+clf4GsEQsKfzzUUZEgDxlYXBnYLUiyHVOoZ9kgvd5sUSCByNeXn2yPn51tBmYZftWJJEuT6N7UsE8Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790011387; c=relaxed/simple;
	bh=awOoPhvEwiDjaTELZ44BzD5ZD4IHyJn878O/Vf7OXMg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Sw+vJNLKX6UyTEvDhM5UOAbCMDHZdvd9lyUYgoTX76SCURnFlDG0IdejD6EGm8w9In5eMjW+dS1lTOT4FX1fFq7LBqQu0aycJ4cnyGlUoUiyN0Cu/ZooniYWpA0AsSKJsbDZWlZjFkTtNuN9XIckJ8ro8wkLJTS+sIXDDAJqUj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdqajYoM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdqajYoM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790011385; x=1821547385;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=awOoPhvEwiDjaTELZ44BzD5ZD4IHyJn878O/Vf7OXMg=;
  b=fdqajYoMw+W8pSOZyUBDScL9ebqrz09WVNC8s2fWyIin2DrFzohvzLma
   qbDTXjtzPl+/fOUtX8EF6FlzLAJ+w63a5ok5uxgdLj/B68A7CZ85sKDI3
   tCaxHfRkLZHwfjPV4v+986nRWIShuOZ1SWYDISgsfrf7WLBewVLGTDgUU
   zFx5a8YE0wUWdM/1xA4QFg7KqU0gVnd16rT/HxzFkgirTxuXy/KUfXD6K
   i4wqkuNFAnIkAp14xLK0mWhzqnh4bYOfVPunWu3A7viCEn699bmT6jHdK
   6UTbJehQOqym8qukBALYTiSROG5T2gtCUOthGIT0Evp70bKy7lF9/QAuI
   A==;
X-CSE-ConnectionGUID: JLp8V5d4SJOLc6LGt2U6Gw==
X-CSE-MsgGUID: 8r1mcDv5S4e141xahLWtkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89474104"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="89474104"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 10:23:04 -0700
X-CSE-ConnectionGUID: BXYOFdXFSZSQAxfe6DFVmg==
X-CSE-MsgGUID: kFtUa45NRNej9q00DerF0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="271267160"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.215])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 10:23:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 21 Sep 2026 20:22:59 +0300 (EEST)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: Hans de Goede <hansg@kernel.org>, 
    "open list:AMD HETERO CORE HARDWARE FEEDBACK DRIVER" <platform-driver-x86@vger.kernel.org>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Fix a few Sashiko flagged issues on AMD_HFI
In-Reply-To: <92a0c8c3-3db1-4252-9c84-9a91ca8681c7@amd.com>
Message-ID: <a82ef9e8-7c71-0638-bf2f-b354a1ec62c6@linux.intel.com>
References: <20260921170411.1149960-1-mario.limonciello@amd.com> <d70bc046-49bd-79b2-7df7-57d79046c507@linux.intel.com> <92a0c8c3-3db1-4252-9c84-9a91ca8681c7@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-686406211-1790011379=:1213"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-686406211-1790011379=:1213
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 21 Sep 2026, Mario Limonciello wrote:
> On 9/21/26 12:10, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 21 Sep 2026, Mario Limonciello wrote:
> >=20
> > > Sashiko flagged a few instances that could trigger out of bounds or
> > > use-after-free.  This series fixes them.
> >=20
> > Hi,
> >=20
> > I suppose it would be fair to credit sashiko with tags.
> >=20
> > > Mario Limonciello (3):
> > >    platform/x86/amd: hfi: Fix a use-after-free when unloading the dri=
ver
> > >    platform/x86/amd: hfi: Fix out-of-bounds reads when parsing rankin=
g
> > >      data
> > >    platform/x86/amd: hfi: Rely on ACPI enumeration instead of a dummy
> > >      device
> > >=20
> > >   drivers/platform/x86/amd/hfi/hfi.c | 34 ++++++++++++++++++---------=
---
> > >   1 file changed, 21 insertions(+), 13 deletions(-)
> > >=20
> > >=20
> >=20
>=20
> What tag would I use?  The Sashiko URLs appear to be private (or at least=
 I
> need to be logged in).
>=20
> Something like:
>=20
> Reported-by: Sashiko
>=20
> or
>=20
> Reported-by: Sashiko
> Closes: <private-sashiko-url>

People have used:

Reported-by: Sashiko <sashiko-bot@kernel.org>
+ Closes tag

For the publically reviewed patches, the patches and their comments can be=
=20
looked up from https://sashiko.dev . I'm not logged anywhere and can=20
access at least those urls just fine. But if you for some reason cannot=20
find a working link (w/o requiring login), we can just leave the Closes=20
tag out.


--=20
 i.

--8323328-686406211-1790011379=:1213--
