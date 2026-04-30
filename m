Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179B640F8C2;
	Thu, 30 Apr 2026 12:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553837; cv=none; b=YFH9nJao3ItMoyghc4ZK4KZFPHtvx0w+P3rjpSr51tchIKCn29E+AXA0KaDTk9i71FtT9Z7JS0GqTz/uHyI9veI1orX5oJd2gYcnSyHwBmKA0nbdt6od2q9rUGjldcAgxvpT/EZksdgUUJM8jxL7Om7IK63l4MiL/ZBLkwXasUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553837; c=relaxed/simple;
	bh=xtKpexkPVNyZJ7ibWhax9nqxFvQngw9lQ6T1KDCJjnc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=d9n9f2mCNAfVxIB0SiY32FlXdBMqXPScsnis+EOmdUuq2mis+ErwTfYLIFOcp8cV9+CvjzI1QlRzzIAi4f0x2UBvmqxd6i4snOF3aPfNgSs1p2kFqOAK/Ks87jmHjECp2fCbwgFFTPjEtFfQ/tfxJ45A1UFrtD8Rdb4Uh3k8J5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/Lm342M; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/Lm342M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777553836; x=1809089836;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xtKpexkPVNyZJ7ibWhax9nqxFvQngw9lQ6T1KDCJjnc=;
  b=k/Lm342MNudsFQ80cBN2htGhIX2tG01fhIvIIa1UAEbxT3xtbg+9AsbX
   +cjdSUIvOJnCq6tiAPBqdaMDnRec/mEldVgbBUHxUVreyHttt2jcF9BNt
   zfqgRMCgsnWJAQiFENr6O+1VDMWyRCKb9TkMsnQfxrAVpXSWA5d806NX5
   4FXCNCCpbF0gEpA0KGLcp8XTTZPTuy3IpQ+s1Kd6PMF+MuYC4TBhbqWs4
   hoGib1acQD/JOzplT6cKZnAwDaDcuDtHPjBpPCWFZt36CPchbDjriEdyf
   dOJ7m7Bplu4DJlhPe0yjK2PlSW2gF5sYcag11qKlvNLkRrXSjZ9yCb8Ys
   A==;
X-CSE-ConnectionGUID: 79RDwf0mTw63Is2q2H3Z3A==
X-CSE-MsgGUID: QFUrUt9TQJiPfkHBt/0SXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78395926"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78395926"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:57:06 -0700
X-CSE-ConnectionGUID: xvyE0ElIQXGnkwAqA3PwjA==
X-CSE-MsgGUID: rKrbTibWTtaIzBADKf0gpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="234842548"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:57:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 30 Apr 2026 15:57:00 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, wse@tuxedocomputers.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/7] platform/x86: uniwill-laptop: Fix behavior of
 "force" module param
In-Reply-To: <20260417050912.5582-4-W_Armin@gmx.de>
Message-ID: <11500ca4-4f32-96b8-7a6a-b3a4606a2206@linux.intel.com>
References: <20260417050912.5582-1-W_Armin@gmx.de> <20260417050912.5582-4-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-994496304-1777553820=:971"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-994496304-1777553820=:971
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 17 Apr 2026, Armin Wolf wrote:

> Users might want to force-enable all possible features even on
> machines with a valid device descriptor. Until now the "force"
> module param was ignored on such machines. Fix this to make
> it easier to test for support of new features.
>=20
> Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfo=
rm/x86/uniwill/uniwill-acpi.c
> index 5551f193c2c1..7c7ea0e76966 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -2481,8 +2481,6 @@ static int __init uniwill_init(void)
>  =09=09if (!force)
>  =09=09=09return -ENODEV;
> =20
> -=09=09/* Assume that the device supports all features */
> -=09=09device_descriptor.features =3D UINT_MAX;
>  =09=09pr_warn("Loading on a potentially unsupported device\n");
>  =09} else {
>  =09=09/*
> @@ -2500,6 +2498,12 @@ static int __init uniwill_init(void)
>  =09=09device_descriptor =3D *descriptor;
>  =09}
> =20
> +=09if (force) {
> +=09=09/* Assume that the device supports all features */
> +=09=09device_descriptor.features =3D UINT_MAX;
> +=09=09pr_warn("Enabling potentially unsupported features\n");
> +=09}
> +
>  =09ret =3D platform_driver_register(&uniwill_driver);
>  =09if (ret < 0)
>  =09=09return ret;
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-994496304-1777553820=:971--
