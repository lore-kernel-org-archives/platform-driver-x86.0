Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B2C36F8FD;
	Fri, 24 Jul 2026 15:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784907853; cv=none; b=kGygxKAKLbjk2FFMplLn+RU5DYLNM7mjestc083iPcm85D4sAmGamTMmGEQd2m197lbNcVj8/aZAhre/Jq6hPGVaIph50L0R1pqJrTd0SMLC9uHDmdDTQbK6jW277wKJe9WWST4K+9Y5KxQRJNUNl9tbntC9ypTHPze3yV/qhbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784907853; c=relaxed/simple;
	bh=jGDeAzLhrWT4VTWt3Rvfl1lmi4OjIsRyWcRfSfNKMZA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=crNu1g5c2IA6dAibfJ3D9O9fDCvK8otfaqXeDQlnE3BLaQl71MtjKoPfADRTgmQjQJqXBf0ILgsBpW++JL8jHumKbDMsPNMZoV2yuzcXdnjj9DfINL0ry6NJpjyH57VniZu6sIpktWLVynZeB8JGBHcROP+z+8FedEPQiv0zAuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QB0H8JUr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QB0H8JUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784907852; x=1816443852;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jGDeAzLhrWT4VTWt3Rvfl1lmi4OjIsRyWcRfSfNKMZA=;
  b=QB0H8JUrQnYlicFjTf2/zm9At8eHYgcxVVHXiCaREOBAbXz8m2JNvMvD
   YkI8R5/lMN7PHCup3CcD7OCoV6El+3LRQMK4C/r2WqStDFVveOyXGgwoj
   tAhislPq58yodvVy3eYxeYmW6gYw7wTN1QrKiyewzeku7DzzgQQnIHWiu
   RUR90vb8jcUyGkL0XVK8HNMYf0UkYP3ApegYzqEiLWhmXY8gXC6a12lpS
   EpShdRfNq3Kr/2rF+yVkZaeFguZliZOpPNWnvEQwNclnqrBlI54zW1G7R
   d0b2TLZxG/+Mvij3dcVM/MQrsleGno2DU84aLQRpoJzpvja94emCrMXPl
   g==;
X-CSE-ConnectionGUID: jNKbLPRxT+2vpcSXky3t6A==
X-CSE-MsgGUID: oFkvrTo5SZ6LTjtByX/39g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102985910"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="102985910"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 08:44:11 -0700
X-CSE-ConnectionGUID: siam5DzcSkSIhsBr2TCLEQ==
X-CSE-MsgGUID: 9k89Op2rTayw09Rdex4+GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="263053532"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.8])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 08:44:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 24 Jul 2026 18:44:04 +0300 (EEST)
To: Sang-Heon Jeon <ekffu200098@gmail.com>
cc: Julia.Lawall@inria.fr, Azael Avalos <coproscefalo@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, cocci@inria.fr, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 25/36] platform/x86: toshiba_haps: remove conditional
 return with no effect
In-Reply-To: <20260723184538.3888637-26-ekffu200098@gmail.com>
Message-ID: <339532bc-e6e1-4b40-af18-49153c25ad64@linux.intel.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com> <20260723184538.3888637-26-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1722884469-1784907844=:1365"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1722884469-1784907844=:1365
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 24 Jul 2026, Sang-Heon Jeon wrote:

> Both branches of the check return the same value, so the check has
> no effect. Remove it and return the value directly.
>=20
> This is the result of running the Coccinelle script from
> scripts/coccinelle/misc/cond_return_no_effect.cocci.
>=20
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  drivers/platform/x86/toshiba_haps.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/platform/x86/toshiba_haps.c b/drivers/platform/x86/t=
oshiba_haps.c
> index c6633b74029f..4f62476b8dd1 100644
> --- a/drivers/platform/x86/toshiba_haps.c
> +++ b/drivers/platform/x86/toshiba_haps.c
> @@ -251,11 +251,7 @@ static int toshiba_haps_resume(struct device *device=
)
>  =09=09=09=09=09    haps->protection_level);
> =20
>  =09/* Reset the protection on resume */
> -=09ret =3D toshiba_haps_reset_protection(haps->acpi_dev->handle);
> -=09if (ret !=3D 0)
> -=09=09return ret;
> -
> -=09return ret;
> +=09return toshiba_haps_reset_protection(haps->acpi_dev->handle);
>  }
>  #endif

Sadly this has not seen much testing:

  CC      drivers/platform/x86/toshiba_haps.o
drivers/platform/x86/toshiba_haps.c: In function =A1toshiba_haps_resume=A2:
drivers/platform/x86/toshiba_haps.c:247:13: error: variable =A1ret=A2 set b=
ut not used [-Werror=3Dunused-but-set-variable]
  247 |         int ret;
      |             ^~~
cc1: all warnings being treated as errors
make[5]: *** [scripts/Makefile.build:289:=20
drivers/platform/x86/toshiba_haps.o] Error 1

=2E..I guess you never took the time to look at and understand the=20
surrounding code either. :-(

--=20
 i.

--8323328-1722884469-1784907844=:1365--
