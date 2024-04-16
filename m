Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8530B12BEB6
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Apr 2024 12:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713271371; cv=none; b=CMJ8M7vVH+vw9VuBSiWsuVuGjGv0ZB4DOpqy208LI3CzWnIOsvYtVqgRbFn456onMJtihf7CwFXKBVJKVq0qHhWkYVJUA0b+DnwfFksvQUsNhA7M8U7WQVSd2svWWLYjOWGcCaDWQGilkUn7Jz2LfEJkHC3V73Ed/cKarNtuNZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713271371; c=relaxed/simple;
	bh=ahupOTTvMn/c4LlkrpxeO4Me2P3aIl7x4LqHUt6K94E=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DDiUm/7mmHRHn+ALgmbGdvSMfbmabJ7JLYDewXctXIaiilWtqt1dTv2n4PzhL5sLrjcHP8b2X1/MPLOTbHVS/FQ69U16fSHpRxVQtRlrsQ+CowASwrr5TyULCSgIJBuzbj5XXB23LrStirAkoVi9wOTkS//4Y3TMxHzTM0G71Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kl4OYYVb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kl4OYYVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713271370; x=1744807370;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ahupOTTvMn/c4LlkrpxeO4Me2P3aIl7x4LqHUt6K94E=;
  b=kl4OYYVbmCCpOcankExPAJqdn4+1HSKoL6lN1FLyNllCw24Nj1QupMYO
   /ugxhI4sAnGB/HhHuWU4G2umTjfw2C9FKViwiX3BaA3Mhq0Y4Ib5Xe7aF
   eaOeWc0K7EhHf/IS1CHtRmm1zrffcWjsw5FmV2Q3epUtoMO7eO6Xzxvav
   Y6RBjDyyUyqVzEiLA0aRj4vyRHUWPawQKmI/hAryZQrHpNajaIryrh8Co
   0HZRXrdvWwVNAmQ0AWP1j5XLNv8skgiGruKIsRvwATE0XI+WpFsq/Gv4d
   LzVcFf8g5zHFQ161fTDJGv/ftrn849Xze+LiVNS9sla67EDkTZwjC7ZSp
   g==;
X-CSE-ConnectionGUID: HDbJGX2pSiKqTWiK9myo9g==
X-CSE-MsgGUID: +fPwug9lT7WiVeLKG/R8gg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12482346"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="12482346"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 05:42:49 -0700
X-CSE-ConnectionGUID: QiYllImURayaZsX3vq3S5w==
X-CSE-MsgGUID: uvq58lx/SKOTW5w+L6h33Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="26914608"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.34])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 05:42:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 16 Apr 2024 15:42:42 +0300 (EEST)
To: Mario Limonciello <superm1@gmail.com>
cc: Mario Limonciello <mario.limonciello@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>, 
    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH] platform/x86/amd: Extend Framework 13 quirk to more
 BIOSes
In-Reply-To: <f2ae6813-0e88-4d64-8dd5-465c02061cb6@gmail.com>
Message-ID: <bdd174d6-7097-06b5-16f8-4bda9331e83c@linux.intel.com>
References: <20240410141046.433-1-mario.limonciello@amd.com> <ace9e5fe-0565-b24d-5394-ba4bd9f4305c@linux.intel.com> <f2ae6813-0e88-4d64-8dd5-465c02061cb6@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-320657222-1713271362=:1005"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-320657222-1713271362=:1005
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 16 Apr 2024, Mario Limonciello wrote:
> On 4/16/24 07:24, Ilpo J=C3=A4rvinen wrote:
> > On Wed, 10 Apr 2024, Mario Limonciello wrote:
> >=20
> > > BIOS 03.05 still hasn't fixed the spurious IRQ1 issue.  As it's still
> > > being worked on there is still a possiblitiy that it won't need to
> > > apply to future BIOS releases.
> >=20
> > Hi Mario,
> >=20
> > Could you explain/confirm what the second sentence is supposed to mean?
> > Mainly I mean "it won't need to apply to future", did you perhaps mean =
it
> > might need to be applied still to some future versions too besides this
> > one because the fix is still being worked on, or what?
> >=20
> > There's also "possiblitiy" typo, in case you end up rewriting the messa=
ge
> > and send v2.
> >=20
>=20
> You probably missed my follow up message in the thread, I tried to explai=
n in
> more detail (and also caught the same typo; sorry!)
>=20
> https://lore.kernel.org/platform-driver-x86/ace9e5fe-0565-b24d-5394-ba4bd=
9f4305c@linux.intel.com/T/#mcf25cbfbd9dc5f4aace5b58c56a7f91671b2f0cc

Okay, I had indeed missed that (or probably seen it but didn't recall/make=
=20
the connection now while I started to apply patches).

I'll fix the possibility typo while applying.

--=20
 i.

--8323328-320657222-1713271362=:1005--
