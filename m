Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F47130D3F8;
	Fri, 18 Sep 2026 15:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744978; cv=none; b=TM80qdKo9BrbI5WedzOdvWdnj6hEGjSnO8mJ1IWCXgnZPO6jkHPcVgC+j1gFDW+q/3abIzlIsNDUKAFb8G8epYpG+/HvwrWgUuWYbWUL8hcFxD/LIqVFm+SKQuUj1AagCeVAuaCFPkCOg5fOzLbiMDACL01FZx9KhalLHoSqwUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744978; c=relaxed/simple;
	bh=t72dqDfvJNySTZ8XHz32yE1D7KDyjG7BBPWi8OxweCk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KbKSjvgD+i5tMTup7VSMbqvC6msWXhzHFEDZYGfyrvbo3dJx1vWnrDSXppjJrMnnaTJEt/B23NLbdH4AoRl1s+eRNUy0Bk3JPUb4oqRO8iigfuG7gQcX+wDWLBLtPEdDAHpUnjOLi6teknvhg5lQHa18Qzm78lenVB/1KVD0Up8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DzaEQETe; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DzaEQETe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789744976; x=1821280976;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=t72dqDfvJNySTZ8XHz32yE1D7KDyjG7BBPWi8OxweCk=;
  b=DzaEQETean7KDyIbuvChs8atbmsKiVviOJPjUHn0snQT55hV8Y9gj8Dy
   ONBkmIHtzWPpu26q+AMreHDjJrByTsZrAuJH0MF7w4cFhv23a/U+PVhZS
   JE1/WKs9kN+fT+TA/Qb3krH7i91JcHlEebBcREr3bqSgx58oLZmebjwOl
   qYJxuzZcKUN1XGypuuWsmKivv5418W/oa3NqzdPAqWjJQR4dxPvtM8syh
   isT/DqBy/rEtb5Ji+OmgMx5ok3XRcGjB9oGRWs6INFk8ck5d2ECPocd3u
   XJZnXqg7Y4KB8ZFDOY7gAqGpBzlOaqDPVDwla7oVVfePpRIvK5neBx6KT
   A==;
X-CSE-ConnectionGUID: D+EHtyK8R1iKC1CJM9+MBQ==
X-CSE-MsgGUID: CZeYBlvtRWmIeKKzBqGoQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="94091923"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="94091923"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 08:22:56 -0700
X-CSE-ConnectionGUID: JFnLB3ZQQwehP36s511sHA==
X-CSE-MsgGUID: fdK71BD2R9KutAy7kkd1WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270752360"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 08:22:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 18 Sep 2026 18:22:50 +0300 (EEST)
To: Aaron Erhardt <aer@tuxedocomputers.com>
cc: wse@tuxedocomputers.com, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 4/6] platform/x86/tuxedo: Fix keyboard LED map
 ordering
In-Reply-To: <dfa01359-e2b3-4e02-85d2-220e48b85594@tuxedocomputers.com>
Message-ID: <4ecaf381-19b3-1473-6262-ebc8e0e471a2@linux.intel.com>
References: <20260826081149.235487-1-aer@tuxedocomputers.com> <20260826081149.235487-5-aer@tuxedocomputers.com> <35453b67-df97-a5a6-99a1-9746500796e9@linux.intel.com> <dfa01359-e2b3-4e02-85d2-220e48b85594@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-952082327-1789744970=:17235"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-952082327-1789744970=:17235
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 15 Sep 2026, Aaron Erhardt wrote:

> Am 15.09.26 um 15:00 schrieb Ilpo J=C3=A4rvinen:
> > On Wed, 26 Aug 2026, Aaron Erhardt wrote:
> >=20
> >> The LED mappings in sirius_16_[iso|ansii]_kbl_map did contain a
> >> flipped line that caused LEDs to turn on in the wrong order when
> >> counting up the Lamp ID.
> >>
> >> Cc: stable@vger.kernel.org
> >=20
> > And the Fixes tag?
>=20
> I assume this is mainly for the stable maintainers to be able to track do=
wn
> when the bug was introduced, right? I thought "Fixes:" would only be used=
 for
> regression bugs.

Fixes tag is not limited to regressions but should be used with any bug=20
to link the commits. And yes, it helps stable people among other things.

Only "bugs" which aren't bugs (cannot be triggered) usually shouldn't have=
=20
one, or comment or style corrections, etc. changes that have no functional=
=20
impact.

> The only commit relevant to this is the one that introduced the driver it=
self:
> cfd84b3f419bf0aec60ecddc92c61b539c339ec9
>=20
> I correct this in the next series.

--=20
 i.

> >> Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
> >> ---
> >>  drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platf=
orm/x86/tuxedo/nb04/wmi_ab.c
> >> index 8f1ffca0430d..2b985b030197 100644
> >> --- a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> >> +++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> >> @@ -232,8 +232,8 @@ static const struct tux_kbl_map_entry_t sirius_16_=
ansii_kbl_map[] =3D {
> >>  =09{ 0x2e, { 246000,  67500, 5250 } },
> >>  =09{ 0x2a, { 269500,  67500, 5250 } },
> >>  =09{ 0x53, { 294500,  67500, 5250 } },
> >> -=09{ 0x55, { 311200,  67500, 5250 } },
> >> -=09{ 0x54, { 327900,  67500, 5250 } },
> >> +=09{ 0x54, { 311200,  67500, 5250 } },
> >> +=09{ 0x55, { 327900,  67500, 5250 } },
> >>  =09{ 0x56, { 344600,  67500, 5250 } },
> >>  =09{ 0x2b, {  31000,  85500, 5500 } },
> >>  =09{ 0x14, {  51500,  85500, 5500 } },
> >> @@ -337,8 +337,8 @@ static const struct tux_kbl_map_entry_t sirius_16_=
iso_kbl_map[] =3D {
> >>  =09{ 0x2e, { 246000,  67500, 5250 } },
> >>  =09{ 0x2a, { 269500,  67500, 5250 } },
> >>  =09{ 0x53, { 294500,  67500, 5250 } },
> >> -=09{ 0x55, { 311200,  67500, 5250 } },
> >> -=09{ 0x54, { 327900,  67500, 5250 } },
> >> +=09{ 0x54, { 311200,  67500, 5250 } },
> >> +=09{ 0x55, { 327900,  67500, 5250 } },
> >>  =09{ 0x56, { 344600,  67500, 5250 } },
> >>  =09{ 0x2b, {  31000,  85500, 5500 } },
> >>  =09{ 0x14, {  51500,  85500, 5500 } },
> >>
> >=20
>=20
--8323328-952082327-1789744970=:17235--
