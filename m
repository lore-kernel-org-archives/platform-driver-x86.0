Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118E024DFF3;
	Mon, 23 Feb 2026 14:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771855386; cv=none; b=rFk8j5kn336/BlEIJa91H5yx9pXfLLSuDXb4BHtDg6D/cAPrxY4rPuY/vNetmZgcWlHFJrPpfw/3SVpzdPXk9x6NIeNJnP8uJuv6fth6tzKv+J4khb8sAkfOU8SxFcbmrXOyk6loA5K+sCbG6Wh7WsnOW7uBRF5uly+JDmgmSpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771855386; c=relaxed/simple;
	bh=yO6J+eus1kR4oOL5t14b3eSPJbly2SEz74iVYUe8aEA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=e47gA6juFWmCp1XIU3xjNIySURW46YExyN52YphfvJVeJxQxnbezvzVRbUjyD5uo1rvqsDB+NMAYJwOZCZujnaaCSVI50IbhcgxImhaDbnmo5FUBKrAAu7ylUwTL/6pvarzph+5C4yu6q2oHfzUVlh4rITHcRywqEjTBJOyv74Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOgEUgbt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOgEUgbt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771855385; x=1803391385;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=yO6J+eus1kR4oOL5t14b3eSPJbly2SEz74iVYUe8aEA=;
  b=QOgEUgbt5RSu9lI2OQlsOYAcjMfkXOpymhMLKzgQX9iUYvr5wskRctCA
   bZdCiVwuvGFHaAkh66XnXge4JvNs6515o8K7bb80yZ1gzk7deBstnq3/C
   KPi0Bqqtb0qlw3eAQCeMtJ1ZFqokicSSAll64oaM62WqEcp9dehTdqdMR
   0WIRtDpB59LsIAfR1FemTv9OSN6io7l05zi+CGVApadu1/iygK7aFSvfA
   DCrzNHa9E6pRpLPF0aeufjevYeo3c/GUEmBEm32nnbx9qpKQte7XsyIm/
   fJ2ftpyZ1CKMwl7UcA29LK/jgNOHCsrP9UupEGKj70U+PM9T9cY8B4sG5
   g==;
X-CSE-ConnectionGUID: ZoUjPuY0QAG9/Z7baMdYaw==
X-CSE-MsgGUID: QDhKxgHHQv60Yc/Pw0hNIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76712261"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="76712261"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:03:04 -0800
X-CSE-ConnectionGUID: RgoMaN5KSPedMyBYk0YfCw==
X-CSE-MsgGUID: I8z3na5cTCeu/h+dPr0d3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="253289400"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:03:02 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Feb 2026 16:02:58 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Derek John Clark <derekjohn.clark@gmail.com>, 
    =?ISO-8859-15?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, Eileen <eileen@one-netbook.com>
Subject: Re: [PATCH v1 1/4] platform/x86: oxpec: Add support for OneXPlayer
 APEX
In-Reply-To: <20260218214919.449636-2-lkml@antheas.dev>
Message-ID: <6bc7e9df-303b-7f3d-e3b3-eefd6afcc074@linux.intel.com>
References: <20260218214919.449636-1-lkml@antheas.dev> <20260218214919.449636-2-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1484750068-1771855378=:1095"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1484750068-1771855378=:1095
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 18 Feb 2026, Antheas Kapenekakis wrote:

> This is a new Strix Halo handheld by OneXPlayer. Uses the same registers
> as the OneXPlayer Fly devices.

Hi,

The changelog bodies should be fully readable and understandable without=20
the shortlog (in the Subject) so you cannot start with "This is ...".

The same problem was in some other patch of this series as well.

--
 i.

> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/platform/x86/oxpec.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
> index 144a454103b9..59d6f9d9a905 100644
> --- a/drivers/platform/x86/oxpec.c
> +++ b/drivers/platform/x86/oxpec.c
> @@ -11,7 +11,7 @@
>   *
>   * Copyright (C) 2022 Joaqu=C3=ADn I. Aramend=C3=ADa <samsagax@gmail.com=
>
>   * Copyright (C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
> - * Copyright (C) 2025 Antheas Kapenekakis <lkml@antheas.dev>
> + * Copyright (C) 2025-2026 Antheas Kapenekakis <lkml@antheas.dev>
>   */
> =20
>  #include <linux/acpi.h>
> @@ -142,6 +142,13 @@ static const struct dmi_system_id dmi_table[] =3D {
>  =09=09},
>  =09=09.driver_data =3D (void *)oxp_2,
>  =09},
> +=09{
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER APEX"),
> +=09=09},
> +=09=09.driver_data =3D (void *)oxp_fly,
> +=09},
>  =09{
>  =09=09.matches =3D {
>  =09=09=09DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>=20
--8323328-1484750068-1771855378=:1095--
