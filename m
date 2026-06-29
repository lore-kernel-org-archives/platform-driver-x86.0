Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9523FE650;
	Mon, 29 Jun 2026 12:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735519; cv=none; b=j8qSFKp6tBsQIyyHgVdYDtjT1zjulJHETROf4PR9Tj73gxsMfPBXOYDV05rQOl+1r5lCLxKFj1wbjIqtAH6jTRq1U13NFNAipIY6dbqs+6CfzJ4Gw9BhJIXCXvhynnc+niMT2EpCCkTZ6QbtstzV6zvavVcgN8PiEvxfVLtPHTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735519; c=relaxed/simple;
	bh=UcKwoJceyURUcabL6YUdb2ifQIfVCQs4Ab0AVC5eMLk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=B7KkVTuu9rGQSJmS2O+jM8E+3KrJWMCMBgQ1490OikfLoHx/+4A3KJQYEKfMwytM64YyaPp24tti4z6Q7fIO+5IzOmYoGRAQ/vYUHozfTG7QT/exbkCuQmFeBFgaOSnQjRXHIcFW06wd6qY+ehMe3bDBr/llBoASXz5lCDKVBmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fm5rRWMo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fm5rRWMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782735517; x=1814271517;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UcKwoJceyURUcabL6YUdb2ifQIfVCQs4Ab0AVC5eMLk=;
  b=Fm5rRWMoTfWaX1F8iFjKbriFuphiRaPK5TGtbFFjQ8tCrywhs3a1lx/S
   pVQn98TcdvXIZXDsDyN+RS3PPTv+cL5+K1ZKfcvCQw1DTTBOqizxLSBHB
   GvS4rfS2oSbs+YO7nzK/h62gjSUQUil0Jj17ilt9d4w3Jg/HsYkUSR1PK
   cVde7J/eZpMl7+nizrHjQZxRB2GyGaIBAZiZ9cVMbFp2UqBMRf+zqsbGb
   npEHALjgN7zqkr+5ubgX5RnU7KQkzE4vtocXMkIfF82n6b2OktuECbW6n
   9J4Idzi0Tddy1ZYbpa96MtSIErHRpf4sKbpo6jbAW04E6aM8OxLt5tDjL
   g==;
X-CSE-ConnectionGUID: RvieNXX3QiiK7YiwzyJwvw==
X-CSE-MsgGUID: EWS30PWpTAyxp3mK5SuVYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="82417076"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="82417076"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 05:18:36 -0700
X-CSE-ConnectionGUID: kny4eLmRR7aTAcSobjyRJw==
X-CSE-MsgGUID: sQ2IRZrtRySTIli9pFYVYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="256351936"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.42])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 05:18:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Jun 2026 15:18:29 +0300 (EEST)
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
cc: Linus Torvalds <torvalds@linux-foundation.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Daniel Scally <dan.scally@ideasonboard.com>, 
    Sakari Ailus <sakari.ailus@linux.intel.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 10/16] platform/x86: int3472: Add include defining
 struct dmi_system_id
In-Reply-To: <55c02bb0f0577ea1534a1969e72cb6b771b8c5c4.1782682124.git.ukleinek@kernel.org>
Message-ID: <099b5db9-1fbb-6041-5a5d-29d0fdd7570a@linux.intel.com>
References: <cover.1782682124.git.ukleinek@kernel.org> <55c02bb0f0577ea1534a1969e72cb6b771b8c5c4.1782682124.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-199170948-1782735509=:1167"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-199170948-1782735509=:1167
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 28 Jun 2026, Uwe Kleine-K=C3=B6nig (The Capable Hub) wrote:

> Currently <linux/mod_devicetable.h> is included transitively in
> int3472.h via
>=20
> =09<linux/clk-provider.h> ->
> =09<linux/of.h> ->
> =09<linux/mod_devicetable.h>
>=20
> However these includes will be tightend such that only the bits relevant
> for of will be provided by <linux/of.h>. To ensure that dmi_system_id
> stays around, include the respective header explicitly.
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---
>  include/linux/platform_data/x86/int3472.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/pl=
atform_data/x86/int3472.h
> index 93f1e1fe09b4..a73841dfae27 100644
> --- a/include/linux/platform_data/x86/int3472.h
> +++ b/include/linux/platform_data/x86/int3472.h
> @@ -13,6 +13,7 @@
>  #include <linux/leds.h>
>  #include <linux/regulator/driver.h>
>  #include <linux/regulator/machine.h>
> +#include <linux/device-id/dmi.h>
>  #include <linux/types.h>
> =20
>  /* FIXME drop this once the I2C_DEV_NAME_FORMAT macro has been added to =
include/linux/i2c.h */
> @@ -72,7 +73,6 @@
>  =09container_of(clk, struct int3472_discrete_device, clock)
> =20
>  struct acpi_device;
> -struct dmi_system_id;

So the forward declaration was actually snakeoil and the real struct was=20
always required for the extern (it just came silently in through other=20
includes without anyone noticing). I had to check myself what happens=20
without this patch because your changelog didn't mention it.

Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-199170948-1782735509=:1167--
