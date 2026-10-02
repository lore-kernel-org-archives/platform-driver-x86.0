Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7772A33D6FA;
	Fri,  2 Oct 2026 09:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932925; cv=none; b=l2760fU1FS3D6agZiJtKFmPjM91kjGboDy63+wjG99uOMZMyotvrtSzD7Lo7Udcc7dVK1VAuJ5mxtF0iyWtGa5EBq4aO7D/ecz4R7mJOFWfX59sJHDLqIQ/67Jy7LMc3qKWSNaW0gGN0raYkNJXKzyU8wLexNrvg2AoFp58zhnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932925; c=relaxed/simple;
	bh=Nt5EyLv2fa36Fy83aGx/2D36CTVlUMueBXMpWlZ6ROg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kxDPRfcDpRd71g6VrB6LowvT5+zEE3WEto0ln32wHDXp+ubExs+m4oPehuvNsY4hoFwURm5/Zsej2y4jg2komMn7TNfput7PTCpn63xguFh3QNw2IoFKujQvuhxPxhzmfsKNjHge0uanhBLejLX3XrKxoTA69PJavEILd4+pODs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpTxvhJf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpTxvhJf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790932924; x=1822468924;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=Nt5EyLv2fa36Fy83aGx/2D36CTVlUMueBXMpWlZ6ROg=;
  b=GpTxvhJfgDmdL+WuxYDVS7Dd3sN/992oC1DquKu3Cc66PN4XTRpKveBv
   u9sHM1JaimcJlXtHFP488sFTblH2WbVRE94fuhEA7hwq0LFXU5Ku2RoTy
   ayagxPsr5ZR89qTxfao3jA9tWLFhHnpn8gY9f13Ev6EjTGOzMRtc+KxCz
   VJSXCuDZ8I/FmJLHAvkx35msEql85ODVB82BTYeItvJ/aU483W87fRci2
   CG5+I+B4qvTR7c2Xg89Ggi7V7solLBKTQrwiAmQtOZvT3hfQ7qCr1dKO/
   llZu/zxyiCF/IvwvjGV3HGS2jej/hPuZheLbXiFXPO3fqWK/F4bMUNbsV
   w==;
X-CSE-ConnectionGUID: WfuPCUicT6iYcI3z+qmamQ==
X-CSE-MsgGUID: NE7HOWtYS3qkmwVGHgBmNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90557661"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90557661"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 02:22:03 -0700
X-CSE-ConnectionGUID: 06h8DB5gRWSN9CV3dAG2Ag==
X-CSE-MsgGUID: rylX1TlzS/mE7df6bmtAVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="296972"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.243])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 02:21:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 2 Oct 2026 12:21:52 +0300 (EEST)
To: =?ISO-8859-15?Q?Milo=A8_Vlku?= <vlku.milos.fun@gmail.com>, 
    Chris Taraszka <chris@miget.com>, 
    TuteMthCD <matias.civadda2342001@gmail.com>
cc: Anton Karasev <uselessfire@gmail.com>, qby140326@gmail.com, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, W_Armin@gmx.de, 
    ilya.gladyshev@linux.dev, foxido@foxido.dev, kento@kekto.ru, 
    ericted8810@gmail.com, chris@miget.com, matias.civadda2342001@gmail.com, 
    btx342@gmail.com, wleizc7319@gmail.com, wolf109909@outlook.com, 
    i@rsplwe.com, bozhenpeng93@gmail.com, martiya.ar@gmail.com, 
    aleksejirlik@"gmail.com."
Subject: Re: [PATCH v6 5/5] platform/x86: bitland-mifs-wmi: Add per-machine
 ops table
In-Reply-To: <CAObHBTxHQDfVH8Su1DLABtC5uUsAGBBk=KvcCOvtTs5gMGamnA@mail.gmail.com>
Message-ID: <094577b3-7b96-72b6-4ef2-a5d1db457401@linux.intel.com>
References: <20260929134503.17249-1-qby140326@gmail.com> <20260929134503.17249-6-qby140326@gmail.com> <20260930015058.3076905-1-uselessfire@gmail.com> <CAObHBTwnv+kEaFdCp+cr31HtdSo3CaRq84T8vr-Pm75yZMTHqQ@mail.gmail.com>
 <CAObHBTxHQDfVH8Su1DLABtC5uUsAGBBk=KvcCOvtTs5gMGamnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-2103700365-1790932364=:1156"
Content-ID: <58a7a029-f367-3239-dee5-b474576ac249@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2103700365-1790932364=:1156
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <0f932454-0725-531a-b22c-5bf2dd13f436@linux.intel.com>

On Fri, 2 Oct 2026, Milo=A8 Vlku wrote:

> Follow-up to my own mail: I have now run those values rather than only
> reading them out of the tables.
>=20
> Built current pdx86 for-next with Chris's GET-only function-id change
> and balanced 1 / quiet 2 / performance 3 / full speed 4 on top. All four
> profiles apply and read back correctly, checked against the EC register
> each time:
>=20
>   low-power            -> QFAN 2
>   balanced             -> QFAN 1
>   balanced-performance -> QFAN 3
>   performance          -> QFAN 4
>=20
> All three power-profiles-daemon profiles work as well, so the desktop
> slider works end to end on TM2307.
>=20
> Two things fell out of that:
>=20
> - Without Chris's change every one of those writes fails with -ENOMSG
>   here, exactly as you described, and with it all of them succeed. So
>   that is a Tested-by from a second board if it is useful.
>=20
> - No machine-specific capability check is needed on this one.
>   WMI_FN_SYSTEM_AC_TYPE is unimplemented, Armin's work reports that as
>   -EOPNOTSUPP, and bitland_pp_check_capability() already treats that as
>   "skip the check". The stock one is fine as-is.
>=20
> So the TM2307 entry comes out as just a mode map plus a DMI match.
> Attached, against the v9 ops table and checkpatch-clean, in case it is
> useful to have in hand while you write the TM2309 one. I will resend it
> properly once that series settles -- posting it now mainly so the values
> sit somewhere concrete, and Mingyou can fold it straight into v10 if
> that is easier than carrying a separate patch.

Hi Milos,

The profile map approach used by Mingyou's patch 5 is not generic enough=20
to handle all variation out there so please don't base on top of that.

We're currently trying to build a generalized approach for the known=20
profile variations:

https://lore.kernel.org/all/20260928153902.139956-1-chris@miget.com/
https://lore.kernel.org/all/20260928064918.80526-1-matias.civadda2342001@gm=
ail.com/

AFAIK, Chris has not yet sent the updated series which would have the=20
latest version of the generalized profile approach. But once that is out,=
=20
you should base your model's profiles on top of it.

--=20
 i.
--8323328-2103700365-1790932364=:1156--
