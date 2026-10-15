Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A0D496D4C;
	Thu, 15 Oct 2026 11:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062011; cv=none; b=mN5TTVLtgmrrM1je8RFlwziUpluorts76WGeIuqLRpqC/7NzTt8E3SrLW1KkeBnUbl6WFOq1BwqFFA39oN2bHM6UmxvVHbZ6+OROPEKhQRH9xER1AQHjHOcBVwjLNAfIjVM2ExbN9TxRQlk7dafZDjwKsjGTIegyQDi9lV1omno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062011; c=relaxed/simple;
	bh=ni+cZ2x3SfxVByDI3e+2C4Xsw/g+GmhxtmKn7cBp4sc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gUg7jFHM3/kiDTmDcFTRqZdNIFtcO3xqd4HMca9T4jnwxXygZuA48fs4l1Bj5o6LBfqz3IDstY50UVTxy4TOcIvESs+njATures2hBC9+ZPeV49GuFawBHwKVuvgd6Tts/077TlP8802fcH18EFRKJy8IZLlKL8f6Wg3psuuxow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9/TvslN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9/TvslN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792062010; x=1823598010;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=ni+cZ2x3SfxVByDI3e+2C4Xsw/g+GmhxtmKn7cBp4sc=;
  b=Y9/TvslNnxeg4jrobNKX6mboWs3vxtWOYS+JlCN+ZIMFanz6+izFsNgI
   ZWWRgBr9DtED99q7N2cji40mYz5B29Oeiwme6KqC7Wzwj4a+/7AmWyD2o
   c/LCCMJfGa/05EsNd5m+I20Ug5GB+BWQxSyXfqedeUpYyt9r8POHGm0TW
   6at7lrqhkIaQpO22n853WoY7CPJ9F15MpiZ3ff7wN0FX2vv2nHyFLUZO/
   H5zSZ2NK4yIvUlEWr3/mknULAuO8anzbSnZyskBFRzeUgg0hxtEXugxqV
   vb1OjltgOsQcu2QsuW+osmPwCj2Nw2AhR9tS5p/Jp/34rBSR17ZjwyFts
   w==;
X-CSE-ConnectionGUID: OWxTlkZHRISD1uYnwCTFyQ==
X-CSE-MsgGUID: XPvyiFC8SAGdYNBixjbryQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="848647"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="848647"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 04:00:09 -0700
X-CSE-ConnectionGUID: wTnngkqfT/K/kEDKjJM6Lg==
X-CSE-MsgGUID: JVQWppVZRiyXutzmaJG01g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1629282"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 04:00:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Oct 2026 14:00:02 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, wse@tuxedocomputers.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/5] platform/x86: uniwill-laptop: Lightbar fixes
In-Reply-To: <3a55c989-f16e-40a5-bd2c-201d45c82c85@gmx.de>
Message-ID: <2a516987-83a4-d703-3226-be216e499b1a@linux.intel.com>
References: <20261007144101.323289-1-W_Armin@gmx.de> <179148110928.29028.17146158167227573018.b4-ty@b4> <3a55c989-f16e-40a5-bd2c-201d45c82c85@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1907028847-1791796143=:1222"
Content-ID: <2a956f0f-55d7-6ffb-862e-370cd5140e0f@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1907028847-1791796143=:1222
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <275a563a-ddbf-ce35-07f9-295f7d29c5a7@linux.intel.com>

On Sat, 10 Oct 2026, Armin Wolf wrote:

> Am 08.10.26 um 19:38 schrieb Ilpo J=E4rvinen:
>=20
> > On Wed, 07 Oct 2026 16:38:53 +0200, Armin Wolf wrote:
> >=20
> > > This patch series mainly deals with various issues inside the code
> > > responsible for controlling the lightbar on supported devices.
> > >=20
> > > The first patch utilizes the improved multicolor LED API to report
> > > the correct brightness of the lightbar to userspace. The next two
> > > patches fix issues discovered inside the code for controlling
> > > animations, while the fourth patch fixes an issue with the naming
> > > of the LEDs in general. The last patch also adds support for another
> > > variant of the Intel NUC x15 laptop kit.
> > >=20
> > > [...]
> > Thank you for your contribution, it has been applied to my local
> > review-ilpo-next branch. Note it will show up in the public
> > platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> > local branch there, which might take a while.
>=20
> Thank you :)
>=20
> I noticed that the LED next branch contains a commit that requires trigge=
rs
> to implement a new callback and prints a warning if this is not the case.
>=20
> Should i wait till the next cycle to send a patch implementing said callb=
ack
> or do you want to rebase for-next onto LED next?

=2E..Goes to look at the other repo...

I don't want to base on top of other maintainers next branches (or pull=20
them into my for-next).

I suppose it might be best to make that addition after -rc1 through=20
fixes, or if time permits, already during the merge window in a separate=20
PR after the usual for-next PR.

--
 i.

> Thanks,
> Armin Wolf
>=20
> > FYI [if applicable to your patch], as per Linus' policy change, also
> > fixes are mostly routed through for-next unless the fix is for a
> > commit introduced in the most recent cycle or is clearly a regression
> > fix.
> >=20
> > The list of commits applied:
> > [1/5] platform/x86: uniwill-laptop: Report correct lightbar brightness
> >        commit: de41d8b4d0dbb81c81cd99c245238d878a3e1951
> > [2/5] platform/x86: uniwill-laptop: Implement rainbow animation as trig=
ger
> >        commit: 59e4e406b6c08ad41f3ad86db6d42b82d8539c12
> > [3/5] platform/x86: uniwill-laptop: Fix breathing animation on Intel QC
> >        commit: 969a3bfa474e35828e142d0160f393a97d9bf0ee
> > [4/5] platform/x86: uniwill-laptop: Label multicolor LEDs correctly
> >        commit: 42e6b269fc1134a3fcce57539034ee496e2c1344
> > [5/5] platform/x86: uniwill-laptop: Extend support for the Intel NUC x1=
5
> >        commit: 7a159a14ce0f5d5a3c2f835f39986ec5539ae374
> >=20
> > --
> >   i.
> >=20
> >=20
>=20

--=20
 i.
--8323328-1907028847-1791796143=:1222--
