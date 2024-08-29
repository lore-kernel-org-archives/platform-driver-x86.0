Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6E718E756
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Aug 2024 11:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724931093; cv=none; b=uz32TQcfNFMh0PUled2S6O1LrlDaaB/jV3IaNKmHghHkgwWQ0UUTohNeYK5G895v6CQ9MGIYnnkSRCY2qZQFN25WZOG/jn20bDXS1n+wpELcR0nXks4pOw8H3ZTLtwBEeXE6kvENrhit/mjdJqAFNvnTB2tYIXUwpJlGdvSfrtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724931093; c=relaxed/simple;
	bh=7Q/ZPLybfEyXw8OJc+kAQkJYqgoKBpXYFa6wU7P2L7g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OlaZH2GObK7ZLAfKtSv/WKmnRjmzLMxj6Q/cdHZHXlX7t4sm776j0dEt4h8/ky44DcOknQAlldZmAy+3ebdmsaiqtEL20+oKLqPxhrOgS6wPLShZjO+9isema4rJ2/4ORmQV9Ddvi0F+slPA4cya3Wt6qvvSBLNGa57VrerxTtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=THgcMcC6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="THgcMcC6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724931092; x=1756467092;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7Q/ZPLybfEyXw8OJc+kAQkJYqgoKBpXYFa6wU7P2L7g=;
  b=THgcMcC6grBU7r9/jMaLnYnGtvZyKcMMD6Fc6FZz7cavSwpd+kyfg2lX
   OGh7uvaNemRGGwa666hum/Eb2CmpaLf3HNhpeqWlZf1SHAtVccHz1kTpK
   DT2w5fPbKZt+qcxBMcELGRdid8H4zOtmwpZvFRrUB8CYstD0lGuLegMeN
   lgoa36nexqJ8DF/09X7qXJq+9QTWeieZTT9ebTn5/bUhqh5kEwBgNDZVC
   aYD32LSwVdR9lrmKVkfyAmEJRmKGcCwGiVZumgPYkP21FL3n91xYQzIGn
   2VtbgPmHi5pTa9MJ3x8ADcquQtk117hCutkxrmj/tpz1bPaqZ37lqwqFL
   Q==;
X-CSE-ConnectionGUID: 7EInXsRRQ1q6HQ/0x4OOuw==
X-CSE-MsgGUID: qpt1LNfsSZ+C0+QVVw8HJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="46031384"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="46031384"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 04:31:31 -0700
X-CSE-ConnectionGUID: ikaU2u84SDephFIiz+FFqQ==
X-CSE-MsgGUID: IcKvzlSHTQOpG3uEd7njiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="68213505"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.59])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 04:31:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 29 Aug 2024 14:31:24 +0300 (EEST)
To: Suma Hegde <Suma.Hegde@amd.com>, Hans de Goede <hdegoede@redhat.com>
cc: platform-driver-x86@vger.kernel.org, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v6 08/10] platform/x86/amd/hsmp: Create mutually exclusive ACPI
 and plat drivers
In-Reply-To: <1b183743-1b78-41cc-a121-1fa6345fa397@amd.com>
Message-ID: <66fd6c95-7a16-b9f5-6efd-232c947ac514@linux.intel.com>
References: <20240829060617.1548658-1-suma.hegde@amd.com> <20240829060617.1548658-8-suma.hegde@amd.com> <9d0e3305-d957-621b-202e-5919b4aa6cb8@linux.intel.com> <1b183743-1b78-41cc-a121-1fa6345fa397@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1897343294-1724931084=:1289"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1897343294-1724931084=:1289
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 29 Aug 2024, Suma Hegde wrote:
> On 8/29/2024 3:55 PM, Ilpo J=C3=A4rvinen wrote:
> >=20
> > On Thu, 29 Aug 2024, Suma Hegde wrote:
> >=20
> > > Separate the probes for HSMP ACPI and platform device drivers.
> > >=20
> > > Provide a Kconfig option to choose between
> > > ACPI or the platform device based driver.
> > > The common code which is the core part of the HSMP driver
> > > maintained at hsmp.c is guarded by AMD_HSMP config and is selected by
> > > these two driver configs.
> > >=20
> > > Also add "|| COMPILE_TEST" clause in Kconfig to get build coverage
> > > for HSMP.
> > >=20
> > > Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> > > Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.co=
m>
> > > ---
> > > Changes since v5:
> > > 1. Update documentation to reduce line length, update SPDK line and u=
pdate
> > > the wordings.
> > > 2. Change module license from GPL v2 to GPL and update SPDX license l=
ine
> > > in plat.c and acpi.c.
> > Hi Suma,
> >=20
> > Just to be sure you're not doing the SPDX license line change because o=
f
> > what I said, the change in MODULE_LICENSE() from "GPL v2" -> "GPL" by n=
o
> > means implies SPDX license has to be changed from "GPL-2.0" to
> > "GPL-2.0-or-later".
> >=20
> > I'm sorry about the confusion I might have caused.
> >=20
> > If I've understood correctly, MODULE_LICENSE()'s value is mainly used t=
o
> > determine eg. which exports (if the _GPL EXPORTs can be used) can be
> > used and taint flags, and that does not require knowing exact GPL versi=
on
> > so it was simplified to "GPL" long time ago w/o requirement to change t=
he
> > oldones (to avoid unnecessary churn).
>=20
> I wanted to update the license to "GPL-2.0-or-later" instead of "GPL-2.0"=
,
> that's the main reason I modified SPDX line.
>=20
> But I missed to update the license for hsmp.h and hsmp.c files. I will se=
nd v7
> with this change and addressing other comments.
>=20
> Kindly respond me if the SPDX license update has to be made as a separate
> patch.
>=20
> Thank you.

I've never really come across patches that attempt change the license of a=
=20
file (I haven't been around as a maintainer that long). The obvious=20
problem here is that you're not the sole contributor to this code.

Hans, have you come across this kind of case before?

--=20
 i.

--8323328-1897343294-1724931084=:1289--
