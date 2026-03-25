Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274603D6CB3;
	Wed, 25 Mar 2026 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444004; cv=none; b=CKzcr274U+zVX5C/PNJ5qd7vLy5ELbFcxHMh0R2Ohnnkm6MxNkNl+Lqmm/eU638Ez1WpoZDT/xu67PgrYAMDrc8YKEWU5ULCQH7jZgNMXRkZRbGT0s8J84+IYGNLfIW/XKjDIqHeVwBfGsHMQgUzeVv5o5k1ff5Obu3wyFETM80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444004; c=relaxed/simple;
	bh=ysGgkm7RAbMGLbp+nmakxZ2OFqthXnUOMciBC0itf8Q=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HUYULNsdwZLwb9e8Z9Zbnxi4IS7MNyWMODN/F48SN6ZA1NfKAYuU9kH0c5YGM8hVKdL6rUssoGNS0P4/m5cmUn3jrKbTaV14J1W6piysGjOZrCNIslTF63MTbs7RNctyCa4Naj1JsicFTzLH3v7ooGbMo+6rVYpbPbW5/EueeDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xvgt3OXD; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xvgt3OXD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774444003; x=1805980003;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ysGgkm7RAbMGLbp+nmakxZ2OFqthXnUOMciBC0itf8Q=;
  b=Xvgt3OXDUJSZAuXEv0dPZjZkpC1AhPdPbs5h/n3VOs8UFg9UW6iztBpo
   E666vhyTbEx8kFbbgHE/c8JbKwyejvdA3MuJ8KyVMxerPH+n90ema4kXa
   gNWJcLZGy0xxT8oJ25uqT7lSSa4trfXbZgKE1oLbIEizrE8/vnw/1iPG0
   3ioXFvPMawBoTfyOwzUutrIxli+5aHQLX2skzLvZyx8Ojdk5DuRS+m8Vt
   h+rrMBFZyUoX/J8R08+awOd9ty1cdujhlOSBJsFaOzWHqNc2rVvnr06gS
   o9T547SHsIXpTuIcBKhTq5FCDLalI6Pcu683MXHW/LJenAlhy3i4wMjuZ
   A==;
X-CSE-ConnectionGUID: pDwRo5uuQmGuRXUGo7MAjA==
X-CSE-MsgGUID: SqKPUF9mSx6Yg5eSGeIejA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="63025996"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="63025996"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:06:43 -0700
X-CSE-ConnectionGUID: 9s7RfkYpSzSW8+0lkUiisA==
X-CSE-MsgGUID: gaY2/oQuTkunKn2u1oX30w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="224686563"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:06:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Mar 2026 15:06:36 +0200 (EET)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 0/5] platform/x86: uniwill-laptop: More support for
 TUXEDO devices
In-Reply-To: <84878980-ff70-42bc-8556-0a21f30a5290@tuxedocomputers.com>
Message-ID: <d89927ca-db50-f060-0ad9-804e91126656@linux.intel.com>
References: <20260324203413.454361-1-wse@tuxedocomputers.com> <704a7de4-ee2e-5f1b-56e1-452fbb1af242@linux.intel.com> <84878980-ff70-42bc-8556-0a21f30a5290@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-130147530-1774443996=:976"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-130147530-1774443996=:976
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 25 Mar 2026, Werner Sembach wrote:

> Hi,
>=20
> Am 25.03.26 um 13:40 schrieb Ilpo J=C3=A4rvinen:
> > On Tue, 24 Mar 2026, Werner Sembach wrote:
> >=20
> > > v2: Incorporate Armins feedback.
> > > v3: Incorporate more of Armins feedback.
> > >      Rework USB-C power prio functions
> > > v4: Readd system vendor SchenkerTechnologiesGmbH for XMG FUSION (L19)
> > >      Replace for loops with if statements for USB-C power priority
> > > functions
> > >      Add missing mutex in usb_c_power_priority_restore
> > > v5: Restructure patch around new entry for XMG Fusion
> > >      Add missing Reviewed-by and Tested-by
> > >      Spelling fixes in documentation
> > > v6: Fix small format error in docs
> > >      Fix Reviewed-by line
> > > v7: Variable rename to lowercase
> > > v8: Move USB-C power priority init to after probe call
> > >      Clarify documentation
> > Hi,
> >=20
> > Does this conflict with something that went through the fixes branch? I
> > tried applying this through for-next and get fails so I guess I'll have
> > to merge fixes to for-next before I can apply this.
> >=20
> > It would be nice to mention any known conflicts in the coverletter.
>=20
> sorry, I thought the base-commit line was enough
>=20
> it applies cleanly to v7.0-rc3 and v7.0-rc4
>=20
> earlier rc versions of 7.0 are missing a required patch

Okay, so there's a dependency for some commit that went through 'fixes'?

> maybe for-next is not yet rebased on the latest rc?

'fixes' and 'for-next' are sort of independent normally. Both are based at=
=20
-rc1.

I don't rebase 'for-next' from -rc1. If there's a conflict or some 'fixes'=
=20
commit needed for a work to be done in 'for-next', I'll resolve those by=20
merging 'fixes' changes back into 'for-next.

> I will have a look

--=20
 i.

--8323328-130147530-1774443996=:976--
