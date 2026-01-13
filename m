Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3CE231858
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jan 2026 14:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315112; cv=none; b=CMrRHPzcMqqIlGS9nSr4+90tn1DazwjCRZKCPZIh5rO0omWLD6zFISELZM6rMgAqIa8pHVewE5MLK+LGOXUWIp5/x1drg2nqPsqHKXOxa1CFajya+Ti889HMDxjy8IbYTkTzdDWqlv8LETs1faOV6kjG+p3iS/x0Pt8eRVPvhEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315112; c=relaxed/simple;
	bh=pMr8j4zMO3Lo6hRqjxF7/Nq1d5ViRPtx5GASQ5qGkCs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pbwFnHiJWc5y43+9fTwqy9xrwT5mmnj6/BWxVrBHCX2aBX9sEybYh8lpoBL1+LtfD1qnj+C6fIwfMLCBngYmDH2fzoEHjxdhHD7MFGfm8VoCorqBUjRt7o2bAJ1PNNW2ycYfihguTCakEXrEgUxzl5jKilK8lH7+Fmvm4rCRX1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUZOVTAM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUZOVTAM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768315110; x=1799851110;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pMr8j4zMO3Lo6hRqjxF7/Nq1d5ViRPtx5GASQ5qGkCs=;
  b=iUZOVTAMproxxiFUCas7oq92o6Q/rwotRvn+RdSrF4lpJ1a9OnHKHmjw
   EwP++dPGpUCMYqpxBlIUyxvLvWV9xGwleta+0mgR8Fw8VlRkv3UDNhYKd
   cxO0tW9ErXlDaK7scCRFCYKsNknJUMpf5j7LedZewum096+RNixbPx6fI
   n5O4TjbEg6Rvn4SNVGxnVR4tS8hsbIIh/cx8TEoETb+2523nale/3nnkV
   5Zfdetq5xVnRmjiLW2KRwboRe2MIlh2SIODJb/bi40tqOFfjbf/ty1BfG
   +WaC4Xhxo6hXBDQY2z8Cjz7nchgwXjq++pTAK1KBWdZJ0qRcp4/n99P20
   g==;
X-CSE-ConnectionGUID: b4fFX8uETM2IlxYeSCK8Pg==
X-CSE-MsgGUID: Av+XqXOiSOqbXH0O1+XB0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73441473"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73441473"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:38:27 -0800
X-CSE-ConnectionGUID: 5t0WjVB0SdeQ4QfrjxB7Xw==
X-CSE-MsgGUID: mcbSh4fNSLee6XgyWNdl7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204480022"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.10])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:38:25 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 13 Jan 2026 16:38:22 +0200 (EET)
To: Krishna Chomal <krishna.chomal108@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Fix Omen 16-wf1xxx thermal profile and add EC
 readback
In-Reply-To: <aWZGNQKt61SzH14d@archlinux>
Message-ID: <ee7aa07d-1cf4-dc74-856d-03a8ceea7778@linux.intel.com>
References: <20251218124303.22024-1-krishna.chomal108@gmail.com> <176823207511.9723.10021168845490287383.b4-ty@linux.intel.com> <aWZGNQKt61SzH14d@archlinux>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2134474321-1768315102=:966"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2134474321-1768315102=:966
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 13 Jan 2026, Krishna Chomal wrote:

> On Mon, Jan 12, 2026 at 05:34:35PM +0200, Ilpo J=C3=A4rvinen wrote:
> > On Thu, 18 Dec 2025 18:13:01 +0530, Krishna Chomal wrote:
> >=20
> > > This series fixes incorrect thermal profile parameters sent for HP Om=
en
> > > 16-wf1xxx and implements hardware readback support for Victus S therm=
al
> > > profiles.
> > >=20
> > > The first patch refactors the DMI handling for Victus S boards. By
> > > moving from simple string list to DMI system id table with driver_dat=
a,
> > > we can now map each board to its correct thermal parameters.
> > >=20
> > > [...]
> >=20
> >=20
> > Thank you for your contribution, it has been applied to my local
> > review-ilpo-next branch. Note it will show up in the public
> > platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> > local branch there, which might take a while.
> >=20
> > The list of commits applied:
> > [1/2] platform/x86: hp-wmi: fix platform profile values for Omen 16-wf1=
xxx
> >      commit: d8bf01424f9eb555bf13b802a8ddffbb49f221a7
> > [2/2] platform/x86: hp-wmi: Add EC offsets to read Victus S thermal pro=
file
> >      commit: 2511dd4dbb76ef6914c9b45ccba2492da25d772d
> >=20
> > --
> > i.
> >=20
>=20
> Hi Ilpo,
>=20
> I want to inform you about a potential issue in patch 2/2. My implementat=
ion
> assumed a strict correlation between WMI command types and EC layouts,
> but I have discovered this isn't universal. Some boards (like 8E35, not
> present in this driver right now) use Victus S WMI commands but retain
> the older EC layout (thermal profile offset: 0x95). Directly using
> offset 0x59 for victus_s devices would not work for boards like 8E35.
>=20
> To fix this, I suggest updating platform_profile_victus_s_get_ec(), to
> check both of these offsets for a valid thermal profile.
>=20
> I can either:
> 1. Send a follow-up patch to implement this iterative check.
> 2. Send a v5 with this logic integrated, if you prefer to drop the
>    current series from your review branch.
>=20
> Please let me know which path you prefer.

Thanks for following through!

Please just send v5 as I had to drop the wmi series anyway from the=20
review-ilpo-next branch so this was easy drop while at it.

--=20
 i.

--8323328-2134474321-1768315102=:966--
