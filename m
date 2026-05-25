Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808303E8349;
	Mon, 25 May 2026 09:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779703086; cv=none; b=SfHgDgWcfny9x/vT8WfCMUuJSWrivMU8OBYMnGwipK887afZFEcGHtObXerxgpE4Yl6sIgpS3ZRsyYYvj0YimZ1/cu+JkqfVAE6iFJL2f39AOM8oWcQN2qBtmnDw4nXwcOG07G8xCUq/kVR+7+7T+/iIo1g700TUfDDpSsQUPa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779703086; c=relaxed/simple;
	bh=f2ye225NC7tH6EjN8G4DCdmB7Srp40FqCsumzbUAupQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cLYuHZ7Dhpm4L3NFUX4Nr8GYTY1/cMJWh824wP6ZwPhdGE1WCE3TbLdDEsIOZd/IZQe+mLXBqE+oIebDlSnCJRv9H0O6jMwdQ/QcFlF4mjrpHSaScn3Zwf1Ujk9c3SXxAU3kBL3ojaJCDJraEKxwK+rzyFYpI9q4enxwo8I9zog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jFtnM/oi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jFtnM/oi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779703084; x=1811239084;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=f2ye225NC7tH6EjN8G4DCdmB7Srp40FqCsumzbUAupQ=;
  b=jFtnM/oi4dWsT7dMECQXQN5/tDcojGRc8MVcmXZH3yIuu0vtbcLSTQc7
   1uzqtBO5ZVmyJ17tROgdVi69k+rWBE2Q/WU/W/z1o09x5fuv0hm6gM9Qj
   Ce6BAjMWM2vXtYqnEDa1tBxpWNa4RDBC5JI+uxxgKIFzFhUZsV49EyjL8
   X8UlinHK4HEQXkgkYoNqGBO8pwSO7lBVLqLM9EVMpWoGZ9ChYTf5u3aZv
   29W4HNLj45c+FGotRsVnecdpmDaCorv/Aqdh9QNzwpqytOKzCX+0RZ5ET
   D5WsplOTytAFudZCRBTl492OYI2h2eyD38jmGhWCWL1TKGR4JK5Bxn7tS
   w==;
X-CSE-ConnectionGUID: 5KlQQ1jnReiyN8lKaG1QWQ==
X-CSE-MsgGUID: YrL0JGWXRxanTvQtQb1nAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="80640640"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="80640640"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 02:58:04 -0700
X-CSE-ConnectionGUID: +rVtBaluTIi4EFJAdXDjyQ==
X-CSE-MsgGUID: TqvMqvUKT4SSyyJ6gN6O/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="238988108"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.234])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 02:58:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 25 May 2026 12:55:07 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, wse@tuxedocomputers.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/8] platform/x86: uniwill-laptop: Charging-related
 improvements
In-Reply-To: <ef98a5f8-d62c-465c-9f15-5958cd92c49e@gmx.de>
Message-ID: <4b691f39-8591-660f-3b5e-271f339d8fcd@linux.intel.com>
References: <20260512232145.329260-1-W_Armin@gmx.de> <177920193411.22546.9855747319755001624.b4-ty@linux.intel.com> <ef98a5f8-d62c-465c-9f15-5958cd92c49e@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1269248311-1779702907=:1159"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1269248311-1779702907=:1159
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 23 May 2026, Armin Wolf wrote:

> Am 19.05.26 um 16:45 schrieb Ilpo J=C3=A4rvinen:
>=20
> > On Wed, 13 May 2026 01:21:37 +0200, Armin Wolf wrote:
> >=20
> > > This patch series contains various charging-related improvements
> > > for the uniwill-laptop driver. The first two patches fix some minor
> > > issues inside the charging threshold code, while the third patch
> > > fixes an issue inside the module initialization code. The next two
> > > patches contain some preparations for the main patch. Said patch
> > > introduces support for controlling the charging modes available
> > > on many Uniwill-based devices not sold by Intel. The last patch
> > > whitelists most Tuxedo devices for using the battery charge modes.
> > >=20
> > > [...]
> >=20
> > Thank you for your contribution, it has been applied to my local
> > review-ilpo-fixes branch. Note it will show up in the public
> > platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
> > local branch there, which might take a while.
>=20
> Thank you :)
>=20
> Is there a special reason why only the first four commits are actually
> available
> on the fixes branch?

Yes, there is.

I was planning on merging the rest through for-next as I didn't categorize=
=20
them as important fixes. I'll get to it some time this week.

--
 i.

> Thanks,
> Armin Wolf
>=20
> >=20
> > The list of commits applied:
> > [1/8] platform/x86: uniwill-laptop: Properly initialize charging thresh=
old
> >        commit: c12cc42dadd85dea210d5699d4f21def827382eb
> > [2/8] platform/x86: uniwill-laptop: Accept charging threshold of 0
> >        commit: c16a4823cc60a32b891f7a148bb30c0f51d12cf4
> > [3/8] platform/x86: uniwill-laptop: Fix behavior of "force" module para=
m
> >        commit: fb4b67c44557cb4cbb15900083d4e1af22320339
> > [4/8] platform/x86: uniwill-laptop: Do not enable the charging limit ev=
en
> > when forced
> >        commit: 26cbe119f99c86dcb4a0136d2bc73c0c716d80e4
> > [5/8] platform/x86: uniwill-laptop: Rework FN lock/super key suspend
> > handling
> >        (no commit info)
> > [6/8] platform/x86: uniwill-laptop: Mark EC_ADDR_OEM_4 as volatile
> >        (no commit info)
> > [7/8] platform/x86: uniwill-laptop: Add support for battery charge mode=
s
> >        (no commit info)
> > [8/8] platform/x86: uniwill-laptop: Enable battery charge modes on supp=
orted
> > devices
> >        (no commit info)

--8323328-1269248311-1779702907=:1159--
