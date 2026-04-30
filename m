Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E923406269;
	Thu, 30 Apr 2026 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553886; cv=none; b=AIbcbM4jcqDYUBGl2riVB2Cy6kyd0+SiHAEnncrOjuL2OXJuDkxefWGXr5EJh0z4DD6jksUifocytinFL9GrWWjc0N9l2pSyGVzIBmP3MsNQYk8+qik5fDR5junY4h1XLyHXodxFbF4qyoiqkoe4KlMT8nhxivE0wZMmBBS4LnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553886; c=relaxed/simple;
	bh=ER9XG9Zw7bJwN3Dq11i1cpKEQ8SjOKhF1DHUfzvYGWM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TfUFfPYsbCrSxSH+9mrl6EOdmliD8fqNSoX5rljtH78JnVLcYK1NxprrV/YY31YaKLp8JNVSIT9byMBguRwmdAxF4Bnbkm4mWNT2t1dk0bCD/PidqZ8spfUKodlcQwOh1i/Newt6E8liuRypjpZoVbYSU3a6vVgRLq2hT0pW68g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yb6Ew4Sl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yb6Ew4Sl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777553886; x=1809089886;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ER9XG9Zw7bJwN3Dq11i1cpKEQ8SjOKhF1DHUfzvYGWM=;
  b=Yb6Ew4SlZk+695pR4AmXldduO72gCbufeP3q+Dp3HZI6jvwLgh7605FL
   Nx/kw9OLVLfSzbFgOVOZ9byOZzUI9bFnPy+vAlVZ6549zaGKf/vkjzOeI
   BBjxn/ZzbW9m9cF08nz5Oy7P8kJCijlyOz931ykDTL/h9KMqwzYF6iOm/
   7FbQeUPB2pZT8Yy9bA3eQFBp2+dsEdt9gm1jEHEnoI75t8I12Ka/XRXma
   ARDQ0HtKHe/VC3E6NVo5M+vsb0QhIVODzqRFtpxqKiVlI4h1GMHAIC6nf
   mw/LiWRpa9EzNVLe9QRe8D3QPxSy9i1Zw+vVjUGSwZpeyonnJ4FqCfRoV
   g==;
X-CSE-ConnectionGUID: kivYPTJsTQ6pX6AC6KIM+Q==
X-CSE-MsgGUID: GWohw21JSdukuo2mdXxeRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="95921854"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="95921854"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:58:06 -0700
X-CSE-ConnectionGUID: aogkschfTRu2hlWgjii60A==
X-CSE-MsgGUID: mHwuosBfSo64mK08xNLFCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="230228105"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:58:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 30 Apr 2026 15:57:59 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, wse@tuxedocomputers.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/7] platform/x86: uniwill-laptop: Do not enable the
 charging limit even when forced
In-Reply-To: <20260417050912.5582-5-W_Armin@gmx.de>
Message-ID: <189b5abd-fbc5-df01-3e93-32a5e12a9ff3@linux.intel.com>
References: <20260417050912.5582-1-W_Armin@gmx.de> <20260417050912.5582-5-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1301165838-1777553879=:971"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1301165838-1777553879=:971
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 17 Apr 2026, Armin Wolf wrote:

> It seems that on some older models (~2020) the battery charging limit
> can permanently damage the battery. Prevent users from enabling this
> feature thru the "force" module parameter to avoid causing permanent
> hardware damage on such devices.
>=20
> Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
> Link: https://www.reddit.com/r/XMG_gg/comments/ld9yyf/battery_limit_hidde=
n_function_discovered_on/
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  Documentation/admin-guide/laptops/uniwill-laptop.rst | 10 ++++++++++
>  drivers/platform/x86/uniwill/uniwill-acpi.c          |  4 ++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docum=
entation/admin-guide/laptops/uniwill-laptop.rst
> index 561334865feb..1f3ca84c7d88 100644
> --- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
> @@ -43,6 +43,11 @@ Support for changing the platform performance mode is =
currently not implemented.
>  Battery Charging Control
>  ------------------------
> =20
> +.. warning:: Some devices do not properly implement the charging thresho=
ld interface. Forcing
> +             the driver to enable access to said interface on such devic=
es might damage the
> +             battery [1]_. Because of this the driver will not enable sa=
id feature even when
> +             using the ``force`` module parameter.
> +
>  The ``uniwill-laptop`` driver supports controlling the battery charge li=
mit. This happens over
>  the standard ``charge_control_end_threshold`` power supply sysfs attribu=
te. All values
>  between 1 and 100 percent are supported.
> @@ -70,3 +75,8 @@ The ``uniwill-laptop`` driver allows to set the configu=
rable TGP for devices wit
>  allow it.
> =20
>  See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
> +
> +References
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. [1] https://www.reddit.com/r/XMG_gg/comments/ld9yyf/battery_limit_hid=
den_function_discovered_on/
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfo=
rm/x86/uniwill/uniwill-acpi.c
> index 7c7ea0e76966..dac80c78ca0b 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -2499,8 +2499,8 @@ static int __init uniwill_init(void)
>  =09}
> =20
>  =09if (force) {
> -=09=09/* Assume that the device supports all features */
> -=09=09device_descriptor.features =3D UINT_MAX;
> +=09=09/* Assume that the device supports all features except the charge =
limit */
> +=09=09device_descriptor.features =3D UINT_MAX & ~UNIWILL_FEATURE_BATTERY=
;
>  =09=09pr_warn("Enabling potentially unsupported features\n");
>  =09}
> =20
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1301165838-1777553879=:971--
